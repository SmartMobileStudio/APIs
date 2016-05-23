unit CodeMirror;

interface

uses
  ECMA.RegEx, W3C.DOM, W3C.HTML5;

type
  JEditor = class;

  JPosition = class external
    ch, line: Integer;
  end;

  JRange = class external
    from, to: JPosition;
  end;

  JPositionConstructor = class external
    constructor CreateJPosition;
//    function (line, ch: Integer): JPosition;
  end;

  JLineHandle = class external
    text: String;
  end;

  JTextMarkerOptions = class external
    className: String; // nullable
    inclusiveLeft: Boolean; // nullable
    inclusiveRight: Boolean; // nullable
    atomic: Boolean; // nullable
    collapsed: Boolean; // nullable
    clearOnEnter: Boolean; // nullable
    clearWhenEmpty: Boolean; // nullable
    replacedWith: JHTMLElement; // nullable
    handleMouseEvents: Boolean; // nullable
    readOnly: Boolean; // nullable
    addToHistory: Boolean; // nullable
    startStyle: String; // nullable
    endStyle: String; // nullable
    css: String; // nullable
    title: String; // nullable
    shared: Boolean; // nullable
  end;

  JLineWidget = class external
    procedure clear;
    procedure changed;
  end;

  JTextMarker = class external
    procedure clear;
    function find: JRange;
    function getOptions(copyWidget: Boolean): JTextMarkerOptions;
  end;

  JDoc = class external
    function getValue: String; overload;
    function getValue(seperator: String): String; overload;
    procedure setValue(content: String);
    function getRange(from, to: JPosition): String; overload;
    function getRange(from, to: JPosition; seperator: String): String; overload;
    procedure replaceRange(replacement: String; from, to: JPosition);
    function getLine(n: Integer): String;
    procedure setLine(n: Integer; text: String);
    procedure removeLine(n: Integer);
    function lineCount: Integer;
    function firstLine: Integer;
    function lastLine: Integer;
    function getLineHandle(num: Integer): JLineHandle;
    function getLineNumber(handle: JLineHandle): Integer;
    procedure eachLine(f: procedure(line: JLineHandle)); overload;
    procedure eachLine(start, &end: Integer; f: procedure(line: JLineHandle)); overload;
    procedure markClean;
    function isClean: Boolean;
    function getSelection: String;
    procedure replaceSelection(replacement: String); overload;
    procedure replaceSelection(replacement: String; collapse: String); overload;
    function getCursor: JPosition; overload;
    function getCursor(start: String): JPosition; overload;
    function listSelections: array of record anchor, head: JPosition; end;
    function somethingSelected: Boolean;
    procedure setCursor(pos: JPosition);
    procedure setSelection(anchor: JPosition; head: JPosition);
    procedure extendSelection(from: JPosition); overload;
    procedure extendSelection(from: JPosition; to: JPosition); overload;
    procedure setExtending(value: Boolean);
    function getEditor: JEditor;
    function copy(copyHistory: Boolean): JDoc;
    function linkedDoc(options: record
      sharedHist: Boolean; // nullable
      from, to: Integer; // nullable
      mode: Variant;
    end): JDoc;
    procedure unlinkDoc(doc: JDoc);
    procedure iterLinkedDocs(fn: procedure(doc: JDoc; sharedHist: Boolean));
    procedure undo;
    procedure redo;
    function historySize: record undo, redo: Integer; end;
    procedure clearHistory;
    function getHistory: Variant;
    procedure setHistory(history: Variant);
    function markText(from: JPosition; to: JPosition): JTextMarker; overload;
    function markText(from: JPosition; to: JPosition; options: JTextMarkerOptions): JTextMarker; overload;
    function setBookmark(pos: JPosition): JTextMarker; overload;
    function setBookmark(pos: JPosition; options: record
      widget: JHTMLElement; // nullable
      insertLeft: Boolean; // nullable
    end): JTextMarker; overload;
    function findMarks(from: JPosition; to: JPosition): array of JTextMarker;
    function findMarksAt(pos: JPosition): array of JTextMarker;
    function getAllMarks: array of JTextMarker;
    function getMode: Variant;
    function posFromIndex(index: Integer): JPosition;
    function indexFromPos(&object: JPosition): Integer;
    state: Variant;
  end;

  JEditorChange = class external
    from, to: JPosition;
    text: array of String;
    removed: array of String;
    origin: String;
  end;

  JEditor = class external
    function hasFocus: Boolean;
    function findPosH(start: JPosition; amount: Integer; &unit: String; visually: Boolean): record
      line, ch: Integer;
      hitSide: Boolean; // nullable
    end;
    function findPosV(start: JPosition; amount: Integer; &unit: String): record
      line, ch: Integer;
      hitSide: Boolean; // nullable
    end;
    procedure setOption(option: String; value: Variant);
    function getOption(option: String): Variant;
    procedure addKeyMap(map: Variant); overload;
    procedure addKeyMap(map: Variant; bottom: Boolean); overload;
    procedure removeKeyMap(map: Variant);
    procedure addOverlay(mode: Variant); overload;
    procedure addOverlay(mode: Variant; options: Variant); overload;
    procedure removeOverlay(mode: Variant);
    function getDoc: JDoc;
    function swapDoc(doc: JDoc): JDoc;
    function getValue: String; overload;
    function getValue(seperator: String): String; overload;
    procedure setValue(content: String);
    function setGutterMarker(line: Variant; gutterID: String; value: JHTMLElement): JLineHandle;
    procedure clearGutter(gutterID: String);
    function addLineClass(line: Variant; where, _class_: String): JLineHandle;
    function removeLineClass(line: Variant; where, class_: String): JLineHandle;
    function lineInfo(line: Variant): record
      line: Variant;
      handle: Variant;
      text: String;
      gutterMarks: Variant;
      textClass: String;
      bgClass: String;
      wrapClass: String;
      widgets: Variant;
    end;
    procedure addWidget(pos: JPosition; node: JHTMLElement; scrollIntoView: Boolean);
    function addLineWidget(line: Variant; node: JHTMLElement): JLineWidget; overload;
    function addLineWidget(line: Variant; node: JHTMLElement; options: record
      coverGutter: Boolean;
      noHScroll: Boolean;
      above: Boolean;
      showIfHidden: Boolean;
    end): JLineWidget; overload;
    procedure setSize(width: Variant; height: Variant);
    procedure scrollTo(x, y: Integer);
    function getScrollInfo: record
      left: Variant;
      top: Variant;
      width: Variant;
      height: Variant;
      clientWidth: Variant;
      clientHeight: Variant;
    end;
    procedure scrollIntoView(pos: JPosition); overload;
    procedure scrollIntoView(pos: JPosition; margin: Integer); overload;
    procedure scrollIntoView(pos: record
      left: Integer;
      top: Integer;
      right: Integer;
      bottom: Integer;
    end; margin: Integer); overload;
    procedure scrollIntoView(pos: record ch, line: Integer; end); overload;
    procedure scrollIntoView(pos: record ch, line: Integer; end; margin: Integer); overload;
    procedure scrollIntoView(pos: record from, to: JPosition; end; margin: Integer); overload;
    function cursorCoords(where: Boolean; mode: String): record
      left: Integer;
      top: Integer;
      bottom: Integer;
    end; overload;
    function cursorCoords(where: JPosition; mode: String): record
      left: Integer;
      top: Integer;
      bottom: Integer;
    end; overload;
    function charCoords(pos: JPosition; mode: String): record
      left: Integer;
      right: Integer;
      top: Integer;
      bottom: Integer;
    end;
    function coordsChar(&object: record left, top: Integer; end): JPosition; overload;
    function coordsChar(&object: record left, top: Integer; end; mode: String): JPosition; overload;
    function defaultTextHeight: Integer;
    function defaultCharWidth: Integer;
    function getViewport: record from, to: Integer; end;
    procedure refresh;
    function getTokenAt(pos: JPosition): record
      start: Integer;
      &end: Integer;
      &string: String;
      &type: String;
      state: Variant;
    end;
    function getStateAfter: Variant; overload;
    function getStateAfter(line: Integer): Variant; overload;
//    function operation(fn: function: JT): JT;
    procedure indentLine(line: Integer); overload;
    procedure indentLine(line: Integer; dir: String); overload;
    procedure focus;
    function getInputField: JHTMLTextAreaElement;
    function getWrapperElement: JHTMLElement;
    function getScrollerElement: JHTMLElement;
    function getGutterElement: JHTMLElement;
    procedure on(eventName: String; handler: procedure(instance: JEditor));
    procedure off(eventName: String; handler: procedure(instance: JEditor));
    state: Variant;
  end;

  JEditorFromTextArea = class external(JEditor)
    procedure save;
    procedure toTextArea;
    function getTextArea: JHTMLTextAreaElement;
  end;

  JDocConstructor = class external
    constructor CreateJDoc;
//    function(text: String; mode: Variant; firstLineNumber: Integer; lineSep: String): JDoc;;
  end;

  JEditorChangeLinkedList = class external(JEditorChange)
    next: JEditorChangeLinkedList; // nullable
  end;

  JEditorChangeCancellable = class external(JEditorChange)
    procedure update; overload;
    procedure update(from: JPosition); overload;
    procedure update(from: JPosition; to: JPosition); overload;
    procedure update(from: JPosition; to: JPosition; text: String); overload;
    procedure cancel;
  end;

  JEditorConfiguration = class external
    value: Variant; // nullable
    mode: Variant; // nullable
    theme: String; // nullable
    indentUnit: Float; // nullable
    smartIndent: Boolean; // nullable
    tabSize: Float; // nullable
    indentWithTabs: Boolean; // nullable
    electricChars: Boolean; // nullable
    rtlMoveVisually: Boolean; // nullable
    keyMap: String; // nullable
    extraKeys: Variant; // nullable
    lineWrapping: Boolean; // nullable
    lineNumbers: Boolean; // nullable
    firstLineNumber: Integer; // nullable
    lineNumberFormatter: function(line: Integer): String; // nullable
    gutters: array of String; // nullable
    fixedGutter: Boolean; // nullable
    readOnly: Variant; // nullable
    showCursorWhenSelecting: Boolean; // nullable
    undoDepth: Float; // nullable
    historyEventDelay: Float; // nullable
    tabindex: Integer; // nullable
    autofocus: Boolean; // nullable
    dragDrop: Boolean; // nullable
    onDragEvent: function(instance: JEditor; event: JEvent): Boolean; // nullable
    onKeyEvent: function(instance: JEditor; event: JEvent): Boolean; // nullable
    cursorBlinkRate: Float; // nullable
    cursorHeight: Float; // nullable
    workTime: Float; // nullable
    workDelay: Float; // nullable
    pollInterval: Float; // nullable
    flattenSpans: Boolean; // nullable
    maxHighlightLength: Integer; // nullable
    viewportMargin: Float; // nullable
    lint: Variant {Boolean or JLintOptions}; // nullable
    placeholder: String; // nullable
  end;

  JStringStream = class external
    lastColumnPos: Integer;
    lastColumnValue: Integer;
    lineStart: Integer;
    pos: Integer;
    start: Integer;
    &string: String;
    tabSize: Integer;
    function eol: Boolean;
    function sol: Boolean;
    function peek: String;
    function next: String;
    function eat(match: String): String; overload;
    function eat(match: JRegExp): String; overload;
    function eat(match: function(char: String): Boolean): String; overload;
    function eatWhile(match: String): Boolean; overload;
    function eatWhile(match: JRegExp): Boolean; overload;
    function eatWhile(match: function(char: String): Boolean): Boolean; overload;
    function eatSpace: Boolean;
    procedure skipToEnd;
    function skipTo(ch: String): Boolean;
    function match(pattern: String): Boolean; overload;
    function match(pattern: String; consume: Boolean): Boolean; overload;
    function match(pattern: String; consume: Boolean; caseFold: Boolean): Boolean; overload;
    function match(pattern: JRegExp): array of String; overload;
    function match(pattern: JRegExp; consume: Boolean): array of String; overload;
    procedure backUp(n: Integer);
    function column: Integer;
    function indentation: Integer;
    function current: String;
  end;

(*
  JMode{<T>} = class external
    function token(stream: JStringStream; state: JT): String;
    startState: : JT; // nullable
    blankLine: (state: JT); // nullable
    copyState: (state: JT): JT; // nullable
    indent: (state: JT; textAfter: String): Integer; // nullable
    lineComment: String; // nullable
    blockCommentStart: String; // nullable
    blockCommentEnd: String; // nullable
    blockCommentLead: String; // nullable
    electricChars: String; // nullable
    electricinput: JRegExp; // nullable
  end;

  JModeFactory{<T>} = class external
    function(config: JCodeMirror.EditorConfiguration; modeOptions: Variant): JMode{<JT>};;
  end;
*)

  JLintStateOptions = class external
    async: Boolean;
    hasGutters: Boolean;
  end;

  JAnnotation = class external
    from: JPosition;
    message: String; // nullable
    severity: String; // nullable
    to: JPosition; // nullable
  end;

  TUpdateLintingCallback = procedure(codeMirror: JEditor; annotations: array of JAnnotation);

  TAnnotationsCallback = procedure(content: String;
    updateLintingCallback: TUpdateLintingCallback; options: JLintStateOptions;
    codeMirror: JEditor);

  JLintOptions = class external(JLintStateOptions)
    getAnnotations: TAnnotationsCallback;
  end;

  JDiffView = class external
    function forceUpdate: procedure(mode: String);
    procedure setShowDifferences(showDifferences: Boolean);
  end;

  JMergeViewDiffChunk = class external
    editFrom: Integer;
    editTo: Integer;
    origFrom: Integer;
    origTo: Integer;
  end;

  JMergeViewEditor = class external(JEditor)
    function editor: JEditor;
    left: JDiffView;
    function leftChunks: JMergeViewDiffChunk;
    function leftOriginal: JEditor;
    right: JDiffView;
    function rightChunks: JMergeViewDiffChunk;
    function rightOriginal: JEditor;
    procedure setShowDifferences(showDifferences: Boolean);
  end;

  JMergeViewEditorConfiguration = class external(JEditorConfiguration)
    allowEditingOriginals: Boolean; // nullable
    collapseIdentical: Variant {Boolean or Float}; // nullable
    connect: String; // nullable
    procedure onCollapse(mergeView: JMergeViewEditor; line: Integer; size: Integer; mark: JTextMarker);
    orig: Variant;
    origLeft: Variant; // nullable
    origRight: Variant; // nullable
    revertButtons: Boolean; // nullable
    showDifferences: Boolean; // nullable
  end;

function fromTextArea(host: JHTMLTextAreaElement): JEditorFromTextArea; overload; external 'CodeMirror.fromTextArea';
function fromTextArea(host: JHTMLTextAreaElement; options: JEditorConfiguration): JEditorFromTextArea; overload; external 'CodeMirror.fromTextArea';
procedure defineExtension(name: String; value: Variant); external 'CodeMirror.defineExtension';
procedure defineDocExtension(name: String; value: Variant); external 'CodeMirror.defineDocExtension';
procedure defineOption(name: String; default_: Variant; updateFunc: procedure); external 'CodeMirror.defineOption';
procedure defineInitHook(func: procedure); external 'CodeMirror.defineInitHook';
procedure registerHelper(namespace: String; name: String; helper: Variant); external 'CodeMirror.registerHelper';
procedure on(element: Variant; eventName: String; handler: procedure); overload; external 'CodeMirror.on';
procedure off(element: Variant; eventName: String; handler: procedure); overload; external 'CodeMirror.off';
procedure signal(target: Variant; name: String; args: array of Variant); external 'CodeMirror.signal';
(*
procedure defineMode(id: String; modefactory: JModeFactory{<Variant>}); external 'CodeMirror.defineMode';
procedure defineMode(id: String; modefactory: JModeFactory{<JT>}); external 'CodeMirror.defineMode';
function getMode(config: JCodeMirror.EditorConfiguration; mode: Variant): JMode{<JT>}; external 'CodeMirror.getMode';
function overlayMode(base: JMode{<JT>}; overlay: JMode{<JS>}): JMode{<Variant>}; overload; external 'CodeMirror.overlayMode';
function overlayMode(base: JMode{<JT>}; overlay: JMode{<JS>}; combine: Boolean): JMode{<Variant>}; overload; external 'CodeMirror.overlayMode';
*)
function MergeView(element: JHTMLElement): JMergeViewEditor; overload; external 'CodeMirror.MergeView';
function MergeView(element: JHTMLElement; options: JMergeViewEditorConfiguration): JMergeViewEditor; overload; external 'CodeMirror.MergeView';

var
  Doc external 'Doc': JDocConstructor;
  Pos external 'Pos': JPositionConstructor;
  Pass external 'Pass': Variant;
  version external 'version': String;

function CodeMirror(host: JHTMLElement): JEditor; overload; external 'CodeMirror';
function CodeMirror(host: JHTMLElement; options: JEditorConfiguration): JEditor; overload; external 'CodeMirror';
function CodeMirror(callback: procedure(host: JHTMLElement)): JEditor; overload; external 'CodeMirror';
function CodeMirror(callback: procedure(host: JHTMLElement); options: JEditorConfiguration): JEditor; overload; external 'CodeMirror';
