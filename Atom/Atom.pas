unit Atom;

interface

uses
  W3C.DOM, SpacePen;

type
  JIEditor = class;
  JIPane = class;
  JITokenizedBuffer = class;

  JIPanes = class external
  end;

  JIPaneView = class external
  end;

  JIPaneContainerView = class external
  end;

  JITreeView = class external
  end;

  JDisposable = class external 'Disposable'
    constructor Create(disposalAction: Variant);
    procedure dispose;
  end;

  JIWorkspaceViewStatic = class external
    constructor CreateJIWorkspaceView;
    version: Float;
    configDefaults: Variant;
    function content: Variant;
  end;

  JDecoration = class external
    procedure destroy;
  end;

  JMarker = class external
    procedure destroy;
    function getScreenRange: JRange;
  end;

  JView = class external 'View'(SpacePen.JView)
    function subscribeWith(eventEmitter: Variant; methodName: String; args: Variant): Variant;
    function addSubscription(subscription: Variant): Variant;
    function subscribe(eventEmitterOrSubscription: Variant; args: array of Variant): Variant;
    function subscribeToCommand(eventEmitter: Variant; args: array of Variant): Variant;
    function unsubscribe: Variant; overload;
    function unsubscribe(&object: Variant): Variant; overload;
  end;

  JIWorkspacePanelOptions = record
    item: Variant;
    visible: Boolean; // nullable
    priority: Float; // nullable
  end;

  JPanel = class external
    function getItem: Variant;
    function getPriority: Variant;
    function isVisible: Boolean;
    procedure show;
    procedure hide;
  end;

  JIWorkspace = class external
    paneForURI: function(uri: String): JIPane;
    function addBottomPanel(options: JIWorkspacePanelOptions): JPanel;
    function addLeftPanel(options: JIWorkspacePanelOptions): JPanel;
    function addRightPanel(options: JIWorkspacePanelOptions): JPanel;
    function addTopPanel(options: JIWorkspacePanelOptions): JPanel;
    function addModalPanel(options: JIWorkspacePanelOptions): JPanel;
    function addOpener(opener: procedure ): Variant;
    function deserializeParams(params: Variant): Variant;
    function serializeParams: record
      paneContainer: Variant;
      fullScreen: Boolean;
    end;
    procedure eachEditor(callback: procedure );
    function getTextEditors: array of JIEditor;
//    function open(uri: String; options: Variant): JQ.Promise{<JView>};
    procedure openLicense;
    function openSync(uri: String; options: Variant): Variant;
//    function openUriInPane(uri: String; pane: Variant; options: Variant): JQ.Promise{<JView>};
    function observeTextEditors(callback: procedure ): JDisposable;
    function reopenItemSync: Variant;
    procedure registerOpener(opener: function(urlToOpen: String): Variant);
    procedure unregisterOpener(opener: procedure );
    function getOpeners: Variant;
    function getActivePane: JIPane;
    function getActivePaneItem: JIPane;
    function getActiveTextEditor: JIEditor;
    function getPanes: Variant;
    procedure saveAll;
    function activateNextPane: Variant;
    function activatePreviousPane: Variant;
    function saveActivePaneItem: Variant;
    function saveActivePaneItemAs: Variant;
    function destroyActivePaneItem: Variant;
    function destroyActivePane: Variant;
    function getActiveEditor: JIEditor;
    procedure increaseFontSize;
    procedure decreaseFontSize;
    procedure resetFontSize;
    procedure itemOpened(item: Variant);
    procedure onPaneItemDestroyed(item: Variant);
    procedure destroyed;
    function onDidChangeActivePaneItem(item: Variant): JDisposable;
  end;

  JIWorkspaceView = class external(JView)
    fullScreen: Boolean;
//    statusBar: JStatusBar.IStatusBarView;
//    function open(uri: String; options: Variant): JQ.Promise{<JView>};
    function openSync(uri: String): Variant; overload;
    function openSync(uri: String; options: Variant): Variant; overload;
    function saveActivePaneItem: Variant;
    function saveActivePaneItemAs: Variant;
    procedure saveAll;
    function destroyActivePaneItem: Variant;
    function destroyActivePane: Variant;
    procedure increaseFontSize;
    procedure decreaseFontSize;
    function initialize(model: JIWorkspace): Variant; overload;
    procedure initialize(view: JView; args: Variant); overload;
    model: JIWorkspace;
    panes: JIPaneContainerView;
    function getModel: JIWorkspace;
    function installShellCommands: Variant;
    function handleFocus: Variant;
    function afterAttach: Variant; overload;
    function afterAttach(onDom: Variant): Variant; overload;
    function confirmClose: Boolean;
    function updateTitle: Variant;
    function setTitle(title: String): Variant;
    function getEditorViews: array of Variant;
    function prependToTop(element: Variant): Variant;
    function appendToTop(element: Variant): Variant;
    function prependToBottom(element: Variant): Variant;
    function appendToBottom(element: Variant): Variant;
    function prependToLeft(element: Variant): Variant;
    function appendToLeft(element: Variant): Variant;
    function prependToRight(element: Variant): Variant;
    function appendToRight(element: Variant): Variant;
    function getActivePaneView: JIPaneView;
    function getActiveView: JView;
    function focusPreviousPaneView: Variant;
    function focusNextPaneView: Variant;
    function focusPaneViewAbove: Variant;
    function focusPaneViewBelow: Variant;
    function focusPaneViewOnLeft: Variant;
    function focusPaneViewOnRight: Variant;
    function eachPaneView(callback: function(paneView: JIPaneView): Variant): function: Variant;
    function getPaneViews: array of JIPaneView;
    function eachEditorView(callback: function(editorView: Variant): Variant): function: Variant;
    function beforeRemove: Variant;
    function command(eventName: String; handler: procedure): Variant; overload;
    function command(eventName: String; selector: procedure ; handler: procedure): Variant; overload;
    function command(eventName: String; options: Variant; handler: procedure): Variant; overload;
    function command(eventName: String; selector: procedure ; options: Variant; handler: procedure): Variant; overload;
  end;

  JIGutterViewStatic = class external
    constructor CreateJIGutterView;
    function content: Variant;
  end;

  JIGutterView = class external(JView)
    firstScreenRow: Variant;
    lastScreenRow: Variant;
    procedure initialize; overload;
    procedure initialize(view: JView; args: Variant); overload;
    function afterAttach: Variant; overload;
    function afterAttach(onDom: Variant): Variant; overload;
    function beforeRemove: Variant;
//    function handleMouseEvents(e: JJQueryMouseEventObject): Variant;
    function getEditorView: Variant;
    function getEditor: JIEditor;
    function getLineNumberElements: JHTMLCollection;
    function getLineNumberElementsForClass(klass: String): JNodeList;
    function getLineNumberElement(bufferRow: Float): JNodeList;
    function addClassToAllLines(klass: String): Boolean;
    function removeClassFromAllLines(klass: String): Boolean;
    function addClassToLine(bufferRow: Float; klass: String): Boolean;
    function removeClassFromLine(bufferRow: Float; klass: String): Boolean;
    function updateLineNumbers(changes: array of Variant): Variant; overload;
    function updateLineNumbers(changes: array of Variant; startScreenRow: Float): Variant; overload;
    function updateLineNumbers(changes: array of Variant; startScreenRow: Float; endScreenRow: Float): Variant; overload;
    procedure prependLineElements(lineElements: Variant);
    procedure appendLineElements(lineElements: Variant);
    procedure removeLineElements(numberOfElements: Float);
    function buildLineElements(startScreenRow: Variant; endScreenRow: Variant): Variant;
    function buildLineElementsHtml(startScreenRow: Variant; endScreenRow: Variant): Variant;
    function updateFoldableClasses(changes: array of Variant): Variant;
    procedure removeLineHighlights;
    function addLineHighlight(row: Float): Variant; overload;
    function addLineHighlight(row: Float; emptySelection: Boolean): Variant; overload;
    function highlightLines: Boolean;
  end;

  JICommandRegistry = class external
    procedure add(selector: String; name: String; callback: procedure(event: Variant));
    function findCommands(params: JObject): array of JObject;
    procedure dispatch(selector: Variant; name: String);
  end;

  JICommandPanel = class external
  end;

  JIDisplayBufferStatic = class external
    constructor CreateJIDisplayBuffer;
  end;

  JIDisplayBuffer = class external
    &constructor: JIDisplayBufferStatic;
    verticalScrollMargin: Float;
    horizontalScrollMargin: Float;
    declaredPropertyValues: Variant;
    tokenizedBuffer: JITokenizedBuffer;
    buffer: JTextBuffer.ITextBuffer;
    charWidthsByScope: Variant;
    markers: record
      // property Item[index: Integer]: JIDisplayBufferMarker;
    end;
    foldsByMarkerId: Variant;
    maxLineLength: Float;
    screenLines: array of JITokenizedLine;
    rowMap: Variant;
    longestScreenRow: Float;
    subscriptions: array of JEmissary.ISubscription;
    subscriptionsByObject: Variant;
    behaviors: Variant;
    subscriptionCounts: Variant;
    eventHandlersByEventName: Variant;
    pendingChangeEvent: Variant;
    softWrap: Boolean;
    function serializeParams: record
      id: Float;
      softWrap: Boolean;
      editorWidthInChars: Float;
      scrollTop: Float;
      scrollLeft: Float;
      tokenizedBuffer: Variant;
    end;
    function deserializeParams(params: Variant): Variant;
    function copy: JIDisplayBuffer;
    function updateAllScreenLines: Variant;
    function emitChanged(eventProperties: Variant): Variant; overload;
    function emitChanged(eventProperties: Variant; refreshMarkers: Boolean): Variant; overload;
    function updateWrappedScreenLines: Variant;
    function setVisible(visible: Variant): Variant;
    function getVerticalScrollMargin: Float;
    function setVerticalScrollMargin(verticalScrollMargin: Float): Float;
    function getHorizontalScrollMargin: Float;
    function setHorizontalScrollMargin(horizontalScrollMargin: Float): Float;
    function getHeight: Variant;
    function setHeight(height: Variant): Variant;
    function getWidth: Variant;
    function setWidth(newWidth: Variant): Variant;
    function getScrollTop: Float;
    function setScrollTop(scrollTop: Float): Float;
    function getScrollBottom: Float;
    function setScrollBottom(scrollBottom: Float): Float;
    function getScrollLeft: Float;
    function setScrollLeft(scrollLeft: Float): Float;
    function getScrollRight: Float;
    function setScrollRight(scrollRight: Float): Float;
    function getLineHeight: Variant;
    function setLineHeight(lineHeight: Variant): Variant;
    function getDefaultCharWidth: Variant;
    function setDefaultCharWidth(defaultCharWidth: Variant): Variant;
    function getScopedCharWidth(scopeNames: Variant; char: Variant): Variant;
    function getScopedCharWidths(scopeNames: Variant): Variant;
    function setScopedCharWidth(scopeNames: Variant; char: Variant; width: Variant): Variant;
    function setScopedCharWidths(scopeNames: Variant; charWidths: Variant): Variant;
    function clearScopedCharWidths: Variant;
    function getScrollHeight: Float;
    function getScrollWidth: Float;
    function getVisibleRowRange: array of Float;
    function intersectsVisibleRowRange(startRow: Variant; endRow: Variant): Variant;
    function selectionIntersectsVisibleRowRange(selection: Variant): Variant;
    function scrollToScreenRange(screenRange: Variant): Variant;
    function scrollToScreenPosition(screenPosition: Variant): Variant;
    function scrollToBufferPosition(bufferPosition: Variant): Variant;
    function pixelRectForScreenRange(screenRange: JTextBuffer.IRange): Variant;
    function getTabLength: Float;
    function setTabLength(tabLength: Float): Variant;
    function setSoftWrap(softWrap: Boolean): Boolean;
    function getSoftWrap: Boolean;
    function setEditorWidthInChars(editorWidthInChars: Float): Variant;
    function getEditorWidthInChars: Float;
    function getSoftWrapColumn: Float;
    function lineForRow(row: Float): Variant;
    function linesForRows(startRow: Float; endRow: Float): Variant;
    function getLines: array of Variant;
    function indentLevelForLine(line: Variant): Variant;
    function bufferRowsForScreenRows(startScreenRow: Variant; endScreenRow: Variant): Variant;
    function createFold(startRow: Float; endRow: Float): JIFold;
    function isFoldedAtBufferRow(bufferRow: Float): Boolean;
    function isFoldedAtScreenRow(screenRow: Float): Boolean;
    function destroyFoldWithId(id: Float): Variant;
    function unfoldBufferRow(bufferRow: Float): array of Variant;
    function largestFoldStartingAtBufferRow(bufferRow: Float): Variant;
    function foldsStartingAtBufferRow(bufferRow: Float): Variant;
    function largestFoldStartingAtScreenRow(screenRow: Variant): Variant;
    function largestFoldContainingBufferRow(bufferRow: Variant): Variant;
    function outermostFoldsInBufferRowRange(startRow: Variant; endRow: Variant): array of Variant;
    function foldsContainingBufferRow(bufferRow: Variant): array of Variant;
    function screenRowForBufferRow(bufferRow: Float): Float;
    function lastScreenRowForBufferRow(bufferRow: Float): Float;
    function bufferRowForScreenRow(screenRow: Float): Float;
    function screenRangeForBufferRange(bufferRange: array of JTextBuffer.IPoint): JTextBuffer.IRange;
    function screenRangeForBufferRange(bufferRange: JTextBuffer.IRange): JTextBuffer.IRange;
    function screenRangeForBufferRange(bufferRange: record
      start: JTextBuffer.IPoint;
      &end: JTextBuffer.IPoint;
    end): JTextBuffer.IRange;
    function screenRangeForBufferRange(bufferRange: record
      start: array of Float;
      &end: JTextBuffer.IPoint;
    end): JTextBuffer.IRange;
    function screenRangeForBufferRange(bufferRange: record
      start: record
        row: Float;
        col: Float;
      end;
      &end: JTextBuffer.IPoint;
    end): JTextBuffer.IRange;
    function screenRangeForBufferRange(bufferRange: record
      start: JTextBuffer.IPoint;
      &end: array of Float;
    end): JTextBuffer.IRange;
    function screenRangeForBufferRange(bufferRange: record
      start: array of Float;
      &end: array of Float;
    end): JTextBuffer.IRange;
    function screenRangeForBufferRange(bufferRange: record
      start: record
        row: Float;
        col: Float;
      end;
      &end: array of Float;
    end): JTextBuffer.IRange;
    function screenRangeForBufferRange(bufferRange: record
      start: JTextBuffer.IPoint;
      &end: record
        row: Float;
        col: Float;
      end;
    end): JTextBuffer.IRange;
    function screenRangeForBufferRange(bufferRange: record
      start: array of Float;
      &end: record
        row: Float;
        col: Float;
      end;
    end): JTextBuffer.IRange;
    function screenRangeForBufferRange(bufferRange: record
      start: record
        row: Float;
        col: Float;
      end;
      &end: record
        row: Float;
        col: Float;
      end;
    end): JTextBuffer.IRange;
    function bufferRangeForScreenRange(screenRange: array of JTextBuffer.IPoint): JTextBuffer.IRange;
    function bufferRangeForScreenRange(screenRange: JTextBuffer.IRange): JTextBuffer.IRange;
    function bufferRangeForScreenRange(screenRange: record
      start: JTextBuffer.IPoint;
      &end: JTextBuffer.IPoint;
    end): JTextBuffer.IRange;
    function bufferRangeForScreenRange(screenRange: record
      start: array of Float;
      &end: JTextBuffer.IPoint;
    end): JTextBuffer.IRange;
    function bufferRangeForScreenRange(screenRange: record
      start: record
        row: Float;
        col: Float;
      end;
      &end: JTextBuffer.IPoint;
    end): JTextBuffer.IRange;
    function bufferRangeForScreenRange(screenRange: record
      start: JTextBuffer.IPoint;
      &end: array of Float;
    end): JTextBuffer.IRange;
    function bufferRangeForScreenRange(screenRange: record
      start: array of Float;
      &end: array of Float;
    end): JTextBuffer.IRange;
    function bufferRangeForScreenRange(screenRange: record
      start: record
        row: Float;
        col: Float;
      end;
      &end: array of Float;
    end): JTextBuffer.IRange;
    function bufferRangeForScreenRange(screenRange: record
      start: JTextBuffer.IPoint;
      &end: record
        row: Float;
        col: Float;
      end;
    end): JTextBuffer.IRange;
    function bufferRangeForScreenRange(screenRange: record
      start: array of Float;
      &end: record
        row: Float;
        col: Float;
      end;
    end): JTextBuffer.IRange;
    function bufferRangeForScreenRange(screenRange: record
      start: record
        row: Float;
        col: Float;
      end;
      &end: record
        row: Float;
        col: Float;
      end;
    end): JTextBuffer.IRange;
    function pixelRangeForScreenRange(screenRange: array of JTextBuffer.IPoint): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: array of JTextBuffer.IPoint; clip: Boolean): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: JTextBuffer.IRange): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: JTextBuffer.IRange; clip: Boolean): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: JTextBuffer.IPoint;
      &end: JTextBuffer.IPoint;
    end): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: JTextBuffer.IPoint;
      &end: JTextBuffer.IPoint;
    end; clip: Boolean): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: array of Float;
      &end: JTextBuffer.IPoint;
    end): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: array of Float;
      &end: JTextBuffer.IPoint;
    end; clip: Boolean): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: record
        row: Float;
        col: Float;
      end;
      &end: JTextBuffer.IPoint;
    end): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: record
        row: Float;
        col: Float;
      end;
      &end: JTextBuffer.IPoint;
    end; clip: Boolean): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: JTextBuffer.IPoint;
      &end: array of Float;
    end): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: JTextBuffer.IPoint;
      &end: array of Float;
    end; clip: Boolean): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: array of Float;
      &end: array of Float;
    end): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: array of Float;
      &end: array of Float;
    end; clip: Boolean): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: record
        row: Float;
        col: Float;
      end;
      &end: array of Float;
    end): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: record
        row: Float;
        col: Float;
      end;
      &end: array of Float;
    end; clip: Boolean): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: JTextBuffer.IPoint;
      &end: record
        row: Float;
        col: Float;
      end;
    end): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: JTextBuffer.IPoint;
      &end: record
        row: Float;
        col: Float;
      end;
    end; clip: Boolean): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: array of Float;
      &end: record
        row: Float;
        col: Float;
      end;
    end): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: array of Float;
      &end: record
        row: Float;
        col: Float;
      end;
    end; clip: Boolean): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: record
        row: Float;
        col: Float;
      end;
      &end: record
        row: Float;
        col: Float;
      end;
    end): JTextBuffer.IRange; overload;
    function pixelRangeForScreenRange(screenRange: record
      start: record
        row: Float;
        col: Float;
      end;
      &end: record
        row: Float;
        col: Float;
      end;
    end; clip: Boolean): JTextBuffer.IRange; overload;
    function pixelPositionForScreenPosition(screenPosition: JTextBuffer.IPoint): JTextBuffer.IPoint; overload;
    function pixelPositionForScreenPosition(screenPosition: JTextBuffer.IPoint; clip: Boolean): JTextBuffer.IPoint; overload;
    function pixelPositionForScreenPosition(screenPosition: array of Float): JTextBuffer.IPoint; overload;
    function pixelPositionForScreenPosition(screenPosition: array of Float; clip: Boolean): JTextBuffer.IPoint; overload;
    function pixelPositionForScreenPosition(screenPosition: record
      row: Float;
      col: Float;
    end): JTextBuffer.IPoint; overload;
    function pixelPositionForScreenPosition(screenPosition: record
      row: Float;
      col: Float;
    end; clip: Boolean): JTextBuffer.IPoint; overload;
    function screenPositionForPixelPosition(pixelPosition: Variant): JTextBuffer.IPoint;
    function pixelPositionForBufferPosition(bufferPosition: Variant): Variant;
    function getLineCount: Float;
    function getLastRow: Float;
    function getMaxLineLength: Float;
    function screenPositionForBufferPosition(bufferPosition: Variant; options: Variant): Variant;
    function bufferPositionForScreenPosition(bufferPosition: Variant; options: Variant): Variant;
    function scopesForBufferPosition(bufferPosition: Variant): Variant;
    function bufferRangeForScopeAtPosition(selector: Variant; position: Variant): Variant;
    function tokenForBufferPosition(bufferPosition: Variant): Variant;
    function getGrammar: JIGrammar;
    function setGrammar(grammar: JIGrammar): Variant;
    function reloadGrammar: Variant;
    function clipScreenPosition(screenPosition: Variant; options: Variant): Variant;
    function findWrapColumn(line: Variant; softWrapColumn: Variant): Variant;
    function rangeForAllLines: JTextBuffer.IRange;
    function getMarker(id: Float): JIDisplayBufferMarker;
    function getMarkers: array of JIDisplayBufferMarker;
    function getMarkerCount: Float;
    function markScreenRange(range: JTextBuffer.IRange; args: array of Variant): JIDisplayBufferMarker;
    function markBufferRange(range: JTextBuffer.IRange): JIDisplayBufferMarker; overload;
    function markBufferRange(range: JTextBuffer.IRange; options: Variant): JIDisplayBufferMarker; overload;
    function markScreenPosition(screenPosition: JTextBuffer.IPoint): JIDisplayBufferMarker; overload;
    function markScreenPosition(screenPosition: JTextBuffer.IPoint; options: Variant): JIDisplayBufferMarker; overload;
    function markBufferPosition(bufferPosition: JTextBuffer.IPoint): JIDisplayBufferMarker; overload;
    function markBufferPosition(bufferPosition: JTextBuffer.IPoint; options: Variant): JIDisplayBufferMarker; overload;
    function destroyMarker(id: Float): Variant;
    function findMarker: JIDisplayBufferMarker; overload;
    function findMarker(params: Variant): JIDisplayBufferMarker; overload;
    function findMarkers: array of JIDisplayBufferMarker; overload;
    function findMarkers(params: Variant): array of JIDisplayBufferMarker; overload;
    function translateToBufferMarkerParams: Variant; overload;
    function translateToBufferMarkerParams(params: Variant): Variant; overload;
    function findFoldMarker(attributes: Variant): JIMarker;
    function findFoldMarkers(attributes: Variant): array of JIMarker;
    function getFoldMarkerAttributes: Variant; overload;
    function getFoldMarkerAttributes(attributes: Variant): Variant; overload;
    function pauseMarkerObservers: Variant;
    function resumeMarkerObservers: Variant;
    function refreshMarkerScreenPositions: Variant;
    function destroy: Variant;
    function logLines(start: Float; &end: Float): array of Variant;
    function handleTokenizedBufferChange(tokenizedBufferChange: Variant): Variant;
    function updateScreenLines(startBufferRow: Variant; endBufferRow: Variant): Variant; overload;
    function updateScreenLines(startBufferRow: Variant; endBufferRow: Variant; bufferDelta: Float): Variant; overload;
    function updateScreenLines(startBufferRow: Variant; endBufferRow: Variant; bufferDelta: Float; options: Variant): Variant; overload;
    function buildScreenLines(startBufferRow: Variant; endBufferRow: Variant): Variant;
    function findMaxLineLength(startScreenRow: Variant; endScreenRow: Variant; newScreenLines: Variant): Variant;
    function handleBufferMarkersUpdated: Variant;
    function handleBufferMarkerCreated(marker: Variant): Variant;
    function createFoldForMarker(maker: Variant): JIFold;
    function foldForMarker(marker: Variant): Variant;
  end;

  JIViewRegistry = class external
    function getView(selector: Variant): Variant;
  end;

  JICursorStatic = class external
    constructor CreateJICursor;
  end;

  JScopeDescriptor = class external
    scopes: array of String;
  end;

  JICursor = class external
    function getScopeDescriptor: JScopeDescriptor;
    screenPosition: Variant;
    bufferPosition: Variant;
    goalColumn: Variant;
    visible: Boolean;
    needsAutoscroll: Boolean;
    editor: JIEditor;
    marker: JIDisplayBufferMarker;
    id: Float;
    function destroy: Variant;
    function changePosition(options: Variant; fn: procedure ): Variant;
    function getPixelRect: Variant;
    function setScreenPosition(screenPosition: Variant): Variant; overload;
    function setScreenPosition(screenPosition: Variant; options: Variant): Variant; overload;
    function getScreenPosition: JTextBuffer.IPoint;
    function getScreenRange: JTextBuffer.IRange;
    function setBufferPosition(bufferPosition: Variant): Variant; overload;
    function setBufferPosition(bufferPosition: Variant; options: Variant): Variant; overload;
    function getBufferPosition: JTextBuffer.IPoint;
    function autoscroll: Variant;
    function updateVisibility: Variant;
    function setVisible(visible: Boolean): Variant;
    function isVisible: Boolean;
    function wordRegExp: Variant; overload;
    function wordRegExp(arg: Variant): Variant; overload;
    function isLastCursor: Boolean;
    function isSurroundedByWhitespace: Boolean;
    function isBetweenWordAndNonWord: Boolean;
    function isInsideWord: Boolean;
    procedure clearAutoscroll;
    procedure clearSelection;
    function getScreenRow: Float;
    function getScreenColumn: Float;
    function getBufferRow: Float;
    function getBufferColumn: Float;
    function getCurrentBufferLine: String;
    function moveUp(rowCount: Float): Variant; overload;
    function moveUp(rowCount: Float; arg: Variant): Variant; overload;
    function moveDown(rowCount: Float): Variant; overload;
    function moveDown(rowCount: Float; arg: Variant): Variant; overload;
    function moveLeft: Variant; overload;
    function moveLeft(arg: Variant): Variant; overload;
    function moveRight: Variant; overload;
    function moveRight(arg: Variant): Variant; overload;
    function moveToTop: Variant;
    procedure moveToBottom;
    procedure moveToBeginningOfScreenLine;
    procedure moveToBeginningOfLine;
    procedure moveToFirstCharacterOfLine;
    procedure moveToEndOfScreenLine;
    procedure moveToEndOfLine;
    procedure moveToBeginningOfWord;
    procedure moveToEndOfWord;
    procedure moveToBeginningOfNextWord;
    procedure moveToPreviousWordBoundary;
    procedure moveToNextWordBoundary;
    function getBeginningOfCurrentWordBufferPosition: JTextBuffer.IPoint; overload;
    function getBeginningOfCurrentWordBufferPosition(options: Variant): JTextBuffer.IPoint; overload;
    function getPreviousWordBoundaryBufferPosition: JTextBuffer.IPoint; overload;
    function getPreviousWordBoundaryBufferPosition(options: Variant): JTextBuffer.IPoint; overload;
    function getMoveNextWordBoundaryBufferPosition: JTextBuffer.IPoint; overload;
    function getMoveNextWordBoundaryBufferPosition(options: Variant): JTextBuffer.IPoint; overload;
    function getEndOfCurrentWordBufferPosition: JTextBuffer.IPoint; overload;
    function getEndOfCurrentWordBufferPosition(options: Variant): JTextBuffer.IPoint; overload;
    function getBeginningOfNextWordBufferPosition: JTextBuffer.IPoint; overload;
    function getBeginningOfNextWordBufferPosition(options: Variant): JTextBuffer.IPoint; overload;
    function getCurrentWordBufferRange: JTextBuffer.IPoint; overload;
    function getCurrentWordBufferRange(options: Variant): JTextBuffer.IPoint; overload;
    function getCurrentLineBufferRange: JTextBuffer.IPoint; overload;
    function getCurrentLineBufferRange(options: Variant): JTextBuffer.IPoint; overload;
    function getCurrentParagraphBufferRange: Variant;
    function getCurrentWordPrefix: String;
    function isAtBeginningOfLine: Boolean;
    function getIndentLevel: Float;
    function isAtEndOfLine: Boolean;
    function getScopes: array of String;
    function hasPrecedingCharactersOnLine: Boolean;
    function getMarker: JMarker;
  end;

  JILanguageMode = class external
  end;

  JISelection = class external
    cursor: JICursor;
    marker: JIDisplayBufferMarker;
    editor: JIEditor;
    initialScreenRange: Variant;
    wordwise: Boolean;
    needsAutoscroll: Boolean;
    retainSelection: Boolean;
    subscriptionCounts: Variant;
    function destroy: Variant;
    function finalize: Variant;
    function clearAutoscroll: Variant;
    function isEmpty: Boolean;
    function isReversed: Boolean;
    function isSingleScreenLine: Boolean;
    function getScreenRange: JTextBuffer.IRange;
    function setScreenRange(screenRange: Variant; options: Variant): Variant;
    function getBufferRange: JTextBuffer.IRange;
    function setBufferRange(bufferRange: Variant; options: Variant): Variant;
    function getBufferRowRange: array of Float;
    procedure autoscroll;
    function getText: String;
    function clear: Boolean;
    function selectWord: JTextBuffer.IRange;
    function expandOverWord: Variant;
    function selectLine: JTextBuffer.IRange; overload;
    function selectLine(row: Variant): JTextBuffer.IRange; overload;
    function expandOverLine: Boolean;
    function selectToScreenPosition(position: Variant): Variant;
    function selectToBufferPosition(position: Variant): Variant;
    function selectRight: Boolean;
    function selectLeft: Boolean;
    function selectUp: Boolean; overload;
    function selectUp(rowCount: Variant): Boolean; overload;
    function selectDown: Boolean; overload;
    function selectDown(rowCount: Variant): Boolean; overload;
    function selectToTop: Variant;
    function selectToBottom: Variant;
    function selectAll: Variant;
    function selectToBeginningOfLine: Variant;
    function selectToFirstCharacterOfLine: Variant;
    function selectToEndOfLine: Variant;
    function selectToBeginningOfWord: Variant;
    function selectToEndOfWord: Variant;
    function selectToBeginningOfNextWord: Variant;
    function selectToPreviousWordBoundary: Variant;
    function selectToNextWordBoundary: Variant;
    function addSelectionBelow: Variant;
    function getGoalBufferRange: Variant;
    function addSelectionAbove: array of Variant;
    function insertText(text: String): Variant; overload;
    function insertText(text: String; options: Variant): Variant; overload;
    function normalizeIndents(text: String; indentBasis: Float): Variant;
    function indent: Variant; overload;
    function indent(_arg: Variant): Variant; overload;
    function indentSelectedRows: array of JTextBuffer.IRange;
    function setIndentationForLine(line: String; indentLevel: Float): Variant;
    function backspace: Variant;
    function backspaceToBeginningOfWord: Variant;
    function backspaceToBeginningOfLine: Variant;
    function delete: Variant;
    function deleteToEndOfWord: Variant;
    function deleteSelectedText: Variant;
    function deleteLine: Variant;
    function joinLines: Variant;
    function outdentSelectedRows: array of Variant;
    function autoIndentSelectedRows: Variant;
    function toggleLineComments: Variant;
    function cutToEndOfLine(maintainClipboard: Variant): Variant;
    function cut(maintainClipboard: Variant): Variant;
    function copy(maintainClipboard: Variant): Variant;
    function fold: Variant;
    function modifySelection(fn: function: Variant): Variant;
    function plantTail: Variant;
    function intersectsBufferRange(bufferRange: Variant): Variant;
    function intersectsWith(otherSelection: Variant): Variant;
    function merge(otherSelection: Variant; options: Variant): Variant;
    function compare(otherSelection: Variant): Variant;
    function getRegionRects: array of Variant;
    function screenRangeChanged: Variant;
  end;

  JIDecorationParams = class external
    id: Float; // nullable
    &class: String;
    &type: Variant;
  end;

  JIDecorationStatic = class external
    function isType(decorationParams: JIDecorationParams; &type: Variant): Boolean;
    constructor CreateJIDecoration;
  end;

  JIDecoration = class external(JEmissary.IEmitter)
    marker: JIDisplayBufferMarker;
    displayBuffer: JIDisplayBuffer;
    params: JIDecorationParams;
    id: Float;
    flashQueue: array of Variant;
    isDestroyed: Boolean;
    procedure destroy;
    procedure update(newParams: JIDecorationParams);
    function getMarker: JIDisplayBufferMarker;
    function getParams: JIDecorationParams;
    function isType(&type: String): Boolean;
    function matchesPattern(decorationPattern: record
      // property Item[key: String]: JIDecorationParams;
    end): Boolean;
    procedure flash(klass: String); overload;
    procedure flash(klass: String; duration: Float); overload;
    function consumeNextFlash: Variant;
  end;

  JIEditor = class external
    deserializing: Boolean;
    callDisplayBufferCreatedHook: Boolean;
    registerEditor: Boolean;
    buffer: JTextBuffer.ITextBuffer;
    languageMode: JILanguageMode;
    cursors: array of JICursor;
    selections: array of JISelection;
    suppressSelectionMerging: Boolean;
    updateBatchDepth: Float;
    selectionFlashDuration: Float;
    softTabs: Boolean;
    displayBuffer: JIDisplayBuffer;
    id: Float;
    behaviors: Variant;
    declaredPropertyValues: Variant;
    eventHandlersByEventName: Variant;
    eventHandlersByNamespace: Variant;
    lastOpened: Float;
    subscriptionCounts: Variant;
    subscriptionsByObject: Variant;
    subscriptions: array of JEmissary.ISubscription;
    mini: Variant;
    function serializeParams: record
      id: Float;
      softTabs: Boolean;
      scrollTop: Float;
      scrollLeft: Float;
      displayBuffer: Variant;
    end;
    function deserializeParams(params: Variant): Variant;
    procedure subscribeToBuffer;
    procedure subscribeToDisplayBuffer;
    function getViewClass: Variant;
    procedure destroyed;
    function isDestroyed: Boolean;
    function copy: JIEditor;
    function getTitle: String;
    function getLongTitle: String;
    procedure setVisible(visible: Boolean);
    procedure setMini(mini: Variant);
    procedure setScrollTop(scrollTop: Variant);
    function getScrollTop: Float;
    procedure setScrollLeft(scrollLeft: Variant);
    function getScrollLeft: Float;
    procedure setEditorWidthInChars(editorWidthInChars: Variant);
    function getSoftWrapColumn: Float;
    function getSoftTabs: Boolean;
    procedure setSoftTabs(softTabs: Boolean);
    function getSoftWrap: Boolean;
    procedure setSoftWrap(softWrap: Variant);
    function getTabText: String;
    function getTabLength: Float;
    procedure setTabLength(tabLength: Variant);
    function usesSoftTabs: Boolean;
    procedure clipBufferPosition(bufferPosition: Variant);
    procedure clipBufferRange(range: Variant);
    procedure indentationForBufferRow(bufferRow: Variant);
    procedure setIndentationForBufferRow(bufferRow: Variant; newLevel: Variant; _arg: Variant);
    function indentLevelForLine(line: Variant): Float;
    function buildIndentString(number: Variant): String;
    procedure save;
    procedure saveAs(filePath: Variant);
    procedure copyPathToClipboard;
    function getPath: String;
    function getText: String;
    procedure setText(text: Variant);
    function getTextInRange(range: Variant): Variant;
    function getLineCount: Float;
    function getBuffer: JTextBuffer.ITextBuffer;
    function getURI: String;
    function isBufferRowBlank(bufferRow: Variant): Boolean;
    procedure isBufferRowCommented(bufferRow: Variant);
    procedure nextNonBlankBufferRow(bufferRow: Variant);
    function getEofBufferPosition: JTextBuffer.IPoint;
    function getLastBufferRow: Float;
    function bufferRangeForBufferRow(row: Variant; options: Variant): JTextBuffer.IRange;
    function lineForBufferRow(row: Float): String;
    function lineLengthForBufferRow(row: Float): Float;
    function scan: Variant;
    function scanInBufferRange: Variant;
    function backwardsScanInBufferRange: Variant;
    function isModified: Boolean;
    function isEmpty: Boolean;
    function shouldPromptToSave: Boolean;
    function screenPositionForBufferPosition(bufferPosition: Variant): JTextBuffer.IPoint; overload;
    function screenPositionForBufferPosition(bufferPosition: Variant; options: Variant): JTextBuffer.IPoint; overload;
    function bufferPositionForScreenPosition(screenPosition: Variant): JTextBuffer.IPoint; overload;
    function bufferPositionForScreenPosition(screenPosition: Variant; options: Variant): JTextBuffer.IPoint; overload;
    function screenRangeForBufferRange(bufferRange: Variant): JTextBuffer.IRange;
    function bufferRangeForScreenRange(screenRange: Variant): JTextBuffer.IRange;
    function clipScreenPosition(screenPosition: Variant; options: Variant): JTextBuffer.IRange;
    function lineForScreenRow(row: Variant): JITokenizedLine;
    function linesForScreenRows: array of JITokenizedLine; overload;
    function linesForScreenRows(start: Variant): array of JITokenizedLine; overload;
    function linesForScreenRows(start: Variant; &end: Variant): array of JITokenizedLine; overload;
    function getScreenLineCount: Float;
    function getMaxScreenLineLength: Float;
    function getLastScreenRow: Float;
    function bufferRowsForScreenRows(startRow: Variant; endRow: Variant): array of Variant;
    function bufferRowForScreenRow(row: Variant): Float;
    function scopesForBufferPosition(bufferPosition: Variant): array of String;
    function bufferRangeForScopeAtCursor(selector: String): Variant;
    function tokenForBufferPosition(bufferPosition: Variant): JIToken;
    function getCursorScopes: array of String;
    procedure logCursorScope;
    function insertText(text: String): array of JTextBuffer.IRange; overload;
    function insertText(text: String; options: Variant): array of JTextBuffer.IRange; overload;
    function insertNewline: array of JTextBuffer.IRange;
    function insertNewlineBelow: array of JTextBuffer.IRange;
    function insertNewlineAbove: Variant;
    function indent: Variant; overload;
    function indent(options: Variant): Variant; overload;
    function backspace: array of Variant;
    function deleteToBeginningOfWord: array of Variant;
    function deleteToBeginningOfLine: array of Variant;
    function delete: array of Variant;
    function deleteToEndOfLine: array of Variant;
    function deleteToEndOfWord: array of Variant;
    function deleteLine: array of JTextBuffer.IRange;
    function indentSelectedRows: array of array of JTextBuffer.IRange;
    function outdentSelectedRows: array of array of JTextBuffer.IRange;
    function toggleLineCommentsInSelection: array of JTextBuffer.IRange;
    function autoIndentSelectedRows: array of array of JTextBuffer.IRange;
    function normalizeTabsInBufferRange(bufferRange: Variant): Variant;
    function cutToEndOfLine: array of Boolean;
    function cutSelectedText: array of Boolean;
    function copySelectedText: array of Boolean;
    function pasteText: array of JTextBuffer.IRange; overload;
    function pasteText(options: Variant): array of JTextBuffer.IRange; overload;
    function undo: array of Variant;
    function redo: array of Variant;
    function foldCurrentRow: Variant;
    function unfoldCurrentRow: array of Variant;
    function foldSelectedLines: array of Variant;
    function foldAll: array of Variant;
    function unfoldAll: array of Variant;
    function foldAllAtIndentLevel(level: Variant): Variant;
    function foldBufferRow(bufferRow: Variant): Variant;
    function unfoldBufferRow(bufferRow: Variant): Variant;
    function isFoldableAtBufferRow(bufferRow: Variant): Boolean;
    function isFoldableAtScreenRow(screenRow: Variant): Boolean;
    function createFold(startRow: Variant; endRow: Variant): JIFold;
    function destroyFoldWithId(id: Variant): Variant;
    function destroyFoldsIntersectingBufferRange(bufferRange: Variant): Variant;
    function toggleFoldAtBufferRow(bufferRow: Variant): Variant;
    function isFoldedAtCursorRow: Boolean;
    function isFoldedAtBufferRow(bufferRow: Variant): Boolean;
    function isFoldedAtScreenRow(screenRow: Variant): Boolean;
    function largestFoldContainingBufferRow(bufferRow: Variant): Boolean;
    function largestFoldStartingAtScreenRow(screenRow: Variant): Variant;
    function outermostFoldsInBufferRowRange(startRow: Variant; endRow: Variant): array of Variant;
    function moveLineUp: array of JISelection;
    function moveLineDown: array of JISelection;
    function duplicateLines: array of array of Variant;
    function mutateSelectedText(fn: function(selection: JISelection): Variant): Variant;
    function replaceSelectedText(options: Variant; fn: function(selection: String): Variant): Variant;
    function decorationsForScreenRowRange(startScreenRow: Variant; endScreenRow: Variant): record
      // property Item[id: Integer]: array of JIDecoration;
    end;
    function decorateMarker(marker: JIDisplayBufferMarker; decorationParams: record
      &type: String;
      &class: String;
    end): JIDecoration;
    function decorationForId(id: Float): JIDecoration;
    function getMarker(id: Float): JIDisplayBufferMarker;
    function getMarkers: array of JIDisplayBufferMarker;
    function findMarkers(args: array of Variant): array of JIDisplayBufferMarker;
    function markScreenRange(args: array of Variant): JIDisplayBufferMarker;
    function markBufferRange(args: array of Variant): JIDisplayBufferMarker;
    function markScreenPosition(args: array of Variant): JIDisplayBufferMarker;
    function markBufferPosition(args: array of Variant): JIDisplayBufferMarker;
    function destroyMarker(args: array of Variant): Boolean;
    function getMarkerCount: Float;
    function hasMultipleCursors: Boolean;
    function getCursors: array of JICursor;
    function getCursor: JICursor;
    function addCursorAtScreenPosition(screenPosition: Variant): JICursor;
    function addCursorAtBufferPosition(bufferPosition: Variant): JICursor;
    function addCursor(marker: Variant): JICursor;
    function removeCursor(cursor: Variant): array of JICursor;
    function addSelection(marker: Variant; options: Variant): JISelection;
    function addSelectionForBufferRange(bufferRange: Variant; options: Variant): JISelection;
    function setSelectedBufferRange(bufferRange: Variant; options: Variant): Variant;
    function setSelectedBufferRanges(bufferRanges: Variant; options: Variant): Variant;
    function removeSelection(selection: JISelection): Variant;
    function clearSelections: Boolean;
    function consolidateSelections: Boolean;
    procedure selectionScreenRangeChanged(selection: Variant);
    function getSelections: array of JISelection;
    function getSelection: JISelection; overload;
    function getSelection(index: Float): JISelection; overload;
    function getLastSelection: JISelection;
    function getSelectionsOrderedByBufferPosition: array of JISelection;
    function getLastSelectionInBuffer: JISelection;
    function selectionIntersectsBufferRange(bufferRange: Variant): Variant;
    function setCursorScreenPosition(position: JTextBuffer.IPoint): Variant; overload;
    function setCursorScreenPosition(position: JTextBuffer.IPoint; options: Variant): Variant; overload;
    function getCursorScreenPosition: JTextBuffer.IPoint;
    function getCursorScreenRow: Float;
    function setCursorBufferPosition(position: Variant): Variant; overload;
    function setCursorBufferPosition(position: Variant; options: Variant): Variant; overload;
    function getCursorBufferPosition: JTextBuffer.IPoint;
    function getSelectedScreenRange: JTextBuffer.IRange;
    function getSelectedBufferRange: JTextBuffer.IRange;
    function getSelectedBufferRanges: array of JTextBuffer.IRange;
    function getSelectedText: String;
    function getTextInBufferRange(range: JTextBuffer.IRange): String;
    function setTextInBufferRange(range: Variant {JTextBuffer.IRange or array of Variant}; text: String): Variant;
    function getCurrentParagraphBufferRange: JTextBuffer.IRange;
    function getWordUnderCursor: String; overload;
    function getWordUnderCursor(options: Variant): String; overload;
    procedure moveCursorUp; overload;
    procedure moveCursorUp(lineCount: Float); overload;
    procedure moveCursorDown; overload;
    procedure moveCursorDown(lineCount: Float); overload;
    procedure moveCursorLeft;
    procedure moveCursorRight;
    procedure moveCursorToTop;
    procedure moveCursorToBottom;
    procedure moveCursorToBeginningOfScreenLine;
    procedure moveCursorToBeginningOfLine;
    procedure moveCursorToFirstCharacterOfLine;
    procedure moveCursorToEndOfScreenLine;
    procedure moveCursorToEndOfLine;
    procedure moveCursorToBeginningOfWord;
    procedure moveCursorToEndOfWord;
    procedure moveCursorToBeginningOfNextWord;
    procedure moveCursorToPreviousWordBoundary;
    procedure moveCursorToNextWordBoundary;
    procedure moveCursorToBeginningOfNextParagraph;
    procedure moveCursorToBeginningOfPreviousParagraph;
    function scrollToCursorPosition(options: Variant): Variant;
    procedure pageUp;
    procedure pageDown;
    procedure selectPageUp;
    procedure selectPageDown;
    function getRowsPerPage: Float;
    function moveCursors(fn: function(cursor: JICursor): Variant): Variant;
    procedure cursorMoved(event: Variant);
    function selectToScreenPosition(position: JTextBuffer.IPoint): Variant;
    function selectRight: array of JISelection;
    function selectLeft: array of JISelection;
    function selectUp: array of JISelection; overload;
    function selectUp(rowCount: Float): array of JISelection; overload;
    function selectDown: array of JISelection; overload;
    function selectDown(rowCount: Float): array of JISelection; overload;
    function selectToTop: array of JISelection;
    function selectAll: array of JISelection;
    function selectToBottom: array of JISelection;
    function selectToBeginningOfLine: array of JISelection;
    function selectToFirstCharacterOfLine: array of JISelection;
    function selectToEndOfLine: array of JISelection;
    function selectToPreviousWordBoundary: array of JISelection;
    function selectToNextWordBoundary: array of JISelection;
    function selectLine: array of JISelection;
    function selectLinesContainingCursors: array of JISelection;
    function addSelectionBelow: array of JISelection;
    function addSelectionAbove: array of JISelection;
    function splitSelectionsIntoLines: array of Variant;
    function transpose: array of JTextBuffer.IRange;
    function upperCase: array of Boolean;
    function lowerCase: array of Boolean;
    function joinLines: array of Variant;
    function selectToBeginningOfWord: array of JISelection;
    function selectToEndOfWord: array of JISelection;
    function selectToBeginningOfNextWord: array of JISelection;
    function selectWord: array of JISelection;
    function selectToBeginningOfNextParagraph: array of JISelection;
    function selectToBeginningOfPreviousParagraph: array of JISelection;
    function selectMarker(marker: Variant): Variant;
    function mergeCursors: array of Float;
    function expandSelectionsForward: Variant;
    function expandSelectionsBackward(fn: function(selection: JISelection): Variant): array of JISelection;
    function finalizeSelections: array of Boolean;
    function mergeIntersectingSelections: Variant;
    function preserveCursorPositionOnBufferReload: JEmissary.ISubscription;
    function getGrammar: JIGrammar;
    procedure setGrammar(grammer: JIGrammar);
    function reloadGrammar: Variant;
    function shouldAutoIndent: Boolean;
    function shouldShowInvisibles: Boolean;
    procedure updateInvisibles;
    function transact(fn: procedure ): Variant;
    function beginTransaction: JITransaction;
    function commitTransaction: Variant;
    function abortTransaction: array of Variant;
    function inspect: String;
    function logScreenLines(start: Float; &end: Float): array of Variant;
    procedure handleTokenization;
    procedure handleGrammarChange;
    function handleMarkerCreated(marker: Variant): Variant;
    function getSelectionMarkerAttributes: record
      &type: String;
      editorId: Float;
      invalidate: String;
    end;
    function getVerticalScrollMargin: Float;
    procedure setVerticalScrollMargin(verticalScrollMargin: Float);
    function getHorizontalScrollMargin: Float;
    procedure setHorizontalScrollMargin(horizontalScrollMargin: Float);
    function getLineHeightInPixels: Float;
    procedure setLineHeightInPixels(lineHeightInPixels: Float);
    procedure batchCharacterMeasurement(fn: procedure );
    function getScopedCharWidth(scopeNames: Variant; char: Variant): Variant;
    function setScopedCharWidth(scopeNames: Variant; char: Variant; width: Variant): Variant;
    function getScopedCharWidths(scopeNames: Variant): Variant;
    function clearScopedCharWidths: Variant;
    function getDefaultCharWidth: Float;
    procedure setDefaultCharWidth(defaultCharWidth: Float);
    procedure setHeight(height: Float);
    function getHeight: Float;
    function getClientHeight: Float;
    procedure setWidth(width: Float);
    function getWidth: Float;
    function getScrollTop: Float;
    procedure setScrollTop(scrollTop: Float);
    function getScrollBottom: Float;
    procedure setScrollBottom(scrollBottom: Float);
    function getScrollLeft: Float;
    procedure setScrollLeft(scrollLeft: Float);
    function getScrollRight: Float;
    procedure setScrollRight(scrollRight: Float);
    function getScrollHeight: Float;
    function getScrollWidth: Float;
    function getVisibleRowRange: Float;
    function intersectsVisibleRowRange(startRow: Variant; endRow: Variant): Variant;
    function selectionIntersectsVisibleRowRange(selection: Variant): Variant;
    function pixelPositionForScreenPosition(screenPosition: Variant): Variant;
    function pixelPositionForBufferPosition(bufferPosition: Variant): Variant;
    function screenPositionForPixelPosition(pixelPosition: Variant): Variant;
    function pixelRectForScreenRange(screenRange: Variant): Variant;
    function scrollToScreenRange(screenRange: Variant; options: Variant): Variant;
    function scrollToScreenPosition(screenPosition: Variant; options: Variant): Variant;
    function scrollToBufferPosition(bufferPosition: Variant; options: Variant): Variant;
    function horizontallyScrollable: Variant;
    function verticallyScrollable: Variant;
    function getHorizontalScrollbarHeight: Variant;
    function setHorizontalScrollbarHeight(height: Variant): Variant;
    function getVerticalScrollbarWidth: Variant;
    function setVerticalScrollbarWidth(width: Variant): Variant;
    function onDidChange(callback: procedure ): JDisposable;
    function onDidDestroy(callback: procedure ): JDisposable;
    function onDidStopChanging(callback: procedure ): JDisposable;
    function onDidChangeCursorPosition(callback: procedure ): JDisposable;
    function onDidSave(callback: procedure(event: record
      path: String;
    end)): JDisposable;
    function decorateMarker(marker: JMarker; options: Variant): JDecoration;
    function getLastCursor: JICursor;
  end;

  JIGrammar = class external
    bundledPackage: Boolean;
    emitter: Variant;
    fileTypes: TupletType;
    firstLineRegex: Variant;
    foldingStopMarker: Variant;
    includedGrammarScopes: TupletType;
    initialRule: Variant;
    injectionSelector: Variant;
    injections: Variant;
    maxTokensPerLine: JNumber;
    name: String;
    packageName: String;
    path: String;
    rawPatterns: TupletType;
    rawRepository: Variant;
    registration: JDisposable;
    registry: Variant;
    repository: JObject;
    scopeName: String;
  end;

  JIPane = class external
    itemForURI: (uri: String): JIEditor;
    items: array of Variant;
    activeItem: Variant;
    function serializeParams: Variant;
    function deserializeParams(params: Variant): Variant;
    function getViewClass: Variant;
    function isActive: Boolean;
    function isDestroyed: Boolean;
    procedure focus;
    procedure blur;
    procedure activate;
    function getPanes: array of JIPane;
    function getItems: array of Variant;
    function getActiveItem: Variant;
    function getActiveEditor: Variant;
    function itemAtIndex(index: Float): Variant;
    function activateNextItem: Variant;
    function activatePreviousItem: Variant;
    function getActiveItemIndex: Float;
    function activateItemAtIndex(index: Float): Variant;
    function activateItem(item: Variant): Variant;
    function addItem(item: Variant; index: Float): Variant;
    function addItems(items: array of Variant; index: Float): array of Variant;
    procedure removeItem(item: Variant; destroying: Variant);
    procedure moveItem(item: Variant; newIndex: Float);
    procedure moveItemToPane(item: Variant; pane: JIPane; index: Float);
    function destroyActiveItem: Boolean;
    function destroyItem(item: Variant): Boolean;
    function destroyItems: array of Variant;
    function destroyInactiveItems: array of Variant;
    procedure destroy;
    function destroyed: array of Variant;
    function promptToSaveItem(item: Variant): Boolean;
    procedure saveActiveItem;
    procedure saveActiveItemAs;
    procedure saveItem(item: Variant; nextAction: procedure );
    procedure saveItemAs(item: Variant; nextAction: procedure );
    function saveItems: array of Variant;
    function activateItemForURI(uri: Variant): Variant;
    procedure copyActiveItem;
    function splitLeft(params: Variant): JIPane;
    function splitRight(params: Variant): JIPane;
    function splitUp(params: Variant): JIPane;
    function splitDown(params: Variant): JIPane;
    function split(orientation: String; side: String; params: Variant): JIPane;
    function findLeftmostSibling: JIPane;
    function findOrCreateRightmostSibling: JIPane;
  end;

  JISerializationStatic{<T>} = class external
    function deserialize(data: JISerializationInfo): JT;
    constructor CreateJISerialization;
  end;

  JISerialization = class external
    function serialize: JISerializationInfo;
  end;

  JISerializationInfo = class external
    deserializer: String;
  end;

  JIBrowserWindow = class external
    function getPosition: array of Float;
    function getSize: array of Float;
  end;

  JIAtomWindowDimentions = class external
    x: Float;
    y: Float;
    width: Float;
    height: Float;
  end;

  JIProjectStatic = class external
    function pathForRepositoryUrl(repoUrl: String): String;
    constructor CreateJIProject;
  end;

  JIProject = class external
    path: String;
    rootDirectory: JPathWatcher.IDirectory; // nullable
    rootDirectories: array of JPathWatcher.IDirectory;
    function serializeParams: Variant;
    function deserializeParams(params: Variant): Variant;
    function destroyed: Variant;
    function destroyRepo: Variant;
    function destroyUnretainedBuffers: Variant;
    function getRepo: JIGit;
    function getPath: String;
    function setPath(projectPath: String): Variant;
    function getRootDirectory: JPathWatcher.IDirectory;
    function resolve(uri: String): String;
    function relativize(fullPath: String): String;
    function contains(pathToCheck: String): Boolean;
    function open(filePath: String): JQ.Promise{<JIEditor>}; overload;
    function open(filePath: String; options: Variant): JQ.Promise{<JIEditor>}; overload;
    function openSync(filePath: String): JIEditor; overload;
    function openSync(filePath: String; options: Variant): JIEditor; overload;
    function getBuffers: JTextBuffer.ITextBuffer;
    function isPathModified(filePath: String): Boolean;
    function findBufferForPath(filePath: String): JTextBuffer.ITextBuffer;
    function bufferForPathSync(filePath: String): JTextBuffer.ITextBuffer;
    function bufferForPath(filePath: String): JQ.Promise{<JTextBuffer.ITextBuffer>};
    function bufferForId(id: Variant): JTextBuffer.ITextBuffer;
    function buildBufferSync(absoluteFilePath: String): JTextBuffer.ITextBuffer;
    function buildBuffer(absoluteFilePath: String): JQ.Promise{<JTextBuffer.ITextBuffer>};
    function addBuffer(buffer: JTextBuffer.ITextBuffer): Variant; overload;
    function addBuffer(buffer: JTextBuffer.ITextBuffer; options: Variant): Variant; overload;
    function addBufferAtIndex(buffer: JTextBuffer.ITextBuffer; index: Float): Variant; overload;
    function addBufferAtIndex(buffer: JTextBuffer.ITextBuffer; index: Float; options: Variant): Variant; overload;
    function scan(regex: Variant; options: Variant; iterator: Variant): JQ.Promise{<Variant>};
    function replace(regex: Variant; replacementText: Variant; filePaths: Variant; iterator: Variant): JQ.Promise{<Variant>};
    function buildEditorForBuffer(buffer: Variant; editorOptions: Variant): JIEditor;
    function eachBuffer(args: array of Variant): Variant;
    function onDidChangePaths(callback: procedure ): JDisposable;
  end;

  JIWorkspaceStatic = class external
    constructor CreateJIWorkspace;
  end;

  JIAtomSettings = class external
    appVersion: String;
    bootstrapScript: String;
    devMode: Boolean;
    initialPath: String;
    pathToOpen: String;
    resourcePath: String;
    shellLoadTime: Float;
    windowState: String;
  end;

  JIAtomState = class external
    mode: String;
    packageStates: Variant;
    project: Variant;
    syntax: Variant;
    version: Float;
    windowDimensions: Variant;
    workspace: Variant;
  end;

  JIDeserializerManager = class external
    deserializers: procedure ;
    add: procedure ;
    remove: procedure ;
    deserialize: procedure ;
    get: procedure ;
  end;

  JIConfig = class external
    function get(keyPath: String): Variant;
  end;

  JIKeymapManager = class external
    defaultTarget: JHTMLElement;
  end;

  JIPackage = class external
    mainModulePath: String;
    mainModule: Variant;
    procedure enable;
    procedure disable;
    function isTheme: Boolean;
    function getType: String;
    function getStylesheetType: String;
    function load: JIPackage;
    procedure reset;
    function activate: JQ.Promise{<array of Variant>};
    procedure activateNow;
  end;

  JIPackageManager = class external(JEmissary.IEmitter)
    packageDirPaths: array of String;
    loadedPackages: Variant;
    activePackages: Variant;
    packageStates: Variant;
    packageActivators: array of Variant;
    function getApmPath: String;
    function getPackageDirPaths: String;
    function getPackageState(name: String): Variant;
    procedure setPackageState(name: String; state: Variant);
    function enablePackage(name: String): Variant;
    function disablePackage(name: String): Variant;
    procedure activate;
    procedure registerPackageActivator(activator: Variant; types: Variant);
    procedure activatePackages(packages: Variant);
    function activatePackage(name: String): JQ.Promise{<JIPackage>};
    procedure deactivatePackages;
    procedure deactivatePackage(name: String);
    function getActivePackages: Variant;
    function getActivePackage(name: String): Variant;
    function isPackageActive(name: String): Boolean;
    procedure unobserveDisabledPackages;
    procedure observeDisabledPackages;
    procedure loadPackages;
    procedure loadPackage(nameOrPath: String);
    procedure unloadPackages;
    procedure unloadPackage(name: String);
    function getLoadedPackage(name: String): Variant;
    function isPackageLoaded(name: String): Boolean;
    function getLoadedPackages: Variant;
    function getLoadedPackagesForTypes(types: Variant): array of Variant;
    function resolvePackagePath(name: String): String;
    function isPackageDisabled(name: String): Boolean;
    function hasAtomEngine(packagePath: String): Boolean;
    function isBundledPackage(name: String): Boolean;
    function getPackageDependencies: Variant;
    function getAvailablePackagePaths: array of Variant;
    function getAvailablePackageNames: array of Variant;
    function getAvailablePackageMetadata: array of Variant;
  end;

  JINotifications = class external
    addInfo: procedure ;
    addError: procedure ;
    addSuccess: procedure ;
    addWarning: procedure ;
  end;

  JIThemeManager = class external
  end;

  JIContextMenuManager = class external
  end;

  JIMenuManager = class external
  end;

  JIClipboard = class external
    function write(text: String): Variant; overload;
    function write(text: String; metadata: Variant): Variant; overload;
    function read: String;
  end;

  JISyntax = class external
  end;

  JIWindowEventHandler = class external
  end;

  JIAtomStatic = class external(JISerializationStatic {JIAtom} )
    version: Float;
    loadSettings: JIAtomSettings;
    function loadOrCreate(mode: Jeditor): JIAtom;
    function loadOrCreate(mode: Jspec): JIAtom;
    function loadOrCreate(mode: String): JIAtom;
    procedure loadState(mode: Variant);
    function getStatePath(mode: Variant): String;
    function getConfigDirPath: String;
    function getStorageDirPath: String;
    function getLoadSettings: JIAtomSettings;
    function getCurrentWindow: JIBrowserWindow;
    function getVersion: String;
    function isReleasedVersion: Boolean;
    constructor CreateJIAtom;
  end;

  JIAtom = class external
    &constructor: JIAtomStatic;
    state: JIAtomState;
    mode: String;
    deserializers: JIDeserializerManager;
    config: JIConfig;
    commands: JICommandRegistry;
    keymaps: JIKeymapManager;
    keymap: JIKeymapManager;
    packages: JIPackageManager;
    themes: JIThemeManager;
    contextManu: JIContextMenuManager;
    menu: JIMenuManager;
    notifications: JINotifications;
    clipboard: JIClipboard;
    syntax: JISyntax;
    views: JIViewRegistry;
    windowEventHandler: JIWindowEventHandler;
    subscribe: procedure ;
    unsubscribe: procedure ;
    loadTime: Float;
    workspaceViewParentSelector: String;
    project: JIProject;
    workspaceView: JIWorkspaceView;
    workspace: JIWorkspace;
    initialize: procedure ;
    setBodyPlatformClass: procedure ;
    function getCurrentWindow: JIBrowserWindow;
    getWindowDimensions: procedure ;
    setWindowDimensions: procedure ;
    restoreWindowDimensions: procedure ;
    storeWindowDimensions: procedure ;
    getLoadSettings: procedure ;
    deserializeProject: procedure ;
    deserializeWorkspaceView: procedure ;
    deserializePackageStates: procedure ;
    deserializeEditorWindow: procedure ;
    startEditorWindow: procedure ;
    unloadEditorWindow: procedure ;
    loadThemes: procedure ;
    watchThemes: procedure ;
    open: procedure ;
    confirm: procedure ;
    showSaveDialog: procedure ;
    showSaveDialogSync: procedure ;
    openDevTools: procedure ;
    toggleDevTools: procedure ;
    executeJavaScriptInDevTools: procedure ;
    reload: procedure ;
    focus: procedure ;
    show: procedure ;
    hide: procedure ;
    setSize: procedure ;
    setPosition: procedure ;
    center: procedure ;
    displayWindow: procedure ;
    close: procedure ;
    exit: procedure ;
    inDevMode: procedure ;
    inSpecMode: procedure ;
    toggleFullScreen: procedure ;
    setFullScreen: procedure ;
    isFullScreen: procedure ;
    getVersion: procedure ;
    isReleasedVersion: procedure ;
    getGitHubAuthTokenName: procedure ;
    setGitHubAuthToken: procedure ;
    getGitHubAuthToken: procedure ;
    getConfigDirPath: procedure ;
    saveSync: procedure ;
    function getWindowLoadTime: Float;
    crashMainProcess: procedure ;
    crashRenderProcess: procedure ;
    beep: procedure ;
    getUserInitScriptPath: procedure ;
    requireUserInitScript: procedure ;
    requireWithGlobals: procedure ;
    services: Variant;
  end;

  JIBufferedNodeProcessStatic = class external
    constructor CreateJIBufferedNodeProcess;
  end;

  JIBufferedNodeProcess = class external(JIBufferedProcess)
  end;

  JIBufferedProcessStatic = class external
    constructor CreateJIBufferedProcess;
  end;

  JIBufferedProcess = class external
    process: procedure ;
    killed: Boolean;
    bufferStream: procedure ;
    kill: procedure ;
  end;

  JIGitStatic = class external
    constructor CreateJIGit;
  end;

  JIGit = class external
  end;

  JITokenizedBuffer = class external
  end;

  JITokenizedLine = class external
  end;

  JIToken = class external
  end;

  JIFoldStatic = class external
    constructor CreateJIFold;
  end;

  JIFold = class external
    id: Float;
    displayBuffer: JIDisplayBuffer;
    marker: JIMarker;
  end;

  JIDisplayBufferMarkerStatic = class external
    constructor CreateJIDisplayBufferMarker;
  end;

  JIDisplayBufferMarker = class external(JEmissary.IEmitter, JEmissary.ISubscriber)
    &constructor: JIDisplayBufferMarkerStatic;
    id: Float;
    bufferMarkerSubscription: Variant;
    oldHeadBufferPosition: JTextBuffer.IPoint;
    oldHeadScreenPosition: JTextBuffer.IPoint;
    oldTailBufferPosition: JTextBuffer.IPoint;
    oldTailScreenPosition: JTextBuffer.IPoint;
    wasValid: Boolean;
    bufferMarker: JIMarker;
    displayBuffer: JIDisplayBuffer;
    globalPauseCount: Float;
    globalQueuedEvents: Variant;
    subscriptions: array of JEmissary.ISubscription;
    subscriptionsByObject: Variant;
    function copy: JIDisplayBufferMarker; overload;
    function copy(attributes: Variant): JIDisplayBufferMarker; overload;
    function getScreenRange: JTextBuffer.IRange;
    function setScreenRange(screenRange: Variant; options: Variant): Variant;
    function getBufferRange: JTextBuffer.IRange;
    function setBufferRange(bufferRange: Variant; options: Variant): Variant;
    function getPixelRange: Variant;
    function getHeadScreenPosition: JTextBuffer.IPoint;
    function setHeadScreenPosition(screenPosition: Variant; options: Variant): Variant;
    function getHeadBufferPosition: JTextBuffer.IPoint;
    function setHeadBufferPosition(bufferPosition: Variant): Variant;
    function getTailScreenPosition: JTextBuffer.IPoint;
    function setTailScreenPosition(screenPosition: Variant; options: Variant): Variant;
    function getTailBufferPosition: JTextBuffer.IPoint;
    function setTailBufferPosition(bufferPosition: Variant): Variant;
    function plantTail: Boolean;
    function clearTail: Boolean;
    function hasTail: Boolean;
    function isReversed: Boolean;
    function isValid: Boolean;
    function isDestroyed: Boolean;
    function getAttributes: Variant;
    function setAttributes(attributes: Variant): Variant;
    function matchesAttributes(attributes: Variant): Variant;
    function destroy: Variant;
    function isEqual(other: JIDisplayBufferMarker): Boolean;
    function compare(other: JIDisplayBufferMarker): Boolean;
    function inspect: String;
    function destroyed: Variant;
    function notifyObservers(_arg: Variant): Variant;
  end;

  JITransaction = class external
  end;

  JIMarker = class external(JEmissary.IEmitter)
  end;

  JITaskStatic = class external
    constructor CreateJITask;
  end;

  JITask = class external
  end;


atom: JAtomCore.IAtom;
//"atom"

type
  JEditorView = class external 'EditorView'(JView)
    characterWidthCache: Variant;
    configDefaults: Variant;
    nextEditorId: Float;
    procedure content(params: Variant);
    function classes: String; overload;
    function classes(_arg: record
      mini: Variant; // nullable
    end): String; overload;
    vScrollMargin: Float;
    hScrollMargin: Float;
    lineHeight: Variant;
    charWidth: Variant;
    charHeight: Variant;
    cursorViews: array of Variant;
    selectionViews: array of Variant;
    lineCache: array of Variant;
    isFocused: Variant;
    editor: JAtomCore.IEditor;
    attached: Variant;
    lineOverdraw: Float;
    pendingChanges: array of Variant;
    newCursors: array of Variant;
    newSelections: array of Variant;
    redrawOnReattach: Variant;
    bottomPaddingInLines: Float;
    active: Boolean;
    id: Float;
    gutter: JAtomCore.IGutterView;
    overlayer: JJQuery;
    scrollView: JJQuery;
    renderedLines: JJQuery;
    underlayer: JJQuery;
    hiddenInput: JJQuery;
    verticalScrollbar: JJQuery;
    verticalScrollbarContent: JJQuery;
    constructor Create(editor: JAtomCore.IEditor);
    procedure initialize(editorOrOptions: JAtomCore.IEditor);
    procedure initialize; overload;
    procedure initialize(editorOrOptions: record
      editor: JAtomCore.IEditor;
      mini: Variant;
      placeholderText: Variant;
    end); overload;
    procedure initialize(editorOrOptions: record
    end);
    procedure bindKeys;
    function getEditor: JAtomCore.IEditor;
    function getText: String;
    procedure setText(text: String);
    function insertText(text: String): array of JTextBuffer.IRange; overload;
    function insertText(text: String; options: Variant): array of JTextBuffer.IRange; overload;
    function setHeightInLines(heightInLines: Float): Float;
    function setWidthInChars(widthInChars: Float): Float;
    procedure pageDown;
    procedure pageUp;
    function getPageRows: Float;
    procedure setShowInvisibles(showInvisibles: Boolean);
    procedure setInvisibles(invisibles: record
      eol: String;
      space: String;
      tab: String;
      cr: String;
    end);
    procedure setShowIndentGuide(showIndentGuide: Boolean);
    procedure setPlaceholderText(placeholderText: String);
    function getPlaceholderText: String;
    function checkoutHead: Boolean;
    function configure: JEmissary.ISubscription;
    procedure handleEvents;
    procedure handleInputEvents;
    function bringHiddenInputIntoView: JJQuery;
    function selectOnMousemoveUntilMouseup: Variant;
    function afterAttach(onDom: Variant): Variant;
    function edit(editor: JAtomCore.IEditor): Variant;
    function getModel: JAtomCore.IEditor;
    function setModel(editor: JAtomCore.IEditor): Variant;
    function showBufferConflictAlert(editor: JAtomCore.IEditor): Variant;
    function scrollTop(scrollTop: Float): Variant; overload;
    function scrollTop(scrollTop: Float; options: Variant): Variant; overload;
    function scrollBottom: Variant; overload;
    function scrollBottom(scrollBottom: Float): Variant; overload;
    function scrollLeft: Float; overload;
    function scrollLeft(scrollLeft: Float): Float; overload;
    function scrollRight: Variant; overload;
    function scrollRight(scrollRight: Float): Variant; overload;
    function scrollToBottom: Variant;
    function scrollToCursorPosition: Variant;
    function scrollToBufferPosition(bufferPosition: Variant; options: Variant): Variant;
    function scrollToScreenPosition(screenPosition: Variant; options: Variant): Variant;
    function scrollToPixelPosition(pixelPosition: Variant; options: Variant): Variant;
    function highlightFoldsContainingBufferRange(bufferRange: Variant): Variant;
    function saveScrollPositionForEditor: Variant;
    function toggleSoftTabs: Variant;
    function toggleSoftWrap: Variant;
    function calculateWidthInChars: Float;
    function calculateHeightInLines: Float;
    function getScrollbarWidth: Float;
    function setSoftWrap(softWrap: Boolean): Variant;
    function setFontSize(fontSize: Float): Variant;
    function getFontSize: Float;
    function setFontFamily: Variant; overload;
    function setFontFamily(fontFamily: String): Variant; overload;
    function getFontFamily: String;
    function setLineHeight(lineHeight: Float): Variant;
    function redraw: Variant;
    function splitLeft: Variant;
    function splitRight: Variant;
    function splitUp: Variant;
    function splitDown: Variant;
    function getPane: Variant;
    function remove(selector: Variant; keepData: Variant): Variant;
    function beforeRemove: Variant;
    function getCursorView: Variant; overload;
    function getCursorView(index: Float): Variant; overload;
    function getCursorViews: array of Variant;
    function addCursorView(cursor: Variant; options: Variant): Variant;
    function removeCursorView(cursorView: Variant): Variant;
    function getSelectionView: Variant; overload;
    function getSelectionView(index: Float): Variant; overload;
    function getSelectionViews: array of Variant;
    function addSelectionView(selection: Variant): Variant;
    function removeSelectionView(selectionView: Variant): Variant;
    function removeAllCursorAndSelectionViews: array of Variant;
    function appendToLinesView(view: Variant): Variant;
    function scrollVertically(pixelPosition: Variant; _arg: Variant): Variant;
    function scrollHorizontally(pixelPosition: Variant): Variant;
    function calculateDimensions: Float;
    function recalculateDimensions: Variant;
    function updateLayerDimensions: Variant;
    function isHidden: Boolean;
    procedure clearRenderedLines;
    function resetDisplay: Variant;
    function requestDisplayUpdate: Variant;
    function updateDisplay: Variant; overload;
    function updateDisplay(options: Variant): Variant; overload;
    function updateCursorViews: Variant;
    function shouldUpdateCursor(cursorView: Variant): Variant;
    function updateSelectionViews: array of Variant;
    function shouldUpdateSelection(selectionView: Variant): Variant;
    function syncCursorAnimations: array of Variant;
    function autoscroll: array of Variant; overload;
    function autoscroll(suppressAutoscroll: Variant): array of Variant; overload;
    function updatePlaceholderText: Variant;
    function updateRenderedLines(scrollViewWidth: Variant): Variant;
    function computeSurroundingEmptyLineChanges(change: Variant): Variant;
    function computeIntactRanges(renderFrom: Variant; renderTo: Variant): Variant;
    function truncateIntactRanges(intactRanges: Variant; renderFrom: Variant; renderTo: Variant): Variant;
    function clearDirtyRanges(intactRanges: Variant): Variant;
    function clearLine(lineElement: Variant): Variant;
    function fillDirtyRanges(intactRanges: Variant; renderFrom: Variant; renderTo: Variant): Variant;
    function updatePaddingOfRenderedLines: Variant;
    function getFirstVisibleScreenRow: Float;
    function getLastVisibleScreenRow: Float;
    function isScreenRowVisible: Boolean;
    function handleScreenLinesChange(change: Variant): Variant;
    function buildLineElementForScreenRow(screenRow: Variant): Variant;
    function buildLineElementsForScreenRows(startRow: Variant; endRow: Variant): Variant;
    function htmlForScreenRows(startRow: Variant; endRow: Variant): Variant;
    function htmlForScreenLine(screenLine: Variant; screenRow: Variant): Variant;
    function buildIndentation(screenRow: Variant; editor: Variant): Variant;
    function buildHtmlEndOfLineInvisibles(screenLine: Variant): Variant;
    function getEndOfLineInvisibles(screenLine: Variant): Variant;
    function lineElementForScreenRow(screenRow: Variant): Variant;
    function toggleLineCommentsInSelection: Variant;
    function pixelPositionForBufferPosition(position: Variant): Variant;
    function pixelPositionForScreenPosition(position: Variant): Variant;
    function positionLeftForLineAndColumn(lineElement: Variant; screenRow: Variant; screenColumn: Variant): Variant;
    function measureToColumn(lineElement: Variant; tokenizedLine: Variant; screenColumn: Variant): Variant;
    function getCharacterWidthCache(scopes: Variant; char: Variant): Variant;
    function setCharacterWidthCache(scopes: Variant; char: Variant; val: Variant): Variant;
    function clearCharacterWidthCache: Variant;
    function pixelOffsetForScreenPosition(position: Variant): Variant;
    function screenPositionFromMouseEvent(e: Variant): Variant;
    function highlightCursorLine: Variant;
    function copyPathToClipboard: Variant;
    function buildLineHtml(_arg: Variant): Variant;
    function updateScopeStack(line: Variant; scopeStack: Variant; desiredScopes: Variant): Variant;
    function pushScope(line: Variant; scopeStack: Variant; scope: Variant): Variant;
    function popScope(line: Variant; scopeStack: Variant): Variant;
    function buildEmptyLineHtml(showIndentGuide: Variant; eolInvisibles: Variant; htmlEolInvisibles: Variant; indentation: Variant; editor: Variant; mini: Variant): Variant;
    function replaceSelectedText(replaceFn: function(str: String): String): Variant;
    function consolidateSelections(e: Variant): Variant;
    function logCursorScope: Variant;
    function logScreenLines(start: Variant; &end: Variant): Variant;
    function logRenderedLines: Variant;
  end;

  JScrollView = class external 'ScrollView'(JView)
  end;

  JSelectListView = class external 'SelectListView'(JView)
    function content: Variant;
    maxItems: Float;
    scheduleTimeout: Variant;
    inputThrottle: Float;
    cancelling: Boolean;
    items: array of Variant;
    list: JJQuery;
    filterEditorView: JJQuery;
    previouslyFocusedElement: JJQuery;
    function initialize: Variant;
    function schedulePopulateList: Float;
    function setItems(items: array of Variant): Variant;
    function setError: Variant; overload;
    function setError(message: String): Variant; overload;
    function setLoading: Variant; overload;
    function setLoading(message: String): Variant; overload;
    function getFilterQuery: String;
    function populateList: Variant;
    function getEmptyMessage: String; overload;
    function getEmptyMessage(itemCount: Variant): String; overload;
    function getEmptyMessage(itemCount: Variant; filteredItemCount: Variant): String; overload;
    procedure setMaxItems(maxItems: Float);
    function selectPreviousItemView: Variant;
    function selectNextItemView: Variant;
    function selectItemView(view: Variant): Variant;
    function scrollToItemView(view: Variant): Variant;
    function getSelectedItemView: Variant;
    function getSelectedItem: Variant;
    function confirmSelection: Variant;
    function viewForItem(item: Variant): Variant {JJQuery or String or JHTMLElement or JView};
    function confirmed(item: Variant): Variant;
    function getFilterKey: Variant;
    function focusFilterEditor: Variant;
    function storeFocusedElement: Variant;
    function restoreFocus: Variant;
    function cancelled: Variant;
    function cancel: Variant;
  end;

  JISelectListItem = class external
    eventName: String;
    eventDescription: String;
  end;

(*
var
  $: Jtype of;
  $$: Jtype of;
  $$$: Jtype of;
  BufferedNodeProcess: JAtomCore.IBufferedNodeProcessStatic;
  BufferedProcess: JAtomCore.IBufferedProcessStatic;
  Git: JAtomCore.IGitStatic;
  Point: JTextBuffer.IPointStatic;
  Range: JTextBuffer.IRangeStatic;
  WorkspaceView: JAtomCore.IWorkspaceViewStatic;
  Task: JAtomCore.ITaskStatic;
  Workspace: JAtomCore.IWorkspaceStatic;
*)

type
  JWindow = class external
    atom: IAtom;
    function measure(description: String; fn: procedure): Variant;
    function profile(description: String; fn: procedure): Variant;
  end;
