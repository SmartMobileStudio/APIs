unit Plyr;

interface

uses
  W3C.DOM4, W3C.HTML5;

type
  JPlyrOptionsKeyboad = class external
    focused: Boolean;
    global: Boolean;
  end;

  JPlyrOptionsTooltips = class external
    controls: Boolean;
    seek: Boolean;
  end;

  JPlyrOptionsListeners = class external
  end;

  JPlyrOptionsCaptions = class external
    active: Boolean;
    language: String;
    update: Boolean;
  end;

  JPlyrOptionsFullscreen = class external
    enabled: Boolean;
    fallback: Boolean;
    iosNative: Boolean;
  end;

  JPlyrOptionsStorage = class external
    enabled: Boolean;
    key: String;
  end;

  JPlyrOptionsSpeed = class external
    selected: Float;
    options: array of Float;
  end;

  JPlyrOptionsQuality = class external
    default: Integer;
    options: array of Integer;
  end;

  JPlyrOptionsLoop = class external
    active: Boolean;
  end;

  JPlyrOptionsAds = class external
    enabled: Boolean;
    publisherId: String;
  end;

  JPlyrSources = class external
    src: String;
    &type: String;
    size: Integer;
  end;

  JPlyrPreviewThumbnails = class external
    src: String;
  end;

  JPlyrTracks = class external
    kind: String;
    label: String;
    srclang: String;
    src: String;
    default: Boolean;
  end;

  JPlyrOptionsUrls = class external
    &type: String;
    title: String;
    sources: array of JPlyrSources;
    poster: String;
    previewThumbnails: JPlyrPreviewThumbnails;
    tracks: array of JPlyrTracks;
  end;

  JPlyrOptionsVimeo = class external
    byline: Boolean;
    portrait: Boolean;
    title: Boolean;
    speed: Boolean;
    transparent: Boolean;
  end;

  JPlyrOptionsYoutube = class external
    noCookie: Boolean;
    rel: Integer;
    showinfo: Integer;
    iv_load_policy: Integer;
  end;

  JPlyrOptionsPreviewThumbnails = class external
    enabled: Boolean;
    src: String;
  end;

  JPlyrOptionsI18n = class external
    restart: String;
    rewind: String;
    play: String;
    pause: String;
    fastForward: String;
    seek: String;
    played: String;
    buffered: String;
    currentTime: String;
    duration: String;
    volume: String;
    mute: String;
    unmute: String;
    enableCaptions: String;
    disableCaptions: String;
    enterFullscreen: String;
    exitFullscreen: String;
    frameTitle: String;
    captions: String;
    settings: String;
    speed: String;
    normal: String;
    quality: String;
    loop: String;
    start: String;
    &end: String;
    all: String;
    reset: String;
    disabled: String;
    advertisement: String;
  end;

  JPlyrOptions = class external
  public
    enabled: Boolean;
    debug: Boolean;
    controls: array of String;
    settings: array of String;
    i18n: JPlyrOptionsI18n;
    loadSprite: Boolean;
    iconUrl: String;
    iconPrefix: String;
    blankVideo: String;
    autoplay: Boolean;
    autopause: Boolean;
    seekTime: Float;
    volume: Float;
    muted: Boolean;
    clickToPlay: Boolean;
    disableContextMenu: Boolean;
    hideControls: Boolean;
    resetOnEnd: Boolean;
    keyboard: JPlyrOptionsKeyboad;
    tooltips: JPlyrOptionsTooltips;
    duration: Float;
    displayDuration: Boolean;
    invertTime: Boolean;
    toggleInvert: Boolean;
    listeners: JPlyrOptionsListeners;
    captions: JPlyrOptionsCaptions;
    fullscreen: JPlyrOptionsFullscreen;
    ratio: String;
    storage: JPlyrOptionsStorage;
    speed: JPlyrOptionsSpeed;
    quality: JPlyrOptionsQuality;
    loop: JPlyrOptionsLoop;
    ads: JPlyrOptionsAds;
    urls: JPlyrOptionsUrls;
    vimeo: JPlyrOptionsVimeo;
    youtube: JPlyrOptionsYouTube;
    previewThumbnails: JPlyrOptionsPreviewThumbnails;
  end;

  JPlyrFullscreen = class external
  public
    active: Boolean;
    enabled: Boolean;
    procedure enter;
    procedure &exit;
    procedure toggle;
  end;

  JPlyrElements = class external
    container: JHTMLDivElement;
    wrapper: JHTMLDivElement;
  end;

  JPlyr = class external 'Plyr'
  public
    isHTML5: Boolean;
    isEmbed: Boolean;
    isYouTube: Boolean;
    isVimeo: Boolean;
    isVideo: Boolean;
    isAudio: Boolean;
    playing: Boolean;
    paused: Boolean;
    stopped: Boolean;
    ended: Boolean;
    currentTime: Float;
    buffered: Float;
    seeking: Boolean;
    duration: Float;
    volume: Float;
    muted: Boolean;
    hasAudio: Boolean;
    speed: Float;
    minimumSpeed: Float;
    maximumSpeed: Float;
    quality: Variant;
    loop: Boolean;
    source: Variant;
    download: String;
    poster: String;
    ratio: Float;
    autoplay: Boolean;
    currentTrack: Integer;
    language: String;
    pip: Boolean;
    fullscreen: JPlyrFullscreen;
    elements: JPlyrElements;
    constructor Create(Target: String); overload;
    constructor Create(Target: String; Options: JPlyrOptions); overload;
    constructor Create(Target: JHTMLElement); overload;
    constructor Create(Target: JHTMLElement; Options: JPlyrOptions); overload;

    class function setup(Target: String): array of JPlyr; overload;
    class function setup(Target: String; Options: JPlyrOptions): array of JPlyr; overload;
    class function setup(Target: JHTMLElement): array of JPlyr; overload;
    class function setup(Target: JHTMLElement; Options: JPlyrOptions): array of JPlyr; overload;

    procedure play;
    procedure pause;
    procedure togglePlay(toggle: Boolean);
    procedure stop;
    procedure restart;
    procedure rewind(seekTime: Float);
    procedure forward(seekTime: Float);
    procedure increaseVolume(step: Float);
    procedure decreaseVolume(step: Float);
    procedure toggleCaptions(toggle: Boolean);
    procedure airplay;
    procedure toggleControls(toggle: Boolean);
    procedure supports(&type: String);
    procedure destroy;
    procedure on(EventName: String; EventHandler: procedure(Event: JEvent));
  end;

var
  Plyr external 'Plyr': JPlyr;