unit GulpMinifyCSS;

interface

uses
  NodeJS.Stream, CleanCSS;

function minifyCSS: JReadWriteStream; overload; external 'gulp-minify-css.minifyCSS';
function minifyCSS(options: JCleanCSSOptions): JReadWriteStream; overload; external 'gulp-minify-css.minifyCSS';



