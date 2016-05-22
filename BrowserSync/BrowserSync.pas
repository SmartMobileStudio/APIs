unit BrowserSync;

interface

uses
  Chokidar, ECMA.RegEx, NodeJS.Core, NodeJS.FS, NodeJS.Stream, NodeJS.Events,
  NodeJS.Http;

//"browser-sync"

type
  JRewriteRules = class external
    match: JRegExp;
    fn: function(match: String): String;
  end;

  JStreamOptions = class external
    once: Boolean; // nullable
    match: Variant {Jmm.Pattern or array of Jmm.Pattern}; // nullable
  end;

  JHash{<T>} = class external
    // property Item[path: String]: JT;
  end;

  JUIOptions = class external
    port: Integer; // nullable
    weinre: record
      port: Integer; // nullable
    end; // nullable
  end;

  TMiddlewareHandler = function(req: JServerRequest;
    res: JServerResponse; next: procedure): Variant;

  JServerOptions = class external
    baseDir: Variant {String or array of String}; // nullable
    directory: Boolean; // nullable
    index: String; // nullable
    routes: JHash{<String>}; // nullable
    middleware: array of TMiddlewareHandler; // nullable
  end;

  JProxyOptions = class external
    target: String; // nullable
    middleware: TMiddlewareHandler; // nullable
    ws: Boolean;
    reqHeaders: function(config: Variant): JHash{<Variant>};
    proxyRes: function(res: JServerResponse; req: JServerRequest; next: JFunction): Variant;
  end;

  JGhostOptions = class external
    clicks: Boolean; // nullable
    scroll: Boolean; // nullable
    forms: Boolean; // nullable
  end;

  JSnippetOptions = class external
    ignorePaths: String; // nullable
    rule: record
      match: JRegExp; // nullable
      fn: function(snippet, match: String): Variant; // nullable
    end; // nullable
  end;

  JSocketOptions = class external
    path: String; // nullable
    clientPath: String; // nullable
    namespace: String; // nullable
    domain: String; // nullable
    port: Integer; // nullable
    clients: record
      heartbeatTimeout: Float; // nullable
    end; // nullable
  end;

  JOptions = class external
    ui: JUIOptions; // nullable
    files: Variant {String or array of String}; // nullable
    watchOptions: JWatchOptions; // nullable
    server: JServerOptions; // nullable
    proxy: Variant {String or Boolean or JProxyOptions}; // nullable
    port: Integer; // nullable
    serveStatic: array of String; // nullable
    https: Boolean; // nullable
    ghostMode: Variant {JGhostOptions or Boolean}; // nullable
    logLevel: String; // nullable
    logPrefix: String; // nullable
    logConnections: Boolean; // nullable
    logFileChanges: Boolean; // nullable
    logSnippet: Boolean; // nullable
    snippetOptions: JSnippetOptions; // nullable
    rewriteRules: Variant {Boolean or array of JRewriteRules}; // nullable
    tunnel: Variant {String or Boolean}; // nullable
    online: Boolean; // nullable
    open: Variant {String or Boolean}; // nullable
    browser: Variant {String or array of String}; // nullable
    xip: Boolean; // nullable
    reloadOnRestart: Boolean; // nullable
    notify: Boolean; // nullable
    scrollProportionally: Boolean; // nullable
    scrollThrottle: Float; // nullable
    scrollRestoreTechnique: String; // nullable
    scrollElements: array of String; // nullable
    scrollElementMapping: array of String; // nullable
    reloadDelay: Float; // nullable
    reloadDebounce: Float; // nullable
    plugins: array of Variant; // nullable
    injectChanges: Boolean; // nullable
    startPath: String; // nullable
    minify: Boolean; // nullable
    host: String; // nullable
    codeSync: Boolean; // nullable
    timestamps: Boolean; // nullable
    scriptPath: function(path: String): String; // nullable
    socket: JSocketOptions; // nullable
    middleware: TMiddlewareHandler; // nullable
    middlewares: array of TMiddlewareHandler; external 'middleware'; // nullable
  end;

  JBrowserSyncInstance = class external
    name: String;
    function init: JBrowserSyncInstance; overload;
    function init(config: JOptions): JBrowserSyncInstance; overload;
    function init(config: JOptions; callback: function(err: JError; bs: JObject): Variant): JBrowserSyncInstance; overload;
    procedure reload; overload;
    procedure reload(file: String); overload;
    procedure reload(files: array of String); overload;
    function reload(options: record
      stream: Boolean;
    end): JReadWriteStream; overload;
    function stream: JReadWriteStream; overload;
    function stream(opts: JStreamOptions): JReadWriteStream; overload;
    procedure notify(message: String); overload;
    procedure notify(message: String; timeout: Float); overload;
    procedure &exit;
    function watch(patterns: String): JEventEmitter; overload;
    function watch(patterns: String; opts: JWatchOptions): JEventEmitter; overload;
    function watch(patterns: String; opts: JWatchOptions; fn: function(event: String; file: JStats): Variant): JEventEmitter; overload;
    procedure pause;
    procedure resume;
    emitter: JEventEmitter;
    active: Boolean;
    paused: Boolean;
  end;

  JBrowserSyncStatic = class external(JBrowserSyncInstance)
//    function (config: JOptions; callback: function(err: JError; bs: JObject): Variant): JBrowserSyncInstance;;
    function create: JBrowserSyncInstance; overload;
    function create(name: String): JBrowserSyncInstance; overload;
    function get(name: String): JBrowserSyncInstance;
    function has(name: String): Boolean;
  end;

var
  BrowserSync external 'browserSync': JBrowserSyncStatic;