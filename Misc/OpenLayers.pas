unit OpenLayers;

interface

uses


//olx

type
  JAttributionOptions = class external
    html: String;
  end;

  JDeviceOrientationOptions = class external
    tracking: Boolean; // nullable
  end;

  JColor = class external(JArray {Float} )
  end;

  JCoordinate = class external 'ol.Coordinate' (JArray {Float} )
  end;

  JExtent = class external(JArray {Float} )
  end;

  JOverlayPositioning = class external(JString)
  end;

  JPixel = class external(JArray {Float} )
  end;

  JRendererType = class external(JString)
  end;

  JSize = class external(JArray {Float} )
  end;

  JTileCoord = class external(JArray {Float} )
  end;

  JViewState = class external
    center: Jol.Coordinate;
    projection: Jol.proj.Projection;
    resolution: Float;
    rotation: Float;
  end;

  JFrameState = class external
    pixelRatio: Float;
    time: Float;
    viewState: Jolx.ViewState;
  end;

  JFeatureOverlayOptions = class external
    features: Variant {JArray{<Jol.Feature>} or Jol.Collection{<Jol.Feature>} or Jol.style.StyleFunction}; // nullable
    map: Jol.Map;
    style: Variant {Jol.style.Style or JArray{<Jol.style.Style>}};
  end;

  JGeolocationOptions = class external
    tracking: Boolean; // nullable
    trackingOptions: JPositionOptions; // nullable
    projection: Variant {Jol.proj.ProjectionLike or Jol.proj.Projection}; // nullable
  end;

  JGraticuleOptions = class external
    map: Jol.Map; // nullable
    maxLines: Float; // nullable
    strokeStyle: Jol.style.Stroke; // nullable
    targetSize: Float; // nullable
  end;

  JBaseWMSOptions = class external
    attributions: JArray{<Jol.Attribution>}; // nullable
    params: Variant; // nullable
    crossOrigin: String; // nullable
    hidpi: Boolean; // nullable
    serverType: Jol.source.wms.ServerType; // nullable
    url: String; // nullable
    logo: Jolx.LogoOptions; // nullable
    projection: Jol.proj.ProjectionLike; // nullable
  end;

  JImageWMSOptions = class external(JBaseWMSOptions)
    imageLoadFunction: Jol.ImageLoadFunctionType; // nullable
    ratio: Float; // nullable
    resolutions: JArray{<Float>}; // nullable
  end;

  JTileWMSOptions = class external
    gutter: Float; // nullable
    tileGrid: Jol.tilegrid.TileGrid; // nullable
    maxZoom: Float; // nullable
    tileLoadFunction: Jol.TileLoadFunctionType; // nullable
    url: String; // nullable
    urls: JArray{<String>}; // nullable
    serverType: Jol.source.wms.ServerType; // nullable
    wrapX: Boolean; // nullable
  end;

  JLogoOptions = class external
    href: String;
    src: String;
  end;

  JMapOptions = class external
    controls: Variant; // nullable
    pixelRatio: Float; // nullable
    interactions: Variant; // nullable
    keyboardEventTarget: Variant; // nullable
    layers: JArray{<Variant>}; // nullable
    loadTilesWhileAnimating: Boolean; // nullable
    loadTilesWhileInteracting: Boolean; // nullable
    logo: Variant; // nullable
    overlays: Variant; // nullable
    renderer: Variant; // nullable
    target: Variant; // nullable
    view: JViewOptions; // nullable
  end;

  JOverlayOptions = class external
    element: JElement; // nullable
    offset: JArray{<Float>}; // nullable
    position: Jol.Coordinate; // nullable
    positioning: Jol.OverlayPositioning; // nullable
    stopEvent: Boolean; // nullable
    insertFirst: Boolean; // nullable
    autoPan: Boolean; // nullable
    autoPanAnimation: Jolx.animation.PanOptions; // nullable
    autoPanMargin: Float; // nullable
  end;

  JViewOptions = class external
    center: Jol.Coordinate; // nullable
    constrainRotation: Boolean; // nullable
    enableRotation: Boolean; // nullable
    extent: Jol.Extent; // nullable
    maxResolution: Float; // nullable
    minResolution: Float; // nullable
    maxZoom: Float; // nullable
    minZoom: Float; // nullable
    projection: Variant {Jol.proj.ProjectionLike or Jol.proj.Projection}; // nullable
    resolution: Float; // nullable
    resolutions: JArray{<Float>}; // nullable
    rotation: Float; // nullable
    zoom: Float; // nullable
    zoomFactor: Float; // nullable
  end;

  JProjection = class external
    code: String;
    units: Jol.proj.Units; // nullable
    extent: JArray{<Float>}; // nullable
    axisOrientation: String; // nullable
    global: Boolean; // nullable
    worldExtent: Jol.Extent; // nullable
    getPointResolution: (resolution: Float; coordinate: Jol.Coordinate): Float; // nullable
  end;

//animation

type
  JBounceOptions = class external
    resolution: Float;
    start: Float; // nullable
    duration: Float; // nullable
    easing: (t: Float): Float; // nullable
  end;

  JPanOptions = class external
    source: Jol.Coordinate;
    start: Float; // nullable
    duration: Float; // nullable
    easing: (t: Float): Float; // nullable
  end;

  JRotateOptions = class external
    rotation: Float; // nullable
    anchor: Jol.Coordinate; // nullable
    start: Float; // nullable
    duration: Float; // nullable
    easing: (t: Float): Float; // nullable
  end;

  JZoomOptions = class external
    resolution: Float;
    start: Float; // nullable
    duration: Float; // nullable
    easing: (t: Float): Float; // nullable
  end;


//control

type
  JDefaultsOptions = class external
    attribution: Boolean; // nullable
    attributionOptions: Variant; // nullable
    rotate: Boolean; // nullable
    rotateOptions: Variant; // nullable
    zoom: Boolean; // nullable
    zoomOptions: Variant; // nullable
  end;


//interaction

type
  JDefaultsOptions = class external
    altShiftDragRotate: Boolean; // nullable
    doubleClickZoom: Boolean; // nullable
    keyboard: Boolean; // nullable
    mouseWheelZoom: Boolean; // nullable
    shiftDragZoom: Boolean; // nullable
    dragPan: Boolean; // nullable
    pinchRotate: Boolean; // nullable
    pinchZoom: Boolean; // nullable
    zoomDelta: Float; // nullable
    zoomDuration: Float; // nullable
  end;


//layer

type
  JBaseOptions = class external
    brightness: Float; // nullable
    contrast: Float; // nullable
    hue: Float; // nullable
    opacity: Float; // nullable
    saturation: Float; // nullable
    visible: Boolean; // nullable
    extent: Jol.Extent; // nullable
    minResolution: Float; // nullable
    maxResolution: Float; // nullable
  end;

  JGroupOptions = class external(JBaseOptions)
    layers: Variant {JArray{<Jol.layer.Base>} or Jol.Collection{<Jol.layer.Base>}}; // nullable
  end;

  JHeatmapOptions = class external(JVectorOptions)
    gradient: JArray{<JString>}; // nullable
    radius: Float; // nullable
    blur: Float; // nullable
    shadow: Float; // nullable
  end;

  JImageOptions = class external(JLayerOptions)
  end;

  JLayerOptions = class external(JBaseOptions)
    source: Jol.source.Source; // nullable
  end;

  JTileOptions = class external(JLayerOptions)
    preload: Float; // nullable
    source: Jol.source.Tile; // nullable
    useInterimTilesOnError: Boolean; // nullable
  end;

  JVectorOptions = class external(JLayerOptions)
    updateWhileAnimating: Boolean; // nullable
    updateWhileInteracting: Boolean; // nullable
    renderOrder: Variant; // nullable
    renderBuffer: Float; // nullable
    source: Jol.source.Vector; // nullable
    style: Variant {Jol.style.Style or JArray{<Jol.style.Style>} or Variant}; // nullable
  end;


//source

type
  JVectorOptions = class external
    attributions: JArray{<Jol.Attribution>}; // nullable
    features: Variant {JArray{<Jol.Feature>} or Jol.Collection{<Jol.Feature>}}; // nullable
    format: Jol.format.Feature; // nullable
    loader: Jol.FeatureLoader; // nullable
    logo: Variant {String or Jolx.LogoOptions}; // nullable
    strategy: Jol.LoadingStrategy; // nullable
    url: String; // nullable
    useSpatialIndex: Boolean; // nullable
    wrapX: Boolean; // nullable
  end;


//style

type
  JFillOptions = class external
    color: Variant {Jol.Color or String}; // nullable
  end;

  JStyleOptions = class external
    geometry: Variant {String or Jol.geom.Geometry or Jol.style.GeometryFunction}; // nullable
    fill: Jol.style.Fill; // nullable
    image: Jol.style.Image; // nullable
    stroke: Jol.style.Stroke; // nullable
    text: Jol.style.Text; // nullable
    zIndex: Float; // nullable
  end;

  JTextOptions = class external
    font: String; // nullable
    offsetX: Float; // nullable
    offsetY: Float; // nullable
    scale: Float; // nullable
    rotation: Float; // nullable
    text: String; // nullable
    textAlign: String; // nullable
    textBaseline: String; // nullable
    fill: Jol.style.Fill; // nullable
    stroke: Jol.style.Stroke; // nullable
  end;


//tilegrid

type
  JTileGridOptions = class external
    extent: Jol.Extent; // nullable
    minZoom: Float; // nullable
    origin: Jol.Coordinate; // nullable
    origins: JArray{<Jol.Coordinate>}; // nullable
    resolutions: JArray{<Float>}; // nullable
    tileSize: Variant {Float or Jol.Size}; // nullable
    tileSizes: JArray{<Variant {Float or Jol.Size}>}; // nullable
  end;

  JWMTSOptions = class external
    extent: Jol.Extent; // nullable
    origin: Jol.Coordinate; // nullable
    origins: JArray{<Jol.Coordinate>}; // nullable
    resolutions: JArray{<Float>}; // nullable
    matrixIds: JArray{<String>}; // nullable
    sizes: JArray{<Jol.Size>}; // nullable
    tileSize: Variant {Float or Jol.Size}; // nullable
    tileSizes: JArray{<Variant {Float or Jol.Size}>}; // nullable
    widths: JArray{<Float>}; // nullable
  end;

  JXYZOptions = class external
    extent: Jol.Extent; // nullable
    maxZoom: Float; // nullable
    minZoom: Float; // nullable
    tileSize: Variant {Float or Jol.Size}; // nullable
  end;

  JZoomifyOptions = class external
    resolutions: JArray{<Float>};
  end;


//view

type
  JFitGeometryOptions = class external
    padding: JArray{<Float>}; // nullable
    constrainResolution: Boolean; // nullable
    nearest: Boolean; // nullable
    minResolution: Float; // nullable
    maxZoom: Float; // nullable
  end;


//format

type
  JGeoJSONOptions = class external
    defaultDataProjection: Variant {Jol.proj.ProjectionLike or Jol.proj.Projection}; // nullable
    geometryName: String; // nullable
  end;

  JReadOptions = class external
    dataProjection: Variant {Jol.proj.ProjectionLike or Jol.proj.Projection}; // nullable
    featureProjection: Variant {Jol.proj.ProjectionLike or Jol.proj.Projection}; // nullable
  end;

  JWriteOptions = class external
    dataProjection: Variant {Jol.proj.ProjectionLike or Jol.proj.Projection}; // nullable
    featureProjection: Variant {Jol.proj.ProjectionLike or Jol.proj.Projection}; // nullable
    rightHanded: Boolean; // nullable
  end;



//ol

type
  JAttribution = class external 'Attribution'
    constructor Create(options: Jolx.AttributionOptions);
    function getHTML: String
  end;

  JCollection = class external 'Collection'(Jol.Object)
    constructor Create(values: JArray{<JT>});
    procedure clear
    function extend(arr: JArray{<JT>}): JCollection{<JT>}
    procedure forEach(f: procedure(element: JT; index: Float; array: JArray{<JT>})) overload;
    procedure forEach(f: procedure(element: JT; index: Float; array: JArray{<JT>}); ref: Variant) overload;
    function getArray: JArray{<JT>}
    function getLength: Float
    procedure insertAt(index: Float; elem: JT)
    function item(index: Float): JT
    function pop: JT
    function push(elem: JT): Float
    function remove(elem: JT): JT
    function removeAt(index: Float): JT
    procedure setAt(index: Float; elem: JT)
  end;

  JCollectionEvent = class external 'CollectionEvent'
    element: JT;
  end;

  JDeviceOrientation = class external 'DeviceOrientation'(Jol.Object)
    constructor Create(options: Jolx.DeviceOrientationOptions);
    function getAlpha: Float
    function getBeta: Float
    function getGamma: Float
    function getHeading: Float
    function getTracking: Boolean
    procedure setTracking(tracking: Boolean)
  end;

  JDragBoxEvent = class external 'DragBoxEvent'
    coordinate: Jol.Coordinate;
  end;

  JFeature = class external 'Feature'(Jol.Object)
    constructor Create(geometryOrProperties: Variant {Jol.geom.Geometry or Variant});
    function clone: JFeature
    function getGeometry: Jol.geom.Geometry
    function getGeometryName: String
    function getId: Variant {String or Float}
    function getStyle: Variant {Jol.style.Style or JArray{<Jol.style.Style>} or Jol.FeatureStyleFunction}
    function getStyleFunction: Jol.FeatureStyleFunction
    procedure setGeometry(geometry: Jol.geom.Geometry)
    procedure setGeometryName(name: String)
    procedure setId(id: Float)
    procedure setId(id: String)
    procedure setStyle(style: Jol.style.Style)
    procedure setStyle(style: JArray{<Jol.style.Style>})
    procedure setStyle(style: Jol.FeatureStyleFunction)
  end;

  JFeatureOverlay = class external 'FeatureOverlay'
    constructor Create(options: Jolx.FeatureOverlayOptions);
    procedure addFeature(feature: Jol.Feature)
    getFeatures: Jol.Collection{<Jol.Feature>};
    function getMap: Jol.Map
    function getStyle: Variant {Jol.style.Style or JArray{<Jol.style.Style>} or Jol.style.StyleFunction}
    function getStyleFunction: Jol.style.StyleFunction
    procedure removeFeature(feature: Jol.Feature)
    procedure setFeatures(features: Jol.Collection{<Jol.Feature>})
    procedure setMap(map: Jol.Map)
    procedure setStyle(style: Jol.style.Style)
    procedure setStyle(style: JArray{<Jol.style.Style>})
    procedure setStyle(style: Jol.style.StyleFunction)
  end;

  JGeolocation = class external 'Geolocation'(Jol.Object)
    constructor Create(options: Jolx.GeolocationOptions);
    function getAccuracy: Float
    function getAccuracyGeometry: Jol.geom.Geometry
    function getAltitude: Float
    function getAltitudeAccuracy: Float
    function getHeading: Float
    function getPosition: Jol.Coordinate
    function getProjection: Jol.proj.Projection
    function getSpeed: Float
    function getTracking: Boolean
    function getTrackingOptions: JPositionOptions
    procedure setProjection(projection: Jol.proj.Projection)
    procedure setTracking(tracking: Boolean)
    procedure setTrackingOptions(options: JPositionOptions)
  end;

  JGraticule = class external 'Graticule'
    constructor Create(options: Jolx.GraticuleOptions);
    function getMap: JMap
    function getMeridians: JArray{<Jol.geom.LineString>}
    function getParallels: JArray{<Jol.geom.LineString>}
    procedure setMap(map: JMap)
  end;

  JImage = class external 'Image'(Jol.ImageBase)
    function getImage(context: JHTMLCanvasElement): JImage
    function getImage(context: JHTMLImageElement): JImage
    function getImage(context: JHTMLVideoElement): JImage
  end;

  JImageBase = class external 'ImageBase'
  end;

  JImageTile = class external 'ImageTile'(Jol.Tile)
    function getImage(context: JHTMLCanvasElement): JImage
    function getImage(context: JHTMLImageElement): JImage
    function getImage(context: JHTMLVideoElement): JImage
  end;

  JKinetic = class external 'Kinetic'
    constructor Create(decay: Float; minVelocity: Float; delay: Float);
  end;

  JMap = class external 'Map'(Jol.Object)
    constructor Create(options: Jolx.MapOptions);
    procedure addControl(control: Jol.control.Control)
    procedure addInteraction(interaction: Jol.interaction.Interaction)
    procedure addLayer(layer: Jol.layer.Base)
    procedure addOverlay(overlay: Jol.Overlay)
    procedure beforeRender(var_args: Jol.PreRenderFunction)
    procedure forEachFeatureAtPixel(pixel: Jol.Pixel; callback: function(feature: Jol.Feature; layer: Jol.layer.Layer): Variant) overload;
    procedure forEachFeatureAtPixel(pixel: Jol.Pixel; callback: function(feature: Jol.Feature; layer: Jol.layer.Layer): Variant; ref: Variant) overload;
    procedure forEachFeatureAtPixel(pixel: Jol.Pixel; callback: function(feature: Jol.Feature; layer: Jol.layer.Layer): Variant; ref: Variant; layerFilter: function(layerCandidate: Jol.layer.Layer): Boolean) overload;
    procedure forEachFeatureAtPixel(pixel: Jol.Pixel; callback: function(feature: Jol.Feature; layer: Jol.layer.Layer): Variant; ref: Variant; layerFilter: function(layerCandidate: Jol.layer.Layer): Boolean; ref2: Variant) overload;
    procedure forEachLayerAtPixel(pixel: Jol.Pixel; callback: function(layer: Jol.layer.Layer): Variant) overload;
    procedure forEachLayerAtPixel(pixel: Jol.Pixel; callback: function(layer: Jol.layer.Layer): Variant; ref: Variant) overload;
    procedure forEachLayerAtPixel(pixel: Jol.Pixel; callback: function(layer: Jol.layer.Layer): Variant; ref: Variant; layerFilter: function(layerCandidate: Jol.layer.Layer): Boolean) overload;
    procedure forEachLayerAtPixel(pixel: Jol.Pixel; callback: function(layer: Jol.layer.Layer): Variant; ref: Variant; layerFilter: function(layerCandidate: Jol.layer.Layer): Boolean; ref2: Variant) overload;
    function getControls: Jol.Collection{<Jol.control.Control>}
    function getCoordinateFromPixel(pixel: Jol.Pixel): Jol.Coordinate
    function getEventCoordinate(event: JEvent): Jol.Coordinate
    function getEventPixel(event: JEvent): Jol.Pixel
    function getInteractions: Jol.Collection{<Jol.interaction.Interaction>}
    function getLayerGroup: Jol.layer.Group
    function getLayers: Jol.Collection{<Jol.layer.Base>}
    function getOverlays: Jol.Collection{<Jol.Overlay>}
    function getPixelFromCoordinate(coordinate: Jol.Coordinate): Jol.Pixel
    function getSize: Jol.Size
    function getTarget: Variant {JElement or String}
    function getTargetElement: JElement
    function getView: JView
    function getViewport: JElement
    function hasFeatureAtPixel(pixel: Jol.Pixel): Boolean overload;
    function hasFeatureAtPixel(pixel: Jol.Pixel; layerFilter: function(layer: Jol.layer.Layer): Boolean): Boolean overload;
    function hasFeatureAtPixel(pixel: Jol.Pixel; layerFilter: function(layer: Jol.layer.Layer): Boolean; ref: Variant): Boolean overload;
    function removeControl(control: Jol.control.Control): Jol.control.Control
    function removeInteraction(interaction: Jol.interaction.Interaction): Jol.interaction.Interaction
    function removeLayer(layer: Jol.layer.Base): Jol.layer.Base
    function removeOverlay(overlay: Jol.Overlay): Jol.Overlay
    procedure render
    procedure renderSync
    procedure setLayerGroup(layerGroup: Jol.layer.Group)
    procedure setSize(size: Jol.Size)
    procedure setTarget(target: JElement)
    procedure setTarget(target: String)
    procedure setView(view: JView)
    procedure updateSize
  end;

  JMapBrowserEvent = class external 'MapBrowserEvent'(JMapEvent)
    coordinate: JCoordinate;
    dragging: Boolean;
    frameState: Jolx.FrameState;
    map: JMap;
    originalEvent: JEvent;
    pixel: JPixel;
    procedure preventDefault
    procedure stopPropagation
  end;

  JMapEvent = class external 'MapEvent'
    frameState: Jolx.FrameState;
    map: JMap;
  end;

  JObject = class external 'Object'(JObservable)
    constructor Create(values: JObject);
    function get(key: String): Variant
    function getKeys: JArray{<String>}
    function getProperties: JObject
    function getRevision: Float
    procedure set(key: String; value: Variant)
    procedure setProperties(values: JObject)
    procedure unset(key: String)
  end;

  JObjectEvent = class external 'ObjectEvent'
    key: String;
    oldValue: Variant;
  end;

  JObservable = class external 'Observable'
    procedure unByKey(key: Variant)
    procedure changed
    function getRevision: Float
    function on(&type: String; listener: procedure(event: JMapBrowserEvent)): Variant overload;
    function on(&type: String; listener: procedure(event: JMapBrowserEvent); ref: Variant): Variant overload;
    function on(&type: JArray{<String>}; listener: procedure(event: JMapBrowserEvent)): Variant overload;
    function on(&type: JArray{<String>}; listener: procedure(event: JMapBrowserEvent); ref: Variant): Variant overload;
    function once(&type: String; listener: procedure(event: JMapBrowserEvent)): Variant overload;
    function once(&type: String; listener: procedure(event: JMapBrowserEvent); ref: Variant): Variant overload;
    function once(&type: JArray{<String>}; listener: procedure(event: JMapBrowserEvent)): Variant overload;
    function once(&type: JArray{<String>}; listener: procedure(event: JMapBrowserEvent); ref: Variant): Variant overload;
    function un(&type: JArray{<String>}; listener: procedure(event: JMapBrowserEvent)): Variant overload;
    function un(&type: JArray{<String>}; listener: procedure(event: JMapBrowserEvent); ref: Variant): Variant overload;
    procedure unByKey(key: Variant)
  end;

  JOverlay = class external 'Overlay'(Jol.Object)
    constructor Create(options: Jolx.OverlayOptions);
    function getElement: JElement
    function getMap: Jol.Map
    function getOffset: JArray{<Float>}
    function getPosition: Jol.Coordinate
    function getPositioning: Jol.OverlayPositioning
    procedure setElement(element: JElement)
    procedure setMap(map: JMap)
    procedure setOffset(offset: JArray{<Float>})
    procedure setPosition(position: Jol.Coordinate)
    procedure setPositioning(positioning: Jol.OverlayPositioning)
  end;

  JSelectEvent = class external 'SelectEvent'
    deselected: JArray{<Jol.Feature>};
    mapBrowserEvent: Jol.MapBrowserEvent;
    selected: JArray{<Jol.Feature>};
  end;

  JSphere = class external 'Sphere'
    constructor Create(radius: Float);
    function geodesicArea(coordinates: JArray{<Jol.Coordinate>}): Float
    function haversineDistance(c1: Jol.Coordinate; c2: Jol.Coordinate): Float
  end;

  JTile = class external 'Tile'
    function getTileCoord: Jol.TileCoord
  end;

  JView = class external 'View'(Jol.Object)
    constructor Create(options: Jolx.ViewOptions);
    function calculateExtent(size: Jol.Size): Jol.Extent
    procedure centerOn(coordinate: Jol.Coordinate; size: Jol.Size; position: Jol.Pixel)
    function constrainCenter(center: Jol.Coordinate): Jol.Coordinate
    function constrainResolution(resolution: Float): Float overload;
    function constrainResolution(resolution: Float; delta: Float): Float overload;
    function constrainResolution(resolution: Float; delta: Float; direction: Float): Float overload;
    procedure fitExtent(extent: Jol.Extent; size: Jol.Size)
    procedure fitGeometry(geometry: Jol.geom.SimpleGeometry; size: Jol.Size) overload;
    procedure fitGeometry(geometry: Jol.geom.SimpleGeometry; size: Jol.Size; options: Jolx.view.FitGeometryOptions) overload;
    function getCenter: Jol.Coordinate
    function getProjection: Jol.proj.Projection
    function getResolution: Float
    function getRotation: Float
    function getZoom: Float
    procedure rotate(rotation: Float; anchor: Jol.Coordinate)
    procedure setCenter(center: Jol.Coordinate)
    procedure setResolution(resolution: Float)
    procedure setRotation(rotation: Float)
    procedure setZoom(zoom: Float)
  end;

  JTileLoadFunctionType = class external
    procedure(image: Jol.Image; url: String);
  end;

  JImageLoadFunctionType = class external
    procedure(image: Jol.Image; url: String);
  end;

  JCoordinateFormatType = class external
    function(coordinate: JCoordinate): String;
  end;

  JFeatureLoader = class external
    function(extent: Jol.Extent; number: Float; projection: Jol.proj.Projection): JArray{<JFeature>};
  end;

  JFeatureStyleFunction = class external
    function(resolution: Float): Jol.style.Style;
  end;

  JLoadingStrategy = class external
    function(extent: Jol.Extent; resolution: Float): JArray{<Jol.Extent>};
  end;

  JPreRenderFunction = class external
    function(map: Jol.Map; frameState: Jolx.FrameState): Boolean;
  end;

  JTransformFunction = class external
    function(input: JArray{<Float>}; output: JArray{<Float>}; dimension: Float): JArray{<Float>};
  end;

//animation

function bounce(options: Jolx.animation.BounceOptions): Jol.PreRenderFunction;
function pan(options: Jolx.animation.PanOptions): Jol.PreRenderFunction;
function rotate(options: Jolx.animation.RotateOptions): Jol.PreRenderFunction;
function zoom(options: Jolx.animation.ZoomOptions): Jol.PreRenderFunction;


//color

function asArray(color: Jol.Color): Jol.Color;
function asArray(color: String): Jol.Color;
function asString(color: Jol.Color): String;
function asString(color: String): String;


//control

type
  JAttribution = class external 'Attribution'
  end;

  JControl = class external 'Control'
  end;

  JFullScreen = class external 'FullScreen'
  end;

  JMousePosition = class external 'MousePosition'
  end;

  JOverviewMap = class external 'OverviewMap'
  end;

  JRotate = class external 'Rotate'
  end;

  JScaleLine = class external 'ScaleLine'
  end;

  JZoom = class external 'Zoom'
  end;

  JZoomSlider = class external 'ZoomSlider'
  end;

  JZoomToExtent = class external 'ZoomToExtent'
  end;

  JScaleLineUnits = class external(JString)
  end;

function defaults: Jol.Collection{<Jol.control.Control>}; overload;
function defaults(options: Jolx.control.DefaultsOptions): Jol.Collection{<Jol.control.Control>}; overload;


//coordinate

function add(coordinate: Jol.Coordinate; delta: Jol.Coordinate): Jol.Coordinate;
function createStringXY: Jol.CoordinateFormatType; overload;
function createStringXY(fractionDigits: Float): Jol.CoordinateFormatType; overload;
function format(coordinate: Jol.Coordinate; template: String): String; overload;
function format(coordinate: Jol.Coordinate; template: String; fractionDigits: Float): String; overload;
function rotate(coordinate: Jol.Coordinate; angle: Float): Jol.Coordinate;
function toStringHDMS: String; overload;
function toStringHDMS(coordinate: Jol.Coordinate): String; overload;
function toStringXY: String; overload;
function toStringXY(coordinate: Jol.Coordinate): String; overload;
function toStringXY(coordinate: Jol.Coordinate; fractionDigits: Float): String; overload;


//easing

function easeIn(t: Float): Float;
function easeOut(t: Float): Float;
function inAndOut(t: Float): Float;
function linear(t: Float): Float;
function upAndDown(t: Float): Float;


//events

//condition



//extent

function applyTransform(extent: Jol.Extent; transformFn: Jol.TransformFunction): Jol.Extent; overload;
function applyTransform(extent: Jol.Extent; transformFn: Jol.TransformFunction; destinationExtent: Jol.Extent): Jol.Extent; overload;
function boundingExtent(coordinates: JArray{<Jol.Coordinate>}): Jol.Extent;
function buffer(extent: Jol.Extent; value: Float): Jol.Extent; overload;
function buffer(extent: Jol.Extent; value: Float; destinationExtent: Jol.Extent): Jol.Extent; overload;
function containsCoordinate(extent: Jol.Extent; coordinate: Jol.Coordinate): Boolean;
function containsExtent(extent1: Jol.Extent; extent2: Jol.Extent): Boolean;
function containsXY(extent: Jol.Extent; x: Float; y: Float): Boolean;
function createEmpty: Jol.Extent;
function equals(extent1: Jol.Extent; extent2: Jol.Extent): Boolean;
function extend(extent1: Jol.Extent; extent2: Jol.Extent): Jol.Extent;
function getBottomLeft(extent: Jol.Extent): Jol.Coordinate;
function getBottomRight(extent: Jol.Extent): Jol.Coordinate;
function getCenter(extent: Jol.Extent): Jol.Coordinate;
function getHeight(extent: Jol.Extent): Float;
function getIntersection(extent1: Jol.Extent; extent2: Jol.Extent): Jol.Extent; overload;
function getIntersection(extent1: Jol.Extent; extent2: Jol.Extent; extent: Jol.Extent): Jol.Extent; overload;
function getSize(extent: Jol.Extent): Jol.Size;
function getTopLeft(extent: Jol.Extent): Jol.Coordinate;
function getTopRight(extent: Jol.Extent): Jol.Coordinate;
function getWidth(extent: Jol.Extent): Float;
function intersects(extent1: Jol.Extent; extent2: Jol.Extent): Boolean;
function isEmpty(extent: Jol.Extent): Boolean;


//featureloader

function xhr(url: String; format: Jol.format.Feature): Jol.FeatureLoader;


//format

type
  JEsriJSON = class external 'EsriJSON'
  end;

  JFeature = class external 'Feature'
  end;

  JGeoJSON = class external 'GeoJSON'(Jol.format.JSONFeature)
    constructor Create(options: Jolx.format.GeoJSONOptions);
    function readFeature(source: Variant {JDocument or JNode or JJSON or String}): Jol.Feature overload;
    function readFeature(source: Variant {JDocument or JNode or JJSON or String}; options: Jolx.format.ReadOptions): Jol.Feature overload;
    function readFeatures(source: Variant {JDocument or JNode or JJSON or String}): JArray{<Jol.Feature>} overload;
    function readFeatures(source: Variant {JDocument or JNode or JJSON or String}; options: Jolx.format.ReadOptions): JArray{<Jol.Feature>} overload;
    function readGeometry(source: Variant {JDocument or JNode or JJSON or String}): Jol.geom.Geometry overload;
    function readGeometry(source: Variant {JDocument or JNode or JJSON or String}; options: Jolx.format.ReadOptions): Jol.geom.Geometry overload;
    function readProjection(source: Variant {JDocument or JNode or JJSON or String}): Jol.proj.Projection
    function writeFeature(feature: Jol.Feature): String overload;
    function writeFeature(feature: Jol.Feature; options: Jolx.format.WriteOptions): String overload;
    function writeFeatureObject(feature: Jol.Feature): JJSON overload;
    function writeFeatureObject(feature: Jol.Feature; options: Jolx.format.WriteOptions): JJSON overload;
    function writeFeatures(features: JArray{<Jol.Feature>}): String overload;
    function writeFeatures(features: JArray{<Jol.Feature>}; options: Jolx.format.WriteOptions): String overload;
    function writeFeaturesObject(features: JArray{<Jol.Feature>}): JJSON overload;
    function writeFeaturesObject(features: JArray{<Jol.Feature>}; options: Jolx.format.WriteOptions): JJSON overload;
    function writeGeometry(geometry: Jol.geom.Geometry): String overload;
    function writeGeometry(geometry: Jol.geom.Geometry; options: Jolx.format.WriteOptions): String overload;
    function writeGeometryObject(geometry: Jol.geom.Geometry): JJSON overload;
    function writeGeometryObject(geometry: Jol.geom.Geometry; options: Jolx.format.WriteOptions): JJSON overload;
  end;

  JGML = class external 'GML'
  end;

  JGML2 = class external 'GML2'
  end;

  JGML3 = class external 'GML3'
  end;

  JGMLBase = class external 'GMLBase'
  end;

  JGPX = class external 'GPX'
  end;

  JIGC = class external 'IGC'
  end;

  JJSONFeature = class external 'JSONFeature'
  end;

  JKML = class external 'KML'
  end;

  JOSMXML = class external 'OSMXML'
  end;

  JPolyline = class external 'Polyline'
  end;

  JTextFeature = class external 'TextFeature'
  end;

  JTopoJSON = class external 'TopoJSON'
  end;

  JWFS = class external 'WFS'
  end;

  JWKT = class external 'WKT'
  end;

  JWMSCapabilities = class external 'WMSCapabilities'
  end;

  JWMSGetFeatureInfo = class external 'WMSGetFeatureInfo'
  end;

  JWMTSCapabilities = class external 'WMTSCapabilities'
  end;

  JXML = class external 'XML'
  end;

  JXMLFeature = class external 'XMLFeature'
  end;

  JIGCZ = class external(JString)
  end;


//geom

type
  JCircle = class external 'Circle'(Jol.geom.SimpleGeometry)
    function intersectsExtent(extent: Jol.Extent): Boolean
    function transform(source: Jol.proj.ProjectionLike; destination: Jol.proj.ProjectionLike): Jol.geom.Circle
  end;

  JGeometry = class external 'Geometry'(Jol.Object)
    function getClosestPoint(point: Jol.Coordinate): Jol.Coordinate overload;
    function getClosestPoint(point: Jol.Coordinate; closestPoint: Jol.Coordinate): Jol.Coordinate overload;
    function getExtent: Jol.Extent overload;
    function getExtent(extent: Jol.Extent): Jol.Extent overload;
  end;

  JGeometryCollection = class external 'GeometryCollection'(Jol.geom.Geometry)
    constructor Create(geometries: JArray{<Jol.geom.Geometry>});
    procedure applyTransform(transformFn: Jol.TransformFunction)
    function clone: Jol.geom.GeometryCollection
    function getGeometries: JArray{<JGeometry>}
    function getType: Jol.geom.GeometryType
    function intersectsExtent(extent: Jol.Extent): Boolean
    procedure setGeometries(geometries: JArray{<Jol.geom.Geometry>})
  end;

  JLinearRing = class external 'LinearRing'(JSimpleGeometry)
    constructor Create(coordinates: JArray{<Jol.Coordinate>}; layout: Jol.geom.GeometryLayout);
    function clone: Jol.geom.LinearRing
    function getArea: Float
    function getCoordinates: JArray{<Jol.Coordinate>}
    function getType: Jol.geom.GeometryType
    procedure setCoordinates(coordinates: JArray{<Jol.Coordinate>}) overload;
    procedure setCoordinates(coordinates: JArray{<Jol.Coordinate>}; layout: Variant) overload;
  end;

  JLineString = class external 'LineString'(Jol.geom.SimpleGeometry)
    constructor Create(coordinates: JArray{<Jol.Coordinate>}; layout: Jol.geom.GeometryLayout);
    procedure appendCoordinate(coordinate: Jol.Coordinate)
    function clone: Jol.geom.LineString
    function getCoordinateAtM(m: Float): Jol.Coordinate overload;
    function getCoordinateAtM(m: Float; extrapolate: Boolean): Jol.Coordinate overload;
    function getCoordinates: JArray{<Jol.Coordinate>}
    function getLength: Float
    function getType: Jol.geom.GeometryType
    function intersectsExtent(extent: Jol.Extent): Boolean
    procedure setCoordinates(coordinates: JArray{<Jol.Coordinate>}) overload;
    procedure setCoordinates(coordinates: JArray{<Jol.Coordinate>}; layout: Jol.geom.GeometryLayout) overload;
  end;

  JMultiLineString = class external 'MultiLineString'(Jol.geom.SimpleGeometry)
    constructor Create(coordinates: JArray{<JArray{<Jol.Coordinate>}>}; layout: Jol.geom.GeometryLayout);
    procedure appendLineString(lineString: Jol.geom.LineString)
    function clone: Jol.geom.MultiLineString
    function getCoordinateAtM(m: Float): Jol.Coordinate overload;
    function getCoordinateAtM(m: Float; extrapolate: Boolean): Jol.Coordinate overload;
    function getCoordinateAtM(m: Float; extrapolate: Boolean; interpolate: Boolean): Jol.Coordinate overload;
    function getCoordinates: JArray{<JArray{<Jol.Coordinate>}>}
    function getLineString(index: Float): Jol.geom.LineString
    function getLineStrings: JArray{<Jol.geom.LineString>}
    function getType: Jol.geom.GeometryType
    function intersectsExtent(extent: Jol.Extent): Boolean
    procedure setCoordinates(coordinates: JArray{<JArray{<Jol.Coordinate>}>}) overload;
    procedure setCoordinates(coordinates: JArray{<JArray{<Jol.Coordinate>}>}; layout: Jol.geom.GeometryLayout) overload;
  end;

  JMultiPoint = class external 'MultiPoint'(Jol.geom.SimpleGeometry)
    constructor Create(coordinates: JArray{<Jol.Coordinate>}; layout: Jol.geom.GeometryLayout);
    procedure appendPoint(point: Jol.geom.Point)
    function clone: Jol.geom.MultiPoint
    function getCoordinates: JArray{<Jol.Coordinate>}
    function getPoint(index: Float): Jol.geom.Point
    function getPoints: JArray{<Jol.geom.Point>}
    function getType: Jol.geom.GeometryType
    function intersectsExtent(extent: Jol.Extent): Boolean
    procedure setCoordinates(coordinates: JArray{<Jol.Coordinate>}) overload;
    procedure setCoordinates(coordinates: JArray{<Jol.Coordinate>}; layout: Jol.geom.GeometryLayout) overload;
  end;

  JMultiPolygon = class external 'MultiPolygon'(Jol.geom.SimpleGeometry)
    constructor Create(coordinates: JArray{<JArray{<JArray{<Jol.Coordinate>}>}>}; layout: Jol.geom.GeometryLayout);
    procedure appendPolygon(polygon: Jol.geom.Polygon)
    function clone: Jol.geom.MultiPolygon
    function getArea: Float
    function getCoordinates: JArray{<JArray{<JArray{<Jol.Coordinate>}>}>} overload;
    function getCoordinates(right: Boolean): JArray{<JArray{<JArray{<Jol.Coordinate>}>}>} overload;
    function getInteriorPoints: Jol.geom.MultiPoint
    function getPolygon(index: Float): Jol.geom.Polygon
    function getPolygons: JArray{<Jol.geom.Polygon>}
    function getType: Jol.geom.GeometryType
    function intersectsExtent(extent: Jol.Extent): Boolean
    procedure setCoordinates(coordinates: JArray{<JArray{<JArray{<Jol.Coordinate>}>}>}) overload;
    procedure setCoordinates(coordinates: JArray{<JArray{<JArray{<Jol.Coordinate>}>}>}; layout: Jol.geom.GeometryLayout) overload;
  end;

  JPoint = class external 'Point'(JSimpleGeometry)
    constructor Create(coordinates: Jol.Coordinate; layout: Jol.geom.GeometryLayout);
    function clone: Jol.geom.Point
    function getCoordinates: Jol.Coordinate
    function getType: Jol.geom.GeometryType
    function intersectsExtent(extent: Jol.Extent): Boolean
    procedure setCoordinates(coordinates: Jol.Coordinate) overload;
    procedure setCoordinates(coordinates: Jol.Coordinate; layout: Jol.geom.GeometryLayout) overload;
  end;

  JPolygon = class external 'Polygon'(JSimpleGeometry)
    constructor Create(coordinates: JArray{<JArray{<Jol.Coordinate>}>}; layout: Jol.geom.GeometryLayout);
    function circular(sphere: Jol.Sphere; center: Jol.Coordinate; radius: Float): Jol.geom.Polygon overload;
    function circular(sphere: Jol.Sphere; center: Jol.Coordinate; radius: Float; n: Float): Jol.geom.Polygon overload;
    procedure appendLinearRing(linearRing: Jol.geom.LinearRing)
    function clone: Jol.geom.Polygon
    function getArea: Float
    function getCoordinates: JArray{<JArray{<Jol.Coordinate>}>} overload;
    function getCoordinates(right: Boolean): JArray{<JArray{<Jol.Coordinate>}>} overload;
    function getInteriorPoint: Jol.geom.Point
    function getLinearRing(index: Float): Jol.geom.LinearRing
    function getLinearRings: JArray{<Jol.geom.LinearRing>}
    function getType: Jol.geom.GeometryType
    function intersectsExtent(extent: Jol.Extent): Boolean
    procedure setCoordinates(coordinates: JArray{<JArray{<Jol.Coordinate>}>}) overload;
    procedure setCoordinates(coordinates: JArray{<JArray{<Jol.Coordinate>}>}; layout: Jol.geom.GeometryLayout) overload;
  end;

  JSimpleGeometry = class external 'SimpleGeometry'(Jol.geom.Geometry)
    procedure applyTransform(transformFn: Jol.TransformFunction)
    function getFirstCoordinate: Jol.Coordinate
    function getLastCoordinate: Jol.Coordinate
    function getLayout: Jol.geom.GeometryLayout
    procedure translate(deltaX: Float; deltaY: Float)
  end;

  JGeometryLayout = class external(JString)
  end;

  JGeometryType = class external(JString)
  end;


//has


//interaction

type
  JDoubleClickZoom = class external 'DoubleClickZoom'
  end;

  JDragAndDrop = class external 'DragAndDrop'
  end;

  JDragAndDropEvent = class external 'DragAndDropEvent'
  end;

  JDragBox = class external 'DragBox'
  end;

  JDragPan = class external 'DragPan'
  end;

  JDragRotate = class external 'DragRotate'
  end;

  JDragRotateAndZoom = class external 'DragRotateAndZoom'
  end;

  JDragZoom = class external 'DragZoom'
  end;

  JDraw = class external 'Draw'
  end;

  JDrawEvent = class external 'DrawEvent'
  end;

  JInteraction = class external 'Interaction'
  end;

  JKeyboardPan = class external 'KeyboardPan'
  end;

  JKeyboardZoom = class external 'KeyboardZoom'
  end;

  JModify = class external 'Modify'
  end;

  JMouseWheelZoom = class external 'MouseWheelZoom'
  end;

  JPinchRotate = class external 'PinchRotate'
  end;

  JPinchZoom = class external 'PinchZoom'
  end;

  JPointer = class external 'Pointer'
  end;

  JSelect = class external 'Select'
  end;

  JSnap = class external 'Snap'
  end;

function defaults(opts: Jolx.interaction.DefaultsOptions): Jol.Collection{<Jol.interaction.Interaction>};


//layer

type
  JBase = class external 'Base'(Jol.Object)
    constructor Create(options: Jolx.layer.BaseOptions);
    function getBrightness: Float
    function getContrast: Float
    function getExtent: Jol.Extent
    function getHue: Float
    function getMaxResolution: Float
    function getMinResolution: Float
    function getOpacity: Float
    function getSaturation: Float
    function getVisible: Boolean
    procedure setBrightness(brigthness: Float)
    procedure setContrast(contrast: Float)
    procedure setExtent overload;
    procedure setExtent(extent: Jol.Extent) overload;
    procedure setHue(hue: Float)
    procedure setMaxResolution(maxResolution: Float)
    procedure setMinResolution(minResolution: Float)
    procedure setOpacity(opacity: Float)
    procedure setSaturation(saturation: Float)
    procedure setVisible(visible: Boolean)
  end;

  JGroup = class external 'Group'(Jol.layer.Base)
    constructor Create(options: Jolx.layer.GroupOptions);
    function getLayers: Jol.Collection{<Jol.layer.Base>}
    procedure setLayers(layers: Jol.Collection{<Jol.layer.Base>})
  end;

  JHeatmap = class external 'Heatmap'(Jol.layer.Vector)
    constructor Create(options: Jolx.layer.HeatmapOptions);
    function getBlur: Float
    function getGradient: JArray{<String>}
    function getRadius: Float
    procedure setBlur(blur: Float)
    procedure setGradient(colors: JArray{<String>})
    procedure setRadius(radius: Float)
  end;

  JImage = class external 'Image'(Jol.layer.Layer)
    constructor Create(options: Jolx.layer.ImageOptions);
    function getSource: Jol.source.Image
  end;

  JLayer = class external 'Layer'(Jol.layer.Base)
    constructor Create(options: Jolx.layer.LayerOptions);
    function getSource: Jol.source.Source
    procedure setSource(source: Jol.source.Source)
  end;

  JTile = class external 'Tile'(Jol.layer.Layer)
    constructor Create(options: Jolx.layer.TileOptions);
    function getPreload: Float
    function getSource: Jol.source.Tile
    function getUseInterimTilesOnError: Boolean
    procedure setPreload(preload: Float)
    procedure setUseInterimTilesOnError(useInterimTilesOnError: Boolean)
  end;

  JVector = class external 'Vector'(Jol.layer.Layer)
    constructor Create(options: Jolx.layer.VectorOptions);
    function getSource: Jol.source.Vector
    function getStyle: Variant {Jol.style.Style or JArray{<Jol.style.Style>} or Jol.style.StyleFunction}
    function getStyleFunction: Jol.style.StyleFunction
    procedure setStyle
    procedure setStyle(style: Jol.style.Style)
    procedure setStyle(style: JArray{<Jol.style.Style>})
    procedure setStyle(style: Jol.style.StyleFunction)
  end;


//loadingstrategy

function all(extent: Jol.Extent; resolution: Float): JArray{<Jol.Extent>};
function bbox(extent: Jol.Extent; resolution: Float): JArray{<Jol.Extent>};
function tile(tileGrid: Jol.tilegrid.TileGrid): Jol.LoadingStrategy;


//proj

type
  JProjection = class external 'Projection'
    constructor Create(options: Jolx.Projection);
  end;

  JProjectionLike = class external(JString)
  end;

  JUnits = class external(JString)
  end;

procedure addCoordinateTransforms(source: JProjectionLike; destination: JProjectionLike; forward: function(coordinate: JCoordinate): JCoordinate; inverse: function(coordinate: JCoordinate): JCoordinate);
procedure addEquivalentProjections(projections: JArray{<JProjection>});
procedure addProjection(projection: JProjection);
function fromLonLat(coordinate: JCoordinate; opt_projection: JProjectionLike): JCoordinate;
function get(projectionLike: JProjectionLike): JProjection;
function getTransform(source: JProjectionLike; destination: JProjectionLike): Jol.TransformFunction;
function toLonLat(coordinate: JCoordinate; projection: JProjectionLike): JCoordinate;
function transform(coordinate: JCoordinate; source: JProjectionLike; destination: JProjectionLike): JCoordinate;
function transformExtent(extent: JExtent; source: JProjectionLike; destination: JProjectionLike): JExtent;

var
  METERS_PER_UNIT: JObject;


//render

type
  JEvent = class external 'Event'
  end;

  JVectorContext = class external 'VectorContext'
  end;

//canvas

type
  JImmediate = class external 'Immediate'
  end;



//source

type
  JBingMaps = class external 'BingMaps'
  end;

  JCluster = class external 'Cluster'
  end;

  JImage = class external 'Image'
  end;

  JImageCanvas = class external 'ImageCanvas'
  end;

  JImageEvent = class external 'ImageEvent'
  end;

  JImageMapGuide = class external 'ImageMapGuide'
  end;

  JImageStatic = class external 'ImageStatic'
  end;

  JImageVector = class external 'ImageVector'
  end;

  JImageWMS = class external 'ImageWMS'
    constructor Create(options: Jolx.ImageWMSOptions);
  end;

  JMapQuest = class external 'MapQuest'
    constructor Create(options: Variant);
  end;

  JOSM = class external 'OSM'
  end;

  JSource = class external 'Source'
  end;

  JStamen = class external 'Stamen'
  end;

  JTile = class external 'Tile'
  end;

  JTileArcGISRest = class external 'TileArcGISRest'
  end;

  JTileDebug = class external 'TileDebug'
  end;

  JTileEvent = class external 'TileEvent'
  end;

  JTileImage = class external 'TileImage'
  end;

  JTileJSON = class external 'TileJSON'
  end;

  JTileUTFGrid = class external 'TileUTFGrid'
  end;

  JTileVector = class external 'TileVector'
  end;

  JTileWMS = class external 'TileWMS'
    constructor Create(options: Jolx.TileWMSOptions);
  end;

  JVector = class external 'Vector'
    constructor Create(opts: Jolx.source.VectorOptions);
    function getExtent: Jol.Extent
    function getFeaturesInExtent(extent: Jol.Extent): array of Jol.Feature
  end;

  JVectorEvent = class external 'VectorEvent'
  end;

  JWMTS = class external 'WMTS'
  end;

  JXYZ = class external 'XYZ'
  end;

  JZoomify = class external 'Zoomify'
  end;

  JState = class external(JString)
  end;

  JWMTSRequestEncoding = class external(JString)
  end;

//wms

type
  JServerType = class external(JString)
  end;



//style

type
  JAtlasManager = class external 'AtlasManager'
  end;

  JCircle = class external 'Circle'
  end;

  JFill = class external 'Fill'
    constructor Create(opt_options: Jolx.style.FillOptions);
    function getColor: Variant {Jol.Color or String}
    procedure setColor(color: Variant {Jol.Color or String})
    function getChecksum: String
  end;

  JIcon = class external 'Icon'
  end;

  JImage = class external 'Image'
  end;

  JRegularShape = class external 'RegularShape'
  end;

  JStroke = class external 'Stroke'
    constructor Create;
  end;

  JStyle = class external 'Style'
    constructor Create(opts: Jolx.style.StyleOptions);
  end;

  JText = class external 'Text'
    constructor Create(opt: Jolx.style.TextOptions);
    function getFont: String
    function getOffsetX: Float
    function getOffsetY: Float
    function getFill: JFill
    function getRotation: Float
    function getScale: Float
    function getStroke: JStroke
    function getText: String
    function getTextAlign: String
    function getTextBaseline: String
    procedure setFont(font: String)
    procedure setOffsetX(offsetX: Float)
    procedure setOffsetY(offsetY: Float)
    procedure setFill(fill: JFill)
    procedure setRotation(rotation: Float)
    procedure setScale(scale: Float)
    procedure setStroke(stroke: JStroke)
    procedure setText(text: String)
    procedure setTextAlign(textAlign: String)
    procedure setTextBaseline(textBaseline: String)
  end;

  JGeometryFunction = class external
    function(feature: JFeature): Jol.geom.Geometry;
  end;

  JStyleFunction = class external
    function(feature: Jol.Feature; resolution: Float): Jol.style.Style;
  end;


//tilegrid

type
  JTileGrid = class external 'TileGrid'
    constructor Create(options: Jolx.tilegrid.TileGridOptions);
    function createTileCoordTransform:       function(tilecoord: Jol.TileCoord; projection: Jol.proj.Projection): Jol.TileCoord;
    end;
    function getMaxZoom: Float
    function getMinZoom: Float
    function getOrigin(z: Float): Jol.Coordinate
    function getResolution(z: Float): Float
    function getResolutions: JArray{<Float>}
    function getTileCoordForCoordAndResolution(coordinate: Jol.Coordinate; resolution: Float): Jol.TileCoord overload;
    function getTileCoordForCoordAndResolution(coordinate: Jol.Coordinate; resolution: Float; tileCoord: Jol.TileCoord): Jol.TileCoord overload;
    function getTileCoordForCoordAndZ(coordinate: Jol.Coordinate; z: Float): Jol.TileCoord overload;
    function getTileCoordForCoordAndZ(coordinate: Jol.Coordinate; z: Float; tileCoord: Jol.TileCoord): Jol.TileCoord overload;
    function getTileSize(z: Float): Variant {Float or Jol.Size}
  end;

  JWMTS = class external 'WMTS'(JTileGrid)
    constructor Create(options: Jolx.tilegrid.WMTSOptions);
    function createFromCapabilitiesMatrixSet(matrixSet: Variant; extent: Jol.Extent): Jol.tilegrid.WMTS
    function getMatrixIds: JArray{<String>}
  end;

  JZoomify = class external 'Zoomify'(JTileGrid)
    constructor Create(options: Jolx.tilegrid.ZoomifyOptions);
  end;

function createXYZ: Jol.tilegrid.TileGrid; overload;
function createXYZ(options: Jolx.tilegrid.XYZOptions): Jol.tilegrid.TileGrid; overload;


//webgl

type
  JContext = class external 'Context'
    constructor Create(canvas: JHTMLCanvasElement; gl: JWebGLRenderingContext);
    function getGL: JWebGLRenderingContext
    function getHitDetectionFramebuffer: JWebGLFramebuffer
    function useProgram(program: JWebGLProgram): Boolean
  end;


function CanvasFunctionType(extent: JExtent; resolution, pixelRatio: Float; size: JSize; projection: Jproj.Projection): JHTMLCanvasElement;


//"openlayers"


