unit Vinyl;

interface

uses
  NodeJS.FS;

type
  JFile = class external 'vinyl.File'
    constructor Create(options: record
      cwd: String; // nullable
      base: String; // nullable
      path: String; // nullable
      history: array of String; // nullable
      stat: JStats; // nullable
      contents: Variant {JBuffer or JNodeJS.ReadWriteStream}; // nullable
    end);
    cwd: String;
    dirname: String;
    basename: String;
    base: String;
    path: String;
    stat: JStats;
    stem: String;
    extname: String;
    history: array of String;
    contents: Variant {JBuffer or JNodeJS.ReadableStream};
    relative: String;
    function isBuffer: Boolean;
    function isStream: Boolean;
    function isNull: Boolean;
    function clone: JFile; overload;
    function clone(opts: record
      contents: Boolean; // nullable
      deep: Boolean; // nullable
    end): JFile; overload;
(*
    function pipe(stream: JT): JT; overload;
    function pipe(stream: JT; opts: record
      &end: Boolean; // nullable
    end): JT; overload;
*)
    function inspect: String;
    function isVinyl(obj: Variant): Boolean;
  end;


