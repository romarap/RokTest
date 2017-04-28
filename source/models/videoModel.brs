
' meta field cotains following fields
' ia: invalid,
' brandTitle: invalid,
' webSafeBrandTitle: invalid,
' contractId: invalid,
' programmeId: invalid,
' episodeTitle: invalid,
' programmeNumber: invalid,
' duration: invalid,
' rating: invalid,
' sinceBroadcast: invalid,

function getVideoMetaObject() as Object
    return {
        ia: invalid,
        brandTitle: invalid,
        webSafeBrandTitle: invalid,
        contractId: invalid,
        programmeId: invalid,
        episodeTitle: invalid,
        programmeNumber: invalid,
        duration: invalid,
        rating: invalid,
        sinceBroadcast: invalid
    }
end function

function getVideoObject() as Object
    return {
        streamUri: invalid,
        licenseurl: invalid,
        meta: getVideoMetaObject(),
        freewheel: {}
    }
end function


function getVideoModel() as Object

    return {
        parsedVideo: {}
        parseXmlVideoResponse: function(response as Object) as Object

            if response = Invalid
                return invalid
            end if

            status = response@status
            serviceReport = getFirstElementByTagName("serviceReport", response)
            description = getFirstElementByTagName("description", serviceReport)
            ptc = getFirstElementByTagName("ptc", response)

            ' Valid XML response with error message
            if status = "ERROR" AND description <> Invalid then
                return {isError: true}
            end if

            ' Timezone check, return geo-blocking error if timezone offset is greater than 60
            if status = "OK" AND ptc <> Invalid AND ptc.getText() = "true"
                if abs(m.getDeviationFromUtcInMinutes()) > 60
                    '@@TODO: This hardcoding message needs attention.
                    return {isError: true}
                end if
            end if

            returnCode = serviceReport@returnCode

            if status = "OK" AND returnCode = "200"
                m.parsedVideo = getVideoObject()

                streamUri = getFirstElementByTagName("streamUri", response)

                ' fetch streamUri
                if streamUri <> Invalid
                    m.parsedVideo.streamUri = streamUri.getText()
                else
                    stream = getFirstElementByTagName("stream", response)
                    if stream <> Invalid
                        uri = getFirstElementByTagName("uri", stream).getText()
                    end if
                end if

                ' this is a decrypted licenseUrl
                m.parsedVideo.licenseurl = m.decryptVideoAssetToken(getFirstElementByTagName("token", response).getText())

                ' video metaData
                ' m.parsedVideo.meta = m.parseVideoMetaResponse(response)

                ' video advert bookmarks
                ' m.parsedVideo.freewheel = m.parseVideoFreewheelResponse(response)

            end if

            return m.parsedVideo
        end function

        decryptVideoAssetToken: function(token as String) as String

            aisToken = {
                iv: "mai7Io7tBah6pai2",
                key: "aetooK9fnooWu7ob",
                ttl: 580
            }

            aisProperties = {
                token: aisToken,
                url: "http://ais.channel4.com/asset/"
            }

            theByteArray = createObject("roByteArray")

            theByteArray.FromAsciiString(aisProperties.token.key)
            keyAsHex = theByteArray.toHexString()

            theByteArray.FromAsciiString(aisProperties.token.iv)
            ivAsHex = theByteArray.toHexString()

            evs = createObject("roEVPCipher")
            evs.setup(false, "aes-128-cbc", keyAsHex, ivAsHex, 1)

            tokenArray = createObject("roByteArray")
            tokenArray.fromBase64String(token)

            result = evs.Process(tokenArray)

            if result <> Invalid
                return result.toAsciiString()
            else
                return ""
            end if
        end function

        getDeviationFromUtcInMinutes: function()
            date = CreateObject("roDateTime")
            utcSeconds = date.asSeconds()
            date.toLocalTime()
            localSeconds = date.asSeconds()

            minutesDiff = (localSeconds - utcSeconds) / 60

            return minutesDiff
        end function

        parseVideoMetaResponse: function(response) as Object
            meta = {}
            meta.ia = getFirstElementByTagName("ia", response).getText()
            meta.brandTitle = getFirstElementByTagName("brandTitle", response).getText()
            meta.webSafeBrandTitle = getFirstElementByTagName("webSafeBrandTitle", response).getText()
            meta.contractId = getFirstElementByTagName("contractId", response).getText()
            meta.programmeId = getFirstElementByTagName("programmeId", response).getText()
            meta.episodeTitle = getFirstElementByTagName("episodeTitle", response).getText()
            meta.programmeNumber = getFirstElementByTagName("programmeNumber", response).getText()
            meta.duration = getFirstElementByTagName("duration", response).getText().toInt()
            meta.sinceBroadcast = getFirstElementByTagName("sinceBroadcast", response).getText().toInt()
            meta.videoType = getFirstElementByTagName("requestType", response).getText()

            rating = getFirstElementByTagName("rating", response)
            if rating <> Invalid
                r = rating.getText()
                if NOT isEmpty(r) then
                    meta.ageRating = r.toInt()
                else
                    meta.ageRating = 0
                end if
            end if

            meta.isCatchUp = false
            sinceBroadcast = getFirstElementByTagName("sinceBroadcast", response)
            if sinceBroadcast <> Invalid AND sinceBroadcast.getText().toInt() > 0
                meta.sinceBroadcast = sinceBroadcast.getText().toInt()
                meta.isCatchUp = true
            end if

            return meta
        end function

        parseVideoFreewheelResponse: function(response) as Object

            adverts = getFirstElementByTagName("adverts", response)
            freewheel = {}
            if adverts <> Invalid then
                freewheel.breaks = []

                freewheel.duration = m.parsedVideo.meta.duration
                freewheel.brandWebSafeTitle = m.parsedVideo.meta.brandWebSafeTitle
                freewheel.programmeId = m.parsedVideo.meta.programmeId

                adChildren = adverts.getChildElements()
                for i = 0 to adChildren.count() - 1
                    if adChildren[i].getName() = "breaks"
                        breaks = getElementsByTagName("breakOffset", adChildren[i])
                        for j = 0 to breaks.count() - 1
                            freewheel.breaks.push({
                                breakOffset: breaks[j].getText().toInt() / 1000,
                                watched: false
                            })
                        end for
                    else
                        freewheel[adChildren[i].getName()] = adChildren[i].getText()
                    end if
                end for
            end if

            return freewheel
        end function

    }
end function

function parseVideoResponse(response) as Object
    return getVideoModel().parseXmlVideoResponse(response)
end function

function parseHistoryResponse(response as Object) as Object
    return response
end function

Function getFirstElementByTagName(tagName, element, first=true) as Object
    if first AND (element.getName() = tagName)
        return element
    end if

    theElements = element.getNamedElements(tagName)
    if theElements[0] <> Invalid
        return theElements[0]
    end if

    children = element.getChildElements()
    if children <> Invalid
        for each child in children
            returnElement = getFirstElementByTagName(tagName, child, false)
            if returnElement <> Invalid
                return returnElement
            end if
        end for
    end if

    return Invalid
End Function
