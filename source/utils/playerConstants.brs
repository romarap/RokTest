function getPlayerConstants() as Object
	return {
		PLAYER: {
            DEFAULT_SEEK_SPEED: 2.0, ' times
            DEFAULT_STEP_SPEED: 5, 'seconds
            SEEK_UPDATE_RATE: 0.1, 'seconds
            SEEK_FORWARD: 1,
            SEEK_BACKWARD: -1,
            ' Ordered array of possible seek speeds
            SEEK_SPEEDS: [-64,-32,-16,-8,-4,-2,0,2,4,8,16,32,64],
            PROGRESSBAR_EVENTS: {
                PAUSE_PLAYBACK: "pausePlayback"
            },
            STATE: {
                PLAYING: "playing",
                STOPPED: "stopped",
                BUFFERING: "buffering",
                PAUSED: "paused",
                SEEK: "seek", ' custom state
                FINISHED: "finished",
                ERROR: "error",
                NONE: "none"
            },

            KEY_ON_CONTROLBAR: {
                BACK: "back",
                PLAY_PAUSE: "play_pause",
                WATCH_NEXT: "watchNext",
                INFO: "info",
                FF: "fastforward",
                RW: "rewind",
                RIGHT: "right",
                LEFT: "left"
            },

            ' @@MORE EVENTS TO COME
            EVENTS: {
                START_ACTUAL_PLAYBACK: "START_ACTUAL_PLAYBACK",
                ERROR_RECEIVED: "ERROR_RECEIVED",
                GET_ADDS_FROM_RAF: "GET_ADDS_FROM_RAF",
                UPDATE_BOOKMARK: "UPDATE_BOOKMARK",
                GET_BOOKMARKS: "GET_BOOKMARKS"
            }

            FIELDS: {
                VIDEO_EVENTS: "videoEvents"
            },

            PLAYBACK_COMPLETED_PERCENTAGE: 97, 'based on HTML5',

            PLAYBACK_COMPLETED_FOR_SHORT_ASSET: 5, 'In seconds - ROKU-560',

            SHORT_ITEM_DURATION: 3, 'In minutes/ROKU-560'

            ADS_TYPES: {
                PREROLL: "preroll",
                MIDROLL: "midroll",
                POSTROLL: "postroll"
            },

            ADS_CONTEXT: {
                FETCH_ON_PLAYER_LAUNCH: "FETCH_ON_PLAYER_LAUNCH",
                FETCH_WHILE_PLAYING: "FETCH_WHILE_PLAYING"
            },

            ERROR_TYPES: {
                GEOBLOCKED: "GEOBLOCKED",
                CONNECTIVITY: "CONNECTIVITY",
                DRM: "DRM",
                FREEWHEEL: "FREEWHEEL",
                GENERIC: "GENERIC",
                APP: "APP"
            },

            OMNITURE_RESUME_TIME: 30
        }
	}
end function
