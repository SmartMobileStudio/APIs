unit GulpConcat;

interface

uses
  ECMA.Date, NodeJS.Stream;

type
  JIOptions = class external
    newLine: String;
  end;

  JIFsStats = class external
    dev: Float; // nullable
    ino: Float; // nullable
    mode: Float; // nullable
    nlink: Float; // nullable
    uid: Float; // nullable
    gid: Float; // nullable
    rdev: Float; // nullable
    size: Float; // nullable
    blksize: Float; // nullable
    blocks: Float; // nullable
    atime: JDate; // nullable
    mtime: JDate; // nullable
    ctime: JDate; // nullable
  end;

  JIVinylOptions = class external
    cwd: String; // nullable
    base: String; // nullable
    path: String; // nullable
    stat: JIFsStats; // nullable
    contents: Variant {JNodeJS.ReadableStream or JBuffer}; // nullable
  end;

  JIConcat = class external 'gulp-concat.IConcat'
(*
    function(filename: String; options: JIOptions): JReadWriteStream;;
    function(options: JIVinylOptions): JReadWriteStream;;
*)
  end;

var
  _tmp: JIConcat;


