unit GlobStream;

interface

uses
  NodeJS.Stream, Glob;

type
  JOptions = class external 'glob-stream.Options' (JIOptions)
    cwd: String; // nullable
    base: String; // nullable
    cwdbase: Boolean; // nullable
  end;

  JElement = class external 'glob-stream.Element'
    cwd: String;
    base: String;
    path: String;
  end;

function Create(glob: String): JReadableStream; overload; external 'glob-stream.create';
function Create(glob: String; opts: JOptions): JReadableStream; overload; external 'glob-stream.create';
function Create(globs: array of String): JReadableStream; overload; external 'glob-stream.create';
function Create(globs: array of String; opts: JOptions): JReadableStream; overload; external 'glob-stream.create';


