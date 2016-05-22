unit Minimatch;

interface

uses
  ECMA.RegEx;

//"minimatch"

type
  JIOptions = class external
    debug: Boolean; // nullable
    nobrace: Boolean; // nullable
    noglobstar: Boolean; // nullable
    dot: Boolean; // nullable
    noext: Boolean; // nullable
    nocase: Boolean; // nullable
    nonull: Boolean; // nullable
    matchBase: Boolean; // nullable
    nocomment: Boolean; // nullable
    nonegate: Boolean; // nullable
    flipNegate: Boolean; // nullable
  end;

  JIMinimatch = class external
    pattern: String;
    options: JIOptions;
    set: array of array of Variant;
    regexp: JRegExp;
    negate: Boolean;
    comment: Boolean;
    empty: Boolean;
    function makeRe: JRegExp;
    function match(fname: String): Boolean;
    function matchOne(files: array of String; pattern: array of String; partial: Boolean): Boolean;
    procedure debug;
    procedure make;
    procedure parseNegate;
    procedure braceExpand(pattern: String; options: JIOptions);
    procedure parse(pattern: String); overload;
    procedure parse(pattern: String; isSub: Boolean); overload;
  end;

  JIMinimatchStatic = class external
    constructor CreateJIMinimatch;
    prototype: JIMinimatch;
  end;

function match(list: array of String; pattern: String): array of String; overload; external;
function match(list: array of String; pattern: String; options: JIOptions): array of String; overload; external;
function filter(pattern: String): function(element: String; indexed: Float; &array: array of String): Boolean; overload; external;
function filter(pattern: String; options: JIOptions): function(element: String; indexed: Float; &array: array of String): Boolean; overload; external;
function makeRe(pattern: String): JRegExp; overload; external;
function makeRe(pattern: String; options: JIOptions): JRegExp; overload; external;

function M(target: String; pattern: String): Boolean; overload; external;
function M(target: String; pattern: String; options: JIOptions): Boolean; overload; external;