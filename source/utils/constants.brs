' Holds the constants.
' @name getConstants
' @memberof constants
function getConstants() as Object
    if m.constants = invalid then
        m.constants = {
            HTTP: {
                RETRY_COUNT: 2,
                TIMEOUT: 3000,
                TIMEOUT_MESSAGE: "Request has timed out"
                METHOD: {
                    GET: "GET",
                    PUT: "PUT",
                    POST: "POST",
                    DELETE: "DELETE"
                }
            },
            STRING_INITIALISATION_FAILED:{
                title: "Failed to load application strings",
                subTitle: "",
                contentTitle: "Sorry but we were unable to load application strings",
                contentInformation: "Please restart the application.",
                errorMessage: "Well this is embarrassing." + chr(10) + "Something's not working. Please try again in a few minutes.",
                errorCode: "temp-4: locale error"
            },

            GENERIC_FATAL_ERROR: {
                message: "Well this is embarrassing." + chr(10) + "Something's not working. Please try again in a few minutes."
            },

            API_RESPONSE_TYPE: {
                JSON: "json",
                XML: "xml",
                HTML: "html"
            },

            MENU_TYPE: {
                MAIN_MENU: "MAIN_MENU",
                LEFT_SUBMENU: "LEFT_SUBMENU",
                TOP_SUBMENU: "TOP_SUBMENU",
                LEVEL_THREE_SUBMENU: "LEVEL_THREE_SUBMENU"
            },

            MAIN_MENU: {
                menu: [
                    "",
                    "",
                    "My4",
                    "Home",
                    "Categories",
                    "Box Sets",
                    "Catch Up",
                    "Search",
                    "A-Z",
                    "Settings",
                    "Help & Info"
                ]
            },

            SELECTED_TOP_MENU_ITEMS: {
                MY4: "My4",
                HOME: "Home"
                CATEGORIES: "Categories",
                BOX_SET: "Box Sets",
                ATOZ: "A-Z",
                CATCHUP: "Catch Up",
                SETTINGS: "Settings",
                SEARCH: "Search",
                HELP: "Help & Info"
            },

            FILTER_MENU: ["Popular", "Latest", "Title"],

            THEMES: {
                default: {
                    background_1: "#1E2226",
                    background_2: "#383F47",
                    cta: "#42688B"
                },
                homepage: {
                    background_1: "#1E2226",
                    background_2: "#1E2226",
                    cta: "#42688B"
                },
                c4: {
                    background_1: "#182838",
                    background_2: "#1e3349",
                    cta: "#2F689C"
                },
                c4_orange: {
                    background_1: "#592808",
                    background_2: "#883e0e",
                    cta: "#df6413"
                },
                more4: {
                    background_1: "#21262A",
                    background_2: "#2A3135",
                    cta: "#516f80"
                },
                e4: {
                    background_1: "#2c1235",
                    background_2: "#411A4f",
                    cta: "#a544c8"
                },
                four_seven: {
                    background_1: "#1a3b3e",
                    background_2: "#383F47",
                    cta: "#3a8088"
                },
                c4_coral: {
                    background_1: "#592929",
                    background_2: "#723637",
                    cta: "#ff6979"
                },
                c4_sky: {
                    background_1: "#0e2942",
                    background_2: "#184066",
                    cta: "#1174df"
                },
                c4_green: {
                    background_1: "#1e2a1c",
                    background_2: "#2f412c",
                    cta: "#4e7f47"
                },
                film4: {
                    background_1: "#540303",
                    background_2: "#770911",
                    cta: "#d8121f"
                },
                four_music: {
                    background_1: "#5e0038",
                    background_2: "#8f0256",
                    cta: "#bd0171"
                },
                stand_up_to_cancer: {
                    background_1: "#561a08",
                    background_2: "#832a0e",
                    cta: "#d64213"
                },
                c4_deeppink: {
                    background_1: "#4e162e",
                    background_2: "#782347",
                    cta: "#c43672"
                },
                c4_warmgrey: {
                    background_1: "#2f2f2c",
                    background_2: "#464643",
                    cta: "#75756f"
                },
                c4_news: {
                    background_1: "#200035",
                    background_2: "#310150",
                    cta: "#6c00b2"
                },
                rewards: {
                    background_1: "#493206",
                    background_2: "#654405",
                    cta: "#b38704"
                },
                world_drama: {
                    background_1: "#450c1f",
                    background_2: "#68122f",
                    cta: "#db336b"
                },
                walter_presents: {
                    background_1: "#450c1f",
                    background_2: "#68122f",
                    cta: "#db336b"
                },
                shorts: {
                    background_1: "#0a3436",
                    background_2: "#125154",
                    cta: "#33b0b0"
                },
                c4_cherry: {
                    background_1: "#410a1a",
                    background_2: "#641129",
                    cta: "#b43055"
                },
                c4_khaki: {
                    background_1: "#403a2b",
                    background_2: "#5c523a",
                    cta: "#9d855f"
                },
                c4_lavender: {
                    background_1: "#313245",
                    background_2: "#464e6a",
                    cta: "#A544C8"
                }
            },

            thumbnailAcceptedImageSizes: {
                imageSize: [
                    { width: 60, height: 34 },
                    { width: 100, height: 56 },
                    { width: 106, height: 60 },
                    { width: 145, height: 82 },
                    { width: 200, height: 113 },
                    { width: 412, height: 232 },
                    { width: 496, height: 279 },
                    { width: 625, height: 352 }
                ]
            },

            STRING_PAD_SIDE: {
                RIGHT: "right",
                LEFT: "left",
                BOTH: "both"
            },

            LEFT_SUBMENU_LAYOUT: {
                rowIndexToFocus: "3",
                labelSize: "[240, 50]",
                labelSpacing: "[0, 0]",
                setFocusOnItem: "0",
                position: "[240, 100]",
                verticalFocusAnimationStyle: "fixedFocusWrap",
                focusedLabelColor: "#2B3137",
                unfocusedLabelColor: "#ECEFF3",
                focusedLabelBar: "pkg:/images/level_2_focus.png",
                unfocusedLabelBar: "pkg:/images/level_2_selected.png",
                numOfLabels: "8",
                numVisibleItems: "8",
                gradientRequired: true,
                gradientTopColor: "#1E2226FF",
                gradientBottomColor: "#383F47",
                focusedFont: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "22"
                },
                unFocusedFont: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "22"
                },
                visible: "true"
            },

            TOP_MENU_LAYOUT: {
                text: "Order by:",
                translation: "[495, 123]",
                width: "100",
                height: "22",
                color: "#C1C1C1",
                visible: "true",
                font: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "18"
                }
            },

            PAGE_TITLE: {
                text: "",
                translation: "[65, 36]",
                visible: "true",
                height: "40",
                color: "#ECECEC"
                font: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "32"
                }
            },

            PAGE_TITLE_COUNT: {
                text: "",
                visible: "true",
                color: "#ECECEC",
                height: "30",
                vertAlign: "bottom",
                font: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "18"
                }
            },

            APP_VERSION_TITLE: {
                text: "",
                translation: "[1030, 45]",
                visible: "true",
                width: "315",
                height: "40",
                color: "#C1C1C1"
                font: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "24"
                }
            },

            SUBMENU_FADE_AFFECT : {
                BOTTOM_RECT: {
                    width: "180",
                    height: "50",
                    color: "#383F47",
                    translation: "[240, 607]",
                    visible: "true",
                    opacity: "0.9"
                },

                TOP_RECT: {
                    width: "180",
                    height: "34",
                    color: "#383F47",
                    translation: "[240, 600]",
                    visible: "true",
                    opacity: "0.7"
                },

                RECT_ANIMATE: {
                    top: "[160, 600]",
                    bottom: "[160, 607]"
                }
            },

            PLACEHOLDER_ATTRIBUTES: {
                text: "Coming Soon",
                translation: "[630, 380]",
                visible: "false",
                font: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "40"
                }
            },

            RESET_COMBINATION: ["rewind", "fastforward", "rewind", "fastforward", "options", "rewind", "rewind", "fastforward", "fastforward"],

            REMOTE_KEYS: {
                LEFT: "left",
                RIGHT: "right",
                BACK: "back"
                DOWN: "down"
                UP: "up",
                OK: "ok",
                FF: "fastforward",
                RW: "rewind",
                PLAY: "play"
                REPLAY: "replay",
                OPTIONS: "options"
            },

            GRID_ROW_HEIGHT: "195",

            ANIMATION_STATE: {
                STOPPED: "stopped",
                PAUSED: "paused",
                RUNNING: "running"
            },

            BRAND_SLICES: {
                SLICE_GROUPS: {
                    ANNOUNCEMENT: "ANNOUNCEMENT",
                    DEFAULT: "DEFAULT",
                    FOOTER: "FOOTER"
                },

                FOOTER_TYPES: {
                    RECOMMENDATIONS: "RECOMMENDATIONS",
                    CATEGORY_RECOMMENDATIONS: "CATEGORY_RECOMMENDATIONS",
                    OUR_PICKS: "OUR_PICKS"
                }
            },

            BRAND: {
                SPONSORSHIP_IMAGE_LAYOUT: {
                    height: "112",
                    width: "400",
                    uri: "",
                    translation: "[0, 608]",
                    visible: "true"
                },

                TITLE_LAYOUT: {
                    text: "",
                    translation: "[69, 36]",
                    visible: "true",
                    numOfLines: "3",
                    wrap: "true",
                    width: "300",
                    height: "150",
                    color: "#ECECEC"
                    font: {
                        uri: "pkg:/fonts/C4Headline.otf",
                        size: "32"
                    },
                    lineSpacing: "2",
                    maxLines: "3"
                },

                SYNOPSIS_LAYOUT: {
                    text: "",
                    translation: "[466, 49]",
                    visible: "true",
                    wrap: "true",
                    width: "460",
                    height: "90",
                    color: "#ECECEC"
                    font: {
                        uri: "pkg:/fonts/C4Headline.otf",
                        size: "18"
                    },
                    lineSpacing: "2",
                    maxLines: "2"
                },

                CHANNEL_LOGO_LAYOUT: {
                    height: "70",
                    width: "168",
                    uri: "",
                    translation: "[1029, 42]",
                    visible: "true"
                },

                RATINGS: {
                    RATING_16: 16,
                    RATING_18: 18
                },

                DISCRIPTION_PANEL_LAYOUT: {
                    rectangleHeight: 60,
                    rectangleWidth: 488,
                    labelHeight: 22,
                    labelWidth: 240,
                    translation: [416, 437],
                    visible: true,
                    color: "#000000",
                    textColor: "#ECECEC",
                    opacity: 0.6,
                    text: "",
                    font: {
                      uri: "pkg:/fonts/C4TextMedium.otf",
                      size: 18
                    },
                    labelTranslation: [16, 29]
                },

                POSTER_ATTRIBUTE: {
                    height: 274.8,
                    width: 488,
                    uri: "",
                    translation: [416, 163],
                    visible: true
                },

                RATING_ICON_ATTRIBUTE: {
                    height: 24,
                    width: 24,
                    uri: "",
                    translation: [764, 465],
                    visible: true
                },

                PROGRESS_BAR_ATTRIBUTE: {
                    background: {
                        width: 488,
                        height: 8,
                        color: "#383F47",
                        translation: [416, 429]
                    },
                    progress: {
                        color: "#ECECEC",
                        height: 8,
                        translation: [0, 0]
                    }
                },

                GRID_ATTRIBUTES: {
                    itemComponentName: ""
                    itemSize: [720,135],
                    itemSpacing: [7.5, 7.6],
                    numColumns: 1,
                    numRows: 4,
                    translation: [416, 165]
                },

                GRID_TYPE: {
                    BRAND: "brand",
                    RECOMMENDED: "recommended"
                }

                RATING_POSTER_URL: {
                    GUIDANCE : "pkg:/images/brand/icon_guidance.png",
                    RATING_16: "pkg:/images/brand/icon_16.png",
                    RATING_18: "pkg:/images/brand/icon_18.png"
                },

                PROGRAMME_TYPE: {
                    FB: "FB",
                    LR: "LR"
                },

                ANALYTICS: {
                    ADDITIONAL_INFO: "series_{seriesInfo}_button"

                },

                SUBMENU: {
                    LAYOUT: {
                        itemSize: "[240, 50]",
                        itemSpacing: "[0, 0]",
                        translation: "[160, 130]",
                        numRows: "7",
                        focusRow: "2",
                        numVisibleItems: "9",
                        itemComponentName: "BrandListItem",
                        visible: "true",
                        jumpToItem: "2",
                        focusBitmapUri: "pkg:/images/level_2_focus.png",
                        focusFootprintBitmapUri: "pkg:/images/level_2_selected.png",
                        vertFocusAnimationStyle: "fixedFocusWrap"
                    },

                    POSTER: {
                        FAVOURITES: {
                            layoutDirection: "horiz",
                            posterWidth: "14",
                            posterHeight: "14",
                            color: "#000000",
                            opacity: "1.0"
                            posterTranslation: "[0, 0]",
                            visible: "true",
                            uri: ""
                        },

                        PLAY: {
                            layoutDirection: "horiz",
                            rectangleWidth: "50",
                            rectangleHeight: "50",
                            
                            posterWidth: "22",
                            posterHeight: "22",
                            color: "",
                            posterTranslation: "[12, 14]",
                            visible: "true",
                            uri: ""
                        }
                    },
                },

                 ADD_REMOVE_MY_LIST: {
                    SIGN_IN_TEXT: "Sign in to add this show to My List."
                    ADD_SHOW_TEXT: "Add this show to watch it later."
                }
            },

            C4_APP_LOGO: {
                height: "116",
                width: "125",
                uri: "pkg:/images/logos/logo.png",
                translation: "[70, 46]",
                visible: "true"
            },

            APP_SPONSOR_LOGO: {
                height: "86",
                width: "240",
                uri: "",
                translation: "[0, 634]",
                visible: "true"
            },

            PAGE_SEPARATOR_LAYOUT: {
                width: "780",
                height: "2",
                opacity: "2.3",
                colot: "#ECECEC",
                translation: "[416, 122]"
            },

            BRAND_SUB_MENU: {
                ' ADD_TO_MY_LIST: "+ Add to My List",
                ADD_TO_MY_LIST: "Add to My List",
                REMOVE_FROM_LIST: "Remove from List",
                ON_MY_LIST: "On My List",
                EXTRAS: "Extras",
                MORE_LIKE_THIS: "More like this",
                SERIES: "Series",
                WATCH: "Watch",
                RESUME: "Resume",
                PLAY_LATEST: "Play latest",
                EPISODE: "Episodes",
                ALL_EPISODES: "All Episodes",
                BLANK_ITEMS: [
                    {favouritesItem: false, title: "", isDummyItem: true},
                    {favouritesItem: false, title: "", isDummyItem: true}
                ]
            },

            NUM_HISTORY_DAYS: 30,

            ACCEPTED_LEVEL_THREE_SUBMENU: {
                menu_items: [
                    {title: "All Channels", id: "default"},
                    {title: "Channel 4", id: "c4"},
                    {title: "E4", id: "e4"},
                    {title: "More 4", id: "more4"}
                ]
            },

            LEVEL_THREE_MENU_LAYOUT: {
                rowIndexToFocus: "2",
                labelSize: "[240, 50]",
                labelSpacing: "[0, 0]",
                setFocusOnItem: "0",
                position: "[480, 129]",
                verticalFocusAnimationStyle: "fixedFocusWrap",
                focusedLabelColor: "#2B3137",
                unfocusedLabelColor: "#ECEFF3",
                focusedLabelBar: "pkg:/images/level_2_focus.png",
                unfocusedLabelBar: "pkg:/images/level_2_selected.png",
                numOfLabels: "4",
                numVisibleItems: "6",
                focusedFont: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "22"
                },
                unFocusedFont: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "22"
                },
                visible: "true",
                opacity: "0.5"
            },

            RAF: {
                GET_ADS: "getAds",
                VIDEOMESSAGE: {
                    PLAYBACK_DONE_MESSAGE: "end of stream",
                    PLAYBACK_START_MESSAGE: "start of play"
                }
            },

            SCREENS: {
                BACK: "back",
                PLAYER: "player",
                BRAND: "BrandPage",
                DEEPLINK: "DeepLinkPage",
                HOME: "HomePage"
            },
            CATCHUP: {
                PRIMETIME_IN_MINS: 1260 ' 21 * 60 ==  9pm
            },
            CATCHUP_LEVEL2_MENU_ITEM: {
                TODAY: "Today",
                YESTERDAY: "Yesterday"
            },

            CATCHUP_LEVEL2_MONTHS: {
                months: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
            },

            LEVEL_TWO_LAYOUT: {
                DEFAULT_LAYOUT: {
                    setFocusOnItem: "0",
                    rowIndexToFocus: "3",
                    position: "[240, 79]",
                    numOfLabels: "8",
                    numVisibleItems: "10",
                    gradientRequired: true,
                    gradientTopColor: "#1E2226FF",
                    gradientBottomColor: "#383F47"
                },

                SPECIFIC_LAYOUT: {
                    setFocusOnItem: "1",
                    rowIndexToFocus: "3",
                    position: "[240, 79]",
                    numOfLabels: "9",
                    numVisibleItems: "11",
                    gradientRequired: true,
                    gradientTopColor: "#1E2226FF",
                    gradientBottomColor: "#383F47"
                },

                SETTINGS_LAYOUT: {
                    setFocusOnItem: "0",
                    rowIndexToFocus: "1",
                    position: "[240, 179]",
                    numOfLabels: "9",
                    numVisibleItems: "10",
                    gradientRequired: false
                },

                HELP_LAYOUT: {
                    setFocusOnItem: "0",
                    rowIndexToFocus: "2",
                    position: "[240, 129]",
                    numOfLabels: "9",
                    numVisibleItems: "10",
                    gradientRequired: false
                },

                MY4_LAYOUT: {
                    setFocusOnItem: "0",
                    rowIndexToFocus: "2",
                    position: "[0, 35]",
                    numOfLabels: "9",
                    numVisibleItems: "10",
                    gradientRequired: false
                }
            },

            CHANNEL_4_SUPPORTED_CHANNELS: {
                CHANNEL4: "Channel 4",
                E4: "E4",
                MORE4: "More 4",
                FOUR_MUSIC: "4 Music",
                FOUR_SEVEN: "4 Seven",
                FILM4: "Film 4"
            },

            CHANNEL_LOGO_URL: {
                UNFOCUSED: {
                    LOGO_C4: "pkg:/images/logos/logo_channel_4_white.png",
                    LOGO_E4: "pkg:/images/logos/logo_E4_white.png",
                    LOGO_M4: "pkg:/images/logos/logo_more4_white.png",
                    LOGO_4M: "pkg:/images/logos/logo_4music_white.png",
                    LOGO_4S: "pkg:/images/logos/logo_4_7_white.png",
                    DEFAULT: "pkg:/images/logos/logo_all4_white.png",
                    LOGO_F4: "pkg:/images/logos/logo_film4_white.png"
                },

                FOCUSED: {
                    LOGO_C4: "pkg:/images/logos/logo_channel_4_colour.png",
                    LOGO_E4: "pkg:/images/logos/logo_E4_colour.png",
                    LOGO_M4: "pkg:/images/logos/logo_more4_colour.png",
                    LOGO_4M: "pkg:/images/logos/logo_4music_colour.png",
                    LOGO_4S: "pkg:/images/logos/logo_4_7_colour.png",
                    DEFAULT: "pkg:/images/logos/logo_all4_colour.png",
                    LOGO_F4: "pkg:/images/logos/logo_film4_colour.png"
                }
            },

            CATCHUP_AIRTIME_LAYOUT: {
                text: "",
                layoutDirection: "horiz",
                visible: true,
                rectangleWidth: 124,
                rectangleHeight: 46,
                labelWidth: 96,
                labelHeight: 24,
                color: "#000000",
                textColor: "#ECECEC",
                opacity: "0.84",
                font: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "22"
                },
                translation: "[0,0]",
                verticalAlign: "center",
                horizontalAlign: "center",
                labelTranslation: "[15, 11.8]"
            },

            PAGE_LIST_TEXT_LAYOUT: {
                text: "9:30pm",
                layoutDirection: "horiz",
                visible: false,
                rectangleWidth: 124,
                rectangleHeight: 46,
                labelWidth: 124,
                labelHeight: 46,
                color: "#000000",
                textColor: "#ECECEC",
                opacity: "0.84",
                font: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "22"
                },
                translation: "[0,0]"
            },

            PAGE_LIST_PLAY_ICON_TEXT_LAYOUT : {
                text: "Play",
                layoutDirection: "horiz",
                visible: true,
                rectangleWidth: 79,
                rectangleHeight: 50,
                labelWidth: 79,
                labelHeight: 50,
                color: "#000000",
                textColor: "#ECECEC",
                opacity: "0.84",
                font: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "22"
                },
                translation: "[50,70]",
                verticalAlign: "center",
                horizontalAlign: "center"
            },

            PLAY_ICON_LAYOUT : {
                layoutDirection: "horiz",
                visible: true,
                rectangleWidth: 50,
                rectangleHeight: 50,
                posterWidth: 24,
                posterHeight: 24,
                translation: [0, 70],
                color: "",
                opacity: "0.90",
                posterUrl: "pkg:/images/brand/icon_play_white.png"
            },

            PAGE_LIST_RESUME_ICON_TEXT_LAYOUT : {
                text: "Resume",
                layoutDirection: "horiz",
                visible: true,
                rectangleWidth: 120,
                rectangleHeight: 50,
                labelWidth: 120,
                labelHeight: 50,
                color: "#000000",
                textColor: "#ECECEC",
                opacity: "0.84",
                font: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "22"
                },
                translation: "[50,70]",
                verticalAlign: "center",
                horizontalAlign: "center"
            },

            RESUME_ICON_LAYOUT : {
                layoutDirection: "horiz",
                visible: true,
                rectangleWidth: 50,
                rectangleHeight: 50,
                posterWidth: 24,
                posterHeight: 24,
                translation: [0, 70],
                color: "#C1C1C1",
                opacity: "0.90",
                posterUrl: "pkg:/images/my4/icon_play_dark_grey.png"
            },

            PAGE_LIST_UNAVAILABLE_ICON_TEXT_LAYOUT : {
                text: "Unavailable",
                layoutDirection: "horiz",
                visible: true,
                rectangleWidth: 170,
                rectangleHeight: 50,
                labelWidth: 170,
                labelHeight: 50,
                color: "#2f3944",
                textColor: "#ECECEC",
                opacity: "1.0",
                font: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "22"
                },
                translation: "[0,60]",
                verticalAlign: "center",
                horizontalAlign: "center"
            },

            GRID_ITEM_TYPE_ICON_TEXT_LAYOUT: {
                text: "",
                layoutDirection: "horiz",
                visible: true,
                rectangleWidth: 130,
                rectangleHeight: 32,
                labelWidth: 130,
                labelHeight: 32,
                color: "#000000D9",
                textColor: "#ECECEC",
                opacity: "1.0",
                font: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "16"
                },
                translation: "[0,0]",
                verticalAlign: "center",
                horizontalAlign: "center"
            },

            GRID_ITEM_TYPE_COLOR: {
                NEW_SERIES: "#ac310a",
                NEW_EPISODE: "#ac310a",
                NEXT_EPISODE: "#ac310a",
                EXPIRED: "#000000D9"
            },

            PAGE_LIST_EPISODE_TYPE_TEXT_LAYOUT : {
                text: "",
                layoutDirection: "horiz",
                visible: true,
                rectangleWidth: 130,
                rectangleHeight: 30,
                labelWidth: 130,
                labelHeight: 30,
                color: "#ac310a",
                textColor: "#ECECEC",
                opacity: "1.0",
                font: {
                    uri: "pkg:/fonts/C4Headline.otf",
                    size: "16"
                },
                translation: "[0,0]",
                verticalAlign: "center",
                horizontalAlign: "center"
            },

            ERROR_LAYOUT: {
                LIST_UNAVAILABLE: {
                    layoutDirection: "horiz",
                    visible: true,
                    width: 616,
                    height: 60,
                    textColor: "#ECECEC",
                    font: {
                        uri: "pkg:/fonts/C4Headline.otf",
                        size: "22"
                    },
                    translation: "[266, 237]",
                    wrap: true
                },

                APP_LOADING: {
                    uri: "pkg:/images/app_loading_error.png",
                    height: "265",
                    width: "536",
                    translation: "[162, 68]",
                    visible: "true"
                }
            },

            DIALOG: {

                PLAYER_ERROR: {
                    visible: true,
                    width: 957,
                    height: 585,
                    titleColor: "#1E2226",
                    titleFont: {
                        uri: "pkg:/fonts/C4Headline.otf",
                        size: "22"
                    },
                    messageColor: "#1E2226",
                    messageFont: {
                        uri: "pkg:/fonts/C4Headline.otf",
                        size: "22"
                    },
                    translation: "[162, 68]",
                    graphicUri: "pkg:/images/close_modal.png",
                    graphicWidth: "27.8",
                    graphicHeight: "23.7",
                    buttons: ["Back"]
                },

                PRIVACY_COOKIES: {
                    HIDE_BACK_LEGEND: true,
                    READ_MORE: {
                        buttons: [
                            {
                                id: "cancel",
                                text: "Exit",
                                fixedSize: {
                                    width: 180
                                }
                            },
                            {
                                id: "confirm",
                                text: "Accept & continue",
                                type: "step",
                                fixedSize: {
                                    width: 224
                                }
                            }
                        ]
                    },

                    DEFAULT: {
                        buttons: [
                            {
                                id: "readMore",
                                text: "Read more",
                                fixedSize: {
                                    width: 180
                                }
                            },
                            {
                                id: "confirm",
                                text: "Accept & continue",
                                type: "step",
                                fixedSize: {
                                    width: 224
                                }
                            }
                        ]
                    }
                },

                DEFAULT_BUTTONS: [
                    {
                        id: "cancel",
                        text: "Back"
                    }
                ],

                CONNECTION_ERROR_BUTTONS: [
                    {
                        id: "cancel",
                        text: "Exit"
                    }
                ]
            },

            HELP: {
                HELP_INFO_SUBMENU_ITEMS: [
                    {
                        title: "FAQ"
                    }, {
                        title : "Terms of Use"
                    }, {
                        title: "Privacy & Cookies"
                    }
                ],
                HELP_INFO_IDS: {
                    faq: "FAQ",
                    privacy: "Privacy & Cookies",
                    terms: "Terms of Use"
                }
            }

            SETTINGS_SUBMENU_ITEMS: {
                PARENTAL_CONTROL: {
                    title: "Parental Control"
                },
                SIGN_IN: {
                    title: "Sign in"
                    loggedInStatus: false
                },
                SIGN_OUT: {
                    title: "Sign Out"
                    loggedInStatus: true
                }
            },

            PARENTAL_PIN: {
                TEXT_LAYOUT: {
                    textcolor: "#ECEFF3",

                    TITLE: {
                        font: {
                            uri: "pkg:/fonts/C4Headline.otf",
                            size: "18"
                        },

                        SIXTEEN: {
                            width: 536,
                            height: 24,
                            translation: [72, 242],
                            text: "16+ all rated content"
                        },

                        EIGHTEEN: {
                            width: 536,
                            height: 24,
                            translation: [72, 342],
                            text: "18+ all rated content"
                        }
                    },
                    POSTER: {
                        SIXTEEN: {
                            height: 24,
                            width: 24,
                            translation: [32, 242],
                            uri: "pkg:/images/brand/icon_16.png"
                        },

                        EIGHTEEN: {
                            height: 24,
                            width: 24,
                            translation: [32, 342],
                            uri: "pkg:/images/brand/icon_18.png"
                        },
                    },
                    PARA: {
                        font: {
                            uri: "pkg:/fonts/C4TextMedium.otf",
                            size: "18"
                        },
                        numLines: "2",
                        wrap: true,
                        ONE: {
                            width: 670,
                            lineSpacing: "2",
                            translation: [32, 169],
                            text: "Set up a PIN to control access to rated content. The PIN will only work on this device. Your PIN can be set at one of two levels: "
                        },
                        SIXTEEN: {
                            width: 640,
                            lineSpacing: "2",
                            translation: [72, 267],
                            text: "If you choose to set it at 16 rated content (16+), then anyone wishing to view content suitable only for users over 16 years of age will need the PIN"
                        },
                        EIGHTEEN: {
                            width: 640,
                            lineSpacing: "2",
                            translation: [72, 367]
                            text: "If you choose to set it at 18 rated content (18+), then anyone wishing to view content suitable only for users over 18 years of age will need the PIN"
                        }
                    }
                },

                PIN_PAD: {
                    TITLE: {
                        text: "Create your 4-digit PIN",
                        font: {
                            uri: "pkg:/fonts/C4Headline.otf",
                            size: "22"
                        },
                        color: "#ECECEC",
                        width: 619,
                        height: 24
                    },

                    DESCRIPTION: {
                        text: "Use the FFW and RW keys to increase/decrease the number, then press SELECT to input.",
                        numOfLines: "2",
                        wrap: true,
                        font: {
                            uri: "pkg:/fonts/C4TextMedium.otf",
                            size: "18"
                        },
                        color: "#ECECEC",
                        width: 380,
                        height: 50
                    },

                    PIN_BOX: {
                        UNFOCUSED: {
                            rectangleColor: "#00000000",
                            backgroundColor: "#474f63",
                            labelColor: "#ECECEC"
                        }
                        FOCUSED: {
                            rectangleColor: "#FFFFFF",
                            backgroundColor: "#1e2226",
                            labelColor: "#33AEA7",
                        }
                    }
                },

                SETUP_PIN_STEPS: [
                    {
                        infoText: "Confirm Your age",
                        buttons: [
                            {
                                id: "cancel",
                                text: "Cancel"
                            },
                            {
                                id: "continue",
                                text: "Yes, I am aged 18 or over",
                                type: "step"
                            }
                        ]
                    },
                    {
                        infoText: "Accept T&C",
                        buttons: [
                            {
                                id: "cancel",
                                text: "Cancel"
                            },
                            {
                                id: "continue",
                                text: "I confirm that I have read the T&Cs",
                                type: "step"
                            }
                        ]
                    },
                    {
                        infoText: "Create PIN",
                        buttons: [
                            {
                                id: "cancel",
                                text: "Cancel"
                            },
                            {
                                id: "confirm",
                                text: "Activate your PIN",
                                type: "step",
                                disabled: true
                            }
                        ]
                    }
                ],

                DEACTIVATE_PIN: {
                    PIN_PAD: {
                        TITLE: {
                            text: "Enter your PIN to deactivate",
                            font: {
                                uri: "pkg:/fonts/C4Headline.otf",
                                size: "22"
                            },
                            color: "#ECECEC",
                            width: 619,
                            height: 24
                        }
                    },
                    BUTTONS: [
                        {
                            id: "cancel",
                            text: "Cancel"
                        },
                        {
                            id: "confirm",
                            text: "Deactivate your PIN",
                            type: "step",
                            disabled: true
                        }
                    ]
                },

                FORGOTTEN_PIN: {
                    title: "Parental Control",
                    subTitle: "Forgotten PIN",
                    contentTitle: "Please contact us at:" + chr(10) + "www.channel4.com/contact",
                    contentInformation: "A member of our Viewer Enquiries team will be in touch by email within 24 hours" + chr(10) + "to provide instructions on how to reset your PIN."
                }
            },

            SIGN_IN_OUT_SETTINGS_PAGE: {
                NEXT_BUTTON_ID: "next",
                PREVIOUS_BUTTON_ID: "previous",
                SIGN_IN_BUTTON_ID: "signIn",
                SIGN_IN: {
                    buttons: [
                        {
                            id: "signInButton",
                            text: "Sign in now"
                        }
                    ]
                },

                SIGN_OUT: {
                    buttons: [
                        {
                            id: "signOutButton",
                            text: "Sign out now"
                        }
                    ]
                },

                SIGN_IN_POPUP: {
                    buttons: [
                        {
                            id: "cancel",
                            text: "Cancel"
                        },
                        {
                            id: "next",
                            text: "Next"
                            type: "step"
                        }
                    ]
                    HINT_TEXT: "Type in your email address"
                    TITLE: "Sign in to All 4"
                    SUB_TITLE: "Not registered yet? Go to channel4.com/roku"
                },

                PASSWORD_POPUP: {
                    buttons: [
                        {
                            id: "previous",
                            text: "Previous"
                        },
                        {
                            id: "cancel",
                            text: "Cancel"
                        },
                        {
                            id: "signIn",
                            text: "Sign in"
                        }
                    ]
                    HINT_TEXT: "Type in your password"
                    SHOW_PASSWORD_TEXT: "Show Password"
                    HIDE_PASSWORD_TEXT: "Hide Password"
                },

                BASIC_BUTTON: {
                    DEFAULT: {
                        UNFOCUSED: {
                            container: "#2B3137",
                            inner: "#2B3137",
                            labelColor: "#ffffff"
                        },
                        FOCUSED: {
                            container: "#ffffff",
                            inner: "#ffffff",
                            labelColor: "#000000"
                        }
                    }
                    STEP_ICON: {
                        focused: "pkg:/images/dialog/arrow_right_black.png",
                        unfocused: "pkg:/images/dialog/arrow_right.png"
                    },
                },

                ERRORS: {
                    INVALID_EMAIL_ADDRESS: "Invalid email address"
                    SIGN_IN_FAILED: "Login error. Please try again"
                }

                SIGN_IN_SUCCESS_LABEL: "You are now signed in to All 4"
                SIGN_OUT_SUCCESS_LABEL: "You are now signed out of All 4"
            },

            SIGN_IN: {
                STATUS: {
                    FAILED: "failed"
                    APPROVED: "approved"
                }
            }

            SCROLLABLE_TEXT_LAYOUT: {
            text: "",
            color: "#ECECEC",
            font: {
                uri: "pkg:/fonts/C4Headline.otf",
                size: "16",
            },
            lineSpacing: 4,
            horizAlign: "left",
            vertAlign: "top",
            scrollbarTrackBitmapUri: "pkg:/images/scrollableText/scrollableTextBlank.png",
            scrollbarThumbBitmapUri: "pkg:/images/scrollableText/scrollableTextArrowUnFocus.png"
            },

            SCROLLABLE_TEXT_FOCUS_ARROW_IMG: "pkg:/images/scrollableText/scrollableTextArrowFocus.png",
            SCROLLABLE_TEXT_UNFOCUS_ARROW_IMG: "pkg:/images/scrollableText/scrollableTextArrowUnFocus.png",

            SEARCH: {
                noResultTitle: "Your search did not match any" + chr(10) + "programmes currently available",
                noResultInfo: "– You can only search by programme name" + chr(10) + "– Please check spelling is correct" + chr(10) + "– Take a look at the A-Z or Category sections",
                MAX_RECENT_SEARCH: 8
            },

            STEP_INDICATOR: {
                stepImage: "pkg:/images/stepIndicator/stepIndicator.png",
                stepImageCurrent: "pkg:/images/stepIndicator/stepIndicatorCurrent.png",
                focusedColor: "#35aba3",
                unfocusedColor: "#cccccc"
            },

            BASIC_BUTTON: {
                DEFAULT: {
                    UNFOCUSED: {
                        container: "#000000",
                        inner: "#000000",
                        labelColor: "#ffffff"
                    },
                    FOCUSED: {
                        container: "#ffffff",
                        inner: "#ffffff",
                        labelColor: "#000000"
                    }
                },
                DISABLED: {
                    container: "#2B3137",
                    inner: "#1e2226",
                    labelColor: "#8a8a8a"
                },
                STEP_ICON: {
                    focused: "pkg:/images/dialog/arrow_right_black.png",
                    unfocused: "pkg:/images/dialog/arrow_right.png"
                },
                BUTTON_ICON: {
                    focused_background: "#42688B",
                    default_background: "#2B3137",
                    focused: "pkg:/images/player/icon_play_white.png",
                    unfocused: "pkg:/images/player/icon_play_grey.png"
                }
            },

            RADIO_BOX: {
                unfocused: "pkg:/images/radioBox/radio_box_unfocused.png",
                focused: "pkg:/images/radioBox/radio_box_focused.png",
                selected: "pkg:/images/radioBox/radio_box_selected.png",
                selectedTextColor: "#ececec",
                defaultTextColor: "#cccccc"
            },


            PARENTAL_CONTROL_PAGE: {
                BUTTON_LIST: {
                    NO_PIN: {
                        translation: "[460, 126]"
                    },
                    PIN: {
                        translation: "[485, 63]"
                    }
                },

                PIN_ACTIVATED: {
                    layoutDirection: "horiz",
                    itemSpacings: "[10]",
                    translation:"[153, 80]",
                    text: "PIN Activated",

                    FONT: {
                        default: "#ececec",
                        recentlyCreated: "#33AEA7",
                        uri: "pkg:/fonts/C4Headline.otf",
                        size: "22"
                    },

                    CHECK_MARK: {
                        default: "pkg:/images/brand_on_my_list.png",
                        recentlyCreated: "pkg:/images/check_green.png"
                    }
                },

                BASIC_BUTTON: {
                    DEFAULT: {
                        UNFOCUSED: {
                            container: "#2B3137",
                            inner: "#2B3137",
                            labelColor: "#ffffff"
                        },
                        FOCUSED: {
                            container: "#ffffff",
                            inner: "#ffffff",
                            labelColor: "#000000"
                        }
                    },
                    STEP_ICON: {
                        focused: "",
                        unfocused: ""
                    },
                    BUTTON_ICON: {
                        focused: "",
                        unfocused: "",
                        focused_background: "#000000",
                        default_background: "#000000"
                    }
                },
                INFO_TEXT: {
                    uri: "pkg:/fonts/C4TextMedium.otf",
                    size: "18",
                    color: "#ececec",
                    translation: "[42, 269]"
                },
                NO_PIN: {
                    buttons: [
                        {
                            id: "setupPinButton",
                            text: "Set up a PIN"
                        }
                    ]
                },
                PIN: {
                    buttons: [
                        {
                            id: "deactivatePinButton",
                            text: "Deactivate PIN"
                        },
                        {
                            id: "forgottenPinButton",
                            text: "Forgotten PIN"
                        }
                    ]
                },

                PIN_ACTIVATED_TEXT: "Your Parental Control PIN has been activated",
                PIN_DEACTIVATED_TEXT: "Your Parental Control PIN has been deactivated",
                ACTIVE_PIN_TEXT: "You have set up a PIN and will be prompted for it on content rated {agerestriction}+"
            },

            PLAYBACK_POPUP: {
                AGE_CONFIRM_TEXT: "Please confirm that you are over {agerating} years old and accept our Terms of Use.",
                PIN_PAD: {
                    TITLE: {
                        text: "Enter your 4-digit PIN",
                        font: {
                            uri: "pkg:/fonts/C4Headline.otf",
                            size: "22"
                        },
                        color: "#ECECEC",
                        width: 619,
                        height: 24
                    }
                },
                MODE: {
                    PIN: "PIN",
                    DEFAULT: "DEFAULT",
                    DEFAULT_WITH_PIN: "DEFAULT_WITH_PIN"
                },
                PIN: {
                    fixedButtonSize: {
                        width: 180
                    },
                    buttons: [
                        {
                            id: "cancel",
                            text: "Cancel"
                        },
                        {
                            id: "forgottenpin",
                            text: "Forgotten PIN"
                        },
                        {
                            id: "confirm",
                            text: "Play"
                            type: "icon",
                            disabled: true
                        }
                    ]
                },
                DEFAULT: {
                    buttons: [
                        {
                            id: "cancel",
                            text: "Decline"
                        },
                        {
                            id: "termsofuse",
                            text: "Terms of Use"
                        },
                        {
                            id: "setuppin",
                            text: "Set up a PIN"
                        },
                        {
                            id: "confirm",
                            text: "Accept & Play",
                            type: "icon"
                        }
                    ]
                },
                DEFAULT_WITH_PIN: {
                    fixedButtonSize: {
                        width: 180
                    },
                    buttons: [
                        {
                            id: "cancel",
                            text: "Decline"
                        },
                        {
                            id: "termsofuse",
                            text: "Terms of Use"
                        },
                        {
                            id: "confirm",
                            text: "Accept & Play",
                            type: "icon"
                        }
                    ]
                }
            },

            FAQ_DIALOG: {

                FAQ_DIALOG_BUTTON: [{
                    id: "back",
                    text: "Back"
                }],

                NO_ANSWER_MESSAGE: "There was an error getting this answer. Please try again later."

            },

            HOME_SLICE_TYPES: {
                "CATCHUP": "CATCHUP",
                "RECOMMENDATIONS": "RECOMMENDATIONS",
                "MOST_POPULAR": "MOST_POPULAR",
                "CONTINUE_WATCHING": "CONTINUE_WATCHING",
                "COLLECTION": "COLLECTION"
            },

            HOME_SLICE_TEMPLATES: {
                BOX_SET: "BOXSET",
                HERO: "HERO"
            },

            HOME_HERO_SLICE: {
                DOT_RECT_ATTRIBUTES: {
                    height: "10",
                    width: "25",
                    color: "#515457"
                },
                DOT_RECT_FOCUS_COLOR: "#ECECEC",
                DOT_RECT_DEFAULT_COLOR: "#515457",
                DOT_X_TRANSLATION: 35,
                ITEMS_SIZE: {
                    width: "650",
                    height: "280"
                },
                ITEM_TYPES: {
                    brand: "brand",
                    episode: "episode"
                }
            },

            HOME_CAROUSEL_SLICE: {
                HEIGHT: 200,
                MARGIN: 15,
                PLACEHOLDER: {
                    type: "placeholder",
                    image: "pkg:/images/logos/logo_all4_white_placeholder.png"
                },
                SEE_ALL_BUTTON: {
                    TITLE: {
                        default: "See all",
                        my4: "My4"
                    },
                    BACKGROUND: {
                        focused: "#ffffff",
                        unfocused: "#00000080"
                    },
                    ARROW: {
                        focused: "pkg:/images/dialog/arrow_right_black.png",
                        unfocused: "pkg:/images/dialog/arrow_right.png"
                    },
                    TEXT_COLOR: {
                        focused: "#2B3137",
                        unfocused: "#ececec"
                    }
                },
                GRID_ITEM: {
                    PROGRESSBAR: {
                        background: {
                            id: "progressbarBackground",
                            color: "#383F47",
                            translation: "[0, 127]",
                            height: "8",
                            width: "240",
                            visible: "false"
                        },
                        progress: {
                            id: "progressbarProgress",
                            color: "#ECECEC",
                            translation: "[0, 0]",
                            height: "8",
                            width: "0"
                        }
                    },
                    PLAYRESUME_ICON: {
                        posterUrl: "pkg:/images/brand/icon_play_dark_grey.png",
                        rectangleWidth: 50
                        rectangleHeight: 50
                        color: "#ececec",
                        translation: "[0, 70]",
                        posterTranslation: "[12.5, 12.5]"
                    },
                    PLAYRESUME_TEXT: {
                        rectangleHeight: 50,
                        labelHeight: 50,
                        translation: [50, 70],
                        visible: true,
                        color: "#000000D9",
                        textColor: "#ECECEC",
                        'text: "",
                        font: {
                          uri: "pkg:/fonts/C4Headline.otf",
                          size: 22
                        }
                        verticalAlign: "center"
                        horizontalAlign: "center"
                    }
                }
            },

            ASSET_TYPE: {
                episode: "episode",
                brand: "brand"
            },

            MY4: {
                SUBMENU_ITEMS: {
                    MY_LIST: {
                        title: "My List"
                    },

                    HISTORY: {
                        title: "History"
                    },

                    WATCHING: {
                        title: "Watching"
                    },
                },

                EMPTY_CONTENT: {
                    "MY LIST": {
                        message: "Shows you've added will appear here",
                        imageUrl: "pkg:/images/my4/my4_empty_mylist.png"
                    },

                    HISTORY: {
                        message: "Keep track of what you have been watching",
                        imageUrl: "pkg:/images/my4/my4_empty_history.png"
                    },

                    WATCHING: {
                        message: "Resume unfinished shows and" + chr(10) + "see new available episodes",
                        imageUrl: "pkg:/images/my4/my4_empty_watching.png"
                    }
                },

                WATCHING_ITEM_TYPES: {
                    NEW_SERIES: "NEW SERIES",
                    NEW_EPISODE: "NEW EPISODE",
                    NEXT_EPISODE: "NEXT EPISODE",
                    EXPIRED: "Unavailable"
                },

                ITEM_TYPES: {
                    WATCHING: "Watching",
                    HISTORY: "History",
                    LIST: "My List"
                },

                CTA: {
                    SHARED_BY_ALL: {
                        title: "Show All Episodes",
                        hasIcon: false
                    },

                    SHARE_BY_LIST_AND_HISTORY: [{
                        title: "Remove",
                        hasIcon: false
                    },
                    {
                        title: "Remove All",
                        hasIcon: false
                    }]

                    PLAY_AGAIN : {
                        title: "Play Again",
                        hasIcon: true
                    },

                    RESUME : {
                        title: "Resume",
                        hasIcon: true
                    },

                    PLAY : {
                        title: "Play",
                        hasIcon: true
                    },

                    RESTART : {
                        title: "Play from start",
                        hasIcon: true
                    }
                },

                GRID_ROW_HEIGHT: "60",

                ACTION_PANEL_TEXT_LAYOUT : {
                    text: "",
                    layoutDirection: "horiz",
                    visible: true,
                    rectangleWidth: 305,
                    rectangleHeight: 40,
                    labelWidth: 305,
                    labelHeight: 40,
                    color: "#00000000",
                    textColor: "#ECECEC",
                    font: {
                        uri: "pkg:/fonts/C4Headline.otf",
                        size: "22"
                    },
                    translation: "[20,0]",
                    verticalAlign: "center",
                    horizontalAlign: "left"
                },

                ACTION_PANEL_TEXT_LAYOUT_FOCUS : {
                    text: "",
                    layoutDirection: "horiz",
                    visible: true,
                    rectangleWidth: 265,
                    rectangleHeight: 40,
                    labelWidth: 265,
                    labelHeight: 40,
                    color: "#00000000",
                    textColor: "#2b3137",
                    font: {
                        uri: "pkg:/fonts/C4Headline.otf",
                        size: "22"
                    },
                    translation: "[50,0]",
                    verticalAlign: "center",
                    horizontalAlign: "left"
                },

                FAVOURITES_ACTION_TYPES: {
                    ADD: "Add",
                    REMOVE: "Remove"
                },

                ACTION_PANEL_ICON_LAYOUT : {
                    layoutDirection: "horiz",
                    visible: true,
                    rectangleWidth: 40,
                    rectangleHeight: 40,
                    posterWidth: 20,
                    posterHeight: 20,
                    translation: [0, 0],
                    posterTranslation: [10, 10]
                    color: "#2f689c",
                    opacity: "1.0",
                    posterUrl: "pkg:/images/brand/icon_play_white.png"
                },

                ADD_TO_LIST_TEXT: " has been added to 'My List'",
                REMOVE_FROM_LIST_TEXT: " has been removed from 'My List'"
            },

            REGISTRY: {
                RESET_PIN: [
                    {
                       key: "pinLevel"
                    },
                    {
                        key: "pinKey"
                    },
                    {
                        key: "termsAgreed"
                    },
                    {
                        key: "welcomeScreenShowCount"
                    }
                ]
            }

            SHOW_ALL_PANEL: {
                ANIMATION: {
                    duration: 0.4,
                    MOVE_IN: "MOVE_IN",
                    MOVE_OUT: "MOVE_OUT",
                    KEYVALUE: {
                        MOVE_IN: [[1280.0, 0.0],[87.0, 0.0]],
                        MOVE_OUT: [[87.0, 0.0],[1280.0, 0.0]]
                    }
                }
            },

            OBSERVERFIELDS: {
                HOMEPAGE: {
                    onclick: "triggerOnClick"
                }
            },

            SCENE: {
                loadingImage: "pkg:/images/programIcons/image_loading.png"
            },

            WELCOME: {
                screenWidth: 1280,
                logoUri: "pkg:/images/welcome.png",
                buttons: [
                    {
                        id: "confirm",
                        text: "Continue"
                    }
                ]
            },

            EXIT_DIALOG: {
                HIDE_BACK_LEGEND: true,
                contentDimensions: {
                    width: 800,
                    height: 490,
                    translation: [240.0, 115.0]
                },
                poster: {
                    uri: "pkg:/images/dialog/exitImage.png",
                    translation: [167.0, 53.0]
                },
                label: {
                    translation: [71.0, 310.0]
                },
                buttonContainerGroup: {
                    translation: [381.0, 502.0],
                    dividerLine: {
                        width: 510
                    },
                    buttonLayout: {
                        translation: [497.0, 22.0],
                        buttonConstants: {
                            BASIC_BUTTON: {
                                DEFAULT: {
                                    UNFOCUSED: {
                                        container: "#000000",
                                        inner: "#000000",
                                        labelColor: "#ffffff"
                                    },
                                    FOCUSED: {
                                        container: "#ffffff",
                                        inner: "#ffffff",
                                        labelColor: "#000000"
                                    }
                                }
                                STEP_ICON: {
                                    focused: "pkg:/images/dialog/arrow_right_black.png",
                                    unfocused: "pkg:/images/dialog/arrow_right.png"
                                },
                            }
                        },
                        buttonSize: {
                            width: 184
                        }
                    }
                },
                buttons: [
                    {
                        id: "cancel",
                        text: "More from All 4",
                    },
                    {
                        id: "exitApp",
                        text: "Exit",
                    }
                ]
            },

            BRAND_GRID_ITEM: {
                PROGRESSBAR: {
                    background: {
                        color: "#383F47",
                        translation: "[0, 127]",
                        height: "8",
                        width: "240"
                    },
                    progress: {
                        color: "#ECECEC",
                        translation: "[0, 0]",
                        height: "8",
                        width: "0"
                    }
                }
            },

            ANIMATE_LEVELS: {
                LEVEL0: "level0",
                LEVEL1: "level1",
                LEVEL2: "level2",
                LEVEL3: "level3",
                PAGE_BODY: "pageBody"
            }
        }
    end if

    return m.constants
end function
