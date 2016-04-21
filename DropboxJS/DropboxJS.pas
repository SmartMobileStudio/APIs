unit DropboxJS;

interface

uses
  ECMA.Date, W3C.File, W3C.WebStorage, W3C.TypedArray, W3C.XmlHttpRequest;

//Util

type
  JClient = class;

  JQueryParams = class external
    // property Item[key: String]: Variant;
  end;

  JAccountInfo = class external 'Dropbox.AccountInfo'
    function parse(acountInfo: Variant): JAccountInfo;
    name: String;
    email: String;
    countryCode: String;
    uid: String;
    referralUrl: String;
    publicAppUrl: String;
    quota: Float;
    usedQuota: Float;
    privateBytes: Float;
    sharedBytes: Float;
    function json: Variant;
  end;

  JApiError = class external 'Dropbox.ApiError'
    status: Float;
    &method: String;
    url: String;
    responseText: String;
    response: Variant;
    constructor Create(xhr: JXMLHttpRequest; method: String; url: String);
    NETWORK_ERROR: Float;
    NO_CONTENT: Float;
    INVALID_PARAM: Float;
    INVALID_TOKEN: Float;
    OAUTH_ERROR: Float;
    NOT_FOUND: Float;
    INVALID_METHOD: Float;
    NOT_ACCEPTABLE: Float;
    CONFLICT: Float;
    RATE_LIMITED: Float;
    SERVER_ERROR: Float;
    OVER_QUOTA: Float;
  end;

  JAuthError = class external 'AuthError'
    code: String;
    description: String;
    uri: String;
    constructor Create(queryString: JQueryParams);
    ACCESS_DENIED: String;
    INVALID_REQUEST: String;
    UNAUTHORIZED_CLIENT: String;
    INVALID_GRANT: String;
    INVALID_SCOPE: String;
    UNSUPPORTED_GRANT_TYPE: String;
    UNSUPPORTED_RESPONSE_TYPE: String;
    SERVER_ERROR: String;
    TEMPORARILY_UNAVAILABLE: String;
  end;

  JCredentials = class external
    key: String;
    secret: String; // nullable
    token: String; // nullable
    uid: String; // nullable
  end;

  JFileStat = class external 'File.Stat'
    function parse(metadata: Variant): JFileStat;
    path: String;
    name: String;
    inAppFolder: Boolean;
    isFolder: Boolean;
    isFile: Boolean;
    isRemoved: Boolean;
    typeIcon: String;
    versionTag: String;
    contentHash: String;
    mimeType: String;
    size: Float;
    humanSize: String;
    hasThumbnail: Boolean;
    modifiedAt: JDate;
    clientModifiedAt: JDate;
    function toJSON: Variant;
  end;

  JFileStatOptions = class external
    version: Float;
    removed: Boolean;
    deleted: Boolean;
    readDir: Boolean;
    versionTag: String;
    rev: String;
    contentHash: String;
    hash: String;
    httpCache: Boolean;
  end;

  JFileShareUrl = class external 'File.ShareUrl'
    class function parse(urlData: String; isDirect: Boolean): JFileShareUrl; overload;
    class function parse(urlData: Variant; isDirect: Boolean): JFileShareUrl; overload;
    url: String;
    expiresAt: JDate;
    isDirect: Boolean;
    isPreview: Boolean;
    function toJSON: Variant;
  end;

  JFileCopyReference = class external 'File.CopyReference'
    class function parse(refData: String): JFileCopyReference; overload;
    class function parse(refData: Variant): JFileCopyReference; overload;
    tag: String;
    expiresAt: JDate;
    function toJSON: Variant;
  end;

  JHttpAppInfo = class external 'Http.AppInfo'
    ICON_SMALL: Float;
    ICON_LARGE: Float;
    class function parse(appInfo: Variant): JHttpAppInfo; overload;
    class function parse(appInfo: Variant; appKey: String): JHttpAppInfo; overload;
    name: String;
    key: String;
    canUseDatastores: Boolean;
    canUseFiles: Boolean;
    hasAppFolder: Boolean;
    canUseFullDropbox: Boolean;
    procedure icon(width: Float); overload;
    procedure icon(width: Float; height: Float); overload;
  end;

  JHttpPollResult = class external 'Http.PollResult'
    class function parse(response: Variant): JHttpPollResult;
    hasChanges: Boolean;
    retryAfter: Float;
  end;

  JHttpPulledChanges = class external 'Http.PulledChanges'
    class function parse(deltaInfo: Variant): JHttpPulledChanges;
    blankSlate: Boolean;
    cursorTag: String;
    shouldPullAgain: Boolean;
    shouldBackOff: Boolean;
    function cursor: String;
  end;

  JHttpPulledChange = class external 'Http.PulledChange'
    class function parse(entry: Variant): JHttpPulledChange;
    path: String;
    wasRemoved: Boolean;
    stat: JFileStat;
  end;

  JHttpRangeInfo = class external 'Http.RangeInfo'
    class function parse(headerValue: String): JHttpRangeInfo;
    start: Float;
    size: Float;
    &end: Float;
  end;

  JHttpUploadCursor = class external 'Http.UploadCursor'
    class function parse(cursorData: String): JHttpUploadCursor; overload;
    class function parse(cursorData: Variant): JHttpUploadCursor; overload;
    constructor Create(cursorData: String); overload;
    constructor Create(cursorData: Variant); overload;
    tag: String;
    offset: Float;
    expiresAt: JDate;
    function toJSON: Variant;
  end;

  TAuthenticateCallback = procedure(err: JApiError; client: JClient);
  TQueryParamsCallback = procedure(queryParams: JQueryParams);
  TClientFileReadCallback = procedure(err: JApiError; fileContents: String; stat: JFileStat; rangeInfo: JHttpRangeInfo);
  TClientFileWriteCallback = procedure(err: JApiError; stat: JFileStat);
  TResumableUploadStepCallback = procedure(err: JApiError; uploadCursor: JHttpUploadCursor);
  TReadThumbnailCallback = procedure(err: JApiError; imageData: String; stat: JFileStat);
  TFileStatCallback = procedure(err: JApiError; stat: JFileStat);

  JAuthenticateOptions = class external
    interactive: Boolean;
  end;

  JSingOutOptions = class external
    mustInvalidate: Boolean;
  end;

  JAccountInfoOptions = class external
    httpCache: Boolean;
  end;

  JClientFileReadOptions = class external
    versionTag: String; // nullable
    rev: String; // nullable
    arrayBuffer: Boolean; // nullable
    blob: Boolean; // nullable
    buffer: Boolean; // nullable
    binary: Boolean; // nullable
    _length: Float; // nullable
    start: Float; // nullable
    httpCache: Boolean; // nullable
  end;

  JClientFileWriteOptions = class external
    lastVersionTag: String; // nullable
    parentRev: String; // nullable
    noOverwrite: Boolean; // nullable
  end;

  JReadDirOptions = class external
    removed: Boolean; // nullable
    deleted: Boolean; // nullable
    limit: Variant; // nullable
    versionTag: String; // nullable
    contentHash: String; // nullable
    httpCache: Boolean; // nullable
  end;

  JMakeURLOptions = class external
    download: Boolean; // nullable
    downloadHack: Boolean; // nullable
    long: Boolean; // nullable
    longUrl: Boolean; // nullable
  end;

  JHistoryOptions = class external
    limit: Float; // nullable
    httpCache: Boolean; // nullable
  end;

  JThumbnailUrlOptions = class external
    png: Boolean; // nullable
    format: String; // nullable
    size: String; // nullable
  end;

  JReadThumbnailOptions = class external(JThumbnailUrlOptions)
    arrayBuffer: Boolean; // nullable
    blob: Boolean; // nullable
    buffer: Boolean; // nullable
  end;

  JFindByNameOptions = class external
    limit: Float; // nullable
    removed: Boolean; // nullable
    deleted: Boolean; // nullable
    httpCache: Boolean; // nullable
  end;

  JRedirectOptions = class external
    redirectUrl: String; // nullable
    redirectFile: String; // nullable
    scope: String; // nullable
    rememberUser: Boolean; // nullable
  end;

  JUtilEventSource = class external 'Util.EventSource'
    constructor Create(options: record
      cancelable: Boolean;
    end);
    function addListener(listener: procedure(event: Variant)): JUtilEventSource;
    function removeListener(listener: procedure(event: Variant)): JUtilEventSource;
    function dispatch(event: Variant): Boolean;
  end;

  JUtilOauth = class external 'Util.Oauth'
    function queryParamsFromUrl(url: String): JQueryParams;
    function randomAuthStateParam: String;
    function checkAuthStateParam(stateParam: String): Boolean;
  end;

  JUtilXhr = class external 'Util.Xhr'
    xhr: JXMLHttpRequest;
    onError: procedure (error: JApiError; callBack: procedure(error: JApiError));
    constructor Create(method: String; baseUrl: String);
    function urlEncode(obj: Variant): String;
    function urlEncodeValue(obj: Variant): String;
    function urlDecode(&string: Variant): JQueryParams;
    function setParams(params: JQueryParams): JUtilXhr;
    function setCallback(callback: procedure(err: JApiError; responseType: String; metadataHeader: Variant; headers: Variant)): JUtilXhr;
    function signWithOauth(oauth: JUtilOauth; cacheFriendly: Boolean): JUtilXhr;
    function addOauthParams(oauth: JUtilOauth): JUtilXhr;
    function addOauthHeader(oauth: JUtilOauth): JUtilXhr;
    function setBody(body: String): JUtilXhr; overload;
    function setBody(body: JBlob): JUtilXhr; overload;
    function setBody(body: JArrayBuffer): JUtilXhr; overload;
    function setResponseType(responseType: String): JUtilXhr;
    function setHeader(headerName: String; value: String): JUtilXhr;
    function reportResponseHeaders: JUtilXhr;
    procedure setFileField(fieldName: String; fileName: String; fileData: String); overload;
    procedure setFileField(fieldName: String; fileName: String; fileData: String; contentType: String); overload;
    procedure setFileField(fieldName: String; fileName: String; fileData: JBlob); overload;
    procedure setFileField(fieldName: String; fileName: String; fileData: JBlob; contentType: String); overload;
(* TODO
    procedure setFileField(fieldName: String; fileName: String; fileData: JFile); overload;
    procedure setFileField(fieldName: String; fileName: String; fileData: JFile; contentType: String); overload;
*)
    function prepare: JUtilXhr;
    function send(callback: procedure(err: JApiError; responseType: String; metadataHeader: Variant)): JUtilXhr;
    procedure onReadyStateChange;
    procedure onXdrLoad;
    procedure onXdrError;
  end;


type
  JClient = class external 'Client'
    ERROR: Float;
    RESET: Float;
    PARAM_SET: Float;
    PARAM_LOADED: Float;
    AUTHORIZED: Float;
    DONE: Float;
    SIGNED_OUT: Float;
    onXhr: JUtilEventSource;
    onError: JUtilEventSource;
    onAuthStepChange: JUtilEventSource;
    authStep: Float;
    constructor Create(options: JCredentials);
// TODO:    function authDriver(driver: JAuthDriver.IAuthDriver): JClient;
    function dropboxUid: String;
    function credentials: JCredentials;
    function authenticate: JClient;
    function authenticate(callback: TAuthenticateCallback): JClient; overload;
    function authenticate(options: JAuthenticateOptions): JClient; overload;
    function authenticate(options: JAuthenticateOptions; callback: TAuthenticateCallback): JClient; overload;
    function isAuthenticated: Boolean;
    function signOut(callback: procedure(err: JApiError)): JXMLHttpRequest; overload;
    function signOut(options: JSingOutOptions; callback: procedure(err: JApiError)): JXMLHttpRequest; overload;
    procedure signOff(callback: procedure(err: JApiError)); overload;
    procedure signOff(options: JSingOutOptions; callback: procedure(err: JApiError)); overload;
    function getAccountInfo(callback: procedure(err: JApiError; AccountInfo: JAccountInfo)): JXMLHttpRequest; overload;
    function getAccountInfo(options: JAccountInfoOptions; callback: procedure(err: JApiError; accountInfo: JAccountInfo)): JXMLHttpRequest; overload;
    function readFile(path: String; callback: TClientFileReadCallback): JXMLHttpRequest; overload;
    function readFile(path: String; options: JClientFileReadOptions; callback: TClientFileReadCallback): JXMLHttpRequest; overload;
    function writeFile(path: String; data: Variant; callback: TClientFileWriteCallback): JXMLHttpRequest; overload;
    function writeFile(path: String; data: Variant; options: JClientFileWriteOptions; callback: TClientFileWriteCallback): JXMLHttpRequest; overload;
    function resumableUploadStep(data: Variant; callback: TResumableUploadStepCallback): JXMLHttpRequest; overload;
    function resumableUploadStep(data: Variant; cursor: JHttpUploadCursor; callback: TResumableUploadStepCallback): JXMLHttpRequest; overload;
    function resumableUploadFinish(path: String; cursor: JHttpUploadCursor; callback: TClientFileWriteCallback): JXMLHttpRequest; overload;
    function resumableUploadFinish(path: String; cursor: JHttpUploadCursor; options: JClientFileWriteOptions; callback: TClientFileWriteCallback): JXMLHttpRequest; overload;
    function stat(path: String; callback: procedure(err: JApiError; stat: JFileStat; folderEntries: array of JFileStat)): JXMLHttpRequest; overload;
    function stat(path: String; options: JFileStatOptions; callback: procedure(err: JApiError; stat: JFileStat; folderEntries: array of JFileStat)): JXMLHttpRequest; overload;
    function readdir(path: String; callback: procedure(err: JApiError; filenames: array of String; stat: JFileStat; folderEntries: array of JFileStat)): JXMLHttpRequest; overload;
    function readdir(path: String; options: JReadDirOptions; callback: procedure(err: JApiError; filenames: array of String; stat: JFileStat; folderEntries: array of JFileStat)): JXMLHttpRequest; overload;
    procedure metadata(path: String; callback: procedure(err: JApiError; stat: JFileStat; folderEntries: array of JFileStat)); overload;
    procedure metadata(path: String; options: JFileStatOptions; callback: procedure(err: JApiError; stat: JFileStat; folderEntries: array of JFileStat)); overload;
    function makeUrl(path: String; callback: procedure(err: JApiError; shareUrl: JFileShareUrl)): JXMLHttpRequest; overload;
    function makeUrl(path: String; options: JMakeURLOptions; callback: procedure(err: JApiError; shareUrl: JFileShareUrl)): JXMLHttpRequest; overload;
    function history(path: String; callback: procedure(err: JApiError; fileVersions: array of JFileStat)): JXMLHttpRequest; overload;
    function history(path: String; options: JHistoryOptions; callback: procedure(err: JApiError; fileVersions: array of JFileStat)): JXMLHttpRequest; overload;
    procedure revisions(path: String; options: JHistoryOptions; callback: procedure(err: JApiError; fileVersions: array of JFileStat));
    function thumbnailUrl(path: String): String; overload;
    function thumbnailUrl(path: String; options: JThumbnailUrlOptions): String; overload;
    function readThumbnail(path: String; callback: TReadThumbnailCallback): JXMLHttpRequest; overload;
    function readThumbnail(path: String; options: JReadThumbnailOptions; callback: TReadThumbnailCallback): JXMLHttpRequest; overload;
    function revertFile(path: String; versionTag: String; callback: TFileStatCallback): JXMLHttpRequest;
    procedure restore(path: String; versionTag: String; callback: TFileStatCallback);
    function findByName(path: String; namePattern: String; callback: procedure(err: JApiError; resultStats: array of JFileStat)): JXMLHttpRequest; overload;
    function findByName(path: String; namePattern: String; options: JFindByNameOptions; callback: procedure(err: JApiError; resultStats: array of JFileStat)): JXMLHttpRequest; overload;
    procedure search(path: String; namePattern: String; options: JFindByNameOptions; callback: procedure(err: JApiError; resultStats: array of JFileStat));
    function makeCopyReference(path: String; callback: procedure(err: JApiError; copyReference: JFileCopyReference)): JXMLHttpRequest;
    function copyRef(path: String; callback: procedure(err: JApiError; copyReference: JFileCopyReference)): JXMLHttpRequest;
    function pullChanges(callback: procedure(err: JApiError; changes: JHttpPulledChanges)): JXMLHttpRequest; overload;
    function pullChanges(cursor: String; callback: procedure(err: JApiError; changes: JHttpPulledChanges)): JXMLHttpRequest; overload;
    function pullChanges(cursor: JHttpPulledChanges; callback: procedure(err: JApiError; changes: JHttpPulledChanges)): JXMLHttpRequest; overload;
    procedure delta(cursor: String; callback: procedure(err: JApiError; changes: JHttpPulledChanges)); overload;
    procedure delta(cursor: JHttpPulledChanges; callback: procedure(err: JApiError; changes: JHttpPulledChanges)); overload;
    procedure pollForChanges(cursor: String; options: Variant; callback: procedure(err: JApiError; changes: JHttpPollResult)); overload;
    procedure pollForChanges(cursor: JHttpPulledChanges; options: Variant; callback: procedure(err: JApiError; changes: JHttpPollResult)); overload;
    function mkdir(path: String; callback: TFileStatCallback): JXMLHttpRequest;
    function remove(path: String; callback: TFileStatCallback): JXMLHttpRequest;
    procedure unlink(path: String; callback: TFileStatCallback);
    procedure delete(path: String; callback: TFileStatCallback);
    function copy(from: String; toPath: String; callback: TFileStatCallback): JXMLHttpRequest; overload;
    function copy(from: JFileCopyReference; toPath: String; callback: TFileStatCallback): JXMLHttpRequest; overload;
    function move(fromPath: String; toPath: String; callback: TFileStatCallback): JXMLHttpRequest;
    function appInfo(callback: procedure(err: JApiError; changes: JHttpAppInfo)): JXMLHttpRequest; overload;
    function appInfo(appKey: String; callback: procedure(err: JApiError; changes: JHttpAppInfo)): JXMLHttpRequest; overload;
    function isAppDeveloper(userId: Variant; callbackcallback: procedure(err: JApiError; isAppDeveloper: Boolean)): JXMLHttpRequest; overload;
    function isAppDeveloper(userId: Variant; appKey: Variant; callbackcallback: procedure(err: JApiError; isAppDeveloper: Boolean)): JXMLHttpRequest; overload;
    function hasOauthRedirectUri(redirectUri: String; callback: procedure(err: JApiError; hasOauthRedirectUri: Boolean)): JXMLHttpRequest; overload;
    function hasOauthRedirectUri(redirectUri: String; appKey: String; callback: procedure(err: JApiError; hasOauthRedirectUri: Boolean)): JXMLHttpRequest; overload;
    function hasOauthRedirectUri(redirectUri: String; appKey: JHttpAppInfo; callback: procedure(err: JApiError; hasOauthRedirectUri: Boolean)): JXMLHttpRequest; overload;
// TODO    function reset: JClient;
    function setCredentials(credentials: JCredentials): JClient;
    function appHash: String;
  end;

  JAuthDriver = class external 'Dropbox.AuthDriver'
    function authType: String;
    function url: String;
    procedure doAuthorize(authUrl: String; stateParam: String; client: JClient; callback: TQueryParamsCallback);
    procedure getStateParam(client: JClient; callback: procedure(state: String));
    procedure resumeAuthorize(stateParam: String; client: JClient; callback: TQueryParamsCallback);
    procedure onAuthStepChange(client: JClient; callback: procedure);
  end;

type
  JIAuthDriver = class external 'AuthDriver.IAuthDriver'
    procedure doAuthorize(authUrl: String; stateParam: String; client: JClient); overload;
    procedure doAuthorize(authUrl: String; stateParam: String; client: JClient; callback: TQueryParamsCallback); overload;
  end;

  JBrowserBase = class external 'AuthDriver.BrowserBase'
    function localStorage: JStorage;
    function currentLocation: String;
    procedure cleanupLocation;
    constructor Create(options: record
      scope: String;
      rememberUser: Boolean;
    end);
    function authType: String;
    procedure onAuthStepChange(client: JClient; callback: procedure);
    function locationStateParam(url: String): String;
  end;

  JRedirect = class external 'AuthDriver.Redirect'
    constructor Create(options: record
      redirectUrl: String;
      redirectFile: String;
      scope: String;
      rememberUser: Boolean;
    end);
    function url: String;
    procedure doAuthorize(authUrl: String; stateParam: String; client: JClient);
    procedure resumeAuthorize(stateParam: String; client: JClient; callback: TQueryParamsCallback);
  end;

  JPopup = class external 'AuthDriver.Popup' (JIAuthDriver)
    function locationOrigin(location: String): String;
    procedure oauthReceiver;
    constructor Create(options: JRedirectOptions);
    function url: String;
  end;

  JChromeApp = class external 'AuthDriver.ChromeApp' (JIAuthDriver)
    constructor Create(options: record
      scope: String;
    end);
  end;

  JChromeExtension = class external 'AuthDriver.ChromeExtension' (JIAuthDriver)
    procedure oauthReceiver;
    constructor Create(options: record
      scope: String;
      receiverPath: String;
    end);
  end;

  JCordova = class external 'AuthDriver.Cordova' (JIAuthDriver)
    procedure oauthReceiver;
    constructor Create(options: record
      scope: String;
      receiverPath: String;
    end);
    function url: String;
  end;

  JNodeServer = class external 'AuthDriver.NodeServer' (JIAuthDriver)
    constructor Create(options: record
      port: Float;
      tls: Variant; // nullable
    end);
    function authType: String;
    function url: String;
    procedure openBrowser(url: String);
    procedure createApp;
    procedure closeServer;
    procedure doRequest(request: Variant; response: Variant);
    procedure closeBrowser(response: Variant);
  end;
