unit GulpUseref;

interface

uses
  NodeJS.Stream;

type
  JOptions = class external
    searchPath: Variant {String or array of String}; // nullable
    base: String; // nullable
    noAssets: Boolean; // nullable
    noconcat: Boolean; // nullable
    additionalStreams: array of JReadWriteStream; // nullable
    transformPath: procedure(filePath: String); // nullable
  end;
  TUseref = function (options: JOptions; transformStreams: array of JReadWriteStream): JReadWriteStream;

var
  useref external 'gulp-useref.useref': TUseref;