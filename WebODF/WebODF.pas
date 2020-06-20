unit WebODF;

interface

uses
  ECMA.TypedArray, ECMA.Date, ECMA.RegEx, W3C.DOM4, W3C.HTML5, W3C.CSSOM, W3C.Geometry,
  W3C.TouchEvents;

type
  JOdfAnnotationElement = class external 'odf.AnnotationElement'
  end;

  TOdfSaveCallback = procedure(Value: String);
  TOdfDestroyCallback = procedure(Error: Variant);

  JOdfContainer = class external;

  TZipLoadCallback = procedure(data: Variant);

  JBase64 = class external 'core.Base64'
  public
    constructor Create;

    function decode(a: String): String;
    function encodeURI(u: String): String;
  end;

  JCSSUnits = class external 'core.Base64'
  public
    constructor Create;

    function convert(value: Float; oldUnit, newUnit: String): Float;
    function convertMeasure(measure: String; newUnit: String): Float;
    function getUnits(measure: String): String;
  end;

  JCursor = class external 'core.Cursor'
  public
    constructor Create(document: Variant; memberId: String);

    function getAnchorNode: JElement;
    function getEndNode: JNode;
    function getNode: JElement;
    function getSelectedRange: JRange;
    function getStartNode: JNode;
    function hasForwardSelection: Boolean;

    procedure putIntoTextNode(node: JNode; container: JText; offset: Integer);
    procedure putNode(node: JNode; container: JNode; offset: Integer);
    procedure remove;
    procedure removeNode(node: JNode);

    procedure setSelectedRange(range: JRange; isForwardSelection: Boolean);

  end;

  JEventNotifier = class external 'core.EventNotifier'
  public
    constructor Create(eventIds: array of String);

    procedure emit(eventId: String); overload;
    procedure emit(eventId: String; args: Variant); overload;
    procedure init;
    procedure register(eventId: String);

    procedure subscribe(eventId: String; callback: procedure);
    procedure unsubscribe(eventId: String; callback: procedure);
  end;

  JUtils = class external 'core.Utils'
  public
    function hashString(value: String): Integer;
    function mergeItems(destination, source: Variant): Variant;
  end;

  JZipEntry = class external
    filename: String;
  end;

  JZip = class external 'core.Zip'
  public
    constructor Create(url: String; entriesReadCallback: procedure(err: String; zipobject: JZip));

    procedure createByteArray(successCallback: procedure(ByteArray: JUInt8Array);
      errorCallback: procedure(error: String));

    function getEntries: array of JZipEntry;
    procedure load(filename: String; callback: TZipLoadCallback);
    procedure loadAsDataUrl(filename, mimetype: String; callback: TZipLoadCallback);
    procedure loadAsDOM(filename: String; callback: TZipLoadCallback);
    procedure loadAsString(filename: String; callback: procedure(data: String));
    procedure loadContentXmlAsFragments(filename: String; callback: procedure(data: String));

    function remove(filename: String): Boolean;
    procedure save(filename: String; data: JUInt8Array; compressed: Boolean; Date: JDate);

    procedure write(callback: procedure(data: String));
    procedure writeAs(newurl: String; callback: procedure(data: String));
  end;

  JOfCollapsingRules = class external
  public
    constructor Create(rootNode: JNode);

    function filterOdfNodesToRemove(Node: JNode): Integer;
    function isCollapsibleContainer(Node: JNode): Boolean;
    function mergeChildrenIntoParent(targetNode: JNode): JNode;
  end;

  JOdfElement = class external
  public
    constructor Create;
  end;

  JOdfDocumentElement = class external (JOdfElement)
  public
    constructor Create;

    automaticStyles: JElement;
    body: JElement;
    fontFaceDecls: JElement;
    manifest: JElement;
    masterStyles: JElement;
    meta: JElement;
    settings: JElement;
    styles: JElement;
  end;

  JOdfPart = class external
    const EMPTY = 0;
    const LOADING = 1;
    const DONE = 2;
  public
    constructor Create(name, mimetype: String; container: JOdfContainer; zip: JZip);

    size: Integer;
    &type: Variant;
    name: String;
    container: JOdfContainer;
    url: String;
    mimetype: String;
    document: Variant;
    onstatereadychange: procedure(Self: JOdfPart);
    state: Integer;
    data: String;

    procedure load;
  end;

  JOdfValueUnit = class external
    value: Integer;
    &unit: String;
  end;

  JOdfFontSize = JOdfValueUnit;

  JOdfStyleMetaData = class external
  public
    name: String;
    family: String;
    displayName: String;
    isCommonStyle: Boolean;
  end;

  JOdfStyleData = class external
  end;

  JOdfAppliedStyle = class external
  public
    orderedStyles: array of JOdfStyleMetaData;
    styleProperties: JOdfStyleData;
  end;

  JGuiStyleSummaryText = class external
  public
    function hasStrikeThrough: Boolean;
    function hasUnderline: Boolean;
    function isBold: Boolean;
    function isItalic: Boolean;
    function fontSize: Float;
    function fontName: String;
  end;

  JGuiStyleSummaryParagraph = class external
  public
    function isAlignedCenter: Boolean;
    function isAlignedJustified: Boolean;
    function isAlignedLeft: Boolean;
    function isAlignedRight: Boolean;
  end;

  JGuiStyleSummary = class external 'gui.StyleSummary'
  public
    constructor Create(styles: array of JOdfAppliedStyle);

    paragraph: JElement;
    text: JGuiStyleSummaryText;

    function hasStrikeThrough: Boolean;
    function hasUnderline: Boolean;
    function isBold: Boolean;
    function isItalic: Boolean;
    function fontSize: Float;
    function fontName: String;
    function isAlignedCenter: Boolean;
    function isAlignedJustified: Boolean;
    function isAlignedLeft: Boolean;
    function isAlignedRight: Boolean;

    function getCommonValue(section, propertyName: String): String;
    function getPropertyValues(section, propertyName: String): array of String;
    function lazilyLoaded(section, propertyName: String;
      acceptedPropertyValues: array of String): function: Boolean;
  end;

  JOdfLazyStyleProperties = class external 'odf.LazyStyleProperties'
  public
    constructor Create(parant, getters: Variant);
    procedure reset(p: Variant);
    function value(name: String): Variant;
  end;

  JOdfStyleParseUtils = class external 'odf.StyleParseUtils'
  public
    constructor Create;

    function getPropertiesElement(name: String; styleElement: JElement): JElement; overload;
    function getPropertiesElement(name: String; styleElement, previousPropertyElement: JElement): JElement; overload;
    function parseAttributeList(text: String): array of String;
    function parseLength(val: String): Float;
    function parsePercent(value: String): Float;
    function parsePositiveLengthOrPercent(value, name: String; parent: JOdfLazyStyleProperties): Float;
    function splitLength(lngth: String): JOdfValueUnit;
  end;

  JOdfGraphicProperties = class external
    constructor Create(element: JElement; styleParseUtils: JOdfStyleParseUtils; parent: JOdfGraphicProperties);

    function horizontalPos: String;
    function horizontalRel: String;
    function strokeWidth: Float;
    function verticalPos: String;
    function verticalRel: String;
  end;

  JOdfParagraphProperties = class external
    constructor Create(element: JElement; styleParseUtils: JOdfStyleParseUtils;
      parent: JOdfParagraphProperties);

    function marginTop: Float;
  end;

  JOdfTextProperties = class external
    constructor Create(element: JElement; styleParseUtils: JOdfStyleParseUtils;
      parent: JOdfTextProperties);

    function fontSize: Integer;
  end;

  JOdfComputedGraphicProperties = class external 'odf.ComputedGraphicProperties'
  public
    constructor Create;

    function horizontalPos: String;
    function horizontalRel: String;
    procedure setGraphicProperties(graphicProperties: JOdfGraphicProperties);
    function verticalPos: String;
    function verticalRel: String;
  end;

  JOdfComputedParagraphProperties = class external 'odf.ComputedParagraphProperties'
  public
    constructor Create;

    function marginTop: Float;
    procedure setStyleChain(newStyleChain: array of JOdfParagraphProperties);
    function value(name: String): Variant;
  end;

  JOdfComputedTextProperties = class external 'odf.ComputedTextProperties'
  public
    constructor Create;

    function fontSize: Integer;
    procedure setStyleChain(newStyleChain: array of JOdfTextProperties);
    function value(name: String): Variant;
  end;

  JOdfComputedGraphicStyle = class external 'odf.ComputedGraphicStyle'
  public
    graphic: JOdfComputedGraphicProperties;
    paragraph: JOdfComputedParagraphProperties;
    text: JOdfComputedTextProperties;
  end;

  JOdfComputedParagraphStyle = class external 'odf.ComputedParagraphStyle'
  public
    paragraph: JOdfComputedParagraphProperties;
    text: JOdfComputedTextProperties;
  end;

  JOdfComputedTextStyle = class external 'odf.ComputedTextStyle'
  public
    constructor Create;

    text: JOdfComputedTextProperties;
  end;

  JOdfPageLayoutProperties = class external 'odf.PageLayoutProperties'
  public
    constructor Create(element: JElement; styleParseUtils: JOdfStyleParseUtils; parent: JOdfPageLayoutProperties);

    function pageHeight: Float;
    function pageWidth: Float;
    function data: JOdfLazyStyleProperties;
  end;

  JOdfPageLayout = class external 'odf.PageLayout'
  public
    constructor Create(element: JElement; styleParseUtils: JOdfStyleParseUtils; parent: JOdfPageLayout);

    pageLayout: JOdfPageLayoutProperties;
  end;

  JOdfPageLayoutCache = class external 'odf.PageLayoutCache'
  end;

  JOdfMasterPage = class external 'odf.MasterPage'
  public
    constructor Create(element: JElement; pageLayoutCache: JOdfPageLayoutCache);

    pageLayout: JOdfPageLayout;
  end;

  JOdfMasterPageCache = class external 'odf.MasterPageCache'
  public
    constructor Create;
  end;

  JOdfStylePileEntry = class external 'odf.StylePileEntry'
  public
    constructor Create(Element: JElement; styleParseUtils: JOdfStyleParseUtils;
      masterPageCache: Variant; parent: JOdfStylePileEntry);

    graphic: JOdfComputedGraphicProperties;
    paragraph: JOdfComputedParagraphProperties;
    text: JOdfComputedTextProperties;

    procedure init(self: JOdfStylePileEntry);
    function masterPage: JOdfMasterPage;
  end;

  JOdfStylePile = class external 'odf.StylePile'
  public
    constructor Create(styleParseUtils: JOdfStyleParseUtils; masterPageCache: JOdfMasterPageCache);

    procedure addAutomaticStyle(style: JElement);
    procedure addCommonStyle(style: JElement);
    function getDefaultStyle: JOdfStylePileEntry;
    function getStyle(styleName: String): JOdfStylePileEntry;
    function parseStyle(element: JElement; visitedStyles: array of String): JOdfStylePileEntry;
    procedure setDefaultStyle(style: JElement);
  end;

  JOdfStyleCache = class external 'odf.StyleCache'
  protected
    procedure addMasterPage(element: JElement);
    procedure appendClassNames(family, ns: String; element: JElement; chain: array of String);
    function createPropertiesChain(styleChain: array of String; propertiesName: String; defaultFamily: String): array of Variant;
    function getParagraphStyleChain(element: JElement; chain: array of String): array of String;
    function getPileFromElement(element: JElement): JOdfStylePile;
    function getTextStyleChain(element: JElement; chain: array of String): array of String;
  public
    constructor Create(odfroot: JOdfDocumentElement);

    function getComputedGraphicStyle(element: JElement): JOdfComputedGraphicStyle;
    function getComputedParagraphStyle(element: JElement): JOdfComputedParagraphStyle;
    function getComputedTextStyle(element: JElement): JOdfComputedTextStyle;
    function getDefaultMasterPage: JOdfMasterPage;
    function getDefaultPageLayout: JOdfPageLayout;
    function getGraphicStyleChain(element: JElement; chain: array of String): array of String;
    function getMasterPage(name: String): JOdfMasterPage;
    function getPageLayout(name: String): JOdfPageLayout;

    procedure update;
  end;

  JOdfParagraphStyle = class external
    name: String;
    displayName: String;
  end;

  JOdfContentSize = class external
    width: Float;
    height: Float;
  end;

  JOdfFormatting = class external 'odf.Formatting'
  protected
    function lengthInPx(lngth, defaultValue: String): Float;
    function buildStyleChain(node: JNode): array of Variant; overload;
    function buildStyleChain(node: JNode; collectedChains: Variant): array of Variant; overload;
    function calculateAppliedStyle(styleChain: array of Variant): JOdfAppliedStyle;
  public
    constructor Create;

    function createDerivedStyleObject(parentStyleName, family: String; overrides: JOdfStyleData): JOdfStyleData;
    function getAppliedStyles(nodes: array of JNode; calculatedStylesCache: Variant): array of JOdfAppliedStyle;
    function getAppliedStylesForElement(node: JNode): JOdfAppliedStyle; overload;
    function getAppliedStylesForElement(node: JNode; calculatedStylesCache: Variant): JOdfAppliedStyle; overload;
    function getAvailableParagraphStyles: array of JOdfParagraphStyle;
    function getContentSize(styleName, styleFamily: String): JOdfContentSize;
    function getDefaultStyleElement(family: String): JElement;
    function getDefaultTabStopDistance: JOdfValueUnit;
    function getFirstCommonParentStyleNameOrSelf(styleName: String): String;
    function getFontMap: Variant;
    function getInheritedStyleAttributes(styleNode: JNode; includeSystemDefault: Boolean): JOdfStyleData;
    function getMasterPageElement(pageName: String): JElement;
    function getPageLayoutStyleElement(styleName, styleFamily: String): JElement;
    function getStyleAttributes(styleNode: JNode): JOdfStyleData;
    function getStyleElement(styleName, family: String): JElement; overload;
    function getStyleElement(styleName, family: String; styleElements: array of JElement): JElement; overload;
    function getSystemDefaultStyleAttributes(styleFamily: String): JOdfStyleData;
    function hasParagraphStyle(styleName: String): Boolean;
    function isCommonStyleElement(styleNode: JNode): Boolean;
    function isStyleUsed(styleElement: JElement): Boolean;
    procedure setOdfContainer(odfcontainer: JOdfContainer);
    procedure updateStyle(styleNode: JElement; properties: JOdfStyleData);
  end;

  JOdfNodeFilter = class external 'odf.OdfNodeFilter'
    constructor Create;

    procedure acceptNode(node: JNode);
  end;

  JOdfTextSerializer = class external 'odf.TextSerializer'
  public
    filter: JOdfNodeFilter;

    constructor Create;

    function serializeNode(node: JNode): String;
    function writeToString(node: JNode): String;
  end;

  JOdfUtilsImpl = class external 'odf.OdfUtilsImpl'
  public
    constructor Create;

    function firstChild(node: JNode): JNode;
    function getAnnotationCreator(annotationElement: JElement): String;
    function getHyperlinkElements(range: JRange): array of JNode;
    function getHyperlinkTarget(element: JElement): String;
    function getImageElements(range: JRange): array of JNode;
    function getNormalizedFontFamilyName(fontFamilyName: String): String;
    function getParagraphElement(node: JNode; offset: Integer): JElement;
    function getParagraphElements(range: JRange): array of JElement;
    function getParentAnnotation(node: JRange; container: JElement): JElement;
    function getRightNode(container: JElement; offset: Integer): JNode;
    function getTextElements(range: JRange; includePartial,
      includeInsignificantWhitespace: Boolean): array of JElement;
    function getTextNodes(range: JRange; includePartial: Boolean): array of JNode;
    function hasNoODFContent(node: JNode): Boolean;
    function isAnchoredAsCharacterElement(e: JNode): Boolean;
    function isAnnotation(e: JNode): Boolean;
    function isAnnotationWrapper(e: JNode): Boolean;
    function isCharacterElement(e: JElement): Boolean;
    function isCharacterFrame(e: JNode): Boolean;
    function isDowngradableSpaceElement(node: JNode): Boolean;
    function isFieldElement(n: JNode): Boolean;
    function isGroupingElement(n: JNode): Boolean;
    function isHyperlink(node: JNode): Boolean;
    function isImage(e: JNode): Boolean;
    function isInlineRoot(e: JNode): Boolean;
    function isLineBreak(e: JNode): Boolean;
    function isListItem(e: JNode): Boolean;
    function isODFNode(node: JNode): Boolean;
    function isODFWhitespace(text: String): Boolean;
    function isParagraph(e: JNode): Boolean;
    function isSignificantTextContent(textNode: JNode): Boolean;
    function isSignificantWhitespace(textNode: JNode; offset: Integer): Boolean;
    function isSpaceElement(e: JNode): Boolean;
    function isTextContentContainingNode(node: JNode): Boolean;
    function isTextSpan(e: JNode): Boolean;
    function isTrailingWhitespace(textnode: JNode; offset: Integer): Boolean;
    function isWithinAnnotation(node: JNode; container: JElement): Boolean;
    function lastChild(node: JNode): JNode;
    function lookLeftForCharacter(node: JNode): Integer;
    function lookRightForCharacter(node: JNode): Boolean;
    function nextNode(node: JNode): JNode;
    function parseFoFontSize(fontSize: String): JOdfFontSize;
    function parseFoLineHeight(lineHeight: String): JOdfValueUnit;
    function parseLength(lngth: String): JOdfValueUnit;
    function parseNonNegativeLength(lngth: String): JOdfValueUnit;
    function parsePercentage(lngth: String): JOdfValueUnit;
    function parsePositiveLength(lngth: String): JOdfValueUnit;
    function prependParentContainers(startContainer: JNode; elements: array of JElement; filter: function(Node: JNode): Boolean): JOdfValueUnit;
    function previousNode(node: JNode): JNode;
    procedure removePartiallyContainedNodes(range: JRange; nodes: array of JNode);
    function scanLeftForAnyCharacter(node: JNode): Boolean;
    function scanLeftForNonSpace(node: JNode): Boolean;
    function scanRightForAnyCharacter(node: JNode): Boolean;
  end;

  JOdfDocumentType = Integer;
  JOdfDocumentTypeHelper = strict helper for JOdfDocumentType
    const TEXT = 1;
    const TEXT_TEMPLATE = 2;
    const PRESENTATION = 3;
    const PRESENTATION_TEMPLATE = 4;
    const SPREADSHEET = 5;
    const SPREADSHEET_TEMPLATE = 6;
  end;

  JOdfStyleInfoStyleDefinition = class external 'odf.StyleInfo-StyleDefinition'
  public
    constructor Create(key, name, family: String) ; overload;
    key: String;
    name: String;
    family: String;
    requires: Boolean;
  end;

  JOdfStyleInfo = class external 'odf.StyleInfo'
  public
    constructor Create;
    procedure changeFontFaceNames(styleElement: JElement; fontFaceNameChangeMap: Variant);
    procedure collectUsedFontFaces(usedFontFaceDeclMap: Variant; styleElement: JElement);
    function determineDependentStyles(element: JElement; styleScope, knownStyles: Variant): Variant;
    function determineStylesForNode(element: JElement; usedStyles: Variant): Variant;
    procedure determineUsedStyles(styleUsingElementsRoot, usedStyles: Variant);
    function getStyleDefinition(stylename, stylefamily: String; knownStyles: Variant): Variant;
    function getStyleName(family: String; element: JElement): String;
    function hasDerivedStyles(odfbody: JElement; nsResolver: function(Value: String): String; styleElement: JElement): Boolean;
    function inverse: Variant;
    procedure mergeRequiredStyles(styleDependency: Variant; usedStyles: Variant);
    procedure mergeUsedAutomaticStyles(automaticStylesRoot: JElement; usedStyles: Variant);
    procedure prefixStyleName(styleElement: JElement; prefix: String);
    procedure prefixStyleNames(prefix: String); overload;
    procedure prefixStyleNames(prefix: String; styleUsingElementsRoot: JElement); overload;
    procedure prefixStyleNames(styleElementsRoot: JElement; prefix: String); overload;
    procedure prefixStyleNames(styleElementsRoot: JElement; prefix: String; styleUsingElementsRoot: JElement); overload;
    procedure prefixUsedStyleNames(element: JElement; prefix: String);
    procedure removePrefixFromStyleNames(prefix: String); overload;
    procedure removePrefixFromStyleNames(prefix: String; styleUsingElementsRoot: JElement); overload;
    procedure removePrefixFromStyleNames(styleElementsRoot: JElement; prefix: String); overload;
    procedure removePrefixFromStyleNames(styleElementsRoot: JElement; prefix: String; styleUsingElementsRoot: JElement); overload;
    procedure removeRegExpFromStyleName(styleElement: JElement; regExp: JRegExp);
    procedure removeRegExpFromUsedStyleNames(Element: JElement; regExp: JRegExp);
  end;

  JOdfStyleTreeNode = class external 'odf.StyleTreeNode'
    constructor Create(element: JElement);
    derivedStyles: Variant;
    element: JElement;
  end;

  JOdfStyleTree = class external 'odf.StyleTree'
  protected
    procedure addStyleMapToStyleTree(stylesMap, stylesTree: Variant);
    function createStyleTreeNode(styleName: String; stylesMap, stylesTree: Variant): JOdfStyleTreeNode;
    function findStyleTreeNode(stylesTree: Variant; name: String): JOdfStyleTreeNode;
    function getStyleMap(stylesNode: Variant): JElement;
  public
    constructor Create(styles, autoStyles: JElement);

    function getStyleTree: JOdfStyleTree;
  end;

  JOdfTextPosition = class external
    verticalTextPosition: String;
    fontHeight: String;
  end;

  JOdfRGB = class external
    r, g, b: Integer;
  end;

  JOdfStyle2CSS = class external 'odf.Style2CSS'
    constructor Create;

    procedure addDrawPageFrameDisplayRules(sheet: JCSSStyleSheet;
      styleName: String; properties: JElement; node: JOdfStyleTreeNode);
    procedure addPageStyleRules(sheet: JCSSStyleSheet; node: JElement);
    procedure addRule(sheet: JCSSStyleSheet; family, name: String; node: JElement);
    procedure addRules(sheet: JCSSStyleSheet; family, name: String; node: JElement);
    procedure addStyleRule(sheet: JCSSStyleSheet; family, name: String; node: JOdfStyleTreeNode);
    function applySimpleMapping(props: JElement; mapping: array of array of String): String;
    function createSelector(family, name: String): String;
    function fixBorderWidth(value: String): String;
    function fixMargin(props: JElement; namespace, name, value: String): String;
    function getDerivedStyleNames(styleName: String; node: JOdfStyleTreeNode): array of String;
    function getDrawingPageProperties(props: JElement): String;
    function getFontSize(styleNode: JElement): JOdfFontSize;
    function getGraphicProperties(props: JElement): String;
    function getParagraphProperties(props: JElement): String;
    function getParentStyleNode(styleNode: JElement): JElement;
    function getSelectors(family, name: String; node: JOdfStyleTreeNode): array of String;
    function getTableCellProperties(props: JElement): String;
    function getTableColumnProperties(props: JElement): String;
    function getTableProperties(props: JElement): String;
    function getTableRowProperties(props: JElement): String;
    function getTextProperties(props: JElement): String;
    function hexToRgb(hex: String): JOdfRGB;
    function isNumber(n: String): Boolean;
    function matchToRgb(m, r, g, b: String): String;
    function parseTextPosition(position: String): JOdfTextPosition;

    procedure style2css(doctype: String; rootNode: JElement;
      stylesheet: JCSSStyleSheet; fontFaceMap, styleTree: Variant);
  end;

  JOdfContainer = class external 'odf.OdfContainer'
  public
    constructor Create(urlOrType: String); overload;
    constructor Create(urlOrType: JOdfDocumentType); overload;
    constructor Create(urlOrType: String; onstatereadychange: procedure); overload;
    constructor Create(urlOrType: JOdfDocumentType; onstatereadychange: procedure); overload;

    rootElement: JODFDocumentElement;

    procedure cloneFontFaceDeclsUsedInStyles(fontFaceDeclsRootElement: JElement; stylesRootElementList: JStyleSheetList); //inner, yet unclear
(* TODO
    procedure cloneStylesInScope(stylesRootElement, scope); //inner
    procedure createByteArray(successCallback, errorCallback); //inner
*)
    function createDocumentElement(name: String): String; //inner
    procedure createElement(&type: JElement); //inner
    procedure createEmptyDocument(&type: JElement; isTemplate: Boolean); //inner
    procedure createManifestEntry(fullPath, mediaType: String); //inner
    procedure fillZip; //inner

    //procedure odf.OdfContainer.getContainer(url) ???

    function getContentElement: JElement;

    function getDocumentType: JOdfDocumentType;

    function getEnsuredMetaElement: JElement; //inner
    function getMetadata(metadataNs, metadataLocalName: String): Variant; //inner

    function getPart(partname: String): JOdfPart;

    procedure getPartData(url: String; callback: TZipLoadCallback);
    function getUrl: String;

    procedure handleContentXml(xmldoc: JXMLDocument); //inner
    procedure handleFlatXml(xmldoc: JXMLDocument); //inner
    procedure handleManifestXml(xmldoc: JXMLDocument); //inner
    procedure handleMetaXml(xmldoc: JXMLDocument); //inner
    procedure handleSettingsXml(xmldoc: JXMLDocument); //inner
    procedure handleStylesXml(xmldoc: JXMLDocument); //inner
    procedure importRootNode(xmldoc: JXMLDocument); //inner

    procedure incrementEditingCycles;

    procedure isTemplate;

    procedure linkAnnotationStartAndEndElements(rootElement: JElement); //inner

    procedure loadComponents; //inner
    procedure loadFromXML(url: String; callback: TZipLoadCallback); //inner
//    procedure loadNextComponent(remainingComponents); //inner
//    procedure mapByFontFaceName(fontFaceDecls); //inner
//    procedure mergeFontFaceDecls(targetFontFaceDeclsRootElement, sourceFontFaceDeclsRootElement); //inner

    procedure removeBlob(filename: String);

    procedure removeDangerousAttributes(element: JElement); //inner
    procedure removeDangerousElements(xmldoc: JXMLDocument); //inner
  end;

  JAnnotationViewManager = class external
  end;

  JOdfZoomHelper = class external
  public
    constructor Create;

    signalZoomChanged: String;

    procedure applyCSSTransform(x, y, scale: Float; is3D: Boolean);
    procedure applyDetailedTransform;
    procedure applyFastTransform;
    procedure applyTransform(is3D: Boolean);

    procedure destroy(callback: TOdfDestroyCallback);

    procedure enableScrollBars(enable: Boolean);

    function getPoint(touch: JTouch): JDOMPoint;

    function getZoomLevel: Float;

    procedure prepareGesture(event: JTouchEvent); // inner
    procedure processGesture(event: JTouchEvent); // inner

    procedure processPan(point: JDOMPoint); // inner
    procedure processPinch(point1, point2: JDOMPoint); // inner
    procedure processZoom(zoomPoint: JDOMPoint; incrementalZoom: Float); // inner

    procedure registerGestureListeners; // inner
    procedure removeScroll; // inner
    procedure restoreScroll; // inner

    procedure sanitizeGesture; // inner
    procedure sanitizePointForPan(point: JDOMPoint); // inner

    procedure setZoomableElement(element: JHTMLElement);
    procedure setZoomLevel(zoomLevel: Float);

    procedure subscribe(eventid: String; cb: procedure);
    procedure unregisterGestureListeners; // inner

    procedure unsubscribe(eventid: String; cb: procedure);
  end;

  JOdfViewport = class external
  end;

  JOdfSingleScrollViewport = class external (JOdfViewport)
  public
    constructor Create(scrollPane: JHtmlElement);

    function height(clientRect: JDOMRect): Float;
    function width(clientRect: JDOMRect): Float;
    procedure scrollIntoView(clientRect: JDOMRect; alighWithTop: Boolean);
    procedure shrinkClientRectByMargin(clientRect, margin: JDOMRect);
  end;

  JOdfCanvas = class external 'odf.OdfCanvas'
  public
    constructor Create(element: JHtmlElement); overload;
    constructor Create(element: JHtmlElement; viewport: Variant); overload;

    procedure addEventListener(eventType: String; eventHandler: JEventHandlerNonNull);
    procedure fixContainerSize;
    procedure fireEvent(eventType: String; args: array of Variant);
    procedure handleAnnotations(odfnode: JOdfDocumentElement);
    procedure handleContent(container: JOdfContainer; odfnode: JOdfDocumentElement);
    procedure load(url: String);
    procedure loadImages(container: JOdfContainer; odffragment: JElement; stylesheet: JCSSStyleSheet);
    procedure loadVideos(container: JOdfContainer; odffragment: JElement);
    procedure redrawContainer;
    procedure refreshOdf(suppressEvent: Boolean);

    procedure addAnnotation(annotation: JOdfAnnotationElement);
    procedure addCssForFrameWithImage(frame: JHTMLFrameElement);

    procedure addListener(eventName: String; handler: procedure);

    procedure destroy(callback: TOdfDestroyCallback);
    procedure enableAnnotations(allow, showRemoveButton: Boolean);

    procedure fitSmart(width, height: Float);
    procedure fitToContainingElement(width, height: Float);
    procedure fitToHeight(height: Float);
    procedure fitToWidth(width: Float);

    procedure forgetAnnotation(annotation: JOdfAnnotationElement);
    function getAnnotationViewManager: JAnnotationViewManager;
    function getElement: JHTMLElement;
    function getFormatting: JOdfFormatting;

    function getSizer: JHTMLElement;
    function getViewport: JOdfViewport;

    function getZoomHelper: JOdfZoomHelper;

    function getZoomLevel: Float;

    function odfContainer: JOdfContainer;

    procedure refreshAnnotations;

    procedure refreshCSS;
    procedure refreshSize;
    procedure rerenderAnnotations;

    procedure save(callback: TOdfSaveCallback);

    procedure setOdfContainer(container: JOdfContainer); overload;
    procedure setOdfContainer(container: JOdfContainer; suppressEvent: Boolean); overload;

    procedure setZoomLevel(zoom: Float);

    procedure showFirstPage;
    procedure showNextPage;
    procedure showPage(n: Integer);
    procedure showPreviousPage;
  end;

  function getPileFromElement(element: JElement): JOdfStylePile ; external 'odf.getPileFromElement';

var
  OdfUtils external 'odf.OdfUtils': JOdfUtilsImpl;

implementation

end.
