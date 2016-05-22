unit GulpHelp;

interface

uses
  Orchestrator, Gulp;

type
  JGulpHelpOptions = class external
    description: String; // nullable
    aliases: array of String; // nullable
    hideEmpty: Boolean; // nullable
    hideDepsMessage: Boolean; // nullable
    afterPrintCallback: procedure; // nullable
  end;

  JTaskMethod = class external
(*
    function(name: String; help: JHelpOption; deps: array of String; fn: Jgulp.TaskCallback; option: JTaskOptions): Variant;;
    function(name: String; help: JHelpOption; deps: array of String): Variant;;
    function(name: String; help: JHelpOption; fn: Jgulp.TaskCallback; option: JTaskOptions): Variant;;
    function(name: String; help: JHelpOption): Variant;;
    function(name: String; deps: array of String; fn: Jgulp.TaskCallback; option: JTaskOptions): Variant;;
    function(name: String; fn: Jgulp.TaskCallback; option: JTaskOptions): Variant;;
*)
  end;

  JGulpHelp = class external(JOrchestrator)
    task: JTaskMethod;
    src: TSrcMethod;
    dest: TDestMethod;
    watch: TWatchMethod;
  end;

  JTaskOptions = class external
    aliases: array of String; // nullable
(*
    options: record
      // property Item[key: String]: String;
    end; // nullable
*)
  end;

function gulpHelp(gulp: JGulp): JGulpHelp; overload; external 'gulp-help.gulpHelp';
function gulpHelp(gulp: JGulp; options: JGulpHelpOptions): JGulpHelp; overload; external 'gulp-help.gulpHelp';