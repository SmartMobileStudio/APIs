unit GulpReplace;

interface

uses
  ECMA.RegEx, NodeJS.Stream;

type
  JGulpReplaceOptions = class external 'gulp-replace.Options'
    skipBinary: Boolean; // nullable
  end;

  TReplacer = function(match: String): String;

function Replace(pattern: String; replacement: String): JReadWriteStream; overload; external 'gulp-replace.replace';
function Replace(pattern: String; replacement: TReplacer): JReadWriteStream; overload; external 'gulp-replace.replace';
function Replace(pattern: String; replacement: String; opts: JGulpReplaceOptions): JReadWriteStream; overload; external 'gulp-replace.replace';
function Replace(pattern: String; replacement: TReplacer; opts: JGulpReplaceOptions): JReadWriteStream; overload; external 'gulp-replace.replace';
function Replace(pattern: JRegExp; replacement: String): JReadWriteStream; overload; external 'gulp-replace.replace';
function Replace(pattern: JRegExp; replacement: TReplacer): JReadWriteStream; overload; external 'gulp-replace.replace';
function Replace(pattern: JRegExp; replacement: String; opts: JGulpReplaceOptions): JReadWriteStream; overload; external 'gulp-replace.replace';
function Replace(pattern: JRegExp; replacement: TReplacer; opts: JGulpReplaceOptions): JReadWriteStream; overload; external 'gulp-replace.replace';



