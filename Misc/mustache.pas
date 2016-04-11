unit Mustache;

interface

uses
  ECMA.RegEx;

type
  JMustacheScanner = class external
    &string: String;
    tail: String;
    pos: Float;
    function eos: Boolean;
    function scan(re: JRegExp): String;
    function scanUntil(re: JRegExp): String;
  end;

  JMustacheContext = class external
    view: Variant;
    parentContext: JMustacheContext;
    function push(view: Variant): JMustacheContext;
    function lookup(name: String): Variant;
  end;

  JMustacheWriter = class external
    // function (view: Variant): String;
    procedure clearCache;
    function parse(template: String): Variant; overload;
    function parse(template: String; tags: Variant): Variant; overload;
    function render(template: String; view, partials: Variant): String;
    function renderTokens(tokens: array of String; context: JMustacheContext; partials, originalTemplate: Variant): String;
  end;

  JMustacheStatic = class external
    name: String;
    version: String;
    tags: String;
    Scanner: JMustacheScanner;
    Context: JMustacheContext;
    Writer: JMustacheWriter;
    escape: Variant;
    function clearCache: JMustacheWriter;
    function parse(template: String): Variant; overload;
    function parse(template: String; tags: Variant): Variant; overload;
    function render(template: String; view: Variant): String; overload;
    function render(template: String; view, partials: Variant): String; overload;
    function to_html(template: String; view: Variant): Variant; overload;
    function to_html(template: String; view, partials: Variant): Variant; overload;
    function to_html(template: String; view, partials, send: Variant): Variant; overload;
  end;

var Mustache external 'mustache': JMustacheStatic;
