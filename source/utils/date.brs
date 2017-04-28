'
'   Utility Function for converting seconds to a fornatted time string
'   @example:   secondsToTimeString(634)            -->     "00:10:34"
'   @example:   secondsToTimeString(634, "long")    -->     "10 minutes"
'   @todo:      regexp based replacing format
'
function secondsToTimeString(time = 0 as Integer, format = "short" as String, showHours = true as Boolean) as String
    if format = "short" then result = "0:00:00" else result = "1 minute"

    if time > 0 then

        hours = 0
        if showHours then
            ' Hours
            hours = int(time / 3600)
        end if

        ' Minutes
        minutes = int((time - (hours * 3600)) / 60)

        ' Seconds
        seconds = int(time - (hours * 3600) - (minutes * 60))

        if format = "short" then
            ' Add leading zero when needed
            if minutes < 10 AND showHours then minutes = "0" + minutes.toStr() else minutes = minutes.toStr()
            if seconds < 10 then seconds = "0" + seconds.toStr() else seconds = seconds.toStr()

            ' Format string
            if showHours then
                result = hours.toStr() + ":" + minutes + ":" + seconds
            else
                result = minutes + ":" + seconds
            end if
        else
            ' Format string
            minutesText = minutes.toStr() + " minute"
            if minutes > 1 then
                minutesText = minutes.toStr() + " minutes"
            else if minutes < 1 then
                minutesText = "1 minute"
            end if

            hoursText = hours.toStr() + " hour"
            if hours > 1 then hoursText = hoursText + "s"

            result = minutesText
            if hours > 0 then result = hoursText + " and " + result
        end if
    end if

    return result
end function

function secondsToMinutes(seconds as Integer) as Integer
    ONE_MINUTE = 60
    minutes = int(seconds/ONE_MINUTE)
    return minutes
end function

function secondsToMinutesCeil(seconds as Integer) as Integer
    ONE_MINUTE = 60
    return ceiling(seconds/ONE_MINUTE)
end function

function secondsToHours(seconds as Integer) as Integer
    ONE_HOUR = 3600
    hours = ceiling(seconds/ONE_HOUR)
    return hours
end function

function secondsToDays(seconds as Integer) as Integer
    ONE_DAY = 86400
    DAY_CEIL_CUTOFF = 2
    numberOfDays = seconds/ONE_DAY
    if numberOfDays >= DAY_CEIL_CUTOFF then
        days = ceiling(numberOfDays)
    else
        days = round(numberOfDays)
    end if
    return days
end function

function secondsToMonths(seconds as Integer) as Integer
    THIRTY_ONE_DAYS = 2678400
    months = int(seconds/THIRTY_ONE_DAYS)
    return months
end function

function secondsToYears(milliseconds as Integer) as Integer
    ONE_YEAR = 31536000
    years = int(milliseconds/ONE_YEAR)
    return years
end function

function parseFullDateTime(d as String) as Object
    if d = Invalid then
        return Invalid
    end if

    ' Tokenize from YYYY/MM/DD MM:SS
    dateTokens = d.tokenize("T")

    if dateTokens.count() <> 2 then
        return Invalid
    end if

    return parseDateTime(dateTokens[0], dateTokens[1])
end function

' Parse this 2014/11/03 to a roDateTime
function parseDateTime(d as String, t = "00:00" as String) as Object
    if d = Invalid then
        return Invalid
    end if

    ' Tokenize from YYYY/MM/DD
    dateTokens = d.tokenize("/")

    if dateTokens.count() <> 3 then
        return Invalid
    end if

    ' Now, roDateTime only likes ISO format
    ' YYYY-MM-DD HH:MM:SS
    date = CreateObject("roDateTime")
    date.fromISO8601String(dateTokens[0] + "-" + dateTokens[1] + "-" + dateTokens[2] + " " + t)

    return date
end function

Function timeConvert (timeString As String) As Object

    ' An roDateTime by default gives current time in UTC
    dt = CreateObject ("roDateTime")

    ' Set the time from the time string input
    dt.FromISO8601String (timeString)

    ' Return the local time representation of the input string
    Return dt

End Function

function ceiling(number as Float) as Integer
    if number - int(number) > 0 then
        return int(number) + 1
    else
        return int(number)
    end if
end function

function round(number as Float) as Integer
    if number - int(number) >= 0.5 then
        return int(number) + 1
    else
        return int(number)
    end if
end function

function timeToPluralisedStringForDays(days as Integer) as String
    daysAvailableString = ""

    if days > 1 then
        daysAvailableString = Str(days) + " days left"
    else if days = 1 then
        daysAvailableString = Str(days) + " day left"
    end if

    return daysAvailableString
end function

function timeToPluralisedStringForHours(hours as Integer) as String
    daysAvailableString = ""

    if hours > 1 then
        daysAvailableString = Str(hours) + " hours left"
    else if hours = 1 then
        daysAvailableString = Str(hours) + " hour left"
    end if

    return daysAvailableString
end function

function timeToPluralisedStringForMinutes(duration as Integer) as String
    durationString = ""

    if duration > 1 then
        durationString = Str(duration) + " mins"
    else if duration = 1 then
        durationString = Str(duration) + " min"
    end if

    return durationString
end function

function getAirTimeInString(date as Object) as String
    hours = date.getHours().tostr()
    minutes = date.getMinutes().tostr()
    seconds = date.getSeconds().tostr()

    if hours.len() = 1 then
        hours = "0" + hours
    end if

    if minutes.len() = 1 then
        minutes = "0" + minutes
    end if

    if seconds.len() = 1 then
        seconds = "0" + seconds
    end if
    airTime = hours + ":" + minutes + ":" + seconds

    splitTime = splitString(airTime, ":")
    hours = splitTime[0]
    minutes = splitTime[1]
    if (hours.toInt() > 12)
        airTime = (hours.toInt() - 12).toStr()
        airTime = airTime + "." + minutes

        airTime = airTime + "pm"
    else
        if hours = "00"
            airTime = "12"
        else if (hours.instr("0") = 0)
            airTime = hours.right(1)
        else
            airTime = hours
        end if

        airTime = airTime + "." + minutes

        if hours.toInt() = 12
            airTime = airTime + "pm"
        else
            airTime = airTime + "am"
        end if
    end if

    return airTime
end function

function createDateString(date as Object, addYear=false as Boolean) as String
    months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    dateString = date.getWeekday().left(3) + " " + date.GetDayOfMonth().toStr() + " " + months[date.getMonth() - 1]
    if addYear then
        dateString = dateString + " " + date.getYear().toStr()
    end if
    return dateString
end function

function convertEndTimeToDateObject(date as String) as Object
    dateTimeObject = endDateTimeModel()
    endDateString = splitString(date, ";")[1]
    endDateString = endDateString.right(endDateString.len() - endDateString.instr("=") - 1)
    dateTimeObject.endDate = timeConvert(endDateString)

    now = CreateObject("roDateTime")
    hoursLeft = (dateTimeObject.endDate.asSeconds() - now.asSeconds()) / (60 * 60)
    dateTimeObject.timeLeftString = ""
    if hoursLeft <= (30 * 24) then
        dateTimeObject.daysLeft = ceiling(hoursLeft / 24)
        dateTimeObject.timeLeftString = timeToPluralisedStringForDays(dateTimeObject.daysLeft)
    end if

    if hoursLeft < 24 then
        dateTimeObject.timeLeftString = timeToPluralisedStringForHours(hoursLeft)
    end if
    return dateTimeObject
end function

function convertEndTimeToDateObjectForMy4(date as String) as Object
    dateTimeObject = {
        endDate: invalid,
        daysLeft: invalid,
        timeLeftString: invalid
    }

    dateTimeObject.endDate = timeConvert(date)

    now = CreateObject("roDateTime")
    hoursLeft = (dateTimeObject.endDate.asSeconds() - now.asSeconds()) / (60 * 60)
    dateTimeObject.timeLeftString = ""
    if hoursLeft <= (30 * 24) then
        dateTimeObject.daysLeft = ceiling(hoursLeft / 24)
        dateTimeObject.timeLeftString = timeToPluralisedStringForDays(dateTimeObject.daysLeft)
    end if

    if hoursLeft < 24 then
        dateTimeObject.timeLeftString = timeToPluralisedStringForHours(hoursLeft)
    end if
    return dateTimeObject
end function

function daysOutofSeconds(endDate as String) as String
    now = CreateObject("roDateTime")
    timeLeftString = ""

    date = timeConvert(endDate)
    hoursLeft = (date.asSeconds() - now.asSeconds()) / (60 * 60)

    if hoursLeft <= (30 * 24)
        daysLeft = MathCeil(hoursLeft / 24)
        if hoursLeft > 1
            timeLeftString = daysLeft.toStr() + " days left"
        else
            timeLeftString = daysLeft.toStr() + " day left"
        end if
    end if

    if hoursLeft < 24
        if hoursLeft > 1
            timeLeftString = MathCeil(hoursLeft).toStr() + " hours left"
        else
            timeLeftString = MathCeil(hoursLeft).toStr() + " hour left"
        end if
    end if

    return timeLeftString
end function

function getAssetRtTimeStamp() as Integer
    now = CreateObject("roDateTime")
    return now.AsSeconds()
end function
