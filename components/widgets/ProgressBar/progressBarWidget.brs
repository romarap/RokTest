function init()
    m.log = getLogging("Init player widget")
    m.log.info( m.top.subType() + ".init()")

    m.progress = m.top.findNode("progress")
    m.remaining = m.top.findNode("remaining")
    m.playHead = m.top.findNode("playHead")
    m.playHeadImage = m.top.findNode("playHeadImage")
    m.playHeadTime = m.top.findNode("playHeadTime")
    m.markers = m.top.findNode("markers")
    m.playHeadFocus = m.top.findNode("playHeadFocus")
    m.playHeadFocus.color = m.top.focusedColor
    m.playHeadFocus.visible = false
    m.drawMarkers = false

    m.top.observeField("focusedChild","onFocus")

    ' set playhead image
    m.playHeadImage.uri = m.top.playheadUri

    'Player seek
    m.DEFAULT_STEP_SPEED = getPlayerConstants().PLAYER.DEFAULT_STEP_SPEED
    m.DEFAULT_SEEK_SPEED = getPlayerConstants().PLAYER.DEFAULT_SEEK_SPEED
    m.SEEK_UPDATE_RATE = getPlayerConstants().PLAYER.SEEK_UPDATE_RATE
    m.playbarTimer = CreateTimerObject({ duration: m.SEEK_UPDATE_RATE, repeat: true }, "onTimer")
    m.PauseEventValue = getPlayerConstants().PLAYER.PROGRESSBAR_EVENTS.PAUSE_PLAYBACK

end function

''********************************************************
''**  Interface observers
''********************************************************
function onFocusedColorChanged()
    m.playHeadFocus.color = m.top.focusedColor
end function

function onSeek()
    updateSeek(m.top.seekSelected)
end function


function onSeekSpeedChanged()
    if m.top.seekSpeed = 0 then
        stopTimer()
    else
        ' Ensure Stepping is stop
        m.top.stepSpeed = 0.0
        raiseEvent(m.PauseEventValue)
        m.playbarTimer.control = "start"
    end if
    drawProgressBar()
end function

function onPositionChanged()
    drawProgressBar()
end function

function onDurationChanged()
    drawProgressBar()
end function

function onReceivedAdPods()
    ' Markers need drawing
    m.drawMarkers = true
end function

sub onFocus()
    drawProgressBar()
end sub

''********************************************************
''**  Rendering
''********************************************************
sub drawProgressBar()
    if m.top.duration > 0 then
      ' set playhead image, we clear it first to overcome issue with
      ' Roku failing to render image after playing an Ad - ROKU-293
      m.playHeadImage.uri = ""
	    if m.top.seekSpeed > 0 then
          m.playHeadImage.uri = m.top.skipFFUri
          m.playHeadFocus.visible = true
	    else if m.top.seekSpeed < 0 then
          m.playHeadImage.uri = m.top.skipRWUri
          m.playHeadFocus.visible = true
	    else
  		    if m.top.hasFocus() then
      			  m.playHeadImage.uri = m.top.focusedPlayheadUri
  		    else
      			  m.playHeadImage.uri = m.top.playheadUri
  		    end if
  		    m.playHeadFocus.visible = m.top.hasFocus()
	    end if

        ' position and draw components of the progress bar
	    progress = calcProgressBarPosition(m.top.position)
	    m.playHead.translation = [progress,0]

	    m.progress.width = progress

	    m.remaining.width = m.top.playBarLength - (progress + m.top.scrubberImageWidth)
	    m.remaining.translation = [progress + m.top.scrubberImageWidth ,0]

	    drawTimecode()
        if m.drawMarkers then
            drawMarkers()
        end if
    end if
end sub

sub drawTimecode()
    showHours = false
    m.playHeadTime.text = secondsToTimeString(m.top.position, "short", showHours) + "/" + secondsToTimeString(m.top.duration, "short", showHours)
end sub

sub drawMarkers()
    m.drawMarkers = false

	' remove existing children
	m.markers.removeChildrenIndex(m.markers.getChildCount(),0)

	if (m.top.adPods <> invalid AND m.top.adPods.adPods <> invalid ) then
        adPods = m.top.adPods.adPods

	    ' Create new children
	    numMarkers = adPods.count()

        ' adjustment for placing admarker -  8 is half width of the chapter marker image
        addMarkerAdjustment = ((m.top.scrubberImageWidth / 2) - 8)

	    for i = 0 to numMarkers - 1
            m.log.info("Marker " + adPods[i].renderTime.toStr())
            m.log.info("********************* " + adPods[i].renderSequence)
            if adPods[i].renderSequence = "midroll" then
		        position = calcProgressBarPosition(adPods[i].renderTime) + addMarkerAdjustment
            marker = m.markers.CreateChild("chapterMarker")
		        marker.translation=[position,0]
            end if
        end for
    end if
end sub

function calcProgressBarPosition(timeCode as float) as integer
    if m.top.duration > 0 then
        return  (m.top.playBarLength - m.top.scrubberImageWidth) * (timeCode / m.top.duration)
    else
        return 0
    end if
end function

''********************************************************
''**  Timer Events
''********************************************************
sub onTimer()
    if m.top.seekSpeed <> 0 then
        seekPlayHeadPosition()
    else if m.top.stepSpeed <> 0 then
        stepPlayHeadPosition()
    end if
end sub

sub stopTimer()
    m.top.seekSpeed = 0
    m.top.stepSpeed = 0
    m.playbarTimer.control = "stop"
end sub

''********************************************************
''**  Keyboard events
''********************************************************

' handle step
sub stepPlayHeadPosition()
    setNewPlayheadPosition(m.top.position + m.top.stepSpeed)
end sub


' Initiate stepping thru video
sub initiateStep(stepSpeed as Float)
    ' ensure seek is stopped and the player is paused before starting to step
    stopTimer()
    raiseEvent(m.PauseEventValue)

    ' set step speed
    m.top.stepSpeed = stepSpeed

    ' Start timer
    m.playbarTimer.control = "start"
end sub

' Handle seek video
sub updateSeek(way as Integer)
    ' get ordered array of possible seek speeds
    seekSpeeds = getPlayerConstants().PLAYER.SEEK_SPEEDS
    numSeekSpeeds = seekSpeeds.count()
    idx = 0

    ' find current seek speed or as close as possible
    for i = 0 to numSeekSpeeds - 1
        idx = i
        if m.top.seekSpeed <= seekSpeeds[idx] then
            exit for
        end if
    end for

    ' Increase or decrease seek speed
    if way > 0 then
        if idx < numSeekSpeeds - 1 then
            m.top.seekSpeed = seekSpeeds[idx +1]
        end if
    else
        if idx > 0 then
            m.top.seekSpeed = seekSpeeds[idx - 1]
        end if
    end if
end sub

sub seekPlayHeadPosition()
	if m.top.seekSpeed = 0 then return

	setNewPlayheadPosition(m.top.position + (m.top.seekSpeed*m.SEEK_UPDATE_RATE))
end sub

sub setNewPlayheadPosition(position as float)
    m.top.position = position

    if m.top.position < 0 then
        m.top.position = 0
        stopTimer()
    end if
    if m.top.position > m.top.duration then
        m.top.position = m.top.duration
        stopTimer()
    end if
end sub

sub raiseEvent(value AS string)
    m.top.event = {
        value: value
    }
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press = true then
        if key = "fastforward" then
            updateSeek(m.DEFAULT_SEEK_SPEED)
            raiseEvent(key)
            handled =  true
        else if key = "rewind" then
            updateSeek(-m.DEFAULT_SEEK_SPEED)
            raiseEvent(key)
            handled =  true
        else if key = "right" then
            initiateStep(m.DEFAULT_STEP_SPEED)
            raiseEvent(key)
            handled =  true
        else if key = "left" then
            initiateStep(-m.DEFAULT_STEP_SPEED)
            raiseEvent(key)
            handled =  true
        else if key = "OK" then
            stopTimer()
        else if key = "play" then
            stopTimer()
        else if key = "up" AND m.top.seekSpeed <> 0 then
            handled =  true
        else if key = "down" AND m.top.seekSpeed <> 0 then
            handled =  true
        end if
    else
        if key = "right" then
            stopTimer()
            handled =  true
        else if key = "left" then
            stopTimer()
            handled =  true
        end if
    end if
    return handled
end function
