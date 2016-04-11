unit Plottable;

interface

type
  JSet = class external 'Plottable.Utils.Set'
    size: Float;
    constructor Create;
    function add(value: JT): JSet{<JT>}
    function delete(value: JT): Boolean
    function has(value: JT): Boolean
    procedure forEach(callback: procedure(value: JT; value2: JT; set: JSet{<JT>})) overload;
    procedure forEach(callback: procedure(value: JT; value2: JT; set: JSet{<JT>}); thisArg: Variant) overload;
  end;

  JMap = class external 'Plottable.Utils.Map'
    constructor Create;
    function set(key: JK; value: JV): JMap{<JKJV>}
    function get(key: JK): JV
    function has(key: JK): Boolean
    procedure forEach(callbackFn: procedure(value: JV; key: JK; map: JMap{<JKJV>})) overload;
    procedure forEach(callbackFn: procedure(value: JV; key: JK; map: JMap{<JKJV>}); thisArg: Variant) overload;
    function delete(key: JK): Boolean
  end;



function inRange(x: Float; a: Float; b: Float): Boolean; external 'Plottable.Utils.Math.inRange';
function clamp(x: Float; min: Float; max: Float): Float; external 'Plottable.Utils.Math.clamp';
function max(&array: array of JC; defaultValue: JC): JC; overload; external 'Plottable.Utils.Math.max';
function max(&array: array of JT; accessor: function(t: JT; i: Float): JC; defaultValue: JC): JC; external 'Plottable.Utils.Math.max';
function min(&array: array of JC; defaultValue: JC): JC; external 'Plottable.Utils.Math.min';
function min(&array: array of JT; accessor: function(t: JT; i: Float): JC; defaultValue: JC): JC; external 'Plottable.Utils.Math.min';
function isNaN(n: Variant): Boolean; external 'Plottable.Utils.Math.isNaN';
function isValidNumber(n: Variant): Boolean; external 'Plottable.Utils.Math.isValidNumber';
function range(start: Float; stop: Float): array of Float; overload; external 'Plottable.Utils.Math.range';
function range(start: Float; stop: Float; step: Float): array of Float; overload; external 'Plottable.Utils.Math.range';
function distanceSquared(p1, p2: JPoint): Float; external 'Plottable.Utils.Math.distanceSquared';

//Plottable

//Utils

//DOM

function elementBBox(element: Jd3.Selection{<Variant>}): JSVGRect;
procedure requestAnimationFramePolyfill(callback: procedure);
function elementWidth(element: JElement): Float;
function elementHeight(element: JElement): Float;
function translate(selection: Jd3.Selection{<Variant>}): TupletType;
function translate(selection: Jd3.Selection{<Variant>}; x: Float; y: Float): Jd3.Selection{<Variant>};
function clientRectsOverlap(clientRectA: JClientRect; clientRectB: JClientRect): Boolean;
function clientRectInside(innerClientRect: JClientRect; outerClientRect: JClientRect): Boolean;
function boundingSVG(element: JSVGElement): JSVGElement;
function generateUniqueClipPathId: String;
function intersectsBBox(xValOrRange: Variant {Float or JRange}; yValOrRange: Variant {Float or JRange}; bbox: JSVGRect): Boolean; overload;
function intersectsBBox(xValOrRange: Variant {Float or JRange}; yValOrRange: Variant {Float or JRange}; bbox: JSVGRect; tolerance: Float): Boolean; overload;

var
  SCREEN_REFRESH_RATE_MILLISECONDS: Float;


//Plottable

//Utils

//Color

function contrast(a: String; b: String): Float;
function lightenColor(color: String; factor: Float): String;
function colorTest(colorTester: Jd3.Selection{<Variant>}; className: String): String;




//Plottable

//Utils

//Array

function add(aList: array of Float; bList: array of Float): array of Float;
function uniq(arr: array of JT): array of JT;
function flatten(a: array of array of JT): array of JT;
function createFilledArray(value: Variant {JT or (index: Float): JT}; count: Float): array of JT;




//Plottable

//Utils

type
  JCallbackSet = class external 'CallbackSet'(JSet {JCB} )
    function callCallbacks(args: array of Variant): JCallbackSet{<JCB>}
  end;



//Plottable

//Utils

//Stacking

function stack(datasets: array of JDataset; keyAccessor: JAccessor{<Variant>}; valueAccessor: JAccessor{<Float>}): JStackingResult;
function stackedExtent(stackingResult: JStackingResult; keyAccessor: JAccessor{<Variant>}; filter: JAccessor{<Boolean>}): array of Float;
function normalizeKey(key: Variant): String;




//Plottable

//Utils

//Window

procedure warn(warning: String);
function setTimeout(f: JFunction; time: Float; args: array of Variant): Float;
procedure deprecated(callingMethod: String; version: String); overload;
procedure deprecated(callingMethod: String; version: String; message: String); overload;




//Plottable

//Utils

type
  JClientToSVGTranslator = class external 'ClientToSVGTranslator'
    function getTranslator(elem: JSVGElement): JClientToSVGTranslator
    constructor Create(svg: JSVGElement);
    function computePosition(clientX: Float; clientY: Float): JPoint
    function insideSVG(e: JEvent): Boolean
  end;



//Plottable

//Configs

var
  SHOW_WARNINGS: Boolean;



//Plottable

var
  version: String;


//Plottable

type
  JDataset = class external 'Dataset'
    constructor Create(data: array of Variant; metadata: Variant);
    function onUpdate(callback: JDatasetCallback): JDataset
    function offUpdate(callback: JDatasetCallback): JDataset
    function data: array of Variant
    function data(data: array of Variant): JDataset
    function metadata: Variant
    function metadata(metadata: Variant): JDataset
  end;

  DatasetCallback = (dataset: JDataset);

//Plottable

//RenderPolicies

type
  JImmediate = class external 'Immediate'
    procedure render
  end;

  JAnimationFrame = class external 'AnimationFrame'
    procedure render
  end;

  JTimeout = class external 'Timeout'
    procedure render
  end;

  JRenderPolicy = class external
    function render: Variant
  end;



//Plottable

//RenderController

//Policy

var
  IMMEDIATE: String;
  ANIMATION_FRAME: String;
  TIMEOUT: String;


function renderPolicy: JRenderPolicies.RenderPolicy;
procedure renderPolicy(renderPolicy: String);
procedure registerToRender(component: JComponent);
procedure registerToComputeLayout(component: JComponent);
procedure flush;



//Plottable

type
  JAccessor{<T>} = class external
    function(datum: Variant; index: Float; dataset: JDataset): JT;
  end;

  JEntity{<C extends JComponent>} = class external
    datum: Variant;
    position: JPoint;
    selection: Jd3.Selection{<Variant>};
    component: JC;
  end;

  Projector = (datum: Variant; index: Float; dataset: JDataset): Variant;
  AttributeToProjector =     // property Item[attr: String]: JProjector;
  end;;
  AppliedProjector = (datum: Variant; index: Float): Variant;
  AttributeToAppliedProjector =     // property Item[attr: String]: JAppliedProjector;
  end;;
  SpaceRequest =     minWidth: Float;
    minHeight: Float;
  end;;
  Range =     min: Float;
    max: Float;
  end;;
  Point =     x: Float;
    y: Float;
  end;;
  Bounds =     topLeft: JPoint;
    bottomRight: JPoint;
  end;;

//Plottable

//Formatters

function currency: (d: Variant): String; overload;
function currency(precision: Float): (d: Variant): String; overload;
function currency(precision: Float; symbol: String): (d: Variant): String; overload;
function currency(precision: Float; symbol: String; prefix: Boolean): (d: Variant): String; overload;
function fixed: (d: Variant): String; overload;
function fixed(precision: Float): (d: Variant): String; overload;
function general: (d: Variant): String; overload;
function general(precision: Float): (d: Variant): String; overload;
function identity: (d: Variant): String;
function percentage: (d: Variant): String; overload;
function percentage(precision: Float): (d: Variant): String; overload;
function siSuffix: (d: Variant): String; overload;
function siSuffix(precision: Float): (d: Variant): String; overload;
function multiTime: (d: Variant): String;
function time(specifier: String): JFormatter;
function relativeDate: (d: Variant): String; overload;
function relativeDate(baseValue: Float): (d: Variant): String; overload;
function relativeDate(baseValue: Float; increment: Float): (d: Variant): String; overload;
function relativeDate(baseValue: Float; increment: Float; &label: String): (d: Variant): String; overload;


var
  MILLISECONDS_IN_ONE_DAY: Float;


//Plottable

//SymbolFactories

function circle: JSymbolFactory;
function square: JSymbolFactory;
function cross: JSymbolFactory;
function diamond: JSymbolFactory;
function triangleUp: JSymbolFactory;
function triangleDown: JSymbolFactory;



//Plottable

type
  JScale = class external 'Scale'
    constructor Create;
    function extentOfValues(values: array of JD): array of JD
    function _getAllIncludedValues: array of JD
    function _getExtent: array of JD
    function onUpdate(callback: JScaleCallback{<JScale{<JDJR>}>}): JScale{<JDJR>}
    function offUpdate(callback: JScaleCallback{<JScale{<JDJR>}>}): JScale{<JDJR>}
    procedure _dispatchUpdate
    function autoDomain: JScale{<JDJR>}
    procedure _autoDomainIfAutomaticMode
    function scale(value: JD): JR
    function domain: array of JD
    function domain(values: array of JD): JScale{<JDJR>}
    procedure _getDomain
    procedure _setDomain(values: array of JD)
    procedure _setBackingScaleDomain(values: array of JD)
    function range: array of JR
    function range(values: array of JR): JScale{<JDJR>}
    procedure _getRange
    procedure _setRange(values: array of JR)
    function addIncludedValuesProvider(provider: JScales.IncludedValuesProvider{<JD>}): JScale{<JDJR>}
    function removeIncludedValuesProvider(provider: JScales.IncludedValuesProvider{<JD>}): JScale{<JDJR>}
  end;

  JScaleCallback{<S extends JScale{<VariantVariant>}>} = class external
    function(scale: JS): Variant;
  end;

//Scales

type
  JIncludedValuesProvider{<D>} = class external
    function(scale: JScale{<JDVariant>}): array of JD;
  end;

  JPaddingExceptionsProvider{<D>} = class external
    function(scale: JQuantitativeScale{<JD>}): array of JD;
  end;



//Plottable

type
  JQuantitativeScale = class external 'QuantitativeScale'(JScale {JD, Float} )
    _DEFAULT_NUM_TICKS: Float;
    constructor Create;
    function autoDomain: JQuantitativeScale{<JD>}
    procedure _autoDomainIfAutomaticMode
    function _getExtent: array of JD
    function addPaddingExceptionsProvider(provider: JScales.PaddingExceptionsProvider{<JD>}): JQuantitativeScale{<JD>}
    function removePaddingExceptionsProvider(provider: JScales.PaddingExceptionsProvider{<JD>}): JQuantitativeScale{<JD>}
    function padProportion: Float
    function padProportion(padProportion: Float): JQuantitativeScale{<JD>}
    function _expandSingleValueDomain(singleValueDomain: array of JD): array of JD
    function invert(value: Float): JD
    function domain: array of JD
    function domain(values: array of JD): JQuantitativeScale{<JD>}
    function domainMin: JD
    function domainMin(domainMin: JD): JQuantitativeScale{<JD>}
    function domainMax: JD
    function domainMax(domainMax: JD): JQuantitativeScale{<JD>}
    function extentOfValues(values: array of JD): array of JD
    procedure _setDomain(values: array of JD)
    function defaultTicks: array of JD
    function ticks: array of JD
    function _niceDomain(domain: array of JD): array of JD overload;
    function _niceDomain(domain: array of JD; count: Float): array of JD overload;
    function _defaultExtent: array of JD
    function tickGenerator: JScales.TickGenerators.TickGenerator{<JD>}
    function tickGenerator(generator: JScales.TickGenerators.TickGenerator{<JD>}): JQuantitativeScale{<JD>}
  end;


//Plottable

//Scales

type
  JLinear = class external 'Linear'(JQuantitativeScale {Float} )
    constructor Create;
    function _defaultExtent: array of Float
    function _expandSingleValueDomain(singleValueDomain: array of Float): array of Float
    function scale(value: Float): Float
    function _getDomain: array of Float
    procedure _setBackingScaleDomain(values: array of Float)
    function _getRange: array of Float
    procedure _setRange(values: array of Float)
    function invert(value: Float): Float
    function defaultTicks: array of Float
    function _niceDomain(domain: array of Float): array of Float overload;
    function _niceDomain(domain: array of Float; count: Float): array of Float overload;
  end;



//Plottable

//Scales

type
  JModifiedLog = class external 'ModifiedLog'(JQuantitativeScale {Float} )
    constructor Create(base: Float);
    function scale(x: Float): Float
    function invert(x: Float): Float
    function _getDomain: array of Float
    procedure _setDomain(values: array of Float)
    procedure _setBackingScaleDomain(values: array of Float)
    function ticks: array of Float
    function _niceDomain(domain: array of Float): array of Float overload;
    function _niceDomain(domain: array of Float; count: Float): array of Float overload;
    function _defaultExtent: array of Float
    function _expandSingleValueDomain(singleValueDomain: array of Float): array of Float
    function _getRange: array of Float
    procedure _setRange(values: array of Float)
    function defaultTicks: array of Float
  end;



//Plottable

//Scales

type
  JCategory = class external 'Category'(JScale {String, Float} )
    constructor Create;
    function extentOfValues(values: array of String): array of String
    function _getExtent: array of String
    function domain: array of String
    function domain(values: array of String): JCategory
    procedure _setDomain(values: array of String)
    function range: TupletType
    function range(values: TupletType): JCategory
    function rangeBand: Float
    function stepWidth: Float
    function innerPadding: Float
    function innerPadding(innerPadding: Float): JCategory
    function outerPadding: Float
    function outerPadding(outerPadding: Float): JCategory
    function scale(value: String): Float
    function _getDomain: array of String
    procedure _setBackingScaleDomain(values: array of String)
    function _getRange: array of Float
    procedure _setRange(values: array of Float)
  end;



//Plottable

//Scales

type
  JColor = class external 'Color'(JScale {String, String} )
    constructor Create(scaleType: String);
    function extentOfValues(values: array of String): array of String
    function _getExtent: array of String
    procedure invalidateColorCache
    function scale(value: String): String
    function _getDomain: array of String
    procedure _setBackingScaleDomain(values: array of String)
    function _getRange: array of String
    procedure _setRange(values: array of String)
  end;



//Plottable

//Scales

type
  JTime = class external 'Time'(JQuantitativeScale {JDate} )
    constructor Create;
    function tickInterval(interval: String): array of JDate overload;
    function tickInterval(interval: String; step: Float): array of JDate overload;
    procedure _setDomain(values: array of JDate)
    function _defaultExtent: array of JDate
    function _expandSingleValueDomain(singleValueDomain: array of JDate): array of JDate
    function scale(value: JDate): Float
    function _getDomain: array of JDate
    procedure _setBackingScaleDomain(values: array of JDate)
    function _getRange: array of Float
    procedure _setRange(values: array of Float)
    function invert(value: Float): JDate
    function defaultTicks: array of JDate
    function _niceDomain(domain: array of JDate): array of JDate
    function timeIntervalToD3Time(timeInterval: String): Jd3.time.Interval
  end;



//Plottable

//Scales

type
  JInterpolatedColor = class external 'InterpolatedColor'(JScale {Float, String} )
    REDS: array of String;
    BLUES: array of String;
    POSNEG: array of String;
    constructor Create(scaleType: String);
    function extentOfValues(values: array of Float): array of Float
    function autoDomain: JInterpolatedColor
    function scale(value: Float): String
    function _getDomain: array of Float
    procedure _setBackingScaleDomain(values: array of Float)
    function _getRange: array of String
    procedure _setRange(range: array of String)
  end;



//Plottable

//Scales

//TickGenerators

type
  JTickGenerator{<D>} = class external
    function(scale: JPlottable.QuantitativeScale{<JD>}): array of JD;
  end;

function intervalTickGenerator(interval: Float): JTickGenerator{<Float>};
function integerTickGenerator: JTickGenerator{<Float>};




//Plottable

type
  JDrawer = class external 'Drawer'
    _svgElementName: String;
    _className: String;
    constructor Create(dataset: JDataset);
    function renderArea: Jd3.Selection{<Variant>}
    function renderArea(area: Jd3.Selection{<Variant>}): JDrawer
    procedure remove
    procedure _applyDefaultAttributes(selection: Jd3.Selection{<Variant>})
    function totalDrawTime(data: array of Variant; drawSteps: array of JDrawers.DrawStep): Float
    function draw(data: array of Variant; drawSteps: array of JDrawers.DrawStep): JDrawer
    function selection: Jd3.Selection{<Variant>}
    function selector: String
    function selectionForIndex(index: Float): Jd3.Selection{<Variant>}
  end;

//Drawers



//Plottable

//Drawers

type
  JLine = class external 'Line'(JDrawer)
    constructor Create(dataset: JDataset);
    procedure _applyDefaultAttributes(selection: Jd3.Selection{<Variant>})
    function selectionForIndex(index: Float): Jd3.Selection{<Variant>}
  end;



//Plottable

//Drawers

type
  JArea = class external 'Area'(JDrawer)
    constructor Create(dataset: JDataset);
    procedure _applyDefaultAttributes(selection: Jd3.Selection{<Variant>})
    function selectionForIndex(index: Float): Jd3.Selection{<Variant>}
  end;



//Plottable

//Drawers

type
  JRectangle = class external 'Rectangle'(JDrawer)
    constructor Create(dataset: JDataset);
  end;



//Plottable

//Drawers

type
  JArc = class external 'Arc'(JDrawer)
    constructor Create(dataset: JDataset);
  end;



//Plottable

//Drawers

type
  JSymbol = class external 'Symbol'(JDrawer)
    constructor Create(dataset: JDataset);
  end;



//Plottable

//Drawers

type
  JSegment = class external 'Segment'(JDrawer)
    constructor Create(dataset: JDataset);
  end;



//Plottable

type
  JComponent = class external 'Component'
    _boundingBox: Jd3.Selection{<Variant>};
    _clipPathEnabled: Boolean;
    _isSetup: Boolean;
    _isAnchored: Boolean;
    constructor Create;
    function anchor(selection: Jd3.Selection{<Variant>}): JComponent
    function onAnchor(callback: JComponentCallback): JComponent
    function offAnchor(callback: JComponentCallback): JComponent
    procedure _setup
    function requestedSpace(availableWidth: Float; availableHeight: Float): JSpaceRequest
    function computeLayout: JComponent overload;
    function computeLayout(origin: JPoint): JComponent overload;
    function computeLayout(origin: JPoint; availableWidth: Float): JComponent overload;
    function computeLayout(origin: JPoint; availableWidth: Float; availableHeight: Float): JComponent overload;
    function _sizeFromOffer(availableWidth: Float; availableHeight: Float):       width: Float;
      height: Float;
    end;
    function render: JComponent
    function renderImmediately: JComponent
    function redraw: JComponent
    function renderTo(element: Variant {JString or Jd3.Selection{<Variant>}}): JComponent
    function xAlignment: String
    function xAlignment(xAlignment: String): JComponent
    function yAlignment: String
    function yAlignment(yAlignment: String): JComponent
    function hasClass(cssClass: String): Boolean
    function addClass(cssClass: String): JComponent
    function removeClass(cssClass: String): JComponent
    function fixedWidth: Boolean
    function fixedHeight: Boolean
    function detach: JComponent
    function onDetach(callback: JComponentCallback): JComponent
    function offDetach(callback: JComponentCallback): JComponent
    function parent: JComponentContainer
    function parent(parent: JComponentContainer): JComponent
    procedure destroy
    function width: Float
    function height: Float
    function origin: JPoint
    function originToSVG: JPoint
    function foreground: Jd3.Selection{<Variant>}
    function content: Jd3.Selection{<Variant>}
    function background: Jd3.Selection{<Variant>}
  end;

  ComponentCallback = (component: JComponent);
//Components

type
  JAlignment = class external 'Alignment'
    TOP: String;
    BOTTOM: String;
    LEFT: String;
    RIGHT: String;
    CENTER: String;
  end;



//Plottable

type
  JComponentContainer = class external 'ComponentContainer'(JComponent)
    constructor Create;
    function anchor(selection: Jd3.Selection{<Variant>}): JComponentContainer
    function render: JComponentContainer
    function has(component: JComponent): Boolean
    procedure _adoptAndAnchor(component: JComponent)
    function remove(component: JComponent): JComponentContainer
    function _remove(component: JComponent): Boolean
    procedure _forEach(callback: procedure(component: JComponent))
    procedure destroy
  end;


//Plottable

//Components

type
  JGroup = class external 'Group'(JComponentContainer)
    constructor Create(components: array of JComponent);
    procedure _forEach(callback: function(component: JComponent): Variant)
    function has(component: JComponent): Boolean
    function requestedSpace(offeredWidth: Float; offeredHeight: Float): JSpaceRequest
    function computeLayout: JGroup overload;
    function computeLayout(origin: JPoint): JGroup overload;
    function computeLayout(origin: JPoint; availableWidth: Float): JGroup overload;
    function computeLayout(origin: JPoint; availableWidth: Float; availableHeight: Float): JGroup overload;
    function _sizeFromOffer(availableWidth: Float; availableHeight: Float):       width: Float;
      height: Float;
    end;
    function fixedWidth: Boolean
    function fixedHeight: Boolean
    function components: array of JComponent
    function append(component: JComponent): JGroup
    function _remove(component: JComponent): Boolean
  end;



//Plottable

type
  JAxis = class external 'Axis'(JComponent)
    END_TICK_MARK_CLASS: String;
    TICK_MARK_CLASS: String;
    TICK_LABEL_CLASS: String;
    _tickMarkContainer: Jd3.Selection{<Variant>};
    _tickLabelContainer: Jd3.Selection{<Variant>};
    _baseline: Jd3.Selection{<Variant>};
    _scale: JScale{<JDFloat>};
    _computedWidth: Float;
    _computedHeight: Float;
    constructor Create(scale: JScale{<JDFloat>}; orientation: String);
    procedure destroy
    function _isHorizontal: Boolean
    function _computeWidth: Float
    function _computeHeight: Float
    function requestedSpace(offeredWidth: Float; offeredHeight: Float): JSpaceRequest
    function fixedHeight: Boolean
    function fixedWidth: Boolean
    procedure _rescale
    function computeLayout: JAxis{<JD>} overload;
    function computeLayout(origin: JPoint): JAxis{<JD>} overload;
    function computeLayout(origin: JPoint; availableWidth: Float): JAxis{<JD>} overload;
    function computeLayout(origin: JPoint; availableWidth: Float; availableHeight: Float): JAxis{<JD>} overload;
    procedure _setup
    function _getTickValues: array of JD
    function renderImmediately: JAxis{<JD>}
    function _generateBaselineAttrHash:       // property Item[key: String]: Float;
    end;
    function _generateTickMarkAttrHash:       // property Item[key: String]: Variant {Float or (d: Variant): Float};
    end; overload;
    function _generateTickMarkAttrHash(isEndTickMark: Boolean):       // property Item[key: String]: Variant {Float or (d: Variant): Float};
    end; overload;
    function redraw: JComponent
    procedure _setDefaultAlignment
    function formatter: JFormatter
    function formatter(formatter: JFormatter): JAxis{<JD>}
    function tickLength: Float
    function tickLength(_length: Float): JAxis{<JD>}
    function innerTickLength: Float
    function innerTickLength(_length: Float): JAxis{<JD>}
    function endTickLength: Float
    function endTickLength(_length: Float): JAxis{<JD>}
    function _maxLabelTickLength: Float
    function tickLabelPadding: Float
    function tickLabelPadding(padding: Float): JAxis{<JD>}
    function margin: Float
    function margin(size: Float): JAxis{<JD>}
    function orientation: String
    function orientation(orientation: String): JAxis{<JD>}
    function showEndTickLabels: Boolean
    function showEndTickLabels(show: Boolean): JAxis{<JD>}
  end;


//Plottable

//TimeInterval

var
  second: String;
  minute: String;
  hour: String;
  day: String;
  week: String;
  month: String;
  year: String;


//Axes

type
  JTime = class external 'Time'(JAxis {JDate} )
    TIME_AXIS_TIER_CLASS: String;
    constructor Create(scale: JScales.Time; orientation: String);
    function tierLabelPositions: array of String
    function tierLabelPositions(newPositions: array of String): JTime
    function axisConfigurations: array of JTimeAxisConfiguration
    function axisConfigurations(configurations: array of JTimeAxisConfiguration): JTime
    function orientation: String
    function orientation(orientation: String): JTime
    function _computeHeight: Float
    function _sizeFromOffer(availableWidth: Float; availableHeight: Float):       width: Float;
      height: Float;
    end;
    procedure _setup
    function _getTickValues: array of Variant
    function renderImmediately: JTime
  end;

  TimeAxisTierConfiguration =     interval: String;
    step: Float;
    formatter: JFormatter;
  end;;
  TimeAxisConfiguration = array of JTimeAxisTierConfiguration;


//Plottable

//Axes

type
  JNumeric = class external 'Numeric'(JAxis {Float} )
    constructor Create(scale: JQuantitativeScale{<Float>}; orientation: String);
    procedure _setup
    function _computeWidth: Float
    function _computeHeight: Float
    function _getTickValues: array of Float
    procedure _rescale
    function renderImmediately: JNumeric
    function tickLabelPosition: String
    function tickLabelPosition(position: String): JNumeric
  end;



//Plottable

//Axes

type
  JCategory = class external 'Category'(JAxis {String} )
    constructor Create(scale: JScales.Category; orientation: String);
    procedure _setup
    function _rescale: JComponent
    function requestedSpace(offeredWidth: Float; offeredHeight: Float): JSpaceRequest
    function _getTickValues: array of String
    function tickLabelAngle: Float
    function tickLabelAngle(angle: Float): JCategory
    function renderImmediately: JCategory
    function computeLayout: JAxis{<String>} overload;
    function computeLayout(origin: JPoint): JAxis{<String>} overload;
    function computeLayout(origin: JPoint; availableWidth: Float): JAxis{<String>} overload;
    function computeLayout(origin: JPoint; availableWidth: Float; availableHeight: Float): JAxis{<String>} overload;
  end;



//Plottable

//Components

type
  JLabel = class external 'Label'(JComponent)
    constructor Create(displayText: String; angle: Float);
    function requestedSpace(offeredWidth: Float; offeredHeight: Float): JSpaceRequest
    procedure _setup
    function text: String
    function text(displayText: String): JLabel
    function angle: Float
    function angle(angle: Float): JLabel
    function padding: Float
    function padding(padAmount: Float): JLabel
    function fixedWidth: Boolean
    function fixedHeight: Boolean
    function renderImmediately: JLabel
  end;

  JTitleLabel = class external 'TitleLabel'(JLabel)
    TITLE_LABEL_CLASS: String;
    constructor Create(text: String; angle: Float);
  end;

  JAxisLabel = class external 'AxisLabel'(JLabel)
    AXIS_LABEL_CLASS: String;
    constructor Create(text: String; angle: Float);
  end;



//Plottable

//Components

type
  JLegend = class external 'Legend'(JComponent)
    LEGEND_ROW_CLASS: String;
    LEGEND_ENTRY_CLASS: String;
    LEGEND_SYMBOL_CLASS: String;
    constructor Create(colorScale: JScales.Color);
    procedure _setup
    function maxEntriesPerRow: Float
    function maxEntriesPerRow(maxEntriesPerRow: Float): JLegend
    function comparator: (a: String; b: String): Float
    function comparator(comparator: function(a: String; b: String): Float): JLegend
    function colorScale: JScales.Color
    function colorScale(colorScale: JScales.Color): JLegend
    procedure destroy
    function requestedSpace(offeredWidth: Float; offeredHeight: Float): JSpaceRequest
    function entitiesAt(p: JPoint): array of JEntity{<JLegend>}
    function renderImmediately: JLegend
    function symbol: (datum: Variant; index: Float): JSymbolFactory
    function symbol(symbol: function(datum: Variant; index: Float): JSymbolFactory): JLegend
    function fixedWidth: Boolean
    function fixedHeight: Boolean
  end;



//Plottable

//Components

type
  JInterpolatedColorLegend = class external 'InterpolatedColorLegend'(JComponent)
    LEGEND_LABEL_CLASS: String;
    constructor Create(interpolatedColorScale: JScales.InterpolatedColor);
    procedure destroy
    function formatter: JFormatter
    function formatter(formatter: JFormatter): JInterpolatedColorLegend
    function orientation: String
    function orientation(orientation: String): JInterpolatedColorLegend
    function fixedWidth: Boolean
    function fixedHeight: Boolean
    procedure _setup
    function requestedSpace(offeredWidth: Float; offeredHeight: Float): JSpaceRequest
    function renderImmediately: JInterpolatedColorLegend
  end;



//Plottable

//Components

type
  JGridlines = class external 'Gridlines'(JComponent)
    constructor Create(xScale: JQuantitativeScale{<Variant>}; yScale: JQuantitativeScale{<Variant>});
    function destroy: JGridlines
    procedure _setup
    function renderImmediately: JGridlines
  end;



//Plottable

//Components

type
  JTable = class external 'Table'(JComponentContainer)
    constructor Create(rows: array of array of JComponent);
    procedure _forEach(callback: function(component: JComponent): Variant)
    function has(component: JComponent): Boolean
    function add(component: JComponent; row: Float; col: Float): JTable
    function _remove(component: JComponent): Boolean
    function requestedSpace(offeredWidth: Float; offeredHeight: Float): JSpaceRequest
    function computeLayout: JTable overload;
    function computeLayout(origin: JPoint): JTable overload;
    function computeLayout(origin: JPoint; availableWidth: Float): JTable overload;
    function computeLayout(origin: JPoint; availableWidth: Float; availableHeight: Float): JTable overload;
    function rowPadding: Float
    function rowPadding(rowPadding: Float): JTable
    function columnPadding: Float
    function columnPadding(columnPadding: Float): JTable
    function rowWeight(index: Float): Float
    function rowWeight(index: Float; weight: Float): JTable
    function columnWeight(index: Float): Float
    function columnWeight(index: Float; weight: Float): JTable
    function fixedWidth: Boolean
    function fixedHeight: Boolean
  end;



//Plottable

//Components

type
  JSelectionBoxLayer = class external 'SelectionBoxLayer'(JComponent)
    _box: Jd3.Selection{<Variant>};
    constructor Create;
    procedure _setup
    function _sizeFromOffer(availableWidth: Float; availableHeight: Float):       width: Float;
      height: Float;
    end;
    function bounds: JBounds
    function bounds(newBounds: JBounds): JSelectionBoxLayer
    procedure _setBounds(newBounds: JBounds)
    function renderImmediately: JSelectionBoxLayer
    function boxVisible: Boolean
    function boxVisible(show: Boolean): JSelectionBoxLayer
    function fixedWidth: Boolean
    function fixedHeight: Boolean
  end;



//Plottable

type
  JPlot = class external 'Plot'(JComponent)
    _ANIMATION_MAX_DURATION: Float;
    _renderArea: Jd3.Selection{<Variant>};
    _renderCallback: JScaleCallback{<JScale{<VariantVariant>}>};
    _propertyExtents: Jd3.Map{<array of Variant>};
    _propertyBindings: Jd3.Map{<JPlots.AccessorScaleBinding{<VariantVariant>}>};
    constructor Create;
    function anchor(selection: Jd3.Selection{<Variant>}): JPlot
    procedure _setup
    procedure destroy
    function addDataset(dataset: JDataset): JPlot
    function _createNodesForDataset(dataset: JDataset): JDrawer
    function _createDrawer(dataset: JDataset): JDrawer
    function _getAnimator(key: String): JAnimator
    procedure _onDatasetUpdate
    function attr(attr: String): JPlots.AccessorScaleBinding{<JAVariant {Float or String}>}
    function attr(attr: String; attrValue: Variant {Float or String or JAccessor{<Float>} or JAccessor{<String>}}): JPlot
    function attr(attr: String; attrValue: Variant {JA or JAccessor{<JA>}}; scale: JScale{<JAVariant {Float or String}>}): JPlot
    procedure _bindProperty(&property: String; value: Variant; scale: JScale{<VariantVariant>})
    function _generateAttrToProjector: JAttributeToProjector
    function renderImmediately: JPlot
    function animated: Boolean
    function animated(willAnimate: Boolean): JPlot
    function detach: JPlot
    procedure _updateExtents
    procedure _updateExtentsForProperty(&property: String)
    function _filterForProperty(&property: String): JAccessor{<Boolean>}
    function _extentsForProperty(&property: String): array of Variant
    function animator(animatorKey: String): JAnimator
    function animator(animatorKey: String; animator: JAnimator): JPlot
    function removeDataset(dataset: JDataset): JPlot
    procedure _removeDatasetNodes(dataset: JDataset)
    function datasets: array of JDataset
    function datasets(datasets: array of JDataset): JPlot
    function _getDrawersInOrder: array of JDrawer
    function _generateDrawSteps: array of JDrawers.DrawStep
    procedure _additionalPaint(time: Float)
    function _getDataToDraw: JUtils.Map{<JDatasetarray of Variant>}
    function selections: Jd3.Selection{<Variant>} overload;
    function selections(datasets: array of JDataset): Jd3.Selection{<Variant>} overload;
    function entities: array of JPlots.PlotEntity overload;
    function entities(datasets: array of JDataset): array of JPlots.PlotEntity overload;
    function entityNearest(queryPoint: JPoint): JPlots.PlotEntity
    function _visibleOnPlot(datum: Variant; pixelPoint: JPoint; selection: Jd3.Selection{<Variant>}): Boolean
    function _entityVisibleOnPlot(pixelPoint: JPoint; datum: Variant; index: Float; dataset: JDataset): Boolean
    procedure _uninstallScaleForKey(scale: JScale{<VariantVariant>}; key: String)
    procedure _installScaleForKey(scale: JScale{<VariantVariant>}; key: String)
    function _propertyProjectors: JAttributeToProjector
    function _scaledAccessor(binding: JPlots.AccessorScaleBinding{<JDJR>}): JAccessor{<Variant>}
    function _pixelPoint(datum: Variant; index: Float; dataset: JDataset): JPoint
    function _animateOnNextRender: Boolean
  end;

//Plots

type
  JPlotEntity = class external(JEntity {JPlot} )
    dataset: JDataset;
    index: Float;
    component: JPlot;
  end;

  JAccessorScaleBinding{<DR>} = class external
    accessor: JAccessor{<Variant>};
    scale: JScale{<JDJR>}; // nullable
  end;

//Animator

var
  MAIN: String;
  RESET: String;




//Plottable

//Plots

type
  JPie = class external 'Pie'(JPlot)
    constructor Create;
    function computeLayout: JPie overload;
    function computeLayout(origin: JPoint): JPie overload;
    function computeLayout(origin: JPoint; availableWidth: Float): JPie overload;
    function computeLayout(origin: JPoint; availableWidth: Float; availableHeight: Float): JPie overload;
    function addDataset(dataset: JDataset): JPie
    function removeDataset(dataset: JDataset): JPie
    procedure _onDatasetUpdate
    function _createDrawer(dataset: JDataset): JDrawers.Arc
    function entities: array of JPlotEntity overload;
    function entities(datasets: array of JDataset): array of JPlotEntity overload;
    function sectorValue: JAccessorScaleBinding{<JSFloat>}
    function sectorValue(sectorValue: Variant {Float or JAccessor{<Float>}}): JPlots.Pie
    function sectorValue(sectorValue: Variant {JS or JAccessor{<JS>}}; scale: JScale{<JSFloat>}): JPlots.Pie
    function innerRadius: JAccessorScaleBinding{<JRFloat>}
    function innerRadius(innerRadius: Variant {Float or JAccessor{<Float>}}): JPlots.Pie
    function innerRadius(innerRadius: Variant {JR or JAccessor{<JR>}}; scale: JScale{<JRFloat>}): JPlots.Pie
    function outerRadius: JAccessorScaleBinding{<JRFloat>}
    function outerRadius(outerRadius: Variant {Float or JAccessor{<Float>}}): JPlots.Pie
    function outerRadius(outerRadius: Variant {JR or JAccessor{<JR>}}; scale: JScale{<JRFloat>}): JPlots.Pie
    function labelsEnabled: Boolean
    function labelsEnabled(enabled: Boolean): JPie
    function labelFormatter: JFormatter
    function labelFormatter(formatter: JFormatter): JPie
    function entitiesAt(queryPoint: JPoint): array of JPlotEntity
    function _propertyProjectors: JAttributeToProjector
    function _getDataToDraw: JUtils.Map{<JDatasetarray of Variant>}
    function _pixelPoint(datum: Variant; index: Float; dataset: JDataset):       x: Float;
      y: Float;
    end;
    procedure _additionalPaint(time: Float)
  end;



//Plottable

type
  JXYPlot = class external 'XYPlot'(JPlot)
    _X_KEY: String;
    _Y_KEY: String;
    constructor Create;
    function deferredRendering: Boolean
    function deferredRendering(deferredRendering: Boolean): JXYPlot{<JXJY>}
    function x: JPlots.AccessorScaleBinding{<JXFloat>}
    function x(x: Variant {Float or JAccessor{<Float>}}): JXYPlot{<JXJY>}
    function x(x: Variant {JX or JAccessor{<JX>}}; xScale: JScale{<JXFloat>}): JXYPlot{<JXJY>}
    function y: JPlots.AccessorScaleBinding{<JYFloat>}
    function y(y: Variant {Float or JAccessor{<Float>}}): JXYPlot{<JXJY>}
    function y(y: Variant {JY or JAccessor{<JY>}}; yScale: JScale{<JYFloat>}): JXYPlot{<JXJY>}
    function _filterForProperty(&property: String): (datum: Variant; index: Float; dataset: JDataset): Boolean
    procedure _uninstallScaleForKey(scale: JScale{<VariantVariant>}; key: String)
    procedure _installScaleForKey(scale: JScale{<VariantVariant>}; key: String)
    function destroy: JXYPlot{<JXJY>}
    function autorangeMode: String
    function autorangeMode(autorangeMode: String): JXYPlot{<JXJY>}
    function computeLayout: JXYPlot{<JXJY>} overload;
    function computeLayout(origin: JPoint): JXYPlot{<JXJY>} overload;
    function computeLayout(origin: JPoint; availableWidth: Float): JXYPlot{<JXJY>} overload;
    function computeLayout(origin: JPoint; availableWidth: Float; availableHeight: Float): JXYPlot{<JXJY>} overload;
    function showAllData: JXYPlot{<JXJY>}
    function _projectorsReady: Boolean
    function _pixelPoint(datum: Variant; index: Float; dataset: JDataset): JPoint
    function _getDataToDraw: JUtils.Map{<JDatasetarray of Variant>}
  end;


//Plottable

//Plots

type
  JRectangle = class external 'Rectangle'(JXYPlot {JX, JY} )
    constructor Create;
    function _createDrawer(dataset: JDataset): JDrawers.Rectangle
    function _generateAttrToProjector:       // property Item[attr: String]: (datum: Variant; index: Float; dataset: JDataset): Variant;
    end;
    function _generateDrawSteps: array of JDrawers.DrawStep
    procedure _updateExtentsForProperty(&property: String)
    function _filterForProperty(&property: String): (datum: Variant; index: Float; dataset: JDataset): Boolean
    function x: JAccessorScaleBinding{<JXFloat>}
    function x(x: Variant {Float or JAccessor{<Float>}}): JPlots.Rectangle{<JXJY>}
    function x(x: Variant {JX or JAccessor{<JX>}}; xScale: JScale{<JXFloat>}): JPlots.Rectangle{<JXJY>}
    function x2: JAccessorScaleBinding{<JXFloat>}
    function x2(x2: Variant {Float or JAccessor{<Float>} or JX or JAccessor{<JX>}}): JPlots.Rectangle{<JXJY>}
    function y: JAccessorScaleBinding{<JYFloat>}
    function y(y: Variant {Float or JAccessor{<Float>}}): JPlots.Rectangle{<JXJY>}
    function y(y: Variant {JY or JAccessor{<JY>}}; yScale: JScale{<JYFloat>}): JPlots.Rectangle{<JXJY>}
    function y2: JAccessorScaleBinding{<JYFloat>}
    function y2(y2: Variant {Float or JAccessor{<Float>} or JY or JAccessor{<JY>}}): JPlots.Rectangle{<JXJY>}
    function _propertyProjectors: JAttributeToProjector
    function _pixelPoint(datum: Variant; index: Float; dataset: JDataset):       x: Variant;
      y: Variant;
    end;
    function _getDataToDraw: JUtils.Map{<JDatasetarray of Variant>}
  end;



//Plottable

//Plots

type
  JScatter = class external 'Scatter'(JXYPlot {JX, JY} )
    constructor Create;
    function _createDrawer(dataset: JDataset): JDrawers.Symbol
    function size: JAccessorScaleBinding{<JSFloat>}
    function size(size: Variant {Float or JAccessor{<Float>}}): JPlots.Scatter{<JXJY>}
    function size(size: Variant {JS or JAccessor{<JS>}}; scale: JScale{<JSFloat>}): JPlots.Scatter{<JXJY>}
    function symbol: JAccessorScaleBinding{<VariantVariant>}
    function symbol(symbol: JAccessor{<JSymbolFactory>}): JPlots.Scatter{<JXJY>}
    function _generateDrawSteps: array of JDrawers.DrawStep
    function _visibleOnPlot(datum: Variant; pixelPoint: JPoint; selection: Jd3.Selection{<Variant>}): Boolean
    function _entityVisibleOnPlot(pixelPoint: JPoint; datum: Variant; index: Float; dataset: JDataset): Boolean
    function _propertyProjectors: JAttributeToProjector
  end;



//Plottable

//Plots

type
  JBar = class external 'Bar'(JXYPlot {JX, JY} )
    ORIENTATION_VERTICAL: String;
    ORIENTATION_HORIZONTAL: String;
    _isVertical: Boolean;
    constructor Create(orientation: String);
    function x: JPlots.AccessorScaleBinding{<JXFloat>}
    function x(x: Variant {Float or JAccessor{<Float>}}): JBar{<JXJY>}
    function x(x: Variant {JX or JAccessor{<JX>}}; xScale: JScale{<JXFloat>}): JBar{<JXJY>}
    function y: JPlots.AccessorScaleBinding{<JYFloat>}
    function y(y: Variant {Float or JAccessor{<Float>}}): JBar{<JXJY>}
    function y(y: Variant {JY or JAccessor{<JY>}}; yScale: JScale{<JYFloat>}): JBar{<JXJY>}
    function orientation: String
    function render: JBar{<JXJY>}
    function _createDrawer(dataset: JDataset): JDrawers.Rectangle
    procedure _setup
    function baselineValue: Variant {JX or JY}
    function baselineValue(value: Variant {JX or JY}): JBar{<JXJY>}
    function addDataset(dataset: JDataset): JBar{<JXJY>}
    function removeDataset(dataset: JDataset): JBar{<JXJY>}
    function labelsEnabled: Boolean
    function labelsEnabled(enabled: Boolean): JBar{<JXJY>}
    function labelFormatter: JFormatter
    function labelFormatter(formatter: JFormatter): JBar{<JXJY>}
    function _createNodesForDataset(dataset: JDataset): JDrawer
    procedure _removeDatasetNodes(dataset: JDataset)
    function entityNearest(queryPoint: JPoint): JPlotEntity
    function _visibleOnPlot(datum: Variant; pixelPoint: JPoint; selection: Jd3.Selection{<Variant>}): Boolean
    function _entityVisibleOnPlot(pixelPoint: JPoint; datum: Variant; index: Float; dataset: JDataset): Boolean
    function entitiesAt(p: JPoint): array of JPlotEntity
    function entitiesIn(bounds: JBounds): array of JPlotEntity
    function entitiesIn(xRange: JRange; yRange: JRange): array of JPlotEntity
    procedure _additionalPaint(time: Float)
    function _generateDrawSteps: array of JDrawers.DrawStep
    function _generateAttrToProjector:       // property Item[attr: String]: (datum: Variant; index: Float; dataset: JDataset): Variant;
    end;
    function _getBarPixelWidth: Float
    function entities: array of JPlotEntity overload;
    function entities(datasets: array of JDataset): array of JPlotEntity overload;
    function _pixelPoint(datum: Variant; index: Float; dataset: JDataset):       x: Variant;
      y: Variant;
    end;
    procedure _uninstallScaleForKey(scale: JScale{<VariantFloat>}; key: String)
    function _getDataToDraw: JUtils.Map{<JDatasetarray of Variant>}
  end;



//Plottable

//Plots

type
  JLine = class external 'Line'(JXYPlot {JX, Float} )
    constructor Create;
    function _createDrawer(dataset: JDataset): JDrawer
    function _getResetYFunction: (d: Variant; i: Float; dataset: JDataset): Float
    function _generateDrawSteps: array of JDrawers.DrawStep
    function _generateAttrToProjector:       // property Item[attr: String]: (datum: Variant; index: Float; dataset: JDataset): Variant;
    end;
    function entityNearest(queryPoint: JPoint): JPlotEntity
    function _propertyProjectors: JAttributeToProjector
    function _constructLineProjector(xProjector: JProjector; yProjector: JProjector): (datum: Variant; index: Float; dataset: JDataset): String
    function _getDataToDraw: JUtils.Map{<JDatasetarray of Variant>}
  end;



//Plottable

//Plots

type
  JArea = class external 'Area'(JLine {JX} )
    constructor Create;
    procedure _setup
    function y: JPlots.AccessorScaleBinding{<FloatFloat>}
    function y(y: Variant {Float or JAccessor{<Float>}}): JArea{<JX>}
    function y(y: Variant {Float or JAccessor{<Float>}}; yScale: JQuantitativeScale{<Float>}): JArea{<JX>}
    function y0: JPlots.AccessorScaleBinding{<FloatFloat>}
    function y0(y0: Variant {Float or JAccessor{<Float>}}): JArea{<JX>}
    procedure _onDatasetUpdate
    function addDataset(dataset: JDataset): JArea{<JX>}
    procedure _removeDatasetNodes(dataset: JDataset)
    procedure _additionalPaint
    function _createDrawer(dataset: JDataset): JDrawers.Area
    function _generateDrawSteps: array of JDrawers.DrawStep
    procedure _updateYScale
    function _getResetYFunction: JAccessor{<Variant>}
    function _propertyProjectors: JAttributeToProjector
    function selections: Jd3.Selection{<Variant>} overload;
    function selections(datasets: array of JDataset): Jd3.Selection{<Variant>} overload;
    function _constructAreaProjector(xProjector: JProjector; yProjector: JProjector; y0Projector: JProjector): (datum: array of Variant; index: Float; dataset: JDataset): String
  end;



//Plottable

//Plots

type
  JClusteredBar = class external 'ClusteredBar'(JBar {JX, JY} )
    constructor Create(orientation: String);
    function _generateAttrToProjector:       // property Item[attr: String]: (datum: Variant; index: Float; dataset: JDataset): Variant;
    end;
    function _getDataToDraw: JUtils.Map{<JDatasetarray of Variant>}
  end;



//Plottable

//Plots

type
  JStackedArea = class external 'StackedArea'(JArea {JX} )
    constructor Create;
    function _getAnimator(key: String): JAnimator
    procedure _setup
    function x: JPlots.AccessorScaleBinding{<JXFloat>}
    function x(x: Variant {Float or JAccessor{<Float>}}): JStackedArea{<JX>}
    function x(x: Variant {JX or JAccessor{<JX>}}; xScale: JScale{<JXFloat>}): JStackedArea{<JX>}
    function y: JPlots.AccessorScaleBinding{<FloatFloat>}
    function y(y: Variant {Float or JAccessor{<Float>}}): JStackedArea{<JX>}
    function y(y: Variant {Float or JAccessor{<Float>}}; yScale: JQuantitativeScale{<Float>}): JStackedArea{<JX>}
    procedure _additionalPaint
    procedure _updateYScale
    function _onDatasetUpdate: JStackedArea{<JX>}
    procedure _updateExtentsForProperty(&property: String)
    function _extentsForProperty(attr: String): array of Variant
    function _propertyProjectors: JAttributeToProjector
    function _pixelPoint(datum: Variant; index: Float; dataset: JDataset): JPoint
  end;



//Plottable

//Plots

type
  JStackedBar = class external 'StackedBar'(JBar {JX, JY} )
    constructor Create(orientation: String);
    function x: JPlots.AccessorScaleBinding{<JXFloat>}
    function x(x: Variant {Float or JAccessor{<Float>}}): JStackedBar{<JXJY>}
    function x(x: Variant {JX or JAccessor{<JX>}}; xScale: JScale{<JXFloat>}): JStackedBar{<JXJY>}
    function y: JPlots.AccessorScaleBinding{<JYFloat>}
    function y(y: Variant {Float or JAccessor{<Float>}}): JStackedBar{<JXJY>}
    function y(y: Variant {JY or JAccessor{<JY>}}; yScale: JScale{<JYFloat>}): JStackedBar{<JXJY>}
    function _generateAttrToProjector:       // property Item[attr: String]: (datum: Variant; index: Float; dataset: JDataset): Variant;
    end;
    function _onDatasetUpdate: JStackedBar{<JXJY>}
    procedure _updateExtentsForProperty(&property: String)
    function _extentsForProperty(attr: String): array of Variant
  end;



//Plottable

//Plots

type
  JSegment = class external 'Segment'(JXYPlot {JX, JY} )
    constructor Create;
    function _createDrawer(dataset: JDataset): JDrawers.Segment
    function _generateDrawSteps: array of JDrawers.DrawStep
    procedure _updateExtentsForProperty(&property: String)
    function _filterForProperty(&property: String): (datum: Variant; index: Float; dataset: JDataset): Boolean
    function x: JAccessorScaleBinding{<JXFloat>}
    function x(x: Variant {Float or JAccessor{<Float>}}): JPlots.Segment{<JXJY>}
    function x(x: Variant {JX or JAccessor{<JX>}}; xScale: JScale{<JXFloat>}): JPlots.Segment{<JXJY>}
    function x2: JAccessorScaleBinding{<JXFloat>}
    function x2(x2: Variant {Float or JAccessor{<Float>} or JX or JAccessor{<JX>}}): JPlots.Segment{<JXJY>}
    function y: JAccessorScaleBinding{<JYFloat>}
    function y(y: Variant {Float or JAccessor{<Float>}}): JPlots.Segment{<JXJY>}
    function y(y: Variant {JY or JAccessor{<JY>}}; yScale: JScale{<JYFloat>}): JPlots.Segment{<JXJY>}
    function y2: JAccessorScaleBinding{<JYFloat>}
    function y2(y2: Variant {Float or JAccessor{<Float>} or JY or JAccessor{<JY>}}): JPlots.Segment{<JXJY>}
    function _propertyProjectors: JAttributeToProjector
  end;



//Plottable

//Plots

type
  JWaterfall = class external 'Waterfall'(JBar {JX, Float} )
    constructor Create;
    function connectorsEnabled: Boolean
    function connectorsEnabled(enabled: Boolean): JWaterfall{<JXJY>}
    function total: JPlots.AccessorScaleBinding{<JTBoolean>}
    function total(total: JAccessor{<Boolean>}): JWaterfall{<JXJY>}
    procedure _additionalPaint(time: Float)
    function _createNodesForDataset(dataset: JDataset): JDrawer
    function _extentsForProperty(attr: String): array of Variant
    function _generateAttrToProjector:       // property Item[attr: String]: (datum: Variant; index: Float; dataset: JDataset): Variant;
    end;
    function _onDatasetUpdate: JWaterfall{<JXJY>}
  end;



//Plottable

type
  JAnimator = class external
    function animate(selection: Jd3.Selection{<Variant>}; attrToAppliedProjector: JAttributeToAppliedProjector): Variant {Jd3.Selection{<Variant>} or Jd3.Transition{<Variant>}}
    function totalTime(numberOfIterations: Float): Float
  end;


//Plottable

//Animators

type
  JNull = class external 'Null'
    function totalTime(selection: Variant): Float
    function animate(selection: Jd3.Selection{<Variant>}; attrToAppliedProjector: JAttributeToAppliedProjector): Jd3.Selection{<Variant>}
  end;



//Plottable

//Animators

type
  JEasing = class external 'Easing'
    constructor Create;
    function totalTime(numberOfSteps: Float): Float
    function animate(selection: Jd3.Selection{<Variant>}; attrToAppliedProjector: JAttributeToAppliedProjector): Jd3.Transition{<Variant>}
    function startDelay: Float
    function startDelay(startDelay: Float): JEasing
    function stepDuration: Float
    function stepDuration(stepDuration: Float): JEasing
    function stepDelay: Float
    function stepDelay(stepDelay: Float): JEasing
    function maxTotalDuration: Float
    function maxTotalDuration(maxTotalDuration: Float): JEasing
    function easingMode: String
    function easingMode(easingMode: String): JEasing
  end;



//Plottable

type
  JDispatcher = class external 'Dispatcher'
    _eventToCallback: record
      // property Item[eventName: String]: (e: JEvent): Variant;
    end;;
    _callbacks: array of JUtils.CallbackSet{<JFunction>};
    procedure _setCallback(callbackSet: JUtils.CallbackSet{<JFunction>}; callback: JFunction)
    procedure _unsetCallback(callbackSet: JUtils.CallbackSet{<JFunction>}; callback: JFunction)
  end;


//Plottable

//Dispatchers

type
  JMouse = class external 'Mouse'(JDispatcher)
    function getDispatcher(elem: JSVGElement): JDispatchers.Mouse
    constructor Create(svg: JSVGElement);
    function onMouseMove(callback: JMouseCallback): JDispatchers.Mouse
    function offMouseMove(callback: JMouseCallback): JDispatchers.Mouse
    function onMouseDown(callback: JMouseCallback): JDispatchers.Mouse
    function offMouseDown(callback: JMouseCallback): JDispatchers.Mouse
    function onMouseUp(callback: JMouseCallback): JDispatchers.Mouse
    function offMouseUp(callback: JMouseCallback): JDispatchers.Mouse
    function onWheel(callback: JMouseCallback): JDispatchers.Mouse
    function offWheel(callback: JMouseCallback): JDispatchers.Mouse
    function onDblClick(callback: JMouseCallback): JDispatchers.Mouse
    function offDblClick(callback: JMouseCallback): JDispatchers.Mouse
    function lastMousePosition: JPoint
  end;

  MouseCallback = (p: JPoint; event: JMouseEvent);


//Plottable

//Dispatchers

type
  JTouch = class external 'Touch'(JDispatcher)
    function getDispatcher(elem: JSVGElement): JDispatchers.Touch
    constructor Create(svg: JSVGElement);
    function onTouchStart(callback: JTouchCallback): JDispatchers.Touch
    function offTouchStart(callback: JTouchCallback): JDispatchers.Touch
    function onTouchMove(callback: JTouchCallback): JDispatchers.Touch
    function offTouchMove(callback: JTouchCallback): JDispatchers.Touch
    function onTouchEnd(callback: JTouchCallback): JDispatchers.Touch
    function offTouchEnd(callback: JTouchCallback): JDispatchers.Touch
    function onTouchCancel(callback: JTouchCallback): JDispatchers.Touch
    function offTouchCancel(callback: JTouchCallback): JDispatchers.Touch
  end;

  TouchCallback = (ids: array of Float; idToPoint: record
    // property Item[id: Integer]: JPoint;
  end;; event: JTouchEvent);


//Plottable

//Dispatchers

type
  JKey = class external 'Key'(JDispatcher)
    function getDispatcher: JDispatchers.Key
    constructor Create;
    function onKeyDown(callback: JKeyCallback): JKey
    function offKeyDown(callback: JKeyCallback): JKey
  end;

  KeyCallback = (keyCode: Float; event: JKeyboardEvent);


//Plottable

type
  JInteraction = class external 'Interaction'
    _componentAttachedTo: JComponent;
    procedure _anchor(component: JComponent)
    procedure _unanchor
    function attachTo(component: JComponent): JInteraction
    function detachFrom(component: JComponent): JInteraction
    function enabled: Boolean
    function enabled(enabled: Boolean): JInteraction
    function _translateToComponentSpace(p: JPoint): JPoint
    function _isInsideComponent(p: JPoint): Boolean
  end;


//Plottable

//Interactions

type
  JClick = class external 'Click'(JInteraction)
    procedure _anchor(component: JComponent)
    procedure _unanchor
    function onClick(callback: JClickCallback): JClick
    function offClick(callback: JClickCallback): JClick
  end;



//Plottable

//Interactions

type
  JDoubleClick = class external 'DoubleClick'(JInteraction)
    procedure _anchor(component: JComponent)
    procedure _unanchor
    function onDoubleClick(callback: JClickCallback): JDoubleClick
    function offDoubleClick(callback: JClickCallback): JDoubleClick
  end;



//Plottable

//Interactions

type
  JKey = class external 'Key'(JInteraction)
    procedure _anchor(component: JComponent)
    procedure _unanchor
    function onKeyPress(keyCode: Float; callback: JKeyCallback): JKey
    function offKeyPress(keyCode: Float; callback: JKeyCallback): JKey
  end;



//Plottable

//Interactions

type
  JPointer = class external 'Pointer'(JInteraction)
    procedure _anchor(component: JComponent)
    procedure _unanchor
    function onPointerEnter(callback: JPointerCallback): JPointer
    function offPointerEnter(callback: JPointerCallback): JPointer
    function onPointerMove(callback: JPointerCallback): JPointer
    function offPointerMove(callback: JPointerCallback): JPointer
    function onPointerExit(callback: JPointerCallback): JPointer
    function offPointerExit(callback: JPointerCallback): JPointer
  end;



//Plottable

//Interactions

type
  JPanZoom = class external 'PanZoom'(JInteraction)
    constructor Create(xScale: JQuantitativeScale{<Variant>}; yScale: JQuantitativeScale{<Variant>});
    procedure _anchor(component: JComponent)
    procedure _unanchor
    function xScales: array of JQuantitativeScale{<Variant>}
    function xScales(xScales: array of JQuantitativeScale{<Variant>}): JInteractions.PanZoom
    function yScales: array of JQuantitativeScale{<Variant>}
    function yScales(yScales: array of JQuantitativeScale{<Variant>}): JInteractions.PanZoom
    function addXScale(xScale: JQuantitativeScale{<Variant>}): JPanZoom
    function removeXScale(xScale: JQuantitativeScale{<Variant>}): JPanZoom
    function addYScale(yScale: JQuantitativeScale{<Variant>}): JPanZoom
    function removeYScale(yScale: JQuantitativeScale{<Variant>}): JPanZoom
    function minDomainExtent(quantitativeScale: JQuantitativeScale{<JD>}): JD
    function minDomainExtent(quantitativeScale: JQuantitativeScale{<JD>}; minDomainExtent: JD): JInteractions.PanZoom
    function maxDomainExtent(quantitativeScale: JQuantitativeScale{<JD>}): JD
    function maxDomainExtent(quantitativeScale: JQuantitativeScale{<JD>}; maxDomainExtent: JD): JInteractions.PanZoom
  end;



//Plottable

//Interactions

type
  JDrag = class external 'Drag'(JInteraction)
    procedure _anchor(component: JComponent)
    procedure _unanchor
    function constrainedToComponent: Boolean
    function constrainedToComponent(constrainedToComponent: Boolean): JDrag
    function onDragStart(callback: JDragCallback): JDrag
    function offDragStart(callback: JDragCallback): JDrag
    function onDrag(callback: JDragCallback): JDrag
    function offDrag(callback: JDragCallback): JDrag
    function onDragEnd(callback: JDragCallback): JDrag
    function offDragEnd(callback: JDragCallback): JDrag
  end;



//Plottable

//Components

type
  JDragBoxLayer = class external 'DragBoxLayer'(JComponents.SelectionBoxLayer)
    _hasCorners: Boolean;
    constructor Create;
    procedure _setup
    function renderImmediately: JDragBoxLayer
    function detectionRadius: Float
    function detectionRadius(r: Float): JDragBoxLayer
    function resizable: Boolean
    function resizable(canResize: Boolean): JDragBoxLayer
    procedure _setResizableClasses(canResize: Boolean)
    function onDragStart(callback: JDragBoxCallback): JDragBoxLayer
    function offDragStart(callback: JDragBoxCallback): JDragBoxLayer
    function onDrag(callback: JDragBoxCallback): JDragBoxLayer
    function offDrag(callback: JDragBoxCallback): JDragBoxLayer
    function onDragEnd(callback: JDragBoxCallback): JDragBoxLayer
    function offDragEnd(callback: JDragBoxCallback): JDragBoxLayer
    function dragInteraction: JInteractions.Drag
    function enabled(enabled: Boolean): JDragBoxLayer
    function enabled: Boolean
  end;



//Plottable

//Components

type
  JXDragBoxLayer = class external 'XDragBoxLayer'(JDragBoxLayer)
    constructor Create;
    function computeLayout: JXDragBoxLayer overload;
    function computeLayout(origin: JPoint): JXDragBoxLayer overload;
    function computeLayout(origin: JPoint; availableWidth: Float): JXDragBoxLayer overload;
    function computeLayout(origin: JPoint; availableWidth: Float; availableHeight: Float): JXDragBoxLayer overload;
    procedure _setBounds(newBounds: JBounds)
    procedure _setResizableClasses(canResize: Boolean)
  end;



//Plottable

//Components

type
  JYDragBoxLayer = class external 'YDragBoxLayer'(JDragBoxLayer)
    constructor Create;
    function computeLayout: JYDragBoxLayer overload;
    function computeLayout(origin: JPoint): JYDragBoxLayer overload;
    function computeLayout(origin: JPoint; availableWidth: Float): JYDragBoxLayer overload;
    function computeLayout(origin: JPoint; availableWidth: Float; availableHeight: Float): JYDragBoxLayer overload;
    procedure _setBounds(newBounds: JBounds)
    procedure _setResizableClasses(canResize: Boolean)
  end;
