'
'   Console used for wrapping the print function
'
function getLogging(functionName as String) as Object
    if m.logDebugs = Invalid then
        config = m.global.config
        debug = {
            defaultText: "<Missing Text>",
            loggingEnabled: false,
            logLevel: 0,
            
            info: function(text = m.defaultText as Dynamic, level = "DEBUG" as String) as Void
                ' [OFF, FATAL, ERROR, WARN, INFO, DEBUG, TRACE]
                levels = {
                    OFF: 0
                    FATAL: 1
                    ERROR: 2
                    WARN: 3
                    INFO: 4
                    DEBUG: 5
                    TRACE: 6
                }

                separators = {
                    OFF: ""
                    FATAL: "//////////////////////////////////////////////////////////////////////////////////////////////////////////"
                    ERROR: "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
                    WARN: ".........................................................................................................."
                    INFO: ""
                    DEBUG: ""
                    TRACE: ""
                }

                if m.logLevel < levels[level] then
                    m.logLevel = levels[level]
                end if

                if m.loggingEnabled then
                    if levels[level] <> levels.OFF and levels[level] <= m.logLevel then
                        if separators[level] <> "" then 
                            print separators[level]
                        end if
                        date = CreateObject("roDateTime")
                        print date.ToISOString();" [" + level + "] - "; text
                       
                        if separators[level] <> "" then 
                            print separators[level]
                        end if
                    end if
                end if
            end function

            getLogState: function() as Boolean
                return m.loggingEnabled
            end function

            setLogState: function(logState as Boolean) as Void
                m.loggingEnabled = logState
            end function
        }

        m.logDebugs = debug
    end if

    m.logDebugs.info(functionName)

    return m.logDebugs
end function
