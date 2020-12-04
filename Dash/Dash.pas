unit Dash;

interface

uses
  W3C.DOM, W3C.HTML5;

type
  JLogLevel = Integer;
  JLogLevelHelper = strict helper for JLogLevel
    const LOG_LEVEL_NONE = 0;
    const LOG_LEVEL_FATAL = 1;
    const LOG_LEVEL_ERROR = 2;
    const LOG_LEVEL_WARNING = 3;
    const LOG_LEVEL_INFO = 4;
    const LOG_LEVEL_DEBUG = 5;
  end;

  JMediaType = String;
  JMediaTypeHelper = strict helper for JMediaType
    const Video = 'video';
    const Audio = 'audio';
    const Text = 'text';
    const FragmentedText = 'fragmentedText';
    const EmbeddedText = 'embeddedText';
    const Image = 'image';
  end;

  JDashLogger = class external
(*
        debug(...params: any[]): void;
        info(...params: any[]): void;
        warn(...params: any[]): void;
        error(...params: any[]): void;
        fatal(...params: any[]): void;
*)
  end;


  Debug = class external
    function getLogger: JDashLogger;
    procedure setLogTimestampVisible(flag: boolean);
    procedure setCalleeNameVisible(flag: boolean);
  end;

  JVideoModel = Variant;

  JProtectionController = class external
(*
    initializeForMedia(mediaInfo: ProtectionMediaInfo): void;
    createKeySession(initData: ArrayBuffer, cdmData: Uint8Array): void;
    removeKeySession(session: SessionToken): void;
    closeKeySession(session: SessionToken): void;
    setServerCertificate(serverCertificate: ArrayBuffer): void;
    setMediaElement(element: HTMLMediaElement): void;
    setSessionType(type: string): void;
    setRobustnessLevel(level: string): void;
    setProtectionData(protData: ProtectionData): void;
    getSupportedKeySystemsFromContentProtection(cps: any[]): SupportedKeySystem[];
    getKeySystems(): KeySystem[];
    procedure setKeySystems(keySystems: KeySystem[]);
*)
    procedure stop;
    procedure reset;
  end;

  JBitrate = class external
    width: Integer;
    height: Integer;
    bandwidth: Float;
    scanType: String;
  end;

  JMediaInfo = class external
    id: String;
    index: Integer;
    &type: JMediaType;
(*
    streamInfo: JStreamInfo;
*)
    representationCount: Integer;
    labels: array of String;
    lang: string;
    viewpoint: Variant;
    accessibility: array of Variant;
    audioChannelConfiguration: array of Variant;
    roles: array of String;
    codec: String;
    mimeType: String;
    contentProtection: Variant;
    isText: Boolean;
    KID: Variant;
(*
    bitrateList: array of JBitrate;
*)
  end;

  JProtectionMediaInfo = class external
    codec: String;
    contentProtection: Variant;
  end;

  JMediaPlayerSettingDebugClass = class external
    logLevel: JLogLevel;
  end;

  JMediaPlayerSettingStreamingClass = class external
    metricsMaxListDepth: Integer;
    abandonLoadTimeout: Integer;
    liveDelayFragmentCount: Integer;
(*
    liveDelay?: number;
    scheduleWhilePaused?: boolean;
    fastSwitchEnabled?: boolean;
    bufferPruningInterval?: number;
    bufferToKeep?: number;
    bufferAheadToKeep?: number;
    jumpGaps?: boolean;
    smallGapLimit?: number;
    stableBufferTime?: number;
    bufferTimeAtTopQuality?: number;
    bufferTimeAtTopQualityLongForm?: number;
    longFormContentDurationThreshold?: number;
    wallclockTimeUpdateInterval?: number;
    lowLatencyEnabled?: boolean;
    keepProtectionMediaKeys?: boolean;
    useManifestDateHeaderTimeSource?: boolean;
    useSuggestedPresentationDelay?: boolean;
    useAppendWindowEnd?: boolean,
    manifestUpdateRetryInterval?: number;
    liveCatchUpMinDrift?: number;
    liveCatchUpMaxDrift?: number;
    liveCatchUpPlaybackRate?: number;
    lastBitrateCachingInfo?: {
        enabled?: boolean;
        ttl?: number;
    };
    lastMediaSettingsCachingInfo?: {
        enabled?: boolean;
        ttl?: number;
    };
    cacheLoadThresholds?: {
        video?: number;
        audio?: number;
    };
    retryIntervals?: {
        'MPD'?:                       number;
        'XLinkExpansion'?:            number;
        'MediaSegment'?:              number;
        'InitializationSegment'?:     number;
        'BitstreamSwitchingSegment'?: number;
        'IndexSegment'?:              number;
        'other'?:                     number;
    };
    retryAttempts?: {
        'MPD'?:                       number;
        'XLinkExpansion'?:            number;
        'MediaSegment'?:              number;
        'InitializationSegment'?:     number;
        'BitstreamSwitchingSegment'?: number;
        'IndexSegment'?:              number;
        'other'?:                     number;
    };
    abr?: {
        movingAverageMethod?: 'slidingWindow' | 'ewma';
        ABRStrategy?: 'abrDynamic' | 'abrBola';
        bandwidthSafetyFactor?: number;
        useDefaultABRRules?: boolean;
        useBufferOccupancyABR?: boolean;
        useDeadTimeLatency?: boolean;
        limitBitrateByPortal?: boolean;
        usePixelRatioInLimitBitrateByPortal?: boolean;
        maxBitrate?: {
            audio?: number;
            video?: number;
        };
        minBitrate?: {
            audio?: number;
            video?: number;
        };
        maxRepresentationRatio?: {
            audio?: number;
            video?: number;
        };
        initialBitrate?: {
            audio?: number;
            video?: number;
        };
        initialRepresentationRatio?: {
            audio?: number;
            video?: number;
        };
        autoSwitchBitrate?: {
            audio?: boolean;
            video?: boolean;
        };
    }
}
*)
  end;

  JMediaPlayerSettingClass = class external
    debug: JMediaPlayerSettingDebugClass;
    streaming: JMediaPlayerSettingStreamingClass;
  end;

  JMediaPlayer = class external 'dashjs.MediaPlayer'
    class function create: JMediaPlayer;
    procedure initialize(Element: JHTMLElement); overload;
    procedure initialize(Element: JHTMLElement; Source: String); overload;
    procedure initialize(Element: JHTMLElement; Source: String; AutoPlay: Boolean); overload;

    procedure extend(ParentNameString: String; ChildInstance: Variant; &Override: Boolean);
    procedure attachView(Element: JHTMLElement);
    procedure attachSource(UrlOrManifest: Variant);
    function isReady: Boolean;
    procedure play;
    function isPaused: Boolean;
    procedure pause;
    function isSeeking: Boolean;
    function isDynamic: Boolean;
    procedure seek(Value: Float);
    procedure setPlaybackRate(Value: Float);
    function getPlaybackRate: Integer;
    procedure setMute(Value: Boolean);
    function isMuted: Boolean;
    procedure setVolume(value: Float);
    function getVolume: Integer;
    function time: Integer; overload;
    function time(streamId: String): Integer; overload;
    function duration: Integer;
    function timeAsUTC: Integer;
    function durationAsUTC: Integer;
    function getActiveStream: Variant;
    function getDVRWindowSize: Integer;
    function getDVRSeekOffset(value: Integer): Integer;
    function convertToTimeCode(value: Integer): String;
    function formatUTC(Time: Integer; Locales: String; Hour12: Boolean): String; overload;
    function formatUTC(Time: Integer; Locales: String; Hour12: Boolean; WithDate: Boolean): String; overload;
    function getVersion: string;
(*
    function getDebug: Debug;
*)
    function getBufferLength(&type: JMediaType): Integer;
    function getVideoModel: JVideoModel;
    function getTTMLRenderingDiv: JHTMLDivElement;
    function getVideoElement: JHTMLVideoElement;
    function getSource: String;
(*
    function getTopBitrateInfoFor(type: MediaType): BitrateInfo;
*)
    procedure setAutoPlay(value: Boolean);
    function getAutoPlay: Boolean;
(*
    function getDashMetrics: DashMetrics;
    function getDashAdapter: DashAdapter;
*)
    function getQualityFor(&type: JMediaType): Integer;
    procedure setQualityFor(&type: JMediaType; Value: Integer);
    procedure updatePortalSize;
    procedure enableText(Enable: Boolean);
    procedure setTextTrack(Index: Integer);
    function getTextDefaultLanguage: string;
    procedure setTextDefaultLanguage(Lang: String);
    function getTextDefaultEnabled: Boolean;
    procedure setTextDefaultEnabled(Enable: Boolean);
(*
    function getThumbnail(time: Float): Thumbnail;
    function getBitrateInfoListFor(type: MediaType): BitrateInfo[];
    function getStreamsFromManifest(manifest: object): StreamInfo[];
    function getTracksFor(&type: JMediaType): array of JMediaInfo;
    procedure getTracksForTypeFromManifest(&type: JMediaType; manifest: Variant;
      streamInfo: JStreamInfo): array of JMediaInfo;
    function getCurrentTrackFor(&type: JMediaType): JMediaInfo;
    procedure setInitialMediaSettingsFor(type: JMediaType, value: MediaSettings);
    function getInitialMediaSettingsFor(type: JMediaType): MediaSettings;
*)
    procedure setCurrentTrack(track: JMediaInfo);
(*
    procedure getTrackSwitchModeFor(type: JMediaType): TrackSwitchMode;
    procedure setTrackSwitchModeFor(type: JMediaType; mode: TrackSwitchMode);
    procedure setSelectionModeForInitialTrack(mode: TrackSelectionMode);
    procedure getSelectionModeForInitialTrack: TrackSelectionMode;
    procedure retrieveManifest(url: string, callback: (manifest: object | null, error: any) => void);
*)
    procedure addUTCTimingSource(SchemeIdUri, Value: string);
    procedure removeUTCTimingSource(SchemeIdUri, Value: string);
    procedure clearDefaultUTCTimingSources;
    procedure restoreDefaultUTCTimingSources;
(*
    procedure setXHRWithCredentialsForType(type: string, value: Boolean);
    procedure getXHRWithCredentialsForType(type: string): Boolean;
    procedure getProtectionController: ProtectionController;
    procedure attachProtectionController(value: ProtectionController);
    procedure setProtectionData(value: ProtectionData);
*)
    procedure enableManifestDateHeaderTimeSource(Value: Boolean);
    procedure displayCaptionsOnTop(Value: Boolean);
    procedure attachTTMLRenderingDiv(&Div: JHTMLDivElement);
    function getCurrentTextTrackIndex: Integer;
    procedure preload;
    procedure reset;
    procedure addABRCustomRule(&Type, RuleName: String; Rule: Variant);
    procedure removeABRCustomRule(RuleName: String);
    procedure removeAllABRCustomRule;
    function getCurrentLiveLatency: Integer;
    procedure enableForcedTextStreaming(Value: Boolean);
    function isTextEnabled: Boolean;
    procedure getAverageThroughput(Value: Float);
    function getSettings: JMediaPlayerSettingClass;
    procedure updateSettings(settings: JMediaPlayerSettingClass);
    procedure resetSettings;
  end;

  JDashJS = class external 'dashjs'
    function MediaPlayer: JMediaPlayer;
  end;

var
  DashJS external 'dashjs': JDashJS;

function MediaPlayer: JMediaPlayer; external 'dashjs.MediaPlayer';

implementation

end.
