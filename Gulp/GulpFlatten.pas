unit GulpFlatten;

interface

uses
  NodeJS;

type
  JIOptions = class external
    newPath: String;
  end;

function Flatten: JReadWriteStream; overload; external 'gulp-flatten.flatten';
function Flatten(Options: JIOptions): JReadWriteStream; overload; external 'gulp-flatten.flatten';



