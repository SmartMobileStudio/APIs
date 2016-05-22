unit Gulp;

interface

uses
  NodeJS.Core, NodeJS.Stream, Orchestrator;

type
  JSrcOptions = class external
    read: Boolean; // nullable
    buffer: Boolean; // nullable
    base: String; // nullable
    cwd: String; // nullable
    root: String; // nullable
    dot: Boolean; // nullable
    nomount: Boolean; // nullable
    mark: Boolean; // nullable
    nosort: Boolean; // nullable
    stat: Boolean; // nullable
    silent: Boolean; // nullable
    strict: Boolean; // nullable
    cache: Boolean; // nullable
    statCache: Boolean; // nullable
    sync: Boolean; // nullable
    nounique: Boolean; // nullable
    nonull: Boolean; // nullable
    nocase: Boolean; // nullable
    debug: Boolean; // nullable
    globDebug: Boolean; // nullable
  end;

  JDestOptions = class external
    cwd: String; // nullable
    mode: String; // nullable
  end;

  JWatchOptions = class external
    interval: Float; // nullable
    debounceDelay: Float; // nullable
    mode: String; // nullable
    cwd: String; // nullable
  end;

  JWatchEvent = class external
    &type: String;
    path: String;
  end;

  TWatchCallback = procedure (event: JWatchEvent);
  TTaskCallback = function(cb: procedure(err: Variant)): Variant;


  TGulpPlugin = function (args: array of Variant): JReadWriteStream;

(*
  JWatchMethod = class external
    function (glob: Variant {String or array of String}; fn: Variant {JWatchCallback or String}): JNodeJS.EventEmitter;
    function (glob: Variant {String or array of String}; fn: array of Variant {JWatchCallback or String}): JNodeJS.EventEmitter;
    function (glob: Variant {String or array of String}; opt: JWatchOptions; fn: Variant {JWatchCallback or String}): JNodeJS.EventEmitter;
    function (glob: Variant {String or array of String}; opt: JWatchOptions; fn: array of Variant {JWatchCallback or String}): JNodeJS.EventEmitter;
  end;
*)

  TWatchMethod = function (glob: Variant; opt: JWatchOptions; fn: array of Variant): JEventEmitter;

  TDestMethod = function(outFolder: Variant {String or (file: String): String}; opt: JDestOptions): JReadWriteStream;

  TSrcMethod = function(glob: Variant {String or array of String}; opt: JSrcOptions): JReadWriteStream;

  JGulp = class external 'gulp.Gulp' (JOrchestrator)
    task: JAddMethod;
    src: TSrcMethod;
    dest: TDestMethod;
    watch: TWatchMethod;
  end;

var
  Gulp external 'gulp': JGulp;
