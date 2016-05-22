unit GulpBabel;

interface

uses
  NodeJS.Stream;

function babel(options: record
  filename: String; // nullable
  filenameRelative: String; // nullable
  presets: array of String; // nullable
  plugins: array of String; // nullable
  highlightCode: Boolean; // nullable
  only: Variant {String or array of String}; // nullable
  ignore: Variant {String or array of String}; // nullable
  auxiliaryCommentBefore: Variant; // nullable
  auxiliaryCommentAfter: Variant; // nullable
  sourceMaps: Variant; // nullable
  inputSourceMap: Variant; // nullable
  sourceMapTarget: Variant; // nullable
  sourceFileName: Variant; // nullable
  sourceRoot: Variant; // nullable
  moduleRoot: Variant; // nullable
  moduleIds: Variant; // nullable
  moduleId: Variant; // nullable
  getModuleId: Variant; // nullable
  resolveModuleSource: Variant; // nullable
  keepModuleIdExtesions: Boolean; // nullable
  code: Boolean; // nullable
  ast: Boolean; // nullable
  compact: Variant; // nullable
  comments: Boolean; // nullable
  shouldPrintComment: Variant; // nullable
  env: Variant; // nullable
  retainLines: Boolean; // nullable
end): JReadWriteStream; overload; external 'gulp-babel.babel';

function babel: JReadWriteStream; overload; external 'gulp-babel.babel';
