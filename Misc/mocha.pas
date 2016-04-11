unit Mocha;

interface

uses
  ECMA.RegEx, NodeJS.Core;

type
  JMochaSetupOptions = class external
    slow: Float; // nullable
    timeout: Float; // nullable
    ui: String; // nullable
    globals: array of Variant; // nullable
    reporter: Variant; // nullable
    bail: Boolean; // nullable
    ignoreLeaks: Boolean; // nullable
    grep: Variant; // nullable
  end;

  JMochaOptions = record
    grep: JRegExp; // nullable
    ui: String; // nullable
    reporter: String; // nullable
    timeout: Float; // nullable
    bail: Boolean; // nullable
  end;

  TMochaDone = procedure (error: JError);

  JMochaRunner = class external 'Mocha.IRunner'
  end;

type
  JMocha = class external 'Mocha'
    constructor Create(options: JMochaOptions);
    function setup(options: JMochaSetupOptions): JMocha;
    function bail: JMocha; overload;
    function bail(value: Boolean): JMocha; overload;
    function addFile(file: String): JMocha;
    function reporter(name: String): JMocha; overload;
    function reporter(reporter: function(runner: JMochaRunner; options: Variant): Variant): JMocha; overload;
    function ui(value: String): JMocha;
    function grep(value: String): JMocha; overload;
    function grep(value: JRegExp): JMocha; overload;
    function invert: JMocha;
    function ignoreLeaks(value: Boolean): JMocha;
    function checkLeaks: JMocha;
    procedure throwError(error: JError);
    function growl: JMocha;
    function globals(value: String): JMocha; overload;
    function globals(values: array of String): JMocha; overload;
    function useColors(value: Boolean): JMocha;
    function useInlineDiffs(value: Boolean): JMocha;
    function timeout(value: Float): JMocha;
    function slow(value: Float): JMocha;
    function enableTimeouts(value: Boolean): JMocha;
    function asyncOnly(value: Boolean): JMocha;
    function noHighlighting(value: Boolean): JMocha;
    function run: JMochaRunner; overload;
    function run(onComplete: procedure(failures: Float)): JMochaRunner; overload;
  end;

  JMochaRunnable = class external 'Mocha.IRunnable'
    title: String;
    fn: JFunction;
    async: Boolean;
    sync: Boolean;
    timedOut: Boolean;
  end;

  JMochaSuite = class external 'Mocha.ISuite'
    parent: JMochaSuite;
    title: String;
    function fullTitle: String;
  end;

  JMochaTest = class external 'Mocha.ITest' (JMochaRunnable)
    parent: JMochaSuite;
    pending: Boolean;
    function fullTitle: String;
  end;

  JMochaContextDefinition = class external 'Mocha.IContextDefinition'
//    function (description: String; spec: procedure): JMochaSuite;
    function only(description: String; spec: procedure): JMochaSuite;
    procedure skip(description: String; spec: procedure);
    procedure timeout(ms: Float);
  end;

  JMochaTestDefinition = class external
(*
    function (expectation: String; assertion: procedure): JITest;
    function (expectation: String; assertion: procedure(done: TMochaDone)): JITest;
*)
    function only(expectation: String): JMochaTest; overload;
    function only(expectation: String; assertion: procedure): JMochaTest; overload;
    function only(expectation: String; assertion: procedure(done: TMochaDone)): JMochaTest; overload;
    procedure skip(expectation: String); overload;
    procedure skip(expectation: String; assertion: procedure); overload;
    procedure skip(expectation: String; assertion: procedure(done: TMochaDone)); overload;
    procedure timeout(ms: Float);
  end;

//reporters

type
  JBase = class external 'Base'
    stats: record
      suites: Float;
      tests: Float;
      passes: Float;
      pending: Float;
      failures: Float;
    end;
    constructor Create(runner: JMochaRunner);
  end;

  JDoc = class external 'Doc'(JBase)
  end;

  JDot = class external 'Dot'(JBase)
  end;

  JHTML = class external 'HTML'(JBase)
  end;

  JHTMLCov = class external 'HTMLCov'(JBase)
  end;

  JJSON = class external 'JSON'(JBase)
  end;

  JJSONCov = class external 'JSONCov'(JBase)
  end;

  JJSONStream = class external 'JSONStream'(JBase)
  end;

  JLanding = class external 'Landing'(JBase)
  end;

  JList = class external 'List'(JBase)
  end;

  JMarkdown = class external 'Markdown'(JBase)
  end;

  JMin = class external 'Min'(JBase)
  end;

  JNyan = class external 'Nyan'(JBase)
  end;

  JProgress = class external 'Progress'(JBase)
    constructor Create(runner: JMochaRunner; options: record
      open: String; // nullable
      complete: String; // nullable
      incomplete: String; // nullable
      close: String; // nullable
    end);
  end;

  JSpec = class external 'Spec'(JBase)
  end;

  JTAP = class external 'TAP'(JBase)
  end;

  JXUnit = class external 'XUnit'(JBase)
    constructor Create(runner: JMochaRunner; options: Variant);
  end;

procedure before(action: procedure); overload; external;
procedure before(action: procedure(done: TMochaDone)); overload; external;
procedure before(description: String; action: procedure); overload; external;
procedure before(description: String; action: procedure(done: TMochaDone)); overload; external;
procedure setup(action: procedure); overload; external;
procedure setup(action: procedure(done: TMochaDone)); overload; external;
procedure after(action: procedure); overload; external;
procedure after(action: procedure(done: TMochaDone)); overload; external;
procedure after(description: String; action: procedure); overload; external;
procedure after(description: String; action: procedure(done: TMochaDone)); overload; external;
procedure teardown(action: procedure); overload; external;
procedure teardown(action: procedure(done: TMochaDone)); overload; external;
procedure beforeEach(action: procedure); overload; external;
procedure beforeEach(action: procedure(done: TMochaDone)); overload; external;
procedure beforeEach(description: String; action: procedure); overload; external;
procedure beforeEach(description: String; action: procedure(done: TMochaDone)); overload; external;
procedure suiteSetup(action: procedure); overload; external;
procedure suiteSetup(action: procedure(done: TMochaDone)); overload; external;
procedure afterEach(action: procedure); overload; external;
procedure afterEach(action: procedure(done: TMochaDone)); overload; external;
procedure afterEach(description: String; action: procedure); overload; external;
procedure afterEach(description: String; action: procedure(done: TMochaDone)); overload; external;
procedure suiteTeardown(action: procedure); overload; external;
procedure suiteTeardown(action: procedure(done: TMochaDone)); overload; external;



var Mocha external 'mocha': JMocha;
var Describe external 'describe': JMochaContextDefinition;
var xdescribe external 'xdescribe': JMochaContextDefinition;
var Context external 'context': JMochaContextDefinition;
var Suite external 'suite': JMochaContextDefinition;
var it external 'it': JMochaTestDefinition;
var xit external 'xit': JMochaTestDefinition;
var Test external 'test': JMochaTestDefinition;


