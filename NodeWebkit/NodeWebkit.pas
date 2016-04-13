unit NodeWebkit;

interface

uses
  W3C.HTML5;

type
  JNWEventEmitter = class external 'nw.gui.EventEmitter'
    function addListener(event: String; listener: procedure): JNWEventEmitter;
    function on(event: String; listener: procedure): JNWEventEmitter;
    function once(event: String; listener: procedure): JNWEventEmitter;
    function removeListener(event: String; listener: procedure): JNWEventEmitter;
    function removeAllListeners: JNWEventEmitter; overload;
    function removeAllListeners(event: String): JNWEventEmitter; overload;
    procedure setMaxListeners(n: Float);
    function listeners(event: String): array of procedure;
    function emit(event: String; args: array of Variant): Boolean;
  end;

  JNWMenu = class;

  JNWMenuItemConfig = class external
    &label: String; // nullable
    click: procedure; // nullable
    &type: String; // nullable
    submenu: JNWMenu; // nullable
    icon: String; // nullable
    tooltip: String; // nullable
    checked: Boolean; // nullable
    enabled: Boolean; // nullable
    key: String; // nullable
    modifiers: String; // nullable
  end;

  JNWShortcutOption = class external
    key: String;
    active: procedure;
    failed: procedure;
  end;

  JNWWindowManifestOptions = class external
    title: String; // nullable
    icon: String; // nullable
    toolbar: Boolean; // nullable
    frame: Boolean; // nullable
    width: Float; // nullable
    height: Float; // nullable
    position: String; // nullable
    min_width: Float; // nullable
    min_height: Float; // nullable
    max_width: Float; // nullable
    max_height: Float; // nullable
  end;

  JNWMenuItem = class external 'nw.gui.MenuItem' (JNWEventEmitter)
    constructor Create(config: JNWMenuItemConfig);
    &label: String;
    click: procedure;
    &type: String;
    submenu: JNWMenu;
    icon: String;
    tooltip: String;
    checked: Boolean;
    enabled: Boolean;
    key: String;
    modifiers: String;
  end;

  JNWMenuConfig = class external
    &type: String; // nullable
  end;

  JNWHideMenusOptions = class external
    hideEdit: Boolean;
    hideWindow: Boolean;
  end;

  JNWMenu = class external 'nw.gui.Menu'
    constructor Create(config: JNWMenuConfig);
    items: array of JNWMenuItem;
    procedure append(item: JNWMenuItem);
    procedure remove(item: JNWMenuItem);
    procedure insert(item: JNWMenuItem; atPosition: Float);
    procedure removeAt(index: Float);
    procedure popup(x: Float; y: Float);
    procedure createMacBuiltin(appname: String); overload;
    procedure createMacBuiltin(appname: String; options: JNWHideMenusOptions); overload;
  end;

  JNWShortcut = class external 'nw.gui.Shortcut'(JNWEventEmitter)
    constructor Create(option: JNWShortcutOption);
    key: String;
    active: procedure;
    failed: procedure;
  end;

  JNWWindow = class external 'nw.gui.Window'(JNWEventEmitter)
    function get: JNWWindow; overload;
    function get(windowObJNWect: Variant): JNWWindow; overload;
    function open(url: String): JNWWindow; overload;
    function open(url: String; options: JNWWindowManifestOptions): JNWWindow; overload;
    x: Float;
    y: Float;
    width: Float;
    height: Float;
    title: String;
    menu: JNWMenu;
    isFullScreen: Boolean;
    isKioskMode: Boolean;
    zoomLevel: Float;
    procedure moveTo(x: Float; y: Float);
    procedure moveBy(x: Float; y: Float);
    procedure resizeTo(width: Float; height: Float);
    procedure resizeBy(width: Float; height: Float);
    procedure focus;
    procedure blur;
    procedure show;
    procedure hide;
    procedure close; overload;
    procedure close(force: Boolean); overload;
    procedure reload;
    procedure reloadIgnoringCache;
    procedure maximize;
    procedure unmaximize;
    procedure minimize;
    procedure restore;
    procedure enterFullscreen;
    procedure leaveFullscreen;
    procedure toggleFullscreen;
    procedure enterKioskMode;
    procedure leaveKioskMode;
    procedure toggleKioskMode;
    procedure showDevTools; overload;
    procedure showDevTools(id: String); overload;
    procedure showDevTools(id: String; headless: Boolean); overload;
    procedure showDevTools(id: JHTMLIFrameElement); overload;
    procedure showDevTools(id: JHTMLIFrameElement; headless: Boolean); overload;
    procedure closeDevTools;
    function isDevToolsOpen: Boolean;
    procedure setMaximumSize(width: Float; height: Float);
    procedure setMinimumSize(width: Float; height: Float);
    procedure setResizable(resizable: Boolean);
    procedure setAlwaysOnTop(top: Boolean);
    procedure setPosition(position: String);
    procedure setShowInTaskbar(show: Boolean);
    procedure requestAttention(attention: Boolean); overload;
    procedure requestAttention(attention: Float); overload;
    procedure capturePage(callback: procedure); overload;
    procedure capturePage(callback: procedure; imageformat: String); overload;
    procedure capturePage(callback: procedure; config_obJNWect: record
      format: String;
      datatype: String;
    end); overload;
    procedure setProgressBar(progress: Float);
    procedure setBadgeLabel(&label: String);
    procedure eval(frame: JHTMLIFrameElement; script: String);
  end;

  JNWClipboard = class external 'nw.gui.Clipboard'
    function get: JNWClipboard; overload;
    function getAsString: String; overload; external 'get';
    function get(&type: String): String; overload;
    procedure set(data: String); overload;
    procedure set(data: String; &type: String); overload;
    procedure clear;
  end;

  JNWTrayOption = class external
    title: String; // nullable
    tooltip: String; // nullable
    icon: String; // nullable
    alticon: String; // nullable
    menu: JNWMenu; // nullable
  end;

  JNWTray = class external 'nw.gui.Tray'
    constructor Create(option: JNWTrayOption);
    title: String;
    tooltip: String;
    icon: String;
    alticon: String;
    menu: JNWMenu;
    procedure remove;
  end;

  JNWIEventEmitter = class external
    function addListener(event: String; listener: procedure): JNWEventEmitter;
    function on(event: String; listener: procedure): JNWEventEmitter;
    function once(event: String; listener: procedure): JNWEventEmitter;
    function removeListener(event: String; listener: procedure): JNWEventEmitter;
    function removeAllListeners: JNWEventEmitter; overload;
    function removeAllListeners(event: String): JNWEventEmitter; overload;
    procedure setMaxListeners(n: Float);
    function listeners(event: String): array of procedure;
    function emit(event: String; args: array of Variant): Boolean;
  end;

  JNWApp = class external
    argv: Variant;
    fullArgv: Variant;
    dataPath: String;
    manifest: Variant;
    procedure clearCache;
    procedure closeAllWindows;
    procedure crashBrowser;
    procedure crashRenderer;
    procedure getProxyForURL(url: String);
    procedure quit;
    procedure setCrashDumpDir(dir: String);
    procedure addOriginAccessWhitelistEntry(sourceOrigin: String; destinationProtocol: String; destinationHost: String; allowDestinationSubdomains: Boolean);
    procedure removeOriginAccessWhitelistEntry(sourceOrigin: String; destinationProtocol: String; destinationHost: String; allowDestinationSubdomains: Boolean);
    procedure registerGlobalHotKey(shortcut: JNWShortcut);
    procedure unregisterGlobalHotKey(shortcut: JNWShortcut);
  end;

  JNWShell = class external
    procedure openExternal(uri: String);
    procedure openItem(file_path: String);
    procedure showItemInFolder(file_path: String);
  end;

var
  App external 'App': JNWApp;
  Shell external 'Shell': JNWShell;
