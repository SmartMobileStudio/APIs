unit Phantomjs;

// Project: https://github.com/ariya/phantomjs/wiki/API-Reference
// Original TypeScript Definitions by: 
//   Jed Hunsaker <https://github.com/jedhunsaker>, 
//   Mike Keesey <https://github.com/keesey>

interface

uses
  ECMA.Date;

type
  JTopLeft = class external
    top: Float;
    left: Float;
  end;

  JSize = class external
    width: Float;
    height: Float;
  end;

  JClipRect = class external
    top: Float;
    left: Float;
    width: Float;
    height: Float;
  end;

  JCookie = class external
    name: String;
    value: String;
    domain: String; // nullable
  end;

  JPhantom = class external
    args: array of String;
    cookies: array of JCookie;
    cookiesEnabled: Boolean;
    libraryPath: String;
    scriptName: String;
    version: record 
      major: Integer;
      minor: Integer;
      patch: Integer;
    end;
    function addCookie(cookie: JCookie): Boolean;
    procedure clearCookies;
    function deleteCookie(cookieName: String): Boolean;
    function &exit: Boolean; overload;
    function &exit(returnValue: Variant): Boolean; overload;
    function injectJs(filename: String): Boolean;
    onError: function (msg: String; trace: array of String): Variant;
  end;

  JSystem = class external
    pid: Integer;
    platform: String;
    os: record
      architecture: String;
      name: String;
      version: String;
    end;
(*
    env:       // property Item[name: String]: String;
    end;;
*)
    args: array of String;
  end;

  JPaperSize = class external
    width: String; // nullable
    height: String; // nullable
    border: String;
    format: String; // nullable
    orientation: String; // nullable
  end;

  JWebPageSettings = class external
    javascriptEnabled: Boolean;
    loadImages: Boolean;
    localToRemoteUrlAccessEnabled: Boolean;
    userAgent: String;
    userName: String;
    password: String;
    XSSAuditingEnabled: Boolean;
    webSecurityEnabled: Boolean;
    resourceTimeout: Integer;
  end;

  JResourceError = class external
    id: Integer;
    url: String;
    errorCode: String;
    errorString: String;
  end;

  JResourceResponse = class external
    id: Integer;
    url: String;
    time: JDate;
(*
    headers:       // property Item[name: String]: String;
    end;;
*)
    bodySize: Integer;
    contentType: String; // nullable
    redirectURL: String; // nullable
    stage: String;
    status: Integer;
    statusText: String;
  end;

  JResourceRequest = class external
    id: Integer;
    &method: String;
    url: String;
    time: JDate;
(*
    headers:       // property Item[name: String]: String;
    end;;
*)
  end;

  JNetworkRequest = class external
    procedure abort;
    procedure changeUrl(url: String);
    procedure setHeader(name: String; value: String);
  end;

  JWebPage = class external
    canGoBack: Boolean;
    canGoForward: Boolean;
    clipRect: JClipRect;
    content: String;
    cookies: array of JCookie;
    // customHeaders:       // property Item[name: String]: String;
    event: Variant;
    focusedFrameName: String;
    frameContent: String;
    frameName: String;
    framePlainText: String;
    frameTitle: String;
    frameUrl: String;
    framesCount: Integer;
    framesName: Variant;
    libraryPath: String;
    navigationLocked: Boolean;
    offlineStoragePath: String;
    offlineStorageQuota: Integer;
    ownsPages: Boolean;
    pages: array of JWebPage;
    pagesWindowName: String;
    paperSize: JPaperSize;
    plainText: String;
    scrollPosition: JTopLeft;
    settings: JWebPageSettings;
    title: String;
    url: String;
    viewportSize: JSize;
    windowName: String;
    zoomFactor: Float;
    function addCookie(cookie: JCookie): Boolean;
    function childFramesCount: Integer;
    function childFramesName: String;
    procedure clearCookies;
    procedure close;
    function currentFrameName: String;
    function deleteCookie(cookieName: String): Boolean;
    function evaluate(fn: function: Variant; args: array of Variant): Variant;
    procedure evaluateAsync(fn: function: Variant);
    function evaluateJavascript(str: String): Variant;
    function getPage(windowName: String): JWebPage;
    procedure go(index: Integer);
    procedure goBack;
    procedure goForward;
    procedure includeJs(url: String; callback: function: Variant);
    function injectJs(filename: String): Boolean;
    procedure open(url: String; callback: function(status: String): Variant); overload;
    procedure open(url: String; method: String; callback: function(status: String): Variant); overload;
    procedure open(url: String; method: String; data: Variant; callback: function(status: String): Variant); overload;
    procedure openUrl(url: String; httpConf: Variant; settings: Variant);
    procedure release;
    procedure reload;
    procedure render(filename: String);
    function renderBase64(format: String): String;
    procedure sendEvent(mouseEventType: String); overload;
    procedure sendEvent(mouseEventType: String; mouseX: Float); overload;
    procedure sendEvent(mouseEventType: String; mouseX: Float; mouseY: Float); overload;
    procedure sendEvent(mouseEventType: String; mouseX: Float; mouseY: Float; button: String); overload;
    procedure sendEvent(keyboardEventType: String; keyOrKeys: Variant); overload;
    procedure sendEvent(keyboardEventType: String; keyOrKeys: Variant; aNull: Variant); overload;
    procedure sendEvent(keyboardEventType: String; keyOrKeys: Variant; aNull: Variant; bNull: Variant); overload;
    procedure sendEvent(keyboardEventType: String; keyOrKeys: Variant; aNull: Variant; bNull: Variant; modifier: Integer); overload;
    procedure setContent(content: String; url: String);
    procedure stop;
    procedure switchToFocusedFrame;
    procedure switchToFrame(frameName: String); overload;
    procedure switchToFrame(framePosition: Integer); overload;
    procedure switchToChildFrame(frameName: String); overload;
    procedure switchToChildFrame(framePosition: Integer); overload;
    procedure switchToMainFrame;
    procedure switchToParentFrame;
    procedure uploadFile(selector: String; filename: String);
    onAlert: function(msg: String): Variant;
    onCallback: function: Variant;
    onClosing: function(closingPage: JWebPage): Variant;
    onConfirm: function(msg: String): Boolean;
    onConsoleMessage: function(msg: String; lineNum: Integer; sourceId: String): Variant;
    onError: function(msg: String; trace: array of String): Variant;
    onFilePicker: function(oldFile: String): String;
    onInitialized: function: Variant;
    onLoadFinished: function(status: String): Variant;
    onLoadStarted: function: Variant;
    onNavigationRequested: function(url: String; &type: String; willNavigate: Boolean; main: Boolean): Variant;
    onPageCreated: function(newPage: JWebPage): Variant;
    onPrompt: function(msg: String; defaultVal: String): String;
    onResourceError: function(resourceError: JResourceError): Variant;
    onResourceReceived: function(response: JResourceResponse): Variant;
    onResourceRequested: function(requestData: JResourceRequest; networkRequest: JNetworkRequest): Variant;
    onUrlChanged: function(targetUrl: String): Variant;
    procedure closing(closingPage: JWebPage);
    procedure initialized;
    procedure javaScriptAlertSent(msg: String);
    procedure javaScriptConsoleMessageSent(msg: String); overload;
    procedure javaScriptConsoleMessageSent(msg: String; lineNum: Integer); overload;
    procedure javaScriptConsoleMessageSent(msg: String; lineNum: Integer; sourceId: String); overload;
    procedure loadFinished(status: String);
    procedure loadStarted;
    procedure navigationRequested(url: String; &type: String; willNavigate: Boolean; main: Boolean);
    procedure rawPageCreated(newPage: JWebPage);
    procedure resourceReceived(response: JResourceResponse);
    procedure resourceRequested(requestData: JResourceRequest; networkRequest: JNetworkRequest);
    procedure urlChanged(targetUrl: String);
  end;

  JStream = class external
    function atEnd: Boolean;
    procedure close;
    procedure flush;
    function read: String;
    function readLine: String;
    procedure seek(position: Integer);
    procedure write(data: String);
    procedure writeLine(data: String);
  end;

  JFileSystem = class external
    separator: String;
    workingDirectory: String;
    function list(path: String): array of String;
    function absolute(path: String): String;
    function exists(path: String): Boolean;
    function isDirectory(path: String): Boolean;
    function isFile(path: String): Boolean;
    function isAbsolute(path: String): Boolean;
    function isExecutable(path: String): Boolean;
    function isReadable(path: String): Boolean;
    function isWritable(path: String): Boolean;
    function isLink(path: String): Boolean;
    function readLink(path: String): String;
    procedure changeWorkingDirectory(path: String);
    procedure makeDirectory(path: String);
    procedure makeTree(path: String);
    procedure removeDirectory(path: String);
    procedure removeTree(path: String);
    procedure copyTree(source: String; destination: String);
    function open(path: String; mode: String): JStream; overload;
    function open(path: String; options: record
      mode: String;
      charset: String; // nullable
    end): JStream; overload;
    function read(path: String): String;
    procedure write(path: String; content: String; mode: String);
    function size(path: String): Integer;
    procedure remove(path: String);
    procedure copy(source: String; destination: String);
    procedure move(source: String; destination: String);
    procedure touch(path: String);
  end;

  JWebServerRequest = class external
    &method: String;
    url: String;
    httpVersion: Integer;
(*
    headers:       // property Item[name: String]: String;
    end;;
*)
    post: String;
    postRaw: String;
  end;

  JWebServerResponse = class external
(*
    headers:       // property Item[name: String]: String;
    end;;
*)
    procedure setHeader(name: String; value: String);
    function header(name: String): String;
    statusCode: Integer;
    procedure setEncoding(encoding: String);
    procedure write(data: String);
    procedure writeHead(statusCode: Integer); overload;
(*
    procedure writeHead(statusCode: Integer; headers: record
      // property Item[name: String]: String;
    end); overload;
*)
    procedure close;
    procedure closeGracefully;
  end;

  JWebServer = class external
    port: Integer;
    function listen(port: Integer): Boolean; overload;
    function listen(port: Integer; cb: procedure(request: JWebServerRequest; response: JWebServerResponse)): Boolean; overload;
    function listen(ipAddressPort: String): Boolean; overload;
    function listen(ipAddressPort: String; cb: procedure(request: JWebServerRequest; response: JWebServerResponse)): Boolean; overload;
    procedure close;
  end;

(*
function require(module: String): Variant;
phantom: JPhantom;
function create: JWebPage;
*)