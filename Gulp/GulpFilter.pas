unit GulpFilter;

interface

uses
  NodeJS.Stream, Minimatch, Vinyl;

type
  JFilterOptions = class external(Minimatch.JIOptions)
    restore: Boolean; // nullable
    passthrough: Boolean; // nullable
  end;

  TFileFunction = function(file: JFile): Boolean;

  JFilter = class external(JReadWriteStream)
    restore: JReadWriteStream;
  end;

function GulpFilter(pattern: String): JFilter; overload; external 'gulp-filter.filter';
function GulpFilter(pattern: array of String): JFilter; overload; external 'gulp-filter.filter';
function GulpFilter(pattern: TFileFunction): JFilter; overload; external 'gulp-filter.filter';
function GulpFilter(pattern: String; options: JFilterOptions): JFilter; overload; external 'gulp-filter.filter';
function GulpFilter(pattern: array of String; options: JFilterOptions): JFilter; overload; external 'gulp-filter.filter';
function GulpFilter(pattern: TFileFunction; options: JFilterOptions): JFilter; overload; external 'gulp-filter.filter';