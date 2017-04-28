function init()
	m.log = getLogging(" Init videoDataService")
end function

function getAssetVideoStreamUrl()
    m.log.info(".......Task nodes ---> getAssetVideoStreamUrl() .........")
    dataModel = {}

    if m.apgManager.hasAuthToken() then
        dataModel = m.apgManager.getVideoStreamUrl(m.top.assetUrl)

        if dataModel <> invalid AND baseDataService_checkIfValidResponseData(dataModel) then
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

            baseDataService_sendErrorDataToCaller(dataModel)
        end if
    end if
end function

function getFreewheelAdServerUrl()
    url = ""
    if m.apgManager.hasAuthToken() then
        response = m.apgManager.getFreewheelAddRolls(m.top.freewheel)
        if baseDataService_checkIfValidResponseData(response) then
            url = response
        else
            baseDataService_sendErrorDataToCaller(response)
        end if
    end if

    m.top.resultData = {
        formattedAdUrl: url
    }
end function
