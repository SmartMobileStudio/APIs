unit GulpWatch;

interface

uses
  NodeJS.Stream;

type
  JIOptions = class external
    ignoreInitial: Boolean; // nullable
    events: array of String; // nullable
    base: String; // nullable
    name: String; // nullable
    verbose: Boolean; // nullable
    readDelay: Float; // nullable
  end;

  JIWatchStream = class external(JReadWriteStream)
    function add(path: String): JReadWriteStream; overload;
    function add(path: array of String): JReadWriteStream; overload;
    function unwatch(path: String): JReadWriteStream; overload;
    function unwatch(path: array of String): JReadWriteStream; overload;
    function close: JReadWriteStream;
  end;

function watch(glob: String): JIWatchStream; overload; external 'gulp-watch.watch';
function watch(glob: array of String): JIWatchStream; overload; external 'gulp-watch.watch';
function watch(glob: String; options: JIOptions): JIWatchStream; overload; external 'gulp-watch.watch';
function watch(glob: array of String; options: JIOptions): JIWatchStream; overload; external 'gulp-watch.watch';
function watch(glob: String; options: JIOptions; callback: procedure): JIWatchStream; overload; external 'gulp-watch.watch';
function watch(glob: array of String; options: JIOptions; callback: procedure): JIWatchStream; overload; external 'gulp-watch.watch';