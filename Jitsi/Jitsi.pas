unit Jitsi;

interface

uses
  W3C.DOM, W3C.Html5;

type
  JJitsiConfigHosts = class external
    // XMPP domain.
    domain: String;

    // When using authentication, domain for guest users.
    anonymousdomain: String;

    // Domain for authenticated users. Defaults to <domain>.
    authdomain: String;

    // Jirecon recording component domain.
    jirecon: String;

    // Call control component (Jigasi).
    call_control: String;

    // Focus component domain. Defaults to focus.<domain>
    focus: String;

    // XMPP MUC domain. FIXME: use XEP-0030 to discover it.
    muc: String;
  end;

  JJitsiConfigTesting = class external
    // P2P test mode disables automatic switching to P2P when there are 2
    // participants in the conference.
    p2pTestMode: Boolean;

    // Enables the test specific features consumed by jitsi-meet-torture
    testMode: Boolean;

    // Disables the auto-play behavior of *all* newly created video element.
    // This is useful when the client runs on a host with limited resources.
    noAutoPlayVideo: Boolean;

    // Enable / disable 500 Kbps bitrate cap on desktop tracks. When enabled,
    // simulcast is turned off for the desktop share. If presenter is turned
    // on while screensharing is in progress, the max bitrate is automatically
    // adjusted to 2.5 Mbps. This takes a value between 0 and 1 which determines
    // the probability for this to be enabled.
    capScreenshareBitrate: Integer;
  end;

  JJitsiConfigConstraintsVideoHeight = class external
    ideal: Integer; // defaults to 720
    max: Integer;   // defaults to 720
    min: Integer;   // defaults to 240
  end;

  JJitsiConfigConstraintsVideo = class external
    height: JJitsiConfigConstraintsVideoHeight
  end;

  JJitsiConfigConstraints = class external
    video: JJitsiConfigConstraintsVideo;
  end;

  JJitsiConfigDesktopSharingFrameRate = class external
    min: Integer;
    max: Integer;
  end;

  JJitsiConfigRecordingLimit = class external
    limit: Integer;
    appName: String;
    appURL:  String;
  end;

  JJitsiConfigP2PStunServer = class external
    urls: String;
  end;

  JJitsiConfigP2P = class external
    // Enables peer to peer mode. When enabled the system will try to
    // establish a direct connection when there are exactly 2 participants
    // in the room. If that succeeds the conference will stop sending data
    // through the JVB and use the peer to peer connection instead. When a
    // 3rd participant joins the conference will be moved back to the JVB
    // connection.
    enabled: Boolean;

    // Use XEP-0215 to fetch STUN and TURN servers.
    useStunTurn: Boolean;

    // The STUN servers that will be used in the peer to peer connections
    stunServers: array of JJitsiConfigP2PStunServer;

    // Sets the ICE transport policy for the p2p connection. At the time
    // of this writing the list of possible values are 'all' and 'relay',
    // but that is subject to change in the future. The enum is defined in
    // the WebRTC standard:
    // https://www.w3.org/TR/webrtc/#rtcicetransportpolicy-enum.
    // If not set, the effective value is 'all'.
    iceTransportPolicy: String;

    // If set to true, it will prefer to use H.264 for P2P calls (if H.264
    // is supported).
    preferH264: Boolean;

    // If set to true, disable H.264 video codec by stripping it out of the
    // SDP.
    disableH264: Boolean;

    // How long we're going to wait, before going back to P2P after the 3rd
    // participant has left the conference (to filter out page reload).
    backToP2PDelay: Integer;
  end;

  JJitsiConfigAnalytics = class external
    // The Google Analytics Tracking ID:
    googleAnalyticsTrackingId: String;

    // Matomo configuration:
    matomoEndpoint: String;
    matomoSiteID: String;

    // The Amplitude APP Key:
    amplitudeAPPKey: String;

    // Array of script URLs to load as lib-jitsi-meet "analytics handlers".
    scriptURLs: array of String;
  end;

  JJitsiConfigDeploymentInfo = class external
    shard: String;
    region: String;
    userRegion: String;
  end;

  TRecordingFormat = String;
  TRecordingFormatHelper = strict helper for TRecordingFormat
    const OGG = 'ogg';
    const Flac = 'flac';
    const WAV = 'wav';
  end;

  JJitsiConfigLocalRecording = class external
    enabled: Boolean;
    format: TRecordingFormat;
  end;

  JJitsiConfigE2ePing = class external
    // The interval in milliseconds at which pings will be sent.
    // Defaults to 10000, set to <= 0 to disable.
    pingInterval: Integer;

    // The interval in milliseconds at which analytics events
    // with the measured RTT will be sent. Defaults to 60000, set
    // to <= 0 to disable.
    analyticsInterval: Integer;
  end;

  JJitsiConfigDeploymentUrls = class external
    // If specified a 'Help' button will be displayed in the overflow menu with a link to the specified URL for
    // user documentation.
    userDocumentationURL: String;

    // If specified a 'Download our apps' button will be displayed in the overflow menu with a link
    // to the specified URL for an app download page.
    downloadAppsUrl: String;
  end;

  JJitsiConfigRemoteVideoMenu = class external
    // If set to true the 'Kick out' button will be disabled.
    disableKick: Boolean;
  end;

  JJitsiConfig = class external
    hosts: JJitsiConfigHosts;

    // BOSH URL
    bosh: String;

    // Websocket URL
    websocket: String;

    // The name of client node advertised in XEP-0115 'c' stanza
    clientNode: String;

    // The real JID of focus participant - can be overridden here
    focusUserJid: String;

    testing: JJitsiConfigTesting;

    // Disables ICE/UDP by filtering out local and remote UDP candidates in
    // signalling.
    webrtcIceUdpDisable: Boolean;

    // Disables ICE/TCP by filtering out local and remote TCP candidates in
    // signalling.
    webrtcIceTcpDisable: Boolean;

    // Disable measuring of audio levels.
    disableAudioLevels: Boolean;
    audioLevelsInterval: Integer;

    // Enabling this will run the lib-jitsi-meet no audio detection module which
    // will notify the user if the current selected microphone has no audio
    // input and will suggest another valid device if one is present.
    enableNoAudioDetection: Boolean;

    // Enabling this will run the lib-jitsi-meet noise detection module which will
    // notify the user if there is noise, other than voice, coming from the current
    // selected microphone. The purpose it to let the user know that the input could
    // be potentially unpleasant for other meeting participants.
    enableNoisyMicDetection: Boolean;

    // Start the conference in audio only mode (no video is being received nor
    // sent).
    startAudioOnly: Boolean;

    // Every participant after the Nth will start audio muted.
    startAudioMuted: Boolean;

    // Start calls with audio muted. Unlike the option above, this one is only
    // applied locally. FIXME: having these 2 options is confusing.
    startWithAudioMuted: Boolean;

    // Enabling it (with #params) will disable local audio output of remote
    // participants and to enable it back a reload is needed.
    startSilent: Boolean;

    // Sets the preferred resolution (height) for local video. Defaults to 720.
    resolution: Integer;

    constraints: JJitsiConfigConstraints;

    // Enable / disable simulcast support.
    disableSimulcast: Boolean;

    // Enable / disable layer suspension.  If enabled, endpoints whose HD
    // layers are not in use will be suspended (no longer sent) until they
    // are requested again.
    enableLayerSuspension: Boolean;

    // Every participant after the Nth will start video muted.
    startVideoMuted: Integer;

    // Start calls with video muted. Unlike the option above, this one is only
    // applied locally. FIXME: having these 2 options is confusing.
    startWithVideoMuted: Integer;

    // If set to true, prefer to use the H.264 video codec (if supported).
    // Note that it's not recommended to do this because simulcast is not
    // supported when  using H.264. For 1-to-1 calls this setting is enabled by
    // default and can be toggled in the p2p section.
    preferH264: Boolean;

    // If set to true, disable H.264 video codec by stripping it out of the
    // SDP.
    disableH264: Boolean;

    // Optional desktop sharing frame rate options. Default value: min:5, max:5.
    desktopSharingFrameRate: JJitsiConfigDesktopSharingFrameRate;

    // Try to start calls with screen-sharing instead of camera video.
    startScreenSharing: Boolean;

    // Whether to enable file recording or not.
    fileRecordingsEnabled: Boolean;

    // Enable the dropbox integration.
    dropbox: Variant;

    // When integrations like dropbox are enabled only that will be shown,
    // by enabling fileRecordingsServiceEnabled, we show both the integrations
    // and the generic recording service (its configuration and storage type
    // depends on jibri configuration)
    fileRecordingsServiceEnabled: Boolean;

    // Whether to show the possibility to share file recording with other people
    // (e.g. meeting participants), based on the actual implementation
    // on the backend.
    fileRecordingsServiceSharingEnabled: Boolean;

    // Whether to enable live streaming or not.
    liveStreamingEnabled: Boolean;

    // Transcription (in interface_config,
    // subtitles and buttons can be configured)
    transcribingEnabled: Boolean;

    // Enables automatic turning on captions when recording is started
    autoCaptionOnRecord: Boolean;

    // Default value for the channel "last N" attribute. -1 for unlimited.
    channelLastN: Integer;

    // Options for the recording limit notification.
    recordingLimit: JJitsiConfigRecordingLimit;

    // Disables or enables RTX (RFC 4588) (defaults to false).
    disableRtx: Boolean;

     // Disables or enables TCC (the default is in Jicofo and set to true)
    // (draft-holmer-rmcat-transport-wide-cc-extensions-01). This setting
    // affects congestion control, it practically enables send-side bandwidth
    // estimations.
    enableTcc: Boolean;

    // Disables or enables REMB (the default is in Jicofo and set to false)
    // (draft-alvestrand-rmcat-remb-03). This setting affects congestion
    // control, it practically enables recv-side bandwidth estimations. When
    // both TCC and REMB are enabled, TCC takes precedence. When both are
    // disabled, then bandwidth estimations are disabled.
    enableRemb: Boolean;

    // Enables ICE restart logic in LJM and displays the page reload overlay on
    // ICE failure. Current disabled by default because it's causing issues with
    // signaling when Octo is enabled. Also when we do an "ICE restart"(which is
    // not a real ICE restart), the client maintains the TCC sequence number
    // counter, but the bridge resets it. The bridge sends media packets with
    // TCC sequence numbers starting from 0.
    enableIceRestart: Boolean;

    // Defines the minimum number of participants to start a call (the default
    // is set in Jicofo and set to 2).
    minParticipants: Boolean;

    // Use the TURN servers discovered via XEP-0215 for the jitsi-videobridge
    // connection
    useStunTurn: Boolean;

    // Use TURN/UDP servers for the jitsi-videobridge connection (by default
    // we filter out TURN/UDP because it is usually not needed since the
    // bridge itself is reachable via UDP)
    useTurnUdp: Boolean;

    // Enables / disables a data communication channel with the Videobridge.
    // Values can be 'datachannel', 'websocket', true (treat it as
    // 'datachannel'), undefined (treat it as 'datachannel') and false (don't
    // open any channel).
    openBridgeChannel: Boolean;

    // Require users to always specify a display name.
    requireDisplayName: Boolean;

    // Whether to use a welcome page or not. In case it's false a random room
    // will be joined when no room is specified.
    enableWelcomePage: Boolean;

    // Enabling the close page will ignore the welcome page redirection when
    // a call is hangup.
    enableClosePage: Boolean;

    // Disable hiding of remote thumbnails when in a 1-on-1 conference call.
    disable1On1Mode: Boolean;

    // Default language for the user interface.
    defaultLanguage: String;

    // If true all users without a token will be considered guests and all users
    // with token will be considered non-guests. Only guests will be allowed to
    // edit their profile.
    enableUserRolesBasedOnToken: Boolean;

    // Whether or not some features are checked based on token.
    enableFeaturesBasedOnToken: Boolean;

    // Enable lock room for all moderators, even when userRolesBasedOnToken is enabled and participants are guests.
    lockRoomGuestEnabled: Boolean;

    // When enabled the password used for locking a room is restricted to up to the number of digits specified
    roomPasswordNumberOfDigits: Integer; // default = 0 (disabled)

    // Message to show the users. Example: 'The service will be down for
    // maintenance at 01:00 AM GMT,
    noticeMessage: String;

    // Enables calendar integration, depends on googleApiApplicationClientID
    // and microsoftApiApplicationClientID
    enableCalendarIntegration: Boolean;

    // When 'true', it shows an intermediate page before joining, where the user can  configure its devices.
    prejoinPageEnabled: Boolean;

    // If true, shows the unsafe roon name warning label when a room name is
    // deemed unsafe (due to the simplicity in the name) and a password is not
    // set or the lobby is not enabled.
    enableInsecureRoomNameWarning: Boolean;

    // Whether to enable stats collection or not in the TraceablePeerConnection.
    // This can be useful for debugging purposes (post-processing/analysis of
    // the webrtc stats) as it is done in the jitsi-meet-torture bandwidth
    // estimation tests.
    gatherStats: Boolean;

    // The interval at which PeerConnection.getStats() is called. Defaults to 10000
    pcStatsInterval: Integer;

    // To enable sending statistics to callstats.io you must provide the
    // Application ID and Secret.
    callStatsID: String;
    callStatsSecret: String;

    // enables sending participants display name to callstats
    enableDisplayNameInStats: Boolean;

    // enables sending participants email if available to callstats and other analytics
    enableEmailInStats: Boolean;

    // If third party requests are disabled, no other server will be contacted.
    // This means avatars will be locally generated and callstats integration
    // will not function.
    disableThirdPartyRequests: Boolean;

    // Peer-To-Peer mode: used (if enabled) when there are just 2 participants.
    p2p: JJitsiConfigP2P;

    analytics: JJitsiConfigAnalytics;

    // Information about the jitsi-meet instance we are connecting to, including
    // the user region as seen by the server.
    deploymentInfo: JJitsiConfigDeploymentInfo;

    // Decides whether the start/stop recording audio notifications should play on record.
    // disableRecordAudioNotification: Boolean;

    // Information for the chrome extension banner
    // chromeExtensionBanner: {
    //     // The chrome extension to be installed address
    //     url: 'https://chrome.google.com/webstore/detail/jitsi-meetings/kglhbbefdnlheedjiejgomgmfplipfeb',

    //     // Extensions info which allows checking if they are installed or not
    //     chromeExtensionsInfo: [
    //         {
    //             id: 'kglhbbefdnlheedjiejgomgmfplipfeb',
    //             path: 'jitsi-logo-48x48.png'
    //         }
    //     ]
    // },

    // Local Recording
    //

    localRecording: JJitsiConfigLocalRecording;

    // Options related to end-to-end (participant to participant) ping.
    e2eping: JJitsiConfigE2ePing;

    // If set, will attempt to use the provided video input device label when
    // triggering a screenshare, instead of proceeding through the normal flow
    // for obtaining a desktop stream.
    // NOTE: This option is experimental and is currently intended for internal
    // use only.
    _desktopSharingSourceDevice: String;

    // If true, any checks to handoff to another application will be prevented
    // and instead the app will continue to display in the current browser.
    disableDeepLinking: Boolean;

    // A property to disable the right click context menu for localVideo
    // the menu has option to flip the locally seen video for local presentations
    disableLocalVideoFlip: Boolean;

    // Disables all invite functions from the app (share, invite, dial out...etc)
    disableInviteFunctions: Boolean;

    // Disables storing the room name to the recents list
    doNotStoreRoom: Boolean;

    // Deployment specific URLs.
    deploymentUrls: JJitsiConfigDeploymentUrls;

    // Options related to the remote participant menu.
    remoteVideoMenu: JJitsiConfigRemoteVideoMenu;

    // If set to true all muting operations of remote participants will be disabled.
    disableRemoteMute: Boolean;

    /**
     External API url used to receive branding specific information.
     If there is no url set or there are missing fields, the defaults are applied.
     None of the fieds are mandatory and the response must have the shape:
     {
         // The hex value for the colour used as background
         backgroundColor: '#fff',
         // The url for the image used as background
         backgroundImageUrl: 'https://example.com/background-img.png',
         // The anchor url used when clicking the logo image
         logoClickUrl: 'https://example-company.org',
         // The url used for the image used as logo
         logoImageUrl: 'https://example.com/logo-img.png'
     }
    */
    brandingDataUrl: String;

    // List of undocumented settings used in jitsi-meet
    /**
     _immediateReloadThreshold
     autoRecord
     autoRecordToken
     debug
     debugAudioLevels
     deploymentInfo
     dialInConfCodeUrl
     dialInNumbersUrl
     dialOutAuthUrl
     dialOutCodesUrl
     disableRemoteControl
     displayJids
     etherpad_base
     externalConnectUrl
     firefox_fake_device
     googleApiApplicationClientID
     iAmRecorder
     iAmSipGateway
     microsoftApiApplicationClientID
     peopleSearchQueryTypes
     peopleSearchUrl
     requireDisplayName
     tokenAuthUrl
     */

    // List of undocumented settings used in lib-jitsi-meet
    /**
     _peerConnStatusOutOfLastNTimeout
     _peerConnStatusRtcMuteTimeout
     abTesting
     avgRtpStatsN
     callStatsConfIDNamespace
     callStatsCustomScriptUrl
     desktopSharingSources
     disableAEC
     disableAGC
     disableAP
     disableHPF
     disableNS
     enableLipSync
     enableTalkWhileMuted
     forceJVB121Ratio
     hiddenDomain
     ignoreStartMuted
     nick
     startBitrate
     */
  end;

  TToolbarButton = String;
  TToolbarButtonHelper = strict helper for TToolbarButton
    const Microphone = 'microphone';
    const Camera = 'camera';
    const ClosedCaptions = 'closedcaptions';
    const Desktop = 'desktop';
    const Fullscreen = 'fullscreen';
    const FoDeviceSelection = 'fodeviceselection';
    const Hangup = 'hangup';
    const Profile = 'profile';
    const Chat = 'chat';
    const Recording = 'recording';
    const LiveStreaming = 'livestreaming';
    const Etherpad = 'etherpad';
    const SharedVideo = 'sharedvideo';
    const Settings = 'settings';
    const RaiseHand = 'raisehand';
    const VideoQuality = 'videoquality';
    const FilmStrip = 'filmstrip';
    const Invite = 'invite';
    const Feedback = 'feedback';
    const Stats = 'stats';
    const Shortcuts = 'shortcuts';
    const TileView = 'tileview';
    const VideoBackgroundBlur = 'videobackgroundblur';
    const Download = 'download';
    const Help = 'help';
    const MuteEveryone = 'mute-everyone';
    const Security = 'security';
  end;

  TSettingsSection = String;
  TSettingsSectionHelper = strict helper for TSettingsSection
    const Devices = 'devices';
    const Language = 'language';
    const Moderator = 'moderator';
    const Profile = 'profile';
    const Calendar = 'calendar';
  end;

  TVideoLayoutFit = String;
  TVideoLayoutFitHelper = strict helper for TVideoLayoutFit
    const Both = 'both';
    const Width = 'width';
    const Height = 'height';
  end;

  TBrowser = String;
  TBrowserHelper = strict helper for TBrowser
    const Chrome = 'chrome';
    const Chromium = 'chromium';
    const Firefox = 'firefox';
    const NWJS = 'nwjs';
    const Electron = 'electron';
    const Safari = 'safari';
    const Opera = 'opera';
  end;

  TUXMode = String;
  TUXModeHelper = strict helper for TUXMode
    const RemoteOnly = 'remote-only';
  end;

  JJitsiInterfaceConfig = class external
    DEFAULT_BACKGROUND: String;
    DEFAULT_LOGO_URL: String;

    /**
     * Whether or not the blurred video background for large video should be
     * displayed on browsers that can support it.
     */
    DISABLE_VIDEO_BACKGROUND: Boolean;

    INITIAL_TOOLBAR_TIMEOUT: Integer;
    TOOLBAR_TIMEOUT: Integer;
    TOOLBAR_ALWAYS_VISIBLE: Boolean;
    DEFAULT_REMOTE_DISPLAY_NAME: String;
    DEFAULT_LOCAL_DISPLAY_NAME: String;
    SHOW_JITSI_WATERMARK: Boolean;
    JITSI_WATERMARK_LINK: String;

    // if watermark is disabled by default, it can be shown only for guests
    SHOW_WATERMARK_FOR_GUESTS: Boolean;
    SHOW_BRAND_WATERMARK: Boolean;
    BRAND_WATERMARK_LINK: String;
    SHOW_POWERED_BY: Boolean;
    SHOW_DEEP_LINKING_IMAGE: Boolean;
    GENERATE_ROOMNAMES_ON_WELCOME_PAGE: Boolean;
    DISPLAY_WELCOME_PAGE_CONTENT: Boolean;
    DISPLAY_WELCOME_PAGE_TOOLBAR_ADDITIONAL_CONTENT: Boolean;
    APP_NAME: String;
    NATIVE_APP_NAME: String;
    PROVIDER_NAME: String;
    LANG_DETECTION: Boolean; // Allow i18n to detect the system language

    /**
     * Hide the invite prompt in the header when alone in the meeting.
     */
    HIDE_INVITE_MORE_HEADER: Boolean;

    /**
     * The name of the toolbar buttons to display in the toolbar. If present,
     * the button will display. Exceptions are "livestreaming" and "recording"
     * which also require being a moderator and some values in config.js to be
     * enabled. Also, the "profile" button will not display for user's with a
     * jwt.
     */
    TOOLBAR_BUTTONS: array of TToolbarButton;

    SETTINGS_SECTIONS: array of TSettingsSection;

    // Determines how the video would fit the screen. 'both' would fit the whole
    // screen, 'height' would fit the original video height to the height of the
    // screen, 'width' would fit the original video width to the width of the
    // screen respecting ratio.
    VIDEO_LAYOUT_FIT: TVideoLayoutFit;

    /**
     * Whether to only show the filmstrip (and hide the toolbar).
     */
    filmStripOnly: Boolean;

    /**
     * Whether to show thumbnails in filmstrip as a column instead of as a row.
     */
    VERTICAL_FILMSTRIP: Boolean;

    // A html text to be shown to guests on the close page, false disables it
    CLOSE_PAGE_GUEST_HINT: Boolean;
    SHOW_PROMOTIONAL_CLOSE_PAGE: Boolean;
    FILM_STRIP_MAX_HEIGHT: Integer;

    // Enables feedback star animation.
    ENABLE_FEEDBACK_ANIMATION: Boolean;
    DISABLE_FOCUS_INDICATOR: Boolean;
    DISABLE_DOMINANT_SPEAKER_INDICATOR: Boolean;

    /**
     * Whether the speech to text transcription subtitles panel is disabled.
     * If {@code undefined}, defaults to {@code false}.
     *
     * @type {boolean}
     */
    DISABLE_TRANSCRIPTION_SUBTITLES: Boolean;

    /**
     * Whether the ringing sound in the call/ring overlay is disabled. If
     * {@code undefined}, defaults to {@code false}.
     *
     * @type {boolean}
     */
    DISABLE_RINGING: Boolean;
    AUDIO_LEVEL_PRIMARY_COLOR: String;
    AUDIO_LEVEL_SECONDARY_COLOR: String;
    POLICY_LOGO: Variant;
    LOCAL_THUMBNAIL_RATIO: Float;
    REMOTE_THUMBNAIL_RATIO: Float;

    // Documentation reference for the live streaming feature.
    LIVE_STREAMING_HELP_LINK: String;

    /**
     * Whether the mobile app Jitsi Meet is to be promoted to participants
     * attempting to join a conference in a mobile Web browser. If
     * {@code undefined}, defaults to {@code true}.
     *
     * @type {boolean}
     */
    MOBILE_APP_PROMO: Boolean;

    /**
     * Maximum coeficient of the ratio of the large video to the visible area
     * after the large video is scaled to fit the window.
     *
     * @type {number}
     */
    MAXIMUM_ZOOMING_COEFFICIENT: Float;

    /*
     * If indicated some of the error dialogs may point to the support URL for
     * help.
     */
    SUPPORT_URL: String;

    /**
     * Whether the connection indicator icon should hide itself based on
     * connection strength. If true, the connection indicator will remain
     * displayed while the participant has a weak connection and will hide
     * itself after the CONNECTION_INDICATOR_HIDE_TIMEOUT when the connection is
     * strong.
     *
     * @type {boolean}
     */
    CONNECTION_INDICATOR_AUTO_HIDE_ENABLED: Boolean;

    /**
     * How long the connection indicator should remain displayed before hiding.
     * Used in conjunction with CONNECTION_INDICATOR_AUTOHIDE_ENABLED.
     *
     * @type {number}
     */
    CONNECTION_INDICATOR_AUTO_HIDE_TIMEOUT: Integer;

    /**
     * If true, hides the connection indicators completely.
     *
     * @type {boolean}
     */
    CONNECTION_INDICATOR_DISABLED: Boolean;

    /**
     * If true, hides the video quality label indicating the resolution status
     * of the current large video.
     *
     * @type {boolean}
     */
    VIDEO_QUALITY_LABEL_DISABLED: Boolean;

    /**
     * If true, will display recent list
     *
     * @type {boolean}
     */
    RECENT_LIST_ENABLED: Boolean;

    // Names of browsers which should show a warning stating the current browser
    // has a suboptimal experience. Browsers which are not listed as optimal or
    // unsupported are considered suboptimal. Valid values are:
    // chrome, chromium, edge, electron, firefox, nwjs, opera, safari
    OPTIMAL_BROWSERS: array of TBrowser;

    // Browsers, in addition to those which do not fully support WebRTC, that
    // are not supported and should show the unsupported browser page.
    UNSUPPORTED_BROWSERS: array of TBrowser;

    /**
     * A UX mode where the last screen share participant is automatically
     * pinned. Valid values are the string "remote-only" so remote participants
     * get pinned but not local, otherwise any truthy value for all participants,
     * and any falsy value to disable the feature.
     *
     * Note: this mode is experimental and subject to breakage.
     */
    AUTO_PIN_LATEST_SCREEN_SHARE: TUXMode;

    /**
     * If true, presence status: busy, calling, connected etc. is not displayed.
     */
    DISABLE_PRESENCE_STATUS: Boolean;

    /**
     * If true, notifications regarding joining/leaving are no longer displayed.
     */
    DISABLE_JOIN_LEAVE_NOTIFICATIONS: Boolean;

    /**
    * Decides whether the chrome extension banner should be rendered on the landing page and during the meeting.
    * If this is set to false, the banner will not be rendered at all. If set to true, the check for extension(s)
    * being already installed is done before rendering.
    */
    SHOW_CHROME_EXTENSION_BANNER: Boolean;

    /**
     * When enabled, the kick participant button will not be presented for users without a JWT
     */
    HIDE_KICK_BUTTON_FOR_GUESTS: Boolean;

    /**
     * How many columns the tile view can expand to. The respected range is
     * between 1 and 5.
     */
    TILE_VIEW_MAX_COLUMNS: Integer;

    /**
     * Specify custom URL for downloading android mobile app.
     */
    MOBILE_DOWNLOAD_LINK_ANDROID: String;

    /**
     * Specify URL for downloading ios mobile app.
     */
    MOBILE_DOWNLOAD_LINK_IOS: String;

    /**
     * Specify Firebase dynamic link properties for the mobile apps.
     */
    // MOBILE_DYNAMIC_LINK: {
    //    APN: 'org.jitsi.meet',
    //    APP_CODE: 'w2atb',
    //    CUSTOM_DOMAIN: undefined,
    //    IBI: 'com.atlassian.JitsiMeet.ios',
    //    ISI: '1165103905'
    // },

    /**
     * Specify mobile app scheme for opening the app from the mobile browser.
     */
    APP_SCHEME: String;

    /**
     * Specify the Android app package name.
     */
    ANDROID_APP_PACKAGE: String;

    /**
     * Override the behavior of some notifications to remain displayed until
     * explicitly dismissed through a user action. The value is how long, in
     * milliseconds, those notifications should remain displayed.
     */
    ENFORCE_NOTIFICATION_AUTO_DISMISS_TIMEOUT: Integer;

    // List of undocumented settings
    /**
     INDICATOR_FONT_SIZES
     PHONE_NUMBER_REGEX
    */
  end;

  JJitsiInterfaceUserInfo = class external
    email: String;
    displayName: String;
  end;

  JJitsiInterfaceDevices = class external
    email: String;
    displayName: String;
  end;

  JJitsiOptions = class external
    roomName: String;
    width: String;
    height: String;
    parentNode: JHTMLElement;
    configOverwrite: JJitsiConfig;
    interfaceConfigOverwrite: JJitsiInterfaceConfig;
    noSSL: Boolean; // defaults to false
    jwt: String;
    onload: TEventHandler;
    invitees: array of Variant;
    devices: JJitsiInterfaceDevices;
    userInfo: JJitsiInterfaceUserInfo;
  end;

  JJitsiAPI = class external 'JitsiMeetExternalAPI'
  public
    constructor Create; overload;
    constructor Create(Domain: String); overload;
    constructor Create(Domain: String; Options: JJitsiOptions); overload;

    function getAvailableDevices: Variant;
    procedure getCurrentDevices;
    procedure isDeviceChangeAvailable;
    procedure isDeviceListAvailable;
    procedure isMultipleAudioInputSupported;
    procedure setAudioInputDevice;
    procedure setAudioOutputDevice;
    procedure setVideoInputDevice;

    procedure executeCommand(command: String; argument: String); overload;
    procedure executeCommand(command: String; arguments: Variant); overload;

    function getNumberOfParticipants: Integer;

    function getAvatarURL(participantId: Variant): String;
    function getDisplayName(participantId: Variant): String;
    function getEmail(participantId: Variant): String;

    procedure getIFrame;

    procedure isAudioMuted;
    procedure isVideoMuted;

    procedure isAudioAvailable;
    procedure isVideoAvailable;

    procedure invite;

    procedure dispose;
  end;

implementation



end.
