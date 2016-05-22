unit GulpShell;

interface

uses
  NodeJS.Stream;

type
  JOption = class external
    errorMessage: String; // nullable
    ignoreErrors: Boolean; // nullable
    quiet: Boolean; // nullable
    cwd: String; // nullable
    templateData: Variant; // nullable
    maxBuffer: Float; // nullable
    timeout: Float; // nullable
    env: Variant; // nullable
  end;

  JShell = class external 'gulp-shell.shell'
//    function(commands: Variant {String or array of String}; options: JOption): JReadWriteStream;;
    function task(commands: String): function(done: procedure): JReadWriteStream; overload;
    function task(commands: array of String): function(done: procedure): JReadWriteStream; overload;
    function task(commands: String; options: JOption): function(done: procedure): JReadWriteStream; overload;
    function task(commands: array of String; options: JOption): function(done: procedure): JReadWriteStream; overload;
  end;

var
  Shell external 'shell': JShell;