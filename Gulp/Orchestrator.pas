unit Orchestrator;

interface

type
//  JStrings = string or array of string;

  JAddMethod = class external
(*
    function(name: String; deps: array of String; fn: procedure): JOrchestrator;
    function(name: String; deps: array of String; fn: function(callback: procedure): Variant): JOrchestrator;
    function(name: String; deps: array of String; fn: function: Variant): JOrchestrator;
//    function(name: String; deps: array of String; fn: function: JQ.Promise{<Variant>}): JOrchestrator;

    function(name: String; fn: procedure): JOrchestrator;;
    function(name: String; fn: function(callback: procedure): Variant): JOrchestrator;
    function(name: String; fn: function: Variant): JOrchestrator;;
    function(name: String; fn: function: JQ.Promise{<Variant>}): JOrchestrator;
*)
  end;

  JStartMethod = class external
(*
    function(tasks: JStrings; cb: function(error: Variant): Variant): JOrchestrator;
    function(tasks: array of JStrings): JOrchestrator;
    function(task1: JStrings; task2: JStrings; cb: function(error: Variant): Variant): JOrchestrator;
    function(task1: JStrings; task2: JStrings; task3: JStrings; cb: function(error: Variant): Variant): JOrchestrator;
    function(task1: JStrings; task2: JStrings; task3: JStrings; task4: JStrings; cb: function(error: Variant): Variant): JOrchestrator;
    function(task1: JStrings; task2: JStrings; task3: JStrings; task4: JStrings; task5: JStrings; cb: function(error: Variant): Variant): JOrchestrator;
    function(task1: JStrings; task2: JStrings; task3: JStrings; task4: JStrings; task5: JStrings; task6: JStrings; cb: function(error: Variant): Variant): JOrchestrator;
*)
  end;

  JOnCallbackEvent = class external
    message: String;
    task: String;
    err: Variant;
    duration: Float; // nullable
  end;

  JOnAllCallbackEvent = class external(JOnCallbackEvent)
    src: String;
  end;

type
  JOrchestrator = class external 'orchestrator.Orchestrator'
    add: JAddMethod;
    start: JStartMethod;
    function hasTask(name: String): Boolean;
    procedure stop;
    function on(event: String; cb: function(e: JOnCallbackEvent): Variant): JOrchestrator;
    procedure onAll(cb: function(e: JOnAllCallbackEvent): Variant);
  end;
