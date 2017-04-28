function C4Config() as Object
    config = m.global.config

    if config = invalid then
        ' Config should be loaded at this stage but if it wasn't then load it
        initialiseConfig()
        config = m.global.config
    end if
    return config
end function


' *************************************************************************
' initialiseConfig
'
' Loads the local config and merges in the remote config
' *************************************************************************
function initialiseConfig() as Boolean
    loadedOK = false
    config = getLocalConfig()

    if config <> Invalid then
        ' Add additional config items
        config.localConfigLoaded = true
        config.firmwareVersion = getFirmwareVersionAsObject()
        config.appVersion=getAppVersion()

        'This flag is used to handle temp switching of api end point from Stage to prod, since staging License server fails the playback.
        config.changeStagToProd = true

        remoteConfig = getRemoteConfig(config.remoteConfig,config.clientproperties.requestHeaders)
        if remoteConfig <> Invalid then
            config.remoteConfigLoaded = true
            mergeConfigSettings(config,remoteConfig)
            loadedOK = true
        else
            config.remoteConfigLoaded = false
        end if
    else
        ' load enough config boot app
        config = loadBootstrapConfig()
    end if

    'check if the current device supports accelerating graphics and if so, set the supportAcceleratingGraphics = true, else false.
    config = setDeviceSupportingAcceleratingGraphics(config)

    ' set the config in global context
    setConfigInGlobalContext(config)
    return loadedOK
end function

' *************************************************************************
' setConfigInGlobalContext
'
' Set the config object in the global context
' *************************************************************************
sub setConfigInGlobalContext(config as Object)
    if m.global.hasField("config") then
        m.global.setField("config", config)
    else
        m.global.addFields({"config" : config })
    end if
end sub

' *************************************************************************
' bootstrapConfig
'
' Set enough configuration settings to start initialising the app
' *************************************************************************
function loadBootstrapConfig() as Object
    config = {
        "localConfigLoaded" : false,
        "logging" : {
            "logLevel" : 6,
            "loggingEnabled" : false
        }
    }
    ' set the config in global context
    setConfigInGlobalContext(config)
    return config
end function


' *************************************************************************
' getLocalConfig
'
' loads the config from a local json file, thus allowing C4 to easily
' change the local config without changing the code
' *************************************************************************
function getLocalConfig() as Object
    config = Invalid
    file = CreateObject("roByteArray")
    if file.ReadFile("pkg:/config/localConfig.json") then
        config = ParseJson(file.ToAsciiString())
    end if
    return config
end function

' *************************************************************************
' getRemoteConfig
'
' loads the config from a remote loctaion allowing C4 to change config remotely
' *************************************************************************
function getRemoteConfig(remoteConfigUrl as string, requestHeader as Object) as Object
    remoteConfig = Invalid
    request = CreateObject("roUrlTransfer")
    request.SetCertificatesFile("common:/certs/ca-bundle.crt")
    request.SetUrl(remoteConfigUrl)
    request.AddHeader("X-C4-API-Key",requestHeader["X-C4-API-Key"])
    json = request.GetToString()

    response = ParseJSON(json)

    if response <> Invalid then
        remoteConfig = response.config

        ' remote config needs some adjustments to make use easier
        clientproperties = remoteConfig.clientproperties
        remoteConfig.clientproperties.c_key = clientproperties.api.key
        remoteConfig.clientproperties.c_secret = clientproperties.api.secret
        remoteConfig.clientproperties.oauth = {
            authenv : clientproperties.api.url,
            url: clientproperties.api.url + clientproperties.api.oauth.token.path
            revoke: clientproperties.api.url + clientproperties.api.oauth.revoke.path
        }
    end if

    return remoteConfig
end function

' *************************************************************************
' mergeConfigSettings
'
' Used to merge the remote and local configs. The remote config settings will
' replace local settings is they are of the same type. It will recurse through
' child associative arrays
' *************************************************************************
sub mergeConfigSettings(dest as Object,src as Object)
    for each setting in src
        if NOT dest.DoesExist(setting) then
            ' setting doesn't exist so straight copy
            dest.AddReplace(setting,src[setting])
        else if (type(dest[setting]) = type(src[setting])) AND (NOT type(src[setting]) = "roAssociativeArray") then
            ' setting exists and is a basic type so just replace
            dest.AddReplace(setting,src[setting])
        else
            ' we need to merge next level of config
            mergeConfigSettings(dest[setting],src[setting])
        end if
    end for
end sub

' *************************************************************************
' getConfigurationLoadError
'
' Determines why config has failed and returns appropriate error message
' *************************************************************************
function getConfigurationLoadError() as Object
    if NOT m.global.config.localConfigLoaded then
        return m.global.appStrings.errorMessages.appInit.failedToLoadConfig
    else
        return m.global.appStrings.errorMessages.appInit.failedToRemoteLoadConfig
    end if
end function


' *************************************************************************
' getAppVersion
'
' Gets the version of the app returning 0.0.0 on failure
' *************************************************************************
function getAppVersion() as String
    appInfo = createObject("roAppInfo")
    if appInfo <> invalid then
        return appInfo.GetVersion()
    else
        return "0.0.0"
    end if
end function

function setDeviceSupportingAcceleratingGraphics(config as Object) as Object
    value = checkIfDeviceSupportsAcceleratingGraphics(config)
    config["supportAcceleratingGraphics"] = value

    return config
end function

function checkIfDeviceSupportsAcceleratingGraphics(config as Object) as Boolean
    returnValue = true

    if config.devices <> invalid AND config.devices.notSupportingAcceleratingGraphics <> invalid then
        devicesList = config.devices.notSupportingAcceleratingGraphics

        countNumDevices = devicesList.count() - 1
        model = getDeviceModel()

        for i = 0 to countNumDevices 
            if devicesList[i] = model then
                returnValue = false
                exit for
            end if
        end for
    end if

    return returnValue
end function
