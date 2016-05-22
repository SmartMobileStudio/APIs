unit Glob;

interface

uses
  NodeJS.Core, MiniMatch;

//"glob"

type
  JIOptions = class external(MiniMatch.JIOptions)
    cwd: String; // nullable
    root: String; // nullable
    dot: Boolean; // nullable
    nomount: Boolean; // nullable
    mark: Boolean; // nullable
    nosort: Boolean; // nullable
    stat: Boolean; // nullable
    silent: Boolean; // nullable
    strict: Boolean; // nullable
(*
    cache: record
      // property Item[path: String]: Variant;
    end; // nullable
    statCache: record
      // property Item[path: String]: Jfs.Stats;
    end; // nullable
*)
    symlinks: Variant; // nullable
    sync: Boolean; // nullable
    nounique: Boolean; // nullable
    nonull: Boolean; // nullable
    debug: Boolean; // nullable
    nobrace: Boolean; // nullable
    noglobstar: Boolean; // nullable
    noext: Boolean; // nullable
    nocase: Boolean; // nullable
    matchBase: Variant; // nullable
    nodir: Boolean; // nullable
    ignore: Variant; // nullable
    follow: Boolean; // nullable
    realpath: Boolean; // nullable
    nonegate: Boolean; // nullable
    nocomment: Boolean; // nullable
    globDebug: Boolean; // nullable
  end;

(*
  JIGlobStatic = class external(Jevents.EventEmitter)
    constructor CreateJIGlob;
    constructor CreateJIGlob;
    prototype: JIGlob;
  end;
*)

  JIGlobBase = class external
    minimatch: JIMinimatch;
    options: JIOptions;
    aborted: Boolean;
(*
    cache: record
      // property Item[path: String]: Variant;
    end;
    statCache: record
      // property Item[path: String]: Jfs.Stats;
    end;
    symlinks: record
      // property Item[path: String]: Boolean;
    end;
    realpathCache: record
      // property Item[path: String]: String;
    end;
*)
    found: array of String;
  end;

  JIGlob = class external(JIGlobBase{, Jevents.EventEmitter})
    procedure pause;
    procedure resume;
    procedure abort;
    EOF: Variant;
    paused: Boolean;
    maxDepth: Float;
    maxLength: Float;
    changedCwd: Boolean;
    cwd: String;
    root: String;
    error: Variant;
    matches: array of String;
    procedure log(args: array of Variant);
    procedure emitMatch(m: Variant);
  end;

function sync(pattern: String): array of String; overload; external;
function sync(pattern: String; options: JIOptions): array of String; overload; external;
function hasMagic(pattern: String): Boolean; overload; external;
function hasMagic(pattern: String; options: JIOptions): Boolean; overload; external;

procedure G(pattern: String; cb: procedure(err: JError; matches: array of String)); overload; external;
procedure G(pattern: String; options: JIOptions; cb: procedure(err: JError; matches: array of String)); overload; external;
