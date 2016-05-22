unit GulpSize;

interface

uses
  NodeJS.Stream;

type
  JOptions = class external
    showFiles: Boolean; // nullable
    gzip: Boolean; // nullable
    title: String; // nullable
  end;

  JSizeStream = class external 'gulp-size.SizeStream' (JReadWriteStream)
    size: Float;
    prettySize: String;
  end;

function size: JSizeStream; overload; external 'gulp-size.size';
function size(options: JOptions): JSizeStream; overload; external 'gulp-size.size';