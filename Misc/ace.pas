unit Ace;

// Project: http://ace.ajax.org/
// Original TypeScript Definitions by:
//   Diullei Gomes <https://github.com/Diullei>

interface

uses
  W3C.HTML5;

type
  JPosition = class external
    row: Integer;
    column: Integer;
  end;

  JIEditSession = class;
  JEditor = class;
  JTokenizer = class;
  JSelection = class;
  JVirtualRenderer = class;

  JRange = class external
    startRow: Integer;
    startColumn: Integer;
    endRow: Integer;
    endColumn: Integer;
    start: JPosition;
    &end: JPosition;
    function isEmpty: Boolean;
    procedure isEqual(range: JRange);
    procedure toString;
    function contains(row: Integer; column: Integer): Boolean;
    function compareRange(range: JRange): Integer;
    function comparePoint(p: JRange): Integer;
    function containsRange(range: JRange): Boolean;
    function intersects(range: JRange): Boolean;
    function isEnd(row: Integer; column: Integer): Boolean;
    function isStart(row: Integer; column: Integer): Boolean;
    procedure setStart(row: Integer; column: Integer);
    procedure setEnd(row: Integer; column: Integer);
    function inside(row: Integer; column: Integer): Boolean;
    function insideStart(row: Integer; column: Integer): Boolean;
    function insideEnd(row: Integer; column: Integer): Boolean;
    function compare(row: Integer; column: Integer): Integer;
    function compareStart(row: Integer; column: Integer): Integer;
    function compareEnd(row: Integer; column: Integer): Integer;
    function compareInside(row: Integer; column: Integer): Integer;
    function clipRows(firstRow: Integer; lastRow: Integer): JRange;
    function extend(row: Integer; column: Integer): JRange;
    function isMultiLine: Boolean;
    function clone: JRange;
    function collapseRows: JRange;
    function toScreenRange(session: JIEditSession): JRange;
    function fromPoints(start: JRange; &end: JRange): JRange;
  end;

  JDelta = class external
    action: String;
    range: JRange;
    text: String;
    lines: array of String;
  end;

  JEditorCommand = class external
    name: String;
    bindKey: Variant;
    exec: procedure;
    readOnly: Boolean; // nullable
  end;

  JCommandManager = class external
    byName: Variant;
    commands: Variant;
    platform: String;
    procedure addCommands(commands: array of JEditorCommand);
    procedure addCommand(command: JEditorCommand);
    procedure exec(name: String; editor: JEditor; args: Variant);
  end;

  JAnnotation = class external
    row: Integer;
    column: Integer;
    text: String;
    &type: String;
  end;

  JTokenInfo = class external
    value: String;
  end;

  JKeyBinding = class external
    procedure setDefaultHandler(kb: Variant);
    procedure setKeyboardHandler(kb: Variant);
    procedure addKeyboardHandler(kb: Variant; pos: Variant);
    function removeKeyboardHandler(kb: Variant): Boolean;
    function getKeyboardHandler: Variant;
    procedure onCommandKey(e: Variant; hashId: Variant; keyCode: Variant);
    procedure onTextInput(text: Variant);
  end;

  JTextMode = class external
    function getTokenizer: Variant;
    procedure toggleCommentLines(state, doc, startRow, endRow: Variant);
    function getNextLineIndent(state, line, tab: Variant): String;
    function checkOutdent(state, line, input: Variant): Boolean;
    procedure autoOutdent(state, doc, row: Variant);
    function createWorker(session: Variant): Variant;
    procedure createModeDelegates(mapping: Variant);
    function transformAction(state, action, editor, session, param: Variant): Variant;
  end;

  JAce = class external
    function require(moduleName: String): Variant;
    function edit(el: String): JEditor; overload;
    function edit(el: JHTMLElement): JEditor; overload;
    function createEditSession(text: JDocument; mode: JTextMode): JIEditSession; overload;
    function createEditSession(text: String; mode: JTextMode): JIEditSession; overload;
  end;

  JAnchor = class external
    procedure on(event: String; fn: function(e: Variant): Variant);
    function getPosition: JPosition;
    function getDocument: JDocument;
    procedure onChange(e: Variant);
    procedure setPosition(row: Integer; column: Integer; noClip: Boolean);
    procedure detach;
  end;

  JBackgroundTokenizer = class external
    states: array of Variant;
    procedure setTokenizer(tokenizer: JTokenizer);
    procedure setDocument(doc: JDocument);
    procedure fireUpdateEvent(firstRow, lastRow: Integer);
    procedure start(startRow: Integer);
    procedure stop;
    function getTokens(row: Integer): array of JTokenInfo;
    function getState(row: Integer): String;
  end;

  JDocument = class external
    procedure on(event: String; fn: function(e: Variant): Variant);
    procedure setValue(text: String);
    function getValue: String;
    procedure createAnchor(row: Integer; column: Integer);
    function getNewLineCharacter: String;
    procedure setNewLineMode(newLineMode: String);
    function getNewLineMode: String;
    function isNewLine(text: String): Boolean;
    function getLine(row: Integer): String;
    function getLines(firstRow: Integer; lastRow: Integer): array of String;
    function getAllLines: array of String;
    function getLength: Integer;
    function getTextRange(range: JRange): String;
    function insert(position: JPosition; text: String): Variant;
    function insertLines(row: Integer; lines: array of String): Variant;
    function insertNewLine(position: JPosition): Variant;
    function insertInLine(position: Variant; text: String): Variant;
    function remove(range: JRange): Variant;
    function removeInLine(row: Integer; startColumn: Integer; endColumn: Integer): Variant;
    function removeLines(firstRow: Integer; lastRow: Integer): array of String;
    procedure removeNewLine(row: Integer);
    function replace(range: JRange; text: String): Variant;
    procedure applyDeltas(deltas: array of JDelta);
    procedure revertDeltas(deltas: array of JDelta);
    function indexToPosition(index: Integer; startRow: Integer): JPosition;
    function positionToIndex(pos: JPosition; startRow: Integer): Integer;
  end;

  JUndoManager = class external
    procedure execute(options: Variant);
    function undo: JRange; overload;
    function undo(dontSelect: Boolean): JRange; overload;
    procedure redo(dontSelect: Boolean);
    procedure reset;
    function hasUndo: Boolean;
    function hasRedo: Boolean;
    function isClean: Boolean;
    procedure markClean;
  end;

  JIEditSession = class external
    selection: JSelection;
    bgTokenizer: JBackgroundTokenizer;
    doc: JDocument;
    procedure on(event: String; fn: function(e: Variant): Variant);
    procedure findMatchingBracket(position: JPosition);
    procedure addFold(text: String; range: JRange);
    function getFoldAt(row: Integer; column: Integer): Variant;
    procedure removeFold(arg: Variant);
    procedure expandFold(arg: Variant);
    procedure unfold(arg1, arg2: Boolean);
    procedure screenToDocumentColumn(row, column: Integer);
    function getFoldDisplayLine(foldLine: Variant; docRow: Integer; docColumn: Integer): Variant;
    function getFoldsInRange(range: JRange): Variant;
    procedure highlight(text: String);
    procedure setDocument(doc: JDocument);
    function getDocument: JDocument;
    procedure resetRowCache(row: Integer); external '$resetRowCache';
    procedure setValue(text: String);
    procedure setMode(mode: String);
    function getValue: String;
    function getSelection: JSelection;
    function getState(row: Integer): String;
    function getTokens(row: Integer): array of JTokenInfo;
    function getTokenAt(row: Integer; column: Integer): JTokenInfo;
    procedure setUndoManager(undoManager: JUndoManager);
    function getUndoManager: JUndoManager;
    function getTabString: String;
    procedure setUseSoftTabs(useSoftTabs: Boolean);
    function getUseSoftTabs: Boolean;
    procedure setTabSize(tabSize: Integer);
    function getTabSize: Integer;
    function isTabStop(position: Variant): Boolean;
    procedure setOverwrite(overwrite: Boolean);
    function getOverwrite: Boolean;
    procedure toggleOverwrite;
    procedure addGutterDecoration(row: Integer; className: String);
    procedure removeGutterDecoration(row: Integer; className: String);
    function getBreakpoints: array of Integer;
    procedure setBreakpoints(rows: array of Variant);
    procedure clearBreakpoints;
    procedure setBreakpoint(row: Integer; className: String);
    procedure clearBreakpoint(row: Integer);
    procedure addMarker(range: JRange; clazz: String; &type: procedure; inFront: Boolean); overload;
    procedure addMarker(range: JRange; clazz: String; &type: String; inFront: Boolean); overload;
    procedure addDynamicMarker(marker: Variant; inFront: Boolean);
    procedure removeMarker(markerId: Integer);
    function getMarkers(inFront: Boolean): array of Variant;
    procedure setAnnotations(annotations: array of JAnnotation);
    function getAnnotations: Variant;
    procedure clearAnnotations;
    procedure detectNewLine(text: String); external '$detectNewLine';
    function getWordRange(row: Integer; column: Integer): JRange;
    function getAWordRange(row: Integer; column: Integer): Variant;
    procedure setNewLineMode(newLineMode: String);
    function getNewLineMode: String;
    procedure setUseWorker(useWorker: Boolean);
    function getUseWorker: Boolean;
    procedure onReloadTokenizer;
    procedure mode(mode: JTextMode); external '$mode';
    function getMode: JTextMode;
    procedure setScrollTop(scrollTop: Integer);
    function getScrollTop: Integer;
    procedure setScrollLeft;
    function getScrollLeft: Integer;
    function getScreenWidth: Integer;
    function getLine(row: Integer): String;
    function getLines(firstRow: Integer; lastRow: Integer): array of String;
    function getLength: Integer;
    function getTextRange(range: JRange): String;
    function insert(position: JPosition; text: String): Variant;
    function remove(range: JRange): Variant;
    function undoChanges(deltas: array of Variant; dontSelect: Boolean): JRange;
    function redoChanges(deltas: array of Variant; dontSelect: Boolean): JRange;
    procedure setUndoSelect(enable: Boolean);
    function replace(range: JRange; text: String): Variant;
    function moveText(fromRange: JRange; toPosition: Variant): JRange;
    procedure indentRows(startRow: Integer; endRow: Integer; indentString: String);
    procedure outdentRows(range: JRange);
    function moveLinesUp(firstRow: Integer; lastRow: Integer): Integer;
    function moveLinesDown(firstRow: Integer; lastRow: Integer): Integer;
    function duplicateLines(firstRow: Integer; lastRow: Integer): Integer;
    procedure setUseWrapMode(useWrapMode: Boolean);
    function getUseWrapMode: Boolean;
    procedure setWrapLimitRange(min: Integer; max: Integer);
    function adjustWrapLimit(desiredLimit: Integer): Boolean;
    function getWrapLimit: Integer;
    function getWrapLimitRange: Variant;
    procedure getDisplayTokens(str: String; offset: Integer); external '$getDisplayTokens';
    function getStringScreenWidth(str: String; maxScreenColumn: Integer; screenColumn: Integer): array of Integer; external '$getStringScreenWidth';
    function getRowLength(row: Integer): Integer;
    function getScreenLastRowColumn(screenRow: Integer): Integer;
    function getDocumentLastRowColumn(docRow: Integer; docColumn: Integer): Integer;
    function getDocumentLastRowColumnPosition(docRow: Integer; docColumn: Integer): Integer;
    function getRowSplitData: String;
    function getScreenTabSize(screenColumn: Integer): Integer;
    function screenToDocumentPosition(screenRow: Integer; screenColumn: Integer): Variant;
    function documentToScreenPosition(docRow: Integer; docColumn: Integer): Variant;
    function documentToScreenColumn(row: Integer; docColumn: Integer): Integer;
    procedure documentToScreenRow(docRow: Integer; docColumn: Integer);
    function getScreenLength: Integer;
  end;

  JEditor = class external
//    procedure addEventListener(ev: JChange; callback: function(ev: JEditorChangeEvent): Variant)
    procedure addEventListener(ev: String; callback: procedure);
    inMultiSelectMode: Boolean;
    procedure selectMoreLines(n: Integer);
    procedure onTextInput(text: String);
    procedure onCommandKey(e: Variant; hashId: Variant; keyCode: Variant);
    commands: JCommandManager;
    session: JIEditSession;
    selection: JSelection;
    renderer: JVirtualRenderer;
    keyBinding: JKeyBinding;
    container: JHTMLElement;
    procedure onSelectionChange(e: Variant);
    procedure onChangeMode; overload;
    procedure onChangeMode(e: Variant); overload;
    procedure execCommand(command: String); overload;
    procedure execCommand(command: String; args: Variant); overload;
    procedure setOption(optionName: Variant; optionValue: Variant);
    procedure setOptions(keyValueTuples: Variant);
    function getOption(name: Variant): Variant;
    function getOptions: Variant;
    blockScrolling: Integer; external '$blockScrolling';
    procedure setKeyboardHandler(keyboardHandler: String);
    function getKeyboardHandler: String;
    procedure setSession(session: JIEditSession);
    function getSession: JIEditSession;
    function setValue(val: String): String; overload;
    function setValue(val: String; cursorPos: Integer): String; overload;
    function getValue: String;
    function getSelection: JSelection;
    procedure resize; overload;
    procedure resize(force: Boolean); overload;
    procedure setTheme(theme: String);
    function getTheme: String;
    procedure setStyle(style: String);
    procedure unsetStyle;
    procedure setFontSize(size: String);
    procedure focus;
    procedure isFocused;
    procedure blur;
    procedure onFocus;
    procedure onBlur;
    procedure onDocumentChange(e: Variant);
    procedure onCursorChange;
    function getCopyText: String;
    procedure onCopy;
    procedure onCut;
    procedure onPaste(text: String);
    procedure insert(text: String);
    procedure setOverwrite(overwrite: Boolean);
    function getOverwrite: Boolean;
    procedure toggleOverwrite;
    procedure setScrollSpeed(speed: Integer);
    function getScrollSpeed: Integer;
    procedure setDragDelay(dragDelay: Integer);
    function getDragDelay: Integer;
    procedure setSelectionStyle(style: String);
    function getSelectionStyle: String;
    procedure setHighlightActiveLine(shouldHighlight: Boolean);
    procedure getHighlightActiveLine;
    procedure setHighlightSelectedWord(shouldHighlight: Boolean);
    function getHighlightSelectedWord: Boolean;
    procedure setShowInvisibles(showInvisibles: Boolean);
    function getShowInvisibles: Boolean;
    procedure setShowPrintMargin(showPrintMargin: Boolean);
    function getShowPrintMargin: Boolean;
    procedure setPrintMarginColumn(showPrintMargin: Integer);
    function getPrintMarginColumn: Integer;
    procedure setReadOnly(readOnly: Boolean);
    function getReadOnly: Boolean;
    procedure setBehavioursEnabled(enabled: Boolean);
    function getBehavioursEnabled: Boolean;
    procedure setWrapBehavioursEnabled(enabled: Boolean);
    procedure getWrapBehavioursEnabled;
    procedure setShowFoldWidgets(show: Boolean);
    procedure getShowFoldWidgets;
    procedure remove(dir: String);
    procedure removeWordRight;
    procedure removeWordLeft;
    procedure removeToLineStart;
    procedure removeToLineEnd;
    procedure splitLine;
    procedure transposeLetters;
    procedure toLowerCase;
    procedure toUpperCase;
    procedure indent;
    procedure blockIndent;
    procedure blockOutdent; overload;
    procedure blockOutdent(arg: String); overload;
    procedure toggleCommentLines;
    function getNumberAt: Integer;
    procedure modifyNumber(amount: Integer);
    procedure removeLines;
    function moveLinesDown: Integer;
    function moveLinesUp: Integer;
    function moveText(fromRange: JRange; toPosition: Variant): JRange;
    function copyLinesUp: Integer;
    function copyLinesDown: Integer;
    function getFirstVisibleRow: Integer;
    function getLastVisibleRow: Integer;
    function isRowVisible(row: Integer): Boolean;
    function isRowFullyVisible(row: Integer): Boolean;
    procedure selectPageDown;
    procedure selectPageUp;
    procedure gotoPageDown;
    procedure gotoPageUp;
    procedure scrollPageDown;
    procedure scrollPageUp;
    procedure scrollToRow;
    procedure scrollToLine(line: Integer; center: Boolean; animate: Boolean; callback: procedure);
    procedure centerSelection;
    function getCursorPosition: JPosition;
    function getCursorPositionScreen: Integer;
    function getSelectionRange: JRange;
    procedure selectAll;
    procedure clearSelection;
    procedure moveCursorTo(row: Integer); overload;
    procedure moveCursorTo(row: Integer; column: Integer); overload;
    procedure moveCursorTo(row: Integer; column: Integer; animate: Boolean); overload;
    procedure moveCursorToPosition(position: JPosition);
    procedure jumpToMatching;
    procedure gotoLine(lineNumber: Integer); overload;
    procedure gotoLine(lineNumber, column: Integer); overload;
    procedure gotoLine(lineNumber, column: Integer; animate: Boolean); overload;
    procedure navigateTo(row: Integer; column: Integer);
    procedure navigateUp; overload;
    procedure navigateUp(times: Integer); overload;
    procedure navigateDown; overload;
    procedure navigateDown(times: Integer); overload;
    procedure navigateLeft; overload;
    procedure navigateLeft(times: Integer); overload;
    procedure navigateRight(times: Integer);
    procedure navigateLineStart;
    procedure navigateLineEnd;
    procedure navigateFileEnd;
    procedure navigateFileStart;
    procedure navigateWordRight;
    procedure navigateWordLeft;
    procedure replace(replacement: String); overload;
    procedure replace(replacement: String; options: Variant); overload;
    procedure replaceAll(replacement: String); overload;
    procedure replaceAll(replacement: String; options: Variant); overload;
    function getLastSearchOptions: Variant;
    procedure find(needle: String); overload;
    procedure find(needle: String; options: Variant); overload;
    procedure find(needle: String; options: Variant; animate: Boolean); overload;
    procedure findNext; overload;
    procedure findNext(options: Variant); overload;
    procedure findNext(options: Variant; animate: Boolean); overload;
    procedure findPrevious; overload;
    procedure findPrevious(options: Variant); overload;
    procedure findPrevious(options: Variant; animate: Boolean); overload;
    procedure undo;
    procedure redo;
    procedure destroy;
  end;

  JEditorChangeEvent = class external
    start: JPosition;
    &end: JPosition;
    action: String;
    lines: array of Variant;
  end;

  JPlaceHolder = class external
    procedure on(event: String; fn: function(e: Variant): Variant);
    procedure setup;
    procedure showOtherMarkers;
    procedure hideOtherMarkers;
    procedure onUpdate;
    procedure onCursorChange;
    procedure detach;
    procedure cancel;
  end;

  JIRangeList = class external
    ranges: array of JRange;
    procedure pointIndex(pos: JPosition); overload;
    procedure pointIndex(pos: JPosition; startIndex: Integer); overload;
    procedure addList(ranges: array of JRange);
    procedure add(ranges: JRange);
    function merge: array of JRange;
    procedure substractPoint(pos: JPosition);
  end;

  JRenderLoop = class external
  end;

  JScrollBar = class external
    procedure onScroll(e: Variant);
    function getWidth: Integer;
    procedure setHeight(height: Integer);
    procedure setInnerHeight(height: Integer);
    procedure setScrollTop(scrollTop: Integer);
  end;

  JSearch = class external
    function set(options: Variant): JSearch;
    function getOptions: Variant;
    procedure setOptions(An: Variant);
    function find(session: JIEditSession): JRange;
    function findAll(session: JIEditSession): array of JRange;
    function replace(input: String; replacement: String): String;
  end;

  JSelection = class external
    procedure addEventListener(ev: String; callback: procedure);
    procedure moveCursorWordLeft;
    procedure moveCursorWordRight;
    procedure fromOrientedRange(range: JRange);
    procedure setSelectionRange(match: Variant);
    function getAllRanges: array of JRange;
    procedure on(event: String; fn: function(e: Variant): Variant);
    procedure addRange(range: JRange);
    function isEmpty: Boolean;
    function isMultiLine: Boolean;
    function getCursor: JPosition;
    procedure setSelectionAnchor(row: Integer; column: Integer);
    function getSelectionAnchor: Variant;
    function getSelectionLead: Variant;
    procedure shiftSelection(columns: Integer);
    function isBackwards: Boolean;
    function getRange: JRange;
    procedure clearSelection;
    procedure selectAll;
    procedure setRange(range: JRange; reverse: Boolean);
    procedure selectTo(row: Integer; column: Integer);
    procedure selectToPosition(pos: Variant);
    procedure selectUp;
    procedure selectDown;
    procedure selectRight;
    procedure selectLeft;
    procedure selectLineStart;
    procedure selectLineEnd;
    procedure selectFileEnd;
    procedure selectFileStart;
    procedure selectWordRight;
    procedure selectWordLeft;
    procedure getWordRange;
    procedure selectWord;
    procedure selectAWord;
    procedure selectLine;
    procedure moveCursorUp;
    procedure moveCursorDown;
    procedure moveCursorLeft;
    procedure moveCursorRight;
    procedure moveCursorLineStart;
    procedure moveCursorLineEnd;
    procedure moveCursorFileEnd;
    procedure moveCursorFileStart;
    procedure moveCursorLongWordRight;
    procedure moveCursorLongWordLeft;
    procedure moveCursorBy(rows: Integer; chars: Integer);
    procedure moveCursorToPosition(position: Variant);
    procedure moveCursorTo(row: Integer; column: Integer); overload;
    procedure moveCursorTo(row: Integer; column: Integer; keepDesiredColumn: Boolean); overload;
    procedure moveCursorToScreen(row: Integer; column: Integer; keepDesiredColumn: Boolean);
  end;

  JSplit = class external
    function getSplits: Integer;
    procedure getEditor(idx: Integer);
    function getCurrentEditor: JEditor;
    procedure focus;
    procedure blur;
    procedure setTheme(theme: String);
    procedure setKeyboardHandler(keybinding: String);
    procedure forEach(callback: procedure; scope: String);
    procedure setFontSize(size: Integer);
    procedure setSession(session: JIEditSession; idx: Integer);
    function getOrientation: Integer;
    procedure setOrientation(orientation: Integer);
    procedure resize;
  end;

  JTokenIterator = class external
    function stepBackward: array of String;
    function stepForward: String;
    function getCurrentToken: JTokenInfo;
    function getCurrentTokenRow: Integer;
    function getCurrentTokenColumn: Integer;
  end;

  JTokenizer = class external
    function getLineTokens: Variant;
  end;

  JVirtualRenderer = class external
    scroller: Variant;
    characterWidth: Integer;
    lineHeight: Integer;
    procedure screenToTextCoordinates(left: Integer; top: Integer);
    procedure setSession(session: JIEditSession);
    procedure updateLines(firstRow: Integer; lastRow: Integer);
    procedure updateText;
    procedure updateFull(force: Boolean);
    procedure updateFontSize;
    procedure onResize(force: Boolean; gutterWidth: Integer; width: Integer; height: Integer);
    procedure adjustWrapLimit;
    procedure setAnimatedScroll(shouldAnimate: Boolean);
    function getAnimatedScroll: Boolean;
    procedure setShowInvisibles(showInvisibles: Boolean);
    function getShowInvisibles: Boolean;
    procedure setShowPrintMargin(showPrintMargin: Boolean);
    function getShowPrintMargin: Boolean;
    procedure setPrintMarginColumn(showPrintMargin: Boolean);
    function getPrintMarginColumn: Boolean;
    function getShowGutter: Boolean;
    procedure setShowGutter(show: Boolean);
    function getContainerElement: JHTMLElement;
    function getMouseEventTarget: JHTMLElement;
    function getTextAreaContainer: JHTMLElement;
    function getFirstVisibleRow: Integer;
    function getFirstFullyVisibleRow: Integer;
    function getLastFullyVisibleRow: Integer;
    function getLastVisibleRow: Integer;
    procedure setPadding(padding: Integer);
    function getHScrollBarAlwaysVisible: Boolean;
    procedure setHScrollBarAlwaysVisible(alwaysVisible: Boolean);
    procedure updateFrontMarkers;
    procedure updateBackMarkers;
    procedure addGutterDecoration;
    procedure removeGutterDecoration;
    procedure updateBreakpoints;
    procedure setAnnotations(annotations: array of Variant);
    procedure updateCursor;
    procedure hideCursor;
    procedure showCursor;
    procedure scrollCursorIntoView;
    function getScrollTop: Integer;
    function getScrollLeft: Integer;
    function getScrollTopRow: Integer;
    function getScrollBottomRow: Integer;
    procedure scrollToRow(row: Integer);
    procedure scrollToLine(line: Integer; center: Boolean; animate: Boolean; callback: procedure);
    function scrollToY(scrollTop: Integer): Integer;
    function scrollToX(scrollLeft: Integer): Integer;
    procedure scrollBy(deltaX: Integer; deltaY: Integer);
    function isScrollableBy(deltaX: Integer; deltaY: Integer): Boolean;
    function textToScreenCoordinates(row: Integer; column: Integer): Variant;
    procedure visualizeFocus;
    procedure visualizeBlur;
    procedure showComposition(position: Integer);
    procedure setCompositionText(text: String);
    procedure hideComposition;
    procedure setTheme(theme: String);
    function getTheme: String;
    procedure setStyle(style: String);
    procedure unsetStyle(style: String);
    procedure destroy;
  end;

(*
var
  KeyBinding:     constructor CreateJKeyBinding;
  end;
  Anchor:     constructor CreateJAnchor;
  end;
  BackgroundTokenizer:     constructor CreateJBackgroundTokenizer;
  end;
  Document:     constructor CreateJDocument;
    constructor CreateJDocument;
  end;
  EditSession:     constructor CreateJIEditSession;
    constructor CreateJIEditSession;
    constructor CreateJIEditSession;
  end;
  Editor:     constructor CreateJEditor;
  end;
  PlaceHolder:     constructor CreateJPlaceHolder;
    constructor CreateJPlaceHolder;
  end;
  RangeList:     constructor CreateJIRangeList;
  end;
  Range:     function fromPoints(pos1: JPosition; pos2: JPosition): JRange
    constructor CreateJRange;
  end;
  RenderLoop:     constructor CreateJRenderLoop;
  end;
  ScrollBar:     constructor CreateJScrollBar;
  end;
  Search:     constructor CreateJSearch;
  end;
  Selection:     constructor CreateJSelection;
  end;
  Split:     constructor CreateJSplit;
  end;
  TokenIterator:     constructor CreateJTokenIterator;
  end;
  Tokenizer:     constructor CreateJTokenizer;
  end;
  UndoManager:     constructor CreateJUndoManager;
  end;
  VirtualRenderer:     constructor CreateJVirtualRenderer;
  end;


ace: JAceAjax.Ace;
*)
