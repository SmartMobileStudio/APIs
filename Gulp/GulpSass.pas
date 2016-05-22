unit GulpSass;

interface

uses
  ECMA.Date, NodeJS.Core, NodeJS.Stream;

type
  JSassResults = class external
    css: String;
    map: String;
    stats: record
      entry: String;
      start: JDate;
      &end: JDate;
      duration: Float;
      includedFiles: array of String;
    end;
  end;

  JSassOptions = class external
    file: String; // nullable
    data: String; // nullable
    success: function(results: JSassResults): Variant; // nullable
    error: function(err: JError): Variant; // nullable
    includePaths: array of String; // nullable
    imagePaths: array of String; // nullable
    indentedSyntax: Boolean; // nullable
    omitSourceMapUrl: Boolean; // nullable
    outFile: String; // nullable
    outputStyle: String; // nullable
    precision: Float; // nullable
    sourceComments: Boolean; // nullable
    sourceMap: Variant {Boolean or String}; // nullable
    sourceMapEmbed: Boolean; // nullable
    sourceMapContents: Boolean; // nullable
  end;

  JOptions = class external(JSassOptions)
    errLogToConsole: Boolean; // nullable
    onSuccess: function(css: String): Variant; // nullable
    onError: function(err: JError): Variant; // nullable
    sync: Boolean; // nullable
  end;

  JSass = class external 'gulp-sass.sass'
//    function(opts: JOptions): JReadWriteStream;;
    procedure logError; overload;
    procedure logError(error: String); overload;
    function sync: JReadWriteStream; overload;
    function sync(options: JOptions): JReadWriteStream; overload;
  end;

var
  _tmp external '_tmp': JSass;
