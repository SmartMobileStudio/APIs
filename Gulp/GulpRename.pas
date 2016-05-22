unit GulpRename;

interface

uses
  NodeJS.Stream;

type
  JParsedPath = class external
    dirname: String; // nullable
    basename: String; // nullable
    extname: String; // nullable
  end;

  JGulpRenameOptions = class external (JParsedPath)
    prefix: String; // nullable
    suffix: String; // nullable
  end;

function Rename(name: String): JReadWriteStream; overload; external 'gulp-rename.rename';
function Rename(callback: function(path: JParsedPath): Variant): JReadWriteStream; overload; external 'gulp-rename.rename';
function Rename(opts: JGulpRenameOptions): JReadWriteStream; overload; external 'gulp-rename.rename';