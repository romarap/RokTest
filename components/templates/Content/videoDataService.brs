function init()
	print "Init videoDataService"
end function

function getAssetVideoStreamUrl()
    print ".......Task nodes ---> getAssetVideoStreamUrl() ........."
    dataModel = {}

    dataModel = getVideoStreamUrl(m.top.assetUrl)

    if dataModel <> invalid AND not isError(dataModel) then        
        m.top.resultData = dataModel
    else
        dataModel.type = "PLAYER"

        if dataModel = invalid then
            dataModel = {}
            dataModel.type = "PLAYER"
            dataModel.isError = true
            dataModel.otherType = "GENERIC"
        end if

        if dataModel.otherType = invalid or dataModel.otherType = "" then
            dataModel.otherType =  getOtherErrorTypes().GENERIC
        end if

        result = {
            isError: true
        }
        m.top.resultData = result
    end if
end function

function getVideoStreamUrl(assetUrl as String)
    http = CreateObject("roUrlTransfer")
    http.SetPort(CreateObject("roMessagePort"))
    http.SetCertificatesFile("common:/certs/ca-bundle.crt")
    http.InitClientCertificates()
    http.retainBodyOnError(true)
    http.EnableFreshConnection(true)
    http.EnableResume(true)

    changedUrl = assetUrl

    changedUrl = changedUrl.replace("ais.stage.channel4.com", "ais.channel4.com")

    requestSettings = getRequestHeaderSettings({})
    requestSettings.requestHeaders["Authorization"] = "Bearer " + "iSofrFKlWi1V8u8lokxkzZGxS238"
    requestSettings.requestHeaders["Content-Type"] = "application/x-www-form-urlencoded"
    addRequestHeaders(http, requestSettings.requestHeaders)

    response = fetchData(changedUrl, http, true)

    return processResponse(response, "xml", parseVideoResponse)
end function

Function addRequestHeaders(http as Object, requestHeaders as Object)
    for each header in requestHeaders
        'm._console.info("Header = " + header + "   value = " + requestHeaders[header])
        http.AddHeader(header, requestHeaders[header])
    end for
End Function

Function getRequestHeaderSettings(additionalSettings) as Object
    settings = {
        requestHeaders: {}
    }
    requestHeaders = {
        "X-C4-API-Key": "zfBNhsDXSsQC2REbpL7GyAJb8Xb3Q9nv"
    }
    if requestHeaders <> Invalid
        for each requestHeader in requestHeaders
            settings.requestHeaders[requestHeader] = requestHeaders[requestHeader]
        end for
    end if

    settings.requestHeaders["X-C4-User-Agent"] = "All4Roku/" + "2.19" + " (uid:" + CreateObject("roDeviceInfo").GetDeviceUniqueId() + "; tid:" + getTimeStampInString() + "; did:" + CreateObject("roDeviceInfo").GetDeviceUniqueId() + ")"

    return settings
End Function

Function processResponse(responseData as Dynamic, responseType as String, cbFunction = invalid as Dynamic) as Object

    ' if response data is an error, then return
    if isError(responseData) then
        return responseData
    end if

    ' return error if empty response
    if isEmpty(responseData) then
        return {isError: true}
    end if

    return processResponseInXmlFormat(responseData, cbFunction)
End Function

Function processResponseInXmlFormat(responseData as Dynamic, callbackFunction = invalid as Dynamic) as Object
    response = CreateObject("roXMLElement")
    response.parse(responseData)

    if response <> invalid then
        if callbackFunction <> invalid then
            return callbackFunction(response)
        else
            return response
        end if
    else
        return {isError: true}
    end if
End Function

Function fetchData(reqUrl as String, http as Object, cancelCurrentRequest=false as Boolean, method = "GET" as String) as Dynamic
    if method = "GET" then
        http.SetRequest("GET")
        return getFromHttpAsync(reqUrl, http, cancelCurrentRequest)
    end if
End Function

Function getFromHttpAsync(reqUrl as String, http as Object, cancelCurrentRequest=false as Boolean) as Dynamic
    timeout% = 6000
    http.SetUrl(reqUrl)
    responseStr = ""
    print " request url = ", reqUrl

    if (http.AsyncGetToString())
        event = wait(timeout%, http.GetPort())
        if type(event) = "roUrlEvent" then
            statusGroup = int(event.GetResponseCode()/100)

            'm._console.info("Status Code=" + str(event.GetResponseCode()))
            'm._console.info("Status Group=" + str(statusGroup))

            if statusGroup=2 or statusGroup=3 then
                responseStr = event.GetString()
            end if
        else ' unknown event, return error
            http.AsyncCancel()
            return { isError: true }
        end if
    end if

    return responseStr
End Function

Function getTimeStampInString() as Object
    date = CreateObject("roDateTime")
    year = date.GetHours().toStr()
    month = date.GetMonth().toStr()
    day = date.GetDayOfMonth().toStr()
    hours = date.GetHours().toStr()
    minutes = date.GetMinutes().toStr()
    seconds = date.GetSeconds().toStr()
    milliseconds = date.GetMilliseconds().toStr()

    if month.len() = 1
        month = "0" + month
    end if

    if day.len() = 1
        day = "0" + day
    end if

    if hours.len() = 1
        hours = "0" + hours
    end if

    if minutes.len() = 1
        minutes = "0" + minutes
    end if

    if seconds.len() = 1
        seconds = "0" + seconds
    end if

    if milliseconds.len() = 1
        milliseconds = "0" + milliseconds
    end if

    return day + "1" + hours + "2" + minutes + "3" + seconds + "4" + milliseconds
End Function

function isError(responseObject as Dynamic) as Boolean
    return isObject(responseObject) and responseObject.isError = true
end function

function isObject(item as Dynamic) as Boolean
    return type(item) = "Object" or type(item) = "roAssociativeArray"
end function

function isEmpty(text as Dynamic) as Boolean
    if text = Invalid then
        return true
    else if len(text.trim()) = 0 then
        return true
    else
        return false
    end if
end function