unit Pdf;

interface

uses
  W3C.Html5, W3C.TypedArray;

type
  JPDFTreeNode = class external
    title: String;
    bold: Boolean;
    italic: Boolean;
    color: array of Float;
    dest: Variant;
    items: array of JPDFTreeNode;
  end;

(*
  JPDFPromise{<T>} = class external
    function isResolved: Boolean;
    procedure resolve(value: JT);
    procedure reject(reason: String);
    function then(onResolve: procedure(promise: JT)): JPDFPromise{<JT>} overload;
    function then(onResolve: procedure(promise: JT); onReject: procedure(reason: String)): JPDFPromise{<JT>} overload;
  end;
*)

  JPDFInfo = class external
    PDFFormatVersion: String;
    IsAcroFormPresent: Boolean;
    IsXFAPresent: Boolean;
    // property Item[key: String]: Variant;
  end;

  JPDFMetadata = class external
    procedure parse;
    function get(name: String): String;
    function has(name: String): Boolean;
  end;

  JPDFSource = class external
    url: String; // nullable
    data: JUint8Array; // nullable
    httpHeaders: Variant; // nullable
    password: String; // nullable
  end;

  JPDFProgressData = class external
    loaded: Float;
    total: Float;
  end;

  JPDFRef = class external
    num: Float;
    gen: Variant;
  end;

  JPDFPageViewportOptions = class external
    viewBox: Variant;
    scale: Float;
    rotation: Float;
    offsetX: Float;
    offsetY: Float;
    dontFlip: Boolean;
  end;

  JPDFPageViewport = class external
    width: Float;
    height: Float;
    fontScale: Float;
    transforms: array of Float;
    function clone(options: JPDFPageViewportOptions): JPDFPageViewport;
    function convertToViewportPoint: array of Float;
    function convertToViewportRectangle: array of Float;
    function convertToPdfPoint: array of Float;
  end;

  JPDFAnnotationData = class external
    subtype: String;
    rect: array of Float;
    annotationFlags: Variant;
    color: array of Float;
    borderWidth: Float;
    hasAppearance: Boolean;
  end;

  JPDFViewerParams = class external
    container: JHTMLElement;
    viewer: JHTMLElement; // nullable
  end;

  JTextContentItem = class external
    str: String;
    transform: array of Float;
    width: Float;
    height: Float;
    dir: String;
    fontName: String;
  end;

  JTextContent = class external
    items: array of JTextContentItem;
    styles: Variant;
  end;

  JPDFObjects = class external
    function get(objId: Float): Variant; overload;
    function get(objId: Float; callback: Variant): Variant; overload;
    function resolve(objId: Float; data: Variant): Variant;
    function isResolved(objId: Float): Boolean;
    function hasData(objId: Float): Boolean;
    function getData(objId: Float): Variant;
    procedure clear;
  end;

  JPDFDocumentProxy = class external
    numPages: Float;
    fingerprint: String;
    function embeddedFontsUsed: Boolean;
    function getPage(number: Float): JPDFPromise{<JPDFPageProxy>};
    function getDestinations: JPDFPromise{<array of Variant>};
    function getJavaScript: JPDFPromise{<array of String>};
    function getOutline: JPDFPromise{<array of JPDFTreeNode>};
    function getMetadata: JPDFPromise{<record
      info: JPDFInfo;;
      metadata: JPDFMetadata;
    end;>};
    function isEncrypted: JPDFPromise{<Boolean>}
    function getData: JPDFPromise{<JUint8Array>}
    function dataLoaded: JPDFPromise{<array of Variant>}
    procedure destroy;
  end;

  JPDFAnnotations = class external
    function getData: JPDFAnnotationData
    function hasHtml: Boolean
    function getHtmlElement(commonOjbs: Variant): JHTMLElement
    function getEmptyContainer(tagName: String; rect: array of Float): JHTMLElement
    function isViewable: Boolean
    function loadResources(keys: Variant): JPDFPromise{<Variant>}
    function getOperatorList(evaluator: Variant): JPDFPromise{<Variant>}
  end;

  JPDFRenderTextLayer = class external
    procedure beginLayout
    procedure endLayout
    procedure appendText
  end;

  JPDFRenderImageLayer = class external
    procedure beginLayout
    procedure endLayout
    procedure appendImage
  end;

  JPDFRenderParams = class external
    canvasContext: JCanvasRenderingContext2D;
    textLayer: JPDFRenderTextLayer; // nullable
    imageLayer: JPDFRenderImageLayer; // nullable
    continueCallback: (_continue: ); // nullable
  end;

  JPDFRenderTask = class external(JPDFPromise {JPDFPageProxy} )
    procedure cancel;
  end;

  JPDFPageProxy = class external
    pageNumber: Float;
    rotate: Float;
    ref: JPDFRef;
    view: array of Float;
    function getViewport(scale: Float): JPDFPageViewport; overload;
    function getViewport(scale: Float; rotate: Float): JPDFPageViewport; overload;
    function getAnnotations: JPDFPromise{<JPDFAnnotations>};
    function render(params: JPDFRenderParams): JPDFRenderTask;
    function getTextContent: JPDFPromise{<JTextContent>};
    procedure destroy;
  end;

  JPDFJSStatic = class external
    maxImageSize: Float;
    cMapUrl: String;
    cMapPacked: Boolean;
    disableFontFace: Boolean;
    imageResourcesPath: String;
    disableWorker: Boolean;
    workerSrc: String;
    disableRange: Boolean;
    disableStream: Boolean;
    disableAutoFetch: Boolean;
    pdfBug: Boolean;
    postMessageTransfers: Boolean;
    disableCreateObjectURL: Boolean;
    disableWebGL: Boolean;
    disableFullscreen: Boolean;
    useOnlyCssZoom: Boolean;
    verbosity: Float;
    maxCanvasPixels: Float;
    openExternalLinksInNewWindow: Boolean;
    isEvalSupported: Boolean;
    function getDocument(source: String): JPDFPromise{<JPDFDocumentProxy>} overload;
    function getDocument(source: String; pdfDataRangeTransport: Variant): JPDFPromise{<JPDFDocumentProxy>} overload;
    function getDocument(source: String; pdfDataRangeTransport: Variant; passwordCallback: function(fn: (password: String); reason: String): String): JPDFPromise{<JPDFDocumentProxy>} overload;
    function getDocument(source: String; pdfDataRangeTransport: Variant; passwordCallback: function(fn: (password: String); reason: String): String; progressCallback: procedure(progressData: JPDFProgressData)): JPDFPromise{<JPDFDocumentProxy>} overload;
    function getDocument(source: JUint8Array): JPDFPromise{<JPDFDocumentProxy>} overload;
    function getDocument(source: JUint8Array; pdfDataRangeTransport: Variant): JPDFPromise{<JPDFDocumentProxy>} overload;
    function getDocument(source: JUint8Array; pdfDataRangeTransport: Variant; passwordCallback: function(fn: (password: String); reason: String): String): JPDFPromise{<JPDFDocumentProxy>} overload;
    function getDocument(source: JUint8Array; pdfDataRangeTransport: Variant; passwordCallback: function(fn: (password: String); reason: String): String; progressCallback: procedure(progressData: JPDFProgressData)): JPDFPromise{<JPDFDocumentProxy>} overload;
    function getDocument(source: JPDFSource): JPDFPromise{<JPDFDocumentProxy>} overload;
    function getDocument(source: JPDFSource; pdfDataRangeTransport: Variant): JPDFPromise{<JPDFDocumentProxy>} overload;
    function getDocument(source: JPDFSource; pdfDataRangeTransport: Variant; passwordCallback: function(fn: (password: String); reason: String): String): JPDFPromise{<JPDFDocumentProxy>} overload;
    function getDocument(source: JPDFSource; pdfDataRangeTransport: Variant; passwordCallback: function(fn: (password: String); reason: String): String; progressCallback: procedure(progressData: JPDFProgressData)): JPDFPromise{<JPDFDocumentProxy>} overload;
    procedure PDFViewer(params: JPDFViewerParams)
  end;

PDFJS: JPDFJSStatic;
//"PDFJS"


