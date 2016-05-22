unit GulpAutoprefixer;

interface

uses
  NodeJS.Stream;

type
  JOptions = class external
    browsers: array of String; // nullable
    cascade: Boolean; // nullable
    remove: Boolean; // nullable
  end;

function AutoPrefixer: JReadWriteStream; overload; external 'gulp-autoprefixer.autoPrefixer';
function AutoPrefixer(opts: JOptions): JReadWriteStream; overload; external 'gulp-autoprefixer.autoPrefixer';
