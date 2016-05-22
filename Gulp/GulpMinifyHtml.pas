unit GulpMinifyHtml;

interface

uses
  NodeJS.Stream;

type
  JMinifyOptions = class external 'gulp-minify-html.minifyHtml.Oprions'
    empty: Boolean; // nullable
    cdata: Boolean; // nullable
    comments: Boolean; // nullable
    conditionals: Boolean; // nullable
    spare: Boolean; // nullable
    quotes: Boolean; // nullable
    loose: Boolean; // nullable
  end;

function minifyHtml: JReadWriteStream; overload; external 'gulp-minify-html.minifyHtml';
function minifyHtml(options: JMinifyOptions): JReadWriteStream; overload; external 'gulp-minify-html.minifyHtml';