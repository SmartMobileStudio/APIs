unit Mocha;

interface

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

  JMochaDone = class external
    procedure(error: JError);;
  end;

mocha: JMocha;
describe: JMocha.IContextDefinition;
xdescribe: JMocha.IContextDefinition;
context: JMocha.IContextDefinition;
suite: JMocha.IContextDefinition;
it: JMocha.ITestDefinition;
xit: JMocha.ITestDefinition;
test: JMocha.ITestDefinition;
procedure before(action: procedure);
procedure before(action: procedure(done: JMochaDone));
procedure before(description: String; action: procedure);
procedure before(description: String; action: procedure(done: JMochaDone));
procedure setup(action: procedure);
procedure setup(action: procedure(done: JMochaDone));
procedure after(action: procedure);
procedure after(action: procedure(done: JMochaDone));
procedure after(description: String; action: procedure);
procedure after(description: String; action: procedure(done: JMochaDone));
procedure teardown(action: procedure);
procedure teardown(action: procedure(done: JMochaDone));
procedure beforeEach(action: procedure);
procedure beforeEach(action: procedure(done: JMochaDone));
procedure beforeEach(description: String; action: procedure);
procedure beforeEach(description: String; action: procedure(done: JMochaDone));
procedure suiteSetup(action: procedure);
procedure suiteSetup(action: procedure(done: JMochaDone));
procedure afterEach(action: procedure);
procedure afterEach(action: procedure(done: JMochaDone));
procedure afterEach(description: String; action: procedure);
procedure afterEach(description: String; action: procedure(done: JMochaDone));
procedure suiteTeardown(action: procedure);
procedure suiteTeardown(action: procedure(done: JMochaDone));
type
  JMocha = class external 'Mocha'
    constructor Create(options: record
      grep: JRegExp; // nullable
      ui: String; // nullable
      reporter: String; // nullable
      timeout: Float; // nullable
      bail: Boolean; // nullable
    end));
    function setup(options: JMochaSetupOptions): JMocha;
    function bail: JMocha overload;;
    function bail(value: Boolean): JMocha overload;;
    function addFile(file: String): JMocha;
    function reporter(name: String): JMocha;
    function reporter(reporter: function(runner: JMocha.IRunner; options: Variant): Variant): JMocha;
    function ui(value: String): JMocha;
    function grep(value: String): JMocha;
    function grep(value: JRegExp): JMocha;
    function invert: JMocha;
    function ignoreLeaks(value: Boolean): JMocha;
    function checkLeaks: JMocha;
    procedure throwError(error: JError);
    function growl: JMocha;
    function globals(value: String): JMocha;
    function globals(values: array of String): JMocha;
    function useColors(value: Boolean): JMocha;
    function useInlineDiffs(value: Boolean): JMocha;
    function timeout(value: Float): JMocha;
    function slow(value: Float): JMocha;
    function enableTimeouts(value: Boolean): JMocha;
    function asyncOnly(value: Boolean): JMocha;
    function noHighlighting(value: Boolean): JMocha;
    function run: JMocha.IRunner overload;;
    function run(onComplete: procedure(failures: Float)): JMocha.IRunner overload;;
  end;

//Mocha

type
  JIRunnable = class external
    title: String;
    fn: JFunction;
    async: Boolean;
    sync: Boolean;
    timedOut: Boolean;
  end;

  JISuite = class external
    parent: JISuite;
    title: String;
    function fullTitle: String;
  end;

  JITest = class external(JIRunnable)
    parent: JISuite;
    pending: Boolean;
    function fullTitle: String;
  end;

  JIRunner = class external
  end;

  JIContextDefinition = class external
    function(description: String; spec: procedure): JISuite;;
    function only(description: String; spec: procedure): JISuite;
    procedure skip(description: String; spec: procedure);
    procedure timeout(ms: Float);
  end;

  JITestDefinition = class external
    function(expectation: String; assertion: procedure): JITest;;
    function(expectation: String; assertion: procedure(done: JMochaDone)): JITest;;
    function only(expectation: String): JITest; overload;
    function only(expectation: String; assertion: procedure): JITest; overload;
    function only(expectation: String): JITest; overload;
    function only(expectation: String; assertion: procedure(done: JMochaDone)): JITest; overload;
    procedure skip(expectation: String); overload;
    procedure skip(expectation: String; assertion: procedure); overload;
    procedure skip(expectation: String); overload;
    procedure skip(expectation: String; assertion: procedure(done: JMochaDone)); overload;
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
    constructor Create(runner: JIRunner);
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
    constructor Create(runner: JIRunner; options: record
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
    constructor Create(runner: JIRunner; options: Variant);
  end;



//"mocha"


