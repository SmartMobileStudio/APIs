unit GulpUtil;

interface

uses
  NodeJS.Core, NodeJS.Stream;

type
  JPluginErrorOptions = class external
    name: String; // nullable
    message: Variant; // nullable
    fileName: String; // nullable
    lineNumber: Float; // nullable
    stack: String; // nullable
    showStack: Boolean; // nullable
    showProperties: Boolean; // nullable
    plugin: String; // nullable
    error: JError; // nullable
  end;

(*
  JFile = class external 'gulp-util.File'(Jvinyl)
  end;
*)
  JPluginError = class external 'PluginError'
    constructor Create(options: JPluginErrorOptions); overload;
    constructor Create(pluginName: String; options: JPluginErrorOptions); overload;
    constructor Create(pluginName: String; message: String; options: JPluginErrorOptions); overload;
    constructor Create(pluginName: String; message: JError; options: JPluginErrorOptions); overload;
    name: String;
    message: Variant;
    fileName: String;
    lineNumber: Float;
    stack: String;
    showStack: Boolean;
    showProperties: Boolean;
    plugin: String;
    error: JError;
  end;

function replaceExtension(npath: String; ext: String): String; external;
procedure log; overload; external;
procedure log(message: Variant; optionalParams: array of Variant); overload; external;
function template(tmpl: String): function(opt: record
  file: record
    path: String;
  end;
end): String; overload; external;
function template(tmpl: String; opt: record
  file: record
    path: String;
  end;
end): String; overload; external;
procedure beep; external;
function isStream(obj: Variant): Boolean; external;
function isBuffer(obj: Variant): Boolean; external;
function isNull(obj: Variant): Boolean; external;
function combine(streams: array of JReadWriteStream): function: JReadWriteStream; external;
function buffer: JReadWriteStream; overload; external;
function buffer(cb: procedure(err: JError; data: array of Variant)): JReadWriteStream; overload; external;

var
(*
  colors: Jtype of;
  date:     function(now: JDate; mask: String; convertLocalTimeToUTC: Boolean): Variant;;
    function(date: String; mask: String; convertLocalTimeToUTC: Boolean): Variant;;
    masks: Variant;
  end;
*)
  env: Variant;
//  noop: Jtype of;
  linefeed: String;


