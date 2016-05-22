unit VinylFS;

interface

uses
  NodeJS.Stream, NodeJS.Events, GlobStream, Vinyl;

type
  JWritableStream = class external
    function write(buffer: Variant): Boolean; overload;
    function write(buffer: Variant; cb: procedure): Boolean; overload;
  end;

  JISrcOptions = class external 'vinyl-fs.ISrcOptions' (JOptions)
    cwd: String; // nullable
    base: String; // nullable
    buffer: Boolean; // nullable
    read: Boolean; // nullable
    since: Variant {JDate or Float}; // nullable
    passthrough: Boolean; // nullable
    sourcemaps: Boolean; // nullable
  end;

function src(globs: Variant {String or array of String}): JReadWriteStream; overload; external 'vinyl-fs.src';
function src(globs: Variant {String or array of String}; opt: JISrcOptions): JReadWriteStream; overload; external 'vinyl-fs.src';
function watch(globs: Variant {String or array of String}): JEventEmitter; overload; external 'vinyl-fs.watch';

function watch(globs: Variant {String or array of String}; cb: procedure(outEvt: record
  &type: Variant;
  path: Variant;
  old: Variant;
end)): JEventEmitter; overload; external 'vinyl-fs.watch';

function watch(globs: String): JEventEmitter; overload;  external 'vinyl-fs.watch';
function watch(globs: array of String): JEventEmitter; overload;  external 'vinyl-fs.watch';
function watch(globs: Variant {String or array of String}; opt: record
  interval: Float; // nullable
  debounceDelay: Float; // nullable
  cwd: String; // nullable
  maxListeners: procedure; // nullable
end): JEventEmitter; overload;  external 'vinyl-fs.watch';
function watch(globs: Variant {String or array of String}; opt: record
  interval: Float; // nullable
  debounceDelay: Float; // nullable
  cwd: String; // nullable
  maxListeners: procedure; // nullable
end; cb: procedure(outEvt: record
  &type: Variant;
  path: Variant;
  old: Variant;
end)): JEventEmitter; overload;  external 'vinyl-fs.watch';
function dest(folder: String): JReadWriteStream; overload;  external 'vinyl-fs.dest';
function dest(folder: String; opt: record
  cwd: String; // nullable
  mode: Variant {Float or String}; // nullable
  dirMode: Variant {Float or String}; // nullable
  overwrite: Boolean; // nullable
end): JReadWriteStream; overload; external 'vinyl-fs.dest';
function dest(getFolderPath: function(file: JFile): String): JReadWriteStream; overload; external;
function symlink(folder: String): JReadWriteStream; overload; external 'vinyl-fs.symlink';
function symlink(folder: String; opts: record
  cwd: String; // nullable
  mode: Variant {Float or String}; // nullable
  dirMode: Float; // nullable
end): JReadWriteStream; overload; external 'vinyl-fs.symlink';
function symlink(getFolderPath: function(File: JFile): String): JReadWriteStream; overload; external 'vinyl-fs.symlink';
function symlink(getFolderPath: function(File: JFile): String; opts: record
  cwd: String; // nullable
  dirMode: Float; // nullable
end): JReadWriteStream; overload; external 'vinyl-fs.symlink';