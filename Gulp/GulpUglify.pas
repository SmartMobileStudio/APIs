unit GulpUglify;

interface

uses
  NodeJS.Stream, UglifyJS;

type
  JOptions = class external 'gulp-uglify.Options'
    mangle: Boolean; // nullable
    output: JBeautifierOptions; // nullable
    compress: Variant {JUglifyJS.CompressorOptions or Boolean}; // nullable
    preserverComments: Variant {String or (node: Variant; comment: JUglifyJS.Tokenizer): Boolean}; // nullable
  end;

function GulpUglify: JReadWriteStream; overload; external 'gulp-uglify.GulpUglify';
function GulpUglify(options: JOptions): JReadWriteStream; overload; external 'gulp-uglify.GulpUglify';