unit Quill;

interface

type
  JKey = class external
    key: String;
    shortKey: Boolean; // optional
  end;

  JSources = String;
  JSourcesHelper = strict helper for JSources
    const API = 'api';
    const User = 'user';
    const Silent = 'silent';
  end;

  JFormats = class external
  private
    function GetItem(key: String): Variant; external array;
  public
    property Item[key: String]: Variant read GetItem;
  end;

  JRangeStatic = class external
    constructor CreateJRangeStatic;
    index: Integer;
    _length: Integer;
  end;

  JKeyboardStatic = class external
    procedure addBinding(key: JKey; callback: procedure(range: JRangeStatic; context: Variant)); overload;
    procedure addBinding(key: JKey; context: Variant; callback: procedure(range: JRangeStatic; context: Variant)); overload;
  end;

  JDeltaStatic = class external
    ops: array of Variant; // nullable
    constructor Create(ops: Variant); overload;
    constructor Create(ops: array of Variant); overload;
    function retain(_length: Integer; attributes: Variant): JDeltaStatic;
    function delete(_length: Integer): JDeltaStatic;
    function filter(predicate: Variant): JDeltaStatic;
    function forEach(predicate: Variant): JDeltaStatic;
    function insert(text: Variant; attributes: Variant): JDeltaStatic;
    function map(predicate: Variant): JDeltaStatic;
    function partition(predicate: Variant): JDeltaStatic;
    function reduce(predicate: Variant; initial: Integer): JDeltaStatic;
    function chop: JDeltaStatic;
    function _length: Integer;
    function slice(start, &end: Integer): JDeltaStatic;
    function compose(other: Variant): JDeltaStatic;
    function concat(other: JDeltaStatic): JDeltaStatic;
    function diff(other: JDeltaStatic; index: Integer): JDeltaStatic;
    function eachLine(predicate: Variant; newline: Variant): JDeltaStatic;
    function transform(other: Variant; priority: Variant): JDeltaStatic;
    function transformPosition(index: Integer; priority: Variant): JDeltaStatic;
  end;

  JClipboardStatic = class external
    procedure addMatcher(selector: String; callback: function(node: Variant; delta: JDeltaStatic): JDeltaStatic); overload;
    procedure addMatcher(nodeType: Integer; callback: function(node: Variant; delta: JDeltaStatic): JDeltaStatic); overload;
    procedure dangerouslyPasteHTML(html: String); overload;
    procedure dangerouslyPasteHTML(html: String; source: JSources); overload;
    procedure dangerouslyPasteHTML(index: Integer; html: String); overload;
    procedure dangerouslyPasteHTML(index: Integer; html: String; source: JSources); overload;
  end;

  JQuillOptionsStatic = class external
    debug: String; // nullable
    modules: JFormats; // nullable
    placeholder: String; // nullable
    readOnly: Boolean; // nullable
    theme: String; // nullable
    formats: array of String; // nullable
  end;

  JBoundsStatic = class external
    left: Integer;
    top: Integer;
    height: Integer;
    width: Integer;
  end;

  JQuill = class external
    constructor CreateJQuill;
    procedure deleteText(index: Integer; _length: Integer); overload;
    procedure deleteText(index: Integer; _length: Integer; source: JSources); overload;
    procedure disable;
    procedure enable; overload;
    procedure enable(enabled: Boolean); overload;
    function getContents: JDeltaStatic; overload;
    function getContents(index: Integer): JDeltaStatic; overload;
    function getContents(index: Integer; _length: Integer): JDeltaStatic; overload;
    function getLength: Integer;
    function getText: String; overload;
    function getText(index: Integer): String; overload;
    function getText(index: Integer; _length: Integer): String; overload;
    procedure insertEmbed(index: Integer; &type: String; value: Variant); overload;
    procedure insertEmbed(index: Integer; &type: String; value: Variant; source: JSources); overload;
    function insertText(index: Integer; text: String): JDeltaStatic; overload;
    function insertText(index: Integer; text: String; source: JSources): JDeltaStatic; overload;
    function insertText(index: Integer; text, format: String; value: Variant): JDeltaStatic; overload;
    function insertText(index: Integer; text, format: String; value: Variant; source: JSources): JDeltaStatic; overload;
    function insertText(index: Integer; text: String; formats: JFormats): JDeltaStatic; overload;
    function insertText(index: Integer; text: String; formats: JFormats; source: JSources): JDeltaStatic; overload;
    function pasteHTML(index: Integer; html: String): String; overload;
    function pasteHTML(index: Integer; html: String; source: JSources): String; overload;
    function pasteHTML(html: String): String; overload;
    function pasteHTML(html: String; source: JSources): String; overload;
    function setContents(delta: JDeltaStatic): JDeltaStatic; overload;
    function setContents(delta: JDeltaStatic; source: JSources): JDeltaStatic; overload;
    function setText(text: String): JDeltaStatic; overload;
    function setText(text: String; source: JSources): JDeltaStatic; overload;
    procedure update; overload;
    procedure update(source: String); overload;
    function updateContents(delta: JDeltaStatic): JDeltaStatic; overload;
    function updateContents(delta: JDeltaStatic; source: JSources): JDeltaStatic; overload;

    function format(name: String; value: Variant): JDeltaStatic; overload;
    function format(name: String; value: Variant; source: JSources): JDeltaStatic; overload;
    function formatLine(index, _length: Integer): JDeltaStatic; overload;
    function formatLine(index, _length: Integer; source: JSources): JDeltaStatic; overload;
    function formatLine(index, _length: Integer; format: String; value: Variant): JDeltaStatic; overload;
    function formatLine(index, _length: Integer; format: String; value: Variant; source: JSources): JDeltaStatic; overload;
    function formatLine(index, _length: Integer; formats: JFormats): JDeltaStatic; overload;
    function formatLine(index, _length: Integer; formats: JFormats; source: JSources): JDeltaStatic; overload;
    function formatText(index, _length: Integer): JDeltaStatic; overload;
    function formatText(index, _length: Integer; source: JSources): JDeltaStatic; overload;
    function formatText(index, _length: Integer; format: String; value: Variant): JDeltaStatic; overload;
    function formatText(index, _length: Integer; format: String; value: Variant; source: JSources): JDeltaStatic; overload;
    function formatText(index, _length: Integer; formats: JFormats): JDeltaStatic; overload;
    function formatText(index, _length: Integer; formats: JFormats; source: JSources): JDeltaStatic; overload;
    function getFormat: JFormats; overload;
    function getFormat(range: JRangeStatic): JFormats; overload;
    function getFormat(index: Integer): JFormats; overload;
    function getFormat(index, _length: Integer): JFormats; overload;
    procedure removeFormat(index, _length: Integer); overload;
    procedure removeFormat(index, _length: Integer; source: JSources); overload;

    procedure blur;
    procedure focus;
    function getBounds(index: Integer): JBoundsStatic; overload;
    function getBounds(index, _length: Integer): JBoundsStatic; overload;
    function getSelection: JRangeStatic; overload;
    function getSelection(focus: Boolean): JRangeStatic; overload;
    function hasFocus: Boolean;
    procedure setSelection(index, _length: Integer); overload;
    procedure setSelection(index, _length: Integer; source: JSources); overload;
    procedure setSelection(range: JRangeStatic); overload;
    procedure setSelection(range: JRangeStatic; source: JSources); overload;

    function on(eventName: String; callback: procedure(delta: Variant; oldContents: Variant; source: String)): JQuill; overload;
    function on(eventName: String; callback: procedure(name: String; args: array of Variant)): JQuill; overload;
    function once(eventName: String; callback: procedure(delta: JDeltaStatic; source: String)): JQuill;
    function off(eventName: String; callback: procedure(delta: JDeltaStatic; source: String)): JQuill;

    procedure debug(level: String);
    function import(path: String): Variant;
    procedure register(path: String; def: Variant); overload;
    procedure register(path: String; def: Variant; suppressWarning: Boolean); overload;
    procedure register(defs: JFormats); overload;
    procedure register(defs: JFormats; suppressWarning: Boolean); overload;
    function addContainer(className: String): Variant; overload;
    function addContainer(className: String; refNode: Variant): Variant; overload;
    function addContainer(domNode: Variant): Variant; overload;
    function addContainer(domNode: Variant; refNode: Variant): Variant; overload;
    function getModule(name: String): Variant;

    clipboard: JClipboardStatic;
  end;

var
  Quill external 'quill': JQuill;
//  Delta: JDeltaStatic;


