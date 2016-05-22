unit Chokidar;

interface

//"fs"

type
  JFSWatcher = class external 'fs.FSWatcher'
    procedure add(fileDirOrGlob: String); overload;
    procedure add(filesDirsOrGlobs: array of String); overload;
    procedure unwatch(fileDirOrGlob: String); overload;
    procedure unwatch(filesDirsOrGlobs: array of String); overload;
    function getWatched: Variant;
  end;

  JWatchOptions = class external
    persistent: Boolean; // nullable
    ignored: Variant; // nullable
    ignoreInitial: Boolean; // nullable
    followSymlinks: Boolean; // nullable
    cwd: String; // nullable
    usePolling: Boolean; // nullable
    useFsEvents: Boolean; // nullable
    alwaysStat: Boolean; // nullable
    depth: Float; // nullable
    interval: Float; // nullable
    binaryInterval: Float; // nullable
    ignorePermissionErrors: Boolean; // nullable
    atomic: Boolean; // nullable
    awaitWriteFinish: Variant; // nullable
  end;

function Watch(fileDirOrGlob: String): JFSWatcher; overload; external 'chokidar.watch';
function Watch(fileDirOrGlob: String; options: JWatchOptions): JFSWatcher; overload; external 'chokidar.watch';
function Watch(filesDirsOrGlobs: array of String): JFSWatcher; overload; external 'chokidar.watch';
function Watch(filesDirsOrGlobs: array of String; options: JWatchOptions): JFSWatcher; overload; external 'chokidar.watch';