unit YouTube;

// Project: https://developers.google.com/youtube/
// Original TypeScript Definitions by:
//   Daz Wilkin <https://github.com/DazWilkin/>, Ian Obermiller <http://ianobermiller.com>

interface

type
  TPlayerState = Integer;
  TPlayerStateHelper = strict helper for TPlayerState
    const UNSTARTED = 0;
    const BUFFERING = 1;
    const CUED = 2;
    const ENDED = 3;
    const PAUSED = 4;
    const PLAYING = 5;
  end;

  JPlayer = class;

  JEventArgs = class external
    target: JPlayer;
    data: Variant;
  end;

  TEventHandler = procedure (event: JEventArgs);

  JEvents = class external
    onReady: TEventHandler; // nullable
    onPlayback: TEventHandler; // nullable
    onStateChange: TEventHandler; // nullable
    onError: TEventHandler; // nullable
  end;

  JPlayerVars = class external
    autohide: Float; // nullable
    autoplay: Float; // nullable
    cc_load_policy: Variant; // nullable
    color: String; // nullable
    controls: Float; // nullable
    disablekb: Float; // nullable
    enablejsapi: Float; // nullable
    &end: Float; // nullable
    fs: Float; // nullable
    iv_load_policy: Float; // nullable
    list: String; // nullable
//    listType: JListType; // nullable
    loop: Float; // nullable
    modestbranding: Float; // nullable
    origin: String; // nullable
    playerpiid: String; // nullable
    playlist: array of String; // nullable
    playsinline: Float; // nullable
    rel: Float; // nullable
    showinfo: Float; // nullable
    start: Float; // nullable
    theme: String; // nullable
  end;

  JPlayerOptions = class external
    width: Variant {String or Float}; // nullable
    height: Variant {String or Float}; // nullable
    videoId: String; // nullable
    playerVars: JPlayerVars; // nullable
    events: JEvents; // nullable
  end;

  JVideoByIdParams = class external
    videoId: String;
    startSeconds: Float; // nullable
    endSeconds: Float; // nullable
    suggestedQuality: String; // nullable
  end;

  JVideoByUrlParams = class external
    mediaContentUrl: String;
    startSeconds: Float; // nullable
    endSeconds: Float; // nullable
    suggestedQuality: String; // nullable
  end;

  JVideoData = class external
    video_id: String;
    author: String;
    title: String;
  end;

  JPlayer = class external 'Player'
  public
    size: Variant;

    constructor Create(id: String; playerOptions: JPlayerOptions);

    procedure loadVideoById(videoId: String); overload;
    procedure loadVideoById(videoId: String; startSeconds: Float); overload;
    procedure loadVideoById(videoId: String; startSeconds: Float; suggestedQuality: String); overload;
    procedure loadVideoById(VideoByIdParams: Variant); overload;
    procedure cueVideoById(videoId: String); overload;
    procedure cueVideoById(videoId: String; startSeconds: Float); overload;
    procedure cueVideoById(videoId: String; startSeconds: Float; suggestedQuality: String); overload;
    procedure cueVideoById(VideoByIdParams: Variant); overload;
    procedure loadVideoByUrl(mediaContentUrl: String); overload;
    procedure loadVideoByUrl(mediaContentUrl: String; startSeconds: Float); overload;
    procedure loadVideoByUrl(mediaContentUrl: String; startSeconds: Float; suggestedQuality: String); overload;
    procedure loadVideoByUrl(VideoByUrlParams: Variant); overload;
    procedure cueVideoByUrl(mediaContentUrl: String); overload;
    procedure cueVideoByUrl(mediaContentUrl: String; startSeconds: Float); overload;
    procedure cueVideoByUrl(mediaContentUrl: String; startSeconds: Float; suggestedQuality: String); overload;
    procedure cueVideoByUrl(VideoByUrlParams: Variant); overload;
    procedure playVideo;
    procedure pauseVideo;
    procedure stopVideo;
    procedure seekTo(seconds: Float; allowSeekAhead: Boolean);
    procedure clearVideo;
    procedure nextVideo;
    procedure previousVideo;
    procedure playVideoAt(index: Float);
    procedure mute;
    procedure unMute;
    function isMuted: Boolean;
    procedure setVolume(volume: Float);
    function getVolume: Float;
    function setSize(width: Float; height: Float): Variant;
    function getPlaybackRate: Float;
    procedure setPlaybackRate(suggestedRate: Float);
    function getAvailablePlaybackRates: array of Float;
    procedure setLoop(loopPlaylists: Boolean);
    procedure setShuffle(shufflePlaylist: Boolean);
    function getVideoLoadedFraction: Float;
    function getPlayerState: TPlayerState;
    function getCurrentTime: Float;
    function getVideoStartBytes: Float;
    function getVideoBytesLoaded: Float;
    function getVideoBytesTotal: Float;
    function getDuration: Float;
    function getVideoUrl: String;
    function getVideoEmbedCode: String;
    function getVideoData: JVideoData;
    function getPlaylist: array of Variant;
    function getPlaylistIndex: Float;
    procedure addEventListener(event: String; handler: TEventHandler);
    procedure destroy;
  end;
