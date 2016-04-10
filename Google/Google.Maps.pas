unit Google.maps;

interface

uses
  ECMA.Date, W3C.DOM, W3C.HTML5;

//google.maps

type
  // TODO!!!!
  JControlPosition = Variant;
  JScaleControlStyle = Variant;
  JZoomControlStyle = Variant;
  JMapTypeControlStyle = Variant;
  JAnimation = Variant;
  JMapTypeId = Variant;
  JStreetViewStatus = Variant;
  JStrokePosition = Variant;
  JGeocoderLocationType = Variant;
  JGeocoderStatus = Variant;
  JVehicleType = Variant;
  JTravelMode = Variant;
  JTransitMode = Variant;
  JTransitRoutePreference = Variant;
  JUnitSystem = Variant;
  JDirectionsStatus = Variant;
  JElevationStatus = Variant;
  JMaxZoomStatus = Variant;
  JDistanceMatrixElementStatus = Variant;
  JDistanceMatrixStatus = Variant;
  TKmlLayerStatus = String;
  TKmlLayerStatusHelper = strict helper for TKmlLayerStatus
    const DOCUMENT_NOT_FOUND = 'DOCUMENT_NOT_FOUND';
    const DOCUMENT_TOO_LARGE = 'DOCUMENT_TOO_LARGE';
    const FETCH_ERROR = 'FETCH_ERROR';
    const INVALID_DOCUMENT = 'INVALID_DOCUMENT';
    const INVALID_REQUEST = 'INVALID_REQUEST';
    const LIMITS_EXCEEDED = 'LIMITS_EXCEEDED';
    const OK = 'OK';
    const TIMED_OUT = 'TIMED_OUT';
    const UNKNOWN = 'UNKNOWN';
  end;

  JAdFormat = Variant;
  JPlacesServiceStatus = Variant;
  JRankBy = Variant;
  JOverlayType = Variant;
  JMapsEngineStatus = Variant;

  JMap = class;

  JMapsEventListener = class external
  end;

  JLatLng = class external 'LatLng'
    constructor Create(lat: Float; lng: Float; noWrap: Boolean);
    function equals(other: JLatLng): Boolean;
    function lat: Float;
    function lng: Float;
    function toString: String;
    function toUrlValue: String; overload;
    function toUrlValue(precision: Float): String; overload;
  end;

  JLatLngLiteral = record
    lat: Float;
    lng: Float;
  end;

  JLatLngBounds = class external 'LatLngBounds'
    constructor Create(sw: JLatLng; ne: JLatLng);
    function contains(latLng: JLatLng): Boolean;
    function equals(other: JLatLngBounds): Boolean;
    function extend(point: JLatLng): JLatLngBounds;
    function getCenter: JLatLng;
    function getNorthEast: JLatLng;
    function getSouthWest: JLatLng;
    function intersects(other: JLatLngBounds): Boolean;
    function isEmpty: Boolean;
    function toSpan: JLatLng;
    function toString: String;
    function toUrlValue: String; overload;
    function toUrlValue(precision: Float): String; overload;
    function union(other: JLatLngBounds): JLatLngBounds;
  end;

  JPoint = class external 'Point'
    constructor Create(x: Float; y: Float);
    x: Float;
    y: Float;
    function equals(other: JPoint): Boolean;
    function toString: String;
  end;

  JSize = class external 'Size'
    constructor Create(width: Float; height: Float; widthUnit: String; heightUnit: String);
    height: Float;
    width: Float;
    function equals(other: JSize): Boolean;
    function toString: String;
  end;

  JMVCObject = class external 'MVCObject'
    constructor Create;
    function addListener(eventName: String; handler: procedure(args: array of Variant)): JMapsEventListener;
    procedure bindTo(key: String; target: JMVCObject); overload;
    procedure bindTo(key: String; target: JMVCObject; targetKey: String); overload;
    procedure bindTo(key: String; target: JMVCObject; targetKey: String; noNotify: Boolean); overload;
    procedure changed(key: String);
    function get(key: String): Variant;
    procedure notify(key: String);
    procedure set(key: String; value: Variant);
    procedure setValues(values: Variant);
    procedure unbind(key: String);
    procedure unbindAll;
  end;

  JMVCArray = class external 'MVCArray'(JMVCObject)
    constructor Create(&array: array of Variant);
    procedure clear;
    procedure forEach(callback: procedure(elem: Variant; i: Float));
    function getArray: array of Variant;
    function getAt(i: Float): Variant;
    function getLength: Float;
    procedure insertAt(i: Float; elem: Variant);
    function pop: Variant;
    function push(elem: Variant): Float;
    function removeAt(i: Float): Variant;
    procedure setAt(i: Float; elem: Variant);
  end;

  JMapTypeControlOptions = class external
    mapTypeIds: array of Variant {JMapTypeId or String}; // nullable
    position: JControlPosition; // nullable
    style: JMapTypeControlStyle; // nullable
  end;

  JOverviewMapControlOptions = class external
    opened: Boolean; // nullable
  end;

  JPanControlOptions = class external
    position: JControlPosition; // nullable
  end;

  JRotateControlOptions = class external
    position: JControlPosition; // nullable
  end;

  JScaleControlOptions = class external
    style: JScaleControlStyle; // nullable
  end;

  JStreetViewControlOptions = class external
    position: JControlPosition; // nullable
  end;

  JZoomControlOptions = class external
    position: JControlPosition; // nullable
    style: JZoomControlStyle; // nullable
  end;

  JAttribution = class external
    iosDeepLinkId: String; // nullable
    source: String; // nullable
    webUrl: String; // nullable
  end;

  JPlace = class external
    location: Variant {JLatLng or JLatLngLiteral}; // nullable
    placeId: String; // nullable
    query: String; // nullable
  end;

  JSaveWidgetOptions = class external
    attribution: JAttribution; // nullable
    place: JPlace; // nullable
  end;

  JMarkerShape = class external
    coords: array of Float; // nullable
    &type: String; // nullable
  end;

  JStreetViewAddressControlOptions = class external
    position: JControlPosition; // nullable
  end;

  JStreetViewLocation = class external
    description: String; // nullable
    latLng: JLatLng; // nullable
    pano: String; // nullable
    shortDescription: String; // nullable
  end;

  JStreetViewLink = class external
    description: String; // nullable
    heading: Float; // nullable
    pano: String; // nullable
  end;

  JStreetViewPov = class external
    heading: Float; // nullable
    pitch: Float; // nullable
  end;

  JStreetViewTileData = class external
    function getTileUrl(pano: String; tileZoom: Float; tileX: Float; tileY: Float): String;
    centerHeading: Float; // nullable
    tileSize: JSize; // nullable
    worldSize: JSize; // nullable
  end;

  JStreetViewPanoramaData = class external
    copyright: String; // nullable
    imageDate: String; // nullable
    links: array of JStreetViewLink; // nullable
    location: JStreetViewLocation; // nullable
    tiles: JStreetViewTileData; // nullable
  end;

  JStreetViewPanoramaOptions = class external
    addressControl: Boolean; // nullable
    addressControlOptions: JStreetViewAddressControlOptions; // nullable
    clickToGo: Boolean; // nullable
    disableDefaultUi: Boolean; // nullable
    disableDoubleClickZoom: Boolean; // nullable
    enableCloseButton: Boolean; // nullable
    imageDateControl: Boolean; // nullable
    linksControl: Boolean; // nullable
    panControl: Boolean; // nullable
    panControlOptions: JPanControlOptions; // nullable
    pano: String; // nullable
    panoProvider: function(input: String): JStreetViewPanoramaData; // nullable
    position: Variant {JLatLng or JLatLngLiteral}; // nullable
    pov: JStreetViewPov; // nullable
    scrollwheel: Boolean; // nullable
    visible: Boolean; // nullable
    zoomControl: Boolean; // nullable
    zoomControlOptions: JZoomControlOptions; // nullable
  end;

  JStreetViewPanorama = class external 'StreetViewPanorama'
    constructor Create(container: JElement; opts: JStreetViewPanoramaOptions);
    controls: array of JMVCArray;
    function getLinks: array of JStreetViewLink;
    function getLocation: JStreetViewLocation;
    function getPano: String;
    function getPhotographerPov: JStreetViewPov;
    function getPosition: JLatLng;
    function getPov: JStreetViewPov;
    function getStatus: JStreetViewStatus;
    function getVisible: Boolean;
    function getZoom: Float;
    procedure registerPanoProvider(provider: function(input: String): JStreetViewPanoramaData);
// TODO:    procedure setLinks(links: JArray{<JStreetViewLink>});
    procedure setOptions(options: JStreetViewPanoramaOptions);
    procedure setPano(pano: String);
    procedure setPosition(latLng: JLatLng); overload;
    procedure setPosition(latLng: JLatLngLiteral); overload;
    procedure setPov(pov: JStreetViewPov);
    procedure setVisible(flag: Boolean);
    procedure setZoom(zoom: Float);
  end;

  TStreetViewServiceCallback = procedure(streetViewPanoramaData: JStreetViewPanoramaData; streetViewStatus: JStreetViewStatus);
  JStreetViewService = class external 'StreetViewService'
    procedure getPanoramaById(pano: String; callback: TStreetViewServiceCallback);
    procedure getPanoramaByLocation(latlng: JLatLng; radius: Float;
      callback: TStreetViewServiceCallback); overload;
    procedure getPanoramaByLocation(latlng: JLatLngLiteral; radius: Float;
      callback: TStreetViewServiceCallback); overload;
  end;

  JStreetViewCoverageLayer = class external 'StreetViewCoverageLayer'(JMVCObject)
    function getMap: JMap;
    procedure setMap(map: JMap);
  end;

  JMarkerOptions = class external
    anchorPoint: JPoint; // nullable
    animation: JAnimation; // nullable
    clickable: Boolean; // nullable
    cursor: String; // nullable
    draggable: Boolean; // nullable
    icon: Variant {String or JIcon or JSymbol}; // nullable
    map: Variant {JMap or JStreetViewPanorama}; // nullable
    opacity: Float; // nullable
    optimized: Boolean; // nullable
    place: JPlace; // nullable
    position: JLatLng;
    shape: JMarkerShape; // nullable
    title: String; // nullable
    visible: Boolean; // nullable
    zIndex: Float; // nullable
  end;

  JMapTypeStyleElementType = class external
    all: String; // nullable
    geometry: record
      fill: String; // nullable
      stroke: String; // nullable
    end; // nullable
    labels: record
      icon: String; // nullable
      text: record
        fill: String; // nullable
        stroke: String; // nullable
      end; // nullable
    end; // nullable
  end;

  JMapTypeStyleFeatureType = class external
    administrative: record
      country: String; // nullable
      land_parcel: String; // nullable
      locality: String; // nullable
      neighborhood: String; // nullable
      province: String; // nullable
    end; // nullable
    all: String; // nullable
    landscape: record
      man_made: String; // nullable
      natural: record
        landcover: String; // nullable
        terrain: String; // nullable
      end; // nullable
    end; // nullable
    poi: record
      attraction: String; // nullable
      business: String; // nullable
      government: String; // nullable
      medical: String; // nullable
      park: String; // nullable
      place_of_worship: String; // nullable
      school: String; // nullable
      sports_complex: String; // nullable
    end; // nullable
    road: record
      arterial: String; // nullable
      highway: record
        controlled_access: String; // nullable
      end; // nullable
      local: String; // nullable
    end; // nullable
    transit: record
      line: String; // nullable
      station: record
        airport: String; // nullable
        bus: String; // nullable
        rail: String; // nullable
      end; // nullable
    end; // nullable
    water: String; // nullable
  end;

  JMapTypeStyler = class external
    color: String; // nullable
    gamma: Float; // nullable
    hue: String; // nullable
    invert_lightness: Boolean; // nullable
    lightness: Float; // nullable
    saturation: Float; // nullable
    visibility: String; // nullable
    weight: Float; // nullable
  end;

  JMapTypeStyle = class external
    elementType: JMapTypeStyleElementType; // nullable
    featureType: JMapTypeStyleFeatureType; // nullable
    stylers: array of JMapTypeStyler; // nullable
  end;

  JMapOptions = class external
    backgroundColor: String; // nullable
    center: JLatLng; // nullable
    disableDefaultUI: Boolean; // nullable
    disableDoubleClickZoom: Boolean; // nullable
    draggable: Boolean; // nullable
    draggableCursor: String; // nullable
    draggingCursor: String; // nullable
    heading: Float; // nullable
    keyboardShortcuts: Boolean; // nullable
    mapMaker: Boolean; // nullable
    mapTypeControl: Boolean; // nullable
    mapTypeControlOptions: JMapTypeControlOptions; // nullable
    mapTypeId: JMapTypeId; // nullable
    maxZoom: Float; // nullable
    minZoom: Float; // nullable
    noClear: Boolean; // nullable
    overviewMapControl: Boolean; // nullable
    overviewMapControlOptions: JOverviewMapControlOptions; // nullable
    panControl: Boolean; // nullable
    panControlOptions: JPanControlOptions; // nullable
    rotateControl: Boolean; // nullable
    rotateControlOptions: JRotateControlOptions; // nullable
    scaleControl: Boolean; // nullable
    scaleControlOptions: JScaleControlOptions; // nullable
    scrollwheel: Boolean; // nullable
    streetView: JStreetViewPanorama; // nullable
    streetViewControl: Boolean; // nullable
    streetViewControlOptions: JStreetViewControlOptions; // nullable
    styles: array of JMapTypeStyle; // nullable
    tilt: Float; // nullable
    zoom: Float; // nullable
    zoomControl: Boolean; // nullable
    zoomControlOptions: JZoomControlOptions; // nullable
  end;

  JProjection = class external
    function fromLatLngToPoint(latLng: JLatLng): JPoint; overload;
    function fromLatLngToPoint(latLng: JLatLng; point: JPoint): JPoint; overload;
    function fromPointToLatLng(pixel: JPoint): JLatLng; overload;
    function fromPointToLatLng(pixel: JPoint; noWrap: Boolean): JLatLng; overload;
  end;

  JDataFeatureOptions = class external 'Data.FeatureOptions'
    geometry: Variant {JData.Geometry or JLatLng or JLatLngLiteral}; // nullable
    id: Variant {Float or String}; // nullable
    properties: JObject; // nullable
  end;

  JDataGeometry = class external 'Data.Geometry'
    function getType: String;
  end;

  JDataFeature = class external 'Data.Feature'
    constructor Create(options: JDataFeatureOptions);
    procedure forEachProperty(callback: procedure(value: Variant; name: String));
    function getGeometry: JDataGeometry;
    function getId: Variant {Float or String};
    function getProperty(name: String): Variant;
    procedure removeProperty(name: String);
    procedure setGeometry(newGeometry: JDataGeometry); overload;
    procedure setGeometry(newGeometry: JLatLng); overload;
    procedure setGeometry(newGeometry: JLatLngLiteral); overload;
    procedure setProperty(name: String; newValue: Variant);
    procedure toGeoJson(callback: procedure(feature: JObject));
  end;

  JDataStyleOptions = class external
    clickable: Boolean; // nullable
    cursor: String; // nullable
    draggable: Boolean; // nullable
    editable: Boolean; // nullable
    fillColor: String; // nullable
    fillOpacity: Float; // nullable
    icon: Variant {String or JIcon or JSymbol}; // nullable
    shape: JMarkerShape; // nullable
    strokeColor: String; // nullable
    strokeOpacity: Float; // nullable
    strokeWeight: Float; // nullable
    title: String; // nullable
    visible: Boolean; // nullable
    zIndex: Float; // nullable
  end;

  TDataStylingFunction = function (feature: JDataFeature): JDataStyleOptions;

  JDataOptions = class external
    controlPosition: JControlPosition; // nullable
    controls: array of String; // nullable
    drawingMode: String; // nullable
    featureFactory: function (geometry: JDataGeometry): JDataFeature; // nullable
    map: JMap; // nullable
    style: Variant {JData.StylingFunction or TDataStylingFunction}; // nullable
  end;

  JDataGeoJsonOptions = class external
    idPropertyName: String; // nullable
  end;

  JData = class external 'Data'(JMVCObject)
    constructor Create(options: JDataOptions);
    function add(feature: JDataFeature): JDataFeature; overload;
    function add(feature: JDataFeatureOptions): JDataFeature; overload;
    function addGeoJson(geoJson: JObject): array of JDataFeature; overload;
    function addGeoJson(geoJson: JObject; options: JDataGeoJsonOptions): array of JDataFeature; overload;
    function contains(feature: JDataFeature): Boolean;
    procedure forEach(callback: procedure(feature: JDataFeature));
    function getControlPosition: JControlPosition;
    function getControls: array of String;
    function getDrawingMode: String;
    function getFeatureById(id: Float): JDataFeature; overload;
    function getFeatureById(id: String): JDataFeature; overload;
    function getMap: JMap;
    function getStyle: Variant {JData.StylingFunction or JDataStyleOptions};
    procedure loadGeoJson(url: String); overload;
    procedure loadGeoJson(url: String; options: JDataGeoJsonOptions); overload;
    procedure loadGeoJson(url: String; options: JDataGeoJsonOptions; callback: procedure(features: array of JDataFeature)); overload;
    procedure overrideStyle(feature: JDataFeature; style: JDataStyleOptions);
    procedure remove(feature: JDataFeature);
    procedure revertStyle; overload;
    procedure revertStyle(feature: JDataFeature); overload;
    procedure setControlPosition(controlPosition: JControlPosition);
    procedure setControls(controls: array of String);
    procedure setDrawingMode(drawingMode: String);
    procedure setMap(map: JMap);
    procedure setStyle(style: TDataStylingFunction); overload;
    procedure setStyle(style: JDataStyleOptions); overload;
    procedure toGeoJson(callback: procedure(feature: JObject));
  end;

  JMapType = class external
    function getTile(tileCoord: JPoint; zoom: Float; ownerDocument: JDocument): JElement;
    procedure releaseTile(tile: JElement);
    alt: String; // nullable
    maxZoom: Float; // nullable
    minZoom: Float; // nullable
    name: String; // nullable
    projection: JProjection; // nullable
    radius: Float; // nullable
    tileSize: JSize; // nullable
  end;

  JMapTypeRegistry = class external 'MapTypeRegistry'(JMVCObject)
    constructor Create;
    procedure set(id: String; mapType: JMapType);
  end;

  JMap = class external 'Map' (JMVCObject)
    constructor Create(mapDiv: JElement; opts: JMapOptions);
    procedure fitBounds(bounds: JLatLngBounds);
    function getBounds: JLatLngBounds;
    function getCenter: JLatLng;
    function getDiv: JElement;
    function getHeading: Float;
    function getMapTypeId: Variant {JMapTypeId or String};
    function getProjection: JProjection;
    function getStreetView: JStreetViewPanorama;
    function getTilt: Float;
    function getZoom: Float;
    procedure panBy(x: Float; y: Float);
    procedure panTo(latLng: JLatLng); overload;
    procedure panTo(latLng: JLatLngLiteral); overload;
    procedure panToBounds(latLngBounds: JLatLngBounds);
    procedure setCenter(latlng: JLatLng); overload;
    procedure setCenter(latlng: JLatLngLiteral); overload;
    procedure setHeading(heading: Float);
    procedure setMapTypeId(mapTypeId: JMapTypeId); overload;
    procedure setMapTypeId(mapTypeId: String); overload;
    procedure setOptions(options: JMapOptions);
    procedure setStreetView(panorama: JStreetViewPanorama);
    procedure setTilt(tilt: Float);
    procedure setZoom(zoom: Float);
    controls: array of JMVCArray;
    data: JData;
    mapTypes: JMapTypeRegistry;
    overlayMapTypes: JMVCArray;
  end;

  JIcon = class external
    anchor: JPoint; // nullable
    labelOrigin: JPoint; // nullable
    origin: JPoint; // nullable
    scaledSize: JSize; // nullable
    size: JSize; // nullable
    url: String; // nullable
  end;

  JSymbol = class external
    anchor: JPoint; // nullable
    fillColor: String; // nullable
    fillOpacity: Float; // nullable
    path: Variant {JSymbolPath or String}; // nullable
    rotation: Float; // nullable
    scale: Float; // nullable
    strokeColor: String; // nullable
    strokeOpacity: Float; // nullable
    strokeWeight: Float; // nullable
  end;

  JInfoWindowOptions = class external
    content: Variant {String or JNode}; // nullable
    disableAutoPan: Boolean; // nullable
    maxWidth: Float; // nullable
    pixelOffset: JSize; // nullable
    position: Variant {JLatLng or JLatLngLiteral}; // nullable
    zIndex: Float; // nullable
  end;

  JMarker = class external 'Marker'(JMVCObject)
    MAX_ZINDEX: Float;
    constructor Create(opts: JMarkerOptions);
    function getAnimation: JAnimation;
    function getAttribution: JAttribution;
    function getClickable: Boolean;
    function getCursor: String;
    function getDraggable: Boolean;
    function getIcon: Variant {String or JIcon or JSymbol};
    function getMap: Variant {JMap or JStreetViewPanorama};
    function getOpacity: Float;
    function getPlace: JPlace;
    function getPosition: JLatLng;
    function getShape: JMarkerShape;
    function getTitle: String;
    function getVisible: Boolean;
    function getZIndex: Float;
    procedure setAnimation(animation: JAnimation);
    procedure setAttribution(attribution: JAttribution);
    procedure setClickable(flag: Boolean);
    procedure setCursor(cursor: String);
    procedure setDraggable(flag: Boolean);
    procedure setIcon(icon: String); overload;
    procedure setIcon(icon: JIcon); overload;
    procedure setIcon(icon: JSymbol); overload;
    procedure setMap(map: JMap); overload;
    procedure setMap(map: JStreetViewPanorama); overload;
    procedure setOpacity(opacity: Float);
    procedure setOptions(options: JMarkerOptions);
    procedure setPlace(place: JPlace);
    procedure setPosition(latlng: JLatLng); overload;
    procedure setPosition(latlng: JLatLngLiteral); overload;
    procedure setShape(shape: JMarkerShape);
    procedure setTitle(title: String);
    procedure setVisible(visible: Boolean);
    procedure setZIndex(zIndex: Float);
  end;

  JInfoWindow = class external 'InfoWindow'(JMVCObject)
    constructor Create(opts: JInfoWindowOptions);
    procedure close;
    function getContent: Variant {String or JElement};
    function getPosition: JLatLng;
    function getZIndex: Float;
    procedure open; overload;
    procedure open(map: JMap); overload;
    procedure open(map: JStreetViewPanorama); overload;
    procedure open(map: JMap; anchor: JMVCObject); overload;
    procedure open(map: JStreetViewPanorama; anchor: JMVCObject); overload;
    procedure setContent(content: String); overload;
    procedure setContent(content: JNode); overload;
    procedure setOptions(options: JInfoWindowOptions);
    procedure setPosition(position: JLatLng);
    procedure setZIndex(zIndex: Float);
  end;

  JIconSequence = class external
    fixedRotation: Boolean; // nullable
    icon: JSymbol; // nullable
    offset: String; // nullable
    &repeat: String; // nullable
  end;

  JPolylineOptions = class external
    clickable: Boolean; // nullable
    draggable: Boolean; // nullable
    editable: Boolean; // nullable
    geodesic: Boolean; // nullable
    icons: array of JIconSequence; // nullable
    map: JMap; // nullable
    path: Variant {JMVCArray or array of JLatLng or array of JLatLngLiteral}; // nullable
    strokeColor: String; // nullable
    strokeOpacity: Float; // nullable
    strokeWeight: Float; // nullable
    visible: Boolean; // nullable
    zIndex: Float; // nullable
  end;

  JPolygonOptions = class external
    clickable: Boolean; // nullable
    draggable: Boolean; // nullable
    editable: Boolean; // nullable
    fillColor: String; // nullable
    fillOpacity: Float; // nullable
    geodesic: Boolean; // nullable
    map: JMap; // nullable
    paths: array of Variant; // nullable
    strokeColor: String; // nullable
    strokeOpacity: Float; // nullable
    strokePosition: JStrokePosition; // nullable
    strokeWeight: Float; // nullable
    visible: Boolean; // nullable
    zIndex: Float; // nullable
  end;

  JPolyline = class external 'Polyline'(JMVCObject)
    constructor Create(opts: JPolylineOptions);
    function getDraggable: Boolean;
    function getEditable: Boolean;
    function getMap: JMap;
    function getPath: JMVCArray;
    function getVisible: Boolean;
    procedure setDraggable(draggable: Boolean);
    procedure setEditable(editable: Boolean);
    procedure setMap(map: JMap);
    procedure setOptions(options: JPolylineOptions);
    procedure setPath(path: JMVCArray); overload;
    procedure setPath(path: array of JLatLng); overload;
    procedure setPath(path: array of JLatLngLiteral); overload;
    procedure setVisible(visible: Boolean);
  end;

  JPolygon = class external 'Polygon'(JMVCObject)
    constructor Create(opts: JPolygonOptions);
    function getDraggable: Boolean;
    function getEditable: Boolean;
    function getMap: JMap;
    function getPath: JMVCArray;
    function getPaths: JMVCArray;
    function getVisible: Boolean;
    procedure setDraggable(draggable: Boolean);
    procedure setEditable(editable: Boolean);
    procedure setMap(map: JMap);
    procedure setOptions(options: JPolygonOptions);
    procedure setPath(path: JMVCArray); overload;
    procedure setPath(path: array of JLatLng); overload;
    procedure setPath(path: array of JLatLngLiteral); overload;
    procedure setPaths(paths: JMVCArray); overload;
    procedure setPaths(paths: array of JMVCArray); overload;
    procedure setPaths(path: array of JLatLng); overload;
    procedure setPaths(path: array of array of JLatLng); overload;
(*
    procedure setPaths(path: array of JLatLngLiteral); overload;
    procedure setPaths(path: array of array of JLatLngLiteral); overload;
*)
    procedure setVisible(visible: Boolean);
  end;

  JRectangleOptions = class external
    bounds: JLatLngBounds; // nullable
    clickable: Boolean; // nullable
    draggable: Boolean; // nullable
    editable: Boolean; // nullable
    fillColor: String; // nullable
    fillOpacity: Float; // nullable
    map: JMap; // nullable
    strokeColor: String; // nullable
    strokeOpacity: Float; // nullable
    strokePosition: JStrokePosition; // nullable
    strokeWeight: Float; // nullable
    visible: Boolean; // nullable
    zIndex: Float; // nullable
  end;

  JCircleOptions = class external
    center: JLatLng; // nullable
    clickable: Boolean; // nullable
    draggable: Boolean; // nullable
    editable: Boolean; // nullable
    fillColor: String; // nullable
    fillOpacity: Float; // nullable
    map: JMap; // nullable
    radius: Float; // nullable
    strokeColor: String; // nullable
    strokeOpacity: Float; // nullable
    strokePosition: JStrokePosition; // nullable
    strokeWeight: Float; // nullable
    visible: Boolean; // nullable
    zIndex: Float; // nullable
  end;

  JGroundOverlayOptions = class external
    clickable: Boolean; // nullable
    map: JMap; // nullable
    opacity: Float; // nullable
  end;

  JRectangle = class external 'Rectangle'(JMVCObject)
    constructor Create(opts: JRectangleOptions);
    function getBounds: JLatLngBounds;
    function getDraggable: Boolean;
    function getEditable: Boolean;
    function getMap: JMap;
    function getVisible: Boolean;
    procedure setBounds(bounds: JLatLngBounds);
    procedure setDraggable(draggable: Boolean);
    procedure setEditable(editable: Boolean);
    procedure setMap(map: JMap);
    procedure setOptions(options: JRectangleOptions);
    procedure setVisible(visible: Boolean);
  end;

  JCircle = class external 'Circle'(JMVCObject)
    constructor Create(opts: JCircleOptions);
    function getBounds: JLatLngBounds;
    function getCenter: JLatLng;
    function getDraggable: Boolean;
    function getEditable: Boolean;
    function getMap: JMap;
    function getRadius: Float;
    function getVisible: Boolean;
    procedure setCenter(center: JLatLng); overload;
    procedure setCenter(center: JLatLngLiteral); overload;
    procedure setDraggable(draggable: Boolean);
    procedure setEditable(editable: Boolean);
    procedure setMap(map: JMap);
    procedure setOptions(options: JCircleOptions);
    procedure setRadius(radius: Float);
    procedure setVisible(visible: Boolean);
  end;

  JGroundOverlay = class external 'GroundOverlay'(JMVCObject)
    constructor Create(url: String; bounds: JLatLngBounds; opts: JGroundOverlayOptions);
    function getBounds: JLatLngBounds;
    function getMap: JMap;
    function getOpacity: Float;
    function getUrl: String;
    procedure setMap(map: JMap);
    procedure setOpacity(opacity: Float);
  end;

  JMapCanvasProjection = class external 'MapCanvasProjection'(JMVCObject)
    function fromContainerPixelToLatLng(pixel: JPoint): JLatLng; overload;
    function fromContainerPixelToLatLng(pixel: JPoint; nowrap: Boolean): JLatLng; overload;
    function fromDivPixelToLatLng(pixel: JPoint): JLatLng; overload;
    function fromDivPixelToLatLng(pixel: JPoint; nowrap: Boolean): JLatLng; overload;
    function fromLatLngToContainerPixel(latLng: JLatLng): JPoint;
    function fromLatLngToDivPixel(latLng: JLatLng): JPoint;
    function getWorldWidth: Float;
  end;

  JMapPanes = class external
    floatPane: JElement;
    mapPane: JElement;
    markerLayer: JElement;
    overlayLayer: JElement;
    overlayMouseTarget: JElement;
  end;

  JOverlayView = class external 'OverlayView'(JMVCObject)
    procedure draw;
    function getMap: Variant {JMap or JStreetViewPanorama};
    function getPanes: JMapPanes;
    function getProjection: JMapCanvasProjection;
    procedure onAdd;
    procedure onRemove;
    procedure setMap(map: JMap); overload;
    procedure setMap(map: JStreetViewPanorama); overload;
  end;

  JGeocoderComponentRestrictions = class external
    administrativeArea: String; // nullable
    country: String; // nullable
    locality: String; // nullable
    postalCode: String; // nullable
    route: String; // nullable
  end;

  JGeocoderRequest = class external
    address: String; // nullable
    bounds: JLatLngBounds; // nullable
    componentRestrictions: JGeocoderComponentRestrictions; // nullable
    location: Variant {JLatLng or JLatLngLiteral}; // nullable
    placeId: String; // nullable
    region: String; // nullable
  end;

  JGeocoderAddressComponent = class external
    long_name: String;
    short_name: String;
    types: array of String;
  end;

  JGeocoderGeometry = class external
    bounds: JLatLngBounds;
    location: JLatLng;
    location_type: JGeocoderLocationType;
    viewport: JLatLngBounds;
  end;

  JGeocoderResult = class external
    address_components: array of JGeocoderAddressComponent;
    formatted_address: String;
    geometry: JGeocoderGeometry;
    partial_match: Boolean;
    postcode_localities: array of String;
    types: array of String;
  end;

  JGeocoder = class external 'Geocoder'
    procedure geocode(request: JGeocoderRequest; callback: procedure(results: array of JGeocoderResult; status: JGeocoderStatus));
  end;

  JDistance = class external
    text: String;
    value: Float;
  end;

  JDuration = class external
    text: String;
    value: Float;
  end;

  JTransitStop = class external
    location: JLatLng;
    name: String;
  end;

  JTransitAgency = class external
    name: String;
    phone: String;
    url: String;
  end;

  JTransitVehicle = class external
    icon: String;
    local_icon: String;
    name: String;
    &type: JVehicleType;
  end;

  JTransitLine = class external
    agencies: array of JTransitAgency;
    color: String;
    icon: String;
    name: String;
    short_name: String;
    text_color: String;
    url: String;
    vehicle: JTransitVehicle;
  end;

  JTime = class external
    text: String;
    time_zone: String;
    value: JDate;
  end;

  JTransitDetails = class external
    arrival_stop: JTransitStop;
    arrival_time: JTime;
    departure_stop: JTransitStop;
    departure_time: JTime;
    headsign: String;
    headway: Float;
    line: JTransitLine;
    num_stops: Float;
  end;

  JDirectionsStep = class external
    distance: JDistance;
    duration: JDuration;
    end_location: JLatLng;
    instructions: String;
    path: array of JLatLng;
    start_location: JLatLng;
    steps: JDirectionsStep;
    transit: JTransitDetails;
    travel_mode: JTravelMode;
  end;

  JDirectionsLeg = class external
    arrival_time: JTime;
    departure_time: JTime;
    distance: JDistance;
    duration: JDuration;
    duration_in_traffic: JDuration;
    end_address: String;
    end_location: JLatLng;
    start_address: String;
    start_location: JLatLng;
    steps: array of JDirectionsStep;
    via_waypoints: array of JLatLng;
  end;

  JTransitFare = class external
  end;

  JDirectionsRoute = class external
    bounds: JLatLngBounds;
    copyrights: String;
    fare: JTransitFare;
    legs: array of JDirectionsLeg;
    overview_path: array of JLatLng;
    overview_polyline: String;
    warnings: array of String;
    waypoint_order: array of Float;
  end;

  JDirectionsResult = class external
    routes: array of JDirectionsRoute;
  end;

  JDirectionsRendererOptions = class external
    directions: JDirectionsResult; // nullable
    draggable: Boolean; // nullable
    hideRouteList: Boolean; // nullable
    infoWindow: JInfoWindow; // nullable
    map: JMap; // nullable
    markerOptions: JMarkerOptions; // nullable
    panel: JElement; // nullable
    polylineOptions: JPolylineOptions; // nullable
    preserveViewport: Boolean; // nullable
    routeIndex: Float; // nullable
    suppressBicyclingLayer: Boolean; // nullable
    suppressInfoWindows: Boolean; // nullable
    suppressMarkers: Boolean; // nullable
    suppressPolylines: Boolean; // nullable
  end;

  JTransitOptions = class external
    arrivalTime: JDate; // nullable
    departureTime: JDate; // nullable
    modes: array of JTransitMode;
    routingPreference: JTransitRoutePreference;
  end;

  JDirectionsWaypoint = class external
    location: Variant {JLatLng or JLatLngLiteral or String};
    stopover: Boolean;
  end;

  JDirectionsRequest = class external
    avoidFerries: Boolean; // nullable
    avoidHighways: Boolean; // nullable
    avoidTolls: Boolean; // nullable
    destination: Variant {JLatLng or JLatLngLiteral or String}; // nullable
    durationInTraffic: Boolean; // nullable
    optimizeWaypoints: Boolean; // nullable
    origin: Variant {JLatLng or JLatLngLiteral or String}; // nullable
    provideRouteAlternatives: Boolean; // nullable
    region: String; // nullable
    transitOptions: JTransitOptions; // nullable
    travelMode: JTravelMode; // nullable
    unitSystem: JUnitSystem; // nullable
    waypoints: array of JDirectionsWaypoint; // nullable
  end;

  JDirectionsRenderer = class external 'DirectionsRenderer'(JMVCObject)
    constructor Create(opts: JDirectionsRendererOptions);
    function getDirections: JDirectionsResult;
    function getMap: JMap;
    function getPanel: JElement;
    function getRouteIndex: Float;
    procedure setDirections(directions: JDirectionsResult);
    procedure setMap(map: JMap);
    procedure setOptions(options: JDirectionsRendererOptions);
    procedure setPanel(panel: JElement);
    procedure setRouteIndex(routeIndex: Float);
  end;

  JDirectionsService = class external 'DirectionsService'
    procedure route(request: JDirectionsRequest; callback: procedure(result: JDirectionsResult; status: JDirectionsStatus));
  end;

  JPathElevationRequest = class external
    path: array of JLatLng; // nullable
    samples: Float; // nullable
  end;

  JElevationResult = class external
    elevation: Float;
    location: JLatLng;
    resolution: Float;
  end;

  JLocationElevationRequest = class external
    locations: array of JLatLng;
  end;

  JElevationService = class external 'ElevationService'
    procedure getElevationAlongPath(request: JPathElevationRequest; callback: procedure(results: array of JElevationResult; status: JElevationStatus));
    procedure getElevationForLocations(request: JLocationElevationRequest; callback: procedure(results: array of JElevationResult; status: JElevationStatus));
  end;

  JMaxZoomResult = class external
    status: JMaxZoomStatus;
    zoom: Float;
  end;

  JMaxZoomService = class external 'MaxZoomService'
    procedure getMaxZoomAtLatLng(latlng: JLatLng; callback: procedure(result: JMaxZoomResult)); overload;
    procedure getMaxZoomAtLatLng(latlng: JLatLngLiteral; callback: procedure(result: JMaxZoomResult)); overload;
  end;

  JDistanceMatrixRequest = class external
    avoidFerries: Boolean; // nullable
    avoidHighways: Boolean; // nullable
    avoidTolls: Boolean; // nullable
    destinations: Variant {array of JLatLng or array of String}; // nullable
    durationInTraffic: Boolean; // nullable
    origins: Variant {array of JLatLng or array of String}; // nullable
    region: String; // nullable
    transitOptions: JTransitOptions; // nullable
    travelMode: JTravelMode; // nullable
    unitSystem: JUnitSystem; // nullable
  end;

  JDistanceMatrixResponseElement = class external
    distance: JDistance;
    duration: JDuration;
    fare: JTransitFare;
    status: JDistanceMatrixElementStatus;
  end;

  JDistanceMatrixResponseRow = class external
    elements: array of JDistanceMatrixResponseElement;
  end;

  JDistanceMatrixResponse = class external
    destinationAddresses: array of String;
    originAddresses: array of String;
    rows: array of JDistanceMatrixResponseRow;
  end;

  JDistanceMatrixService = class external 'DistanceMatrixService'
    procedure getDistanceMatrix(request: JDistanceMatrixRequest; callback: procedure(response: JDistanceMatrixResponse; status: JDistanceMatrixStatus));
  end;

  JSaveWidget = class external 'SaveWidget'
    constructor Create(container: JNode; opts: JSaveWidgetOptions);
    function getAttribution: JAttribution;
    function getPlace: JPlace;
    procedure setAttribution(attribution: JAttribution);
    procedure setOptions(opts: JSaveWidgetOptions);
    procedure setPlace(place: JPlace);
  end;

  JImageMapTypeOptions = class external
    alt: String; // nullable
    function getTileUrl(tileCoord: JPoint; zoom: Float): String;
    maxZoom: Float; // nullable
    minZoom: Float; // nullable
    name: String; // nullable
    opacity: Float; // nullable
    tileSize: JSize; // nullable
  end;

  JImageMapType = class external 'ImageMapType'(JMVCObject)
    constructor Create(opts: JImageMapTypeOptions);
    function getOpacity: Float;
    function getTile(tileCoord: JPoint; zoom: Float; ownerDocument: JDocument): JElement;
    procedure releaseTile(tile: JElement);
    procedure setOpacity(opacity: Float);
  end;

  JStyledMapTypeOptions = class external
    alt: String; // nullable
    maxZoom: Float; // nullable
    minZoom: Float; // nullable
    name: String; // nullable
  end;

  JStyledMapType = class external 'StyledMapType'(JMVCObject)
    constructor Create(styles: array of JMapTypeStyle; options: JStyledMapTypeOptions);
    function getTile(tileCoord: JPoint; zoom: Float; ownerDocument: JDocument): JElement;
    procedure releaseTile(tile: JElement);
  end;

  JBicyclingLayer = class external 'BicyclingLayer'(JMVCObject)
    constructor Create;
    function getMap: JMap;
    procedure setMap(map: JMap);
  end;

  JFusionTablesHeatmap = class external
    enabled: Boolean;
  end;

  JFusionTablesMarkerOptions = class external
    iconName: String;
  end;

  JFusionTablesQuery = class external
    from: String; // nullable
    limit: Float; // nullable
    offset: Float; // nullable
    orderBy: String; // nullable
    select: String; // nullable
    where: String; // nullable
  end;

  JFusionTablesPolygonOptions = class external
    fillColor: String; // nullable
    fillOpacity: Float; // nullable
    strokeColor: String; // nullable
    strokeOpacity: Float; // nullable
    strokeWeight: Float; // nullable
  end;

  JFusionTablesPolylineOptions = class external
    strokeColor: String; // nullable
    strokeOpacity: Float; // nullable
    strokeWeight: Float; // nullable
  end;

  JFusionTablesStyle = class external
    markerOptions: JFusionTablesMarkerOptions; // nullable
    polygonOptions: JFusionTablesPolygonOptions; // nullable
    polylineOptions: JFusionTablesPolylineOptions; // nullable
    where: String; // nullable
  end;

  JFusionTablesLayerOptions = class external
    clickable: Boolean; // nullable
    heatmap: JFusionTablesHeatmap; // nullable
    map: JMap; // nullable
    query: JFusionTablesQuery; // nullable
    styles: array of JFusionTablesStyle; // nullable
    suppressInfoWindows: Boolean; // nullable
  end;

  JFusionTablesLayer = class external 'FusionTablesLayer'(JMVCObject)
    constructor Create(options: JFusionTablesLayerOptions);
    function getMap: JMap;
    procedure setMap(map: JMap);
    procedure setOptions(options: JFusionTablesLayerOptions);
  end;

  JKmlLayerOptions = class external
    clickable: Boolean; // nullable
    map: JMap; // nullable
    preserveViewport: Boolean; // nullable
    screenOverlays: Boolean; // nullable
    suppressInfoWindows: Boolean; // nullable
    url: String; // nullable
    zIndex: Float; // nullable
  end;

  JKmlAuthor = class external
    email: String;
    name: String;
    uri: String;
  end;

  JKmlLayerMetadata = class external
    author: JKmlAuthor;
    description: String;
    hasScreenOverlays: Boolean;
    name: String;
    snippet: String;
  end;

  JKmlLayer = class external 'KmlLayer'(JMVCObject)
    constructor Create(opts: JKmlLayerOptions);
    function getDefaultViewport: JLatLngBounds;
    function getMap: JMap;
    function getMetadata: JKmlLayerMetadata;
    function getStatus: TKmlLayerStatus;
    function getUrl: String;
    function getZIndex: Float;
    procedure setMap(map: JMap);
    procedure setUrl(url: String);
    procedure setZIndez(zIndex: Float);
  end;

  JTrafficLayer = class external 'TrafficLayer'(JMVCObject)
    constructor Create;
    procedure getMap;
    procedure setMap(map: JMap);
  end;

  JTransitLayer = class external 'TransitLayer'(JMVCObject)
    constructor Create;
    procedure getMap;
    procedure setMap(map: JMap);
  end;

  Jevent = class external 'event'
    function addDomListener(instance: JObject; eventName: String; handler: procedure): JMapsEventListener; overload;
    function addDomListener(instance: JObject; eventName: String; handler: procedure; capture: Boolean): JMapsEventListener; overload;
    function addDomListenerOnce(instance: JObject; eventName: String; handler: procedure): JMapsEventListener; overload;
    function addDomListenerOnce(instance: JObject; eventName: String; handler: procedure; capture: Boolean): JMapsEventListener; overload;
    function addListener(instance: JObject; eventName: String; handler: procedure): JMapsEventListener;
    function addListenerOnce(instance: JObject; eventName: String; handler: procedure): JMapsEventListener;
    procedure clearInstanceListeners(instance: JObject);
    procedure clearListeners(instance: JObject; eventName: String);
    procedure removeListener(listener: JMapsEventListener);
    procedure trigger(instance: Variant; eventName: String; args: array of Variant);
  end;

  JPolyMouseEvent = class external
    edge: Float; // nullable
    path: Float; // nullable
    vertex: Float; // nullable
  end;

  JFusionTablesMouseEvent = class external
    infoWindowHtml: String; // nullable
    latLng: JLatLng; // nullable
    pixelOffset: JSize; // nullable
    row: JObject; // nullable
  end;

  JFusionTablesCell = class external
    columnName: String; // nullable
    value: String; // nullable
  end;

  JKmlFeatureData = class external
    author: JKmlAuthor;
    description: String;
    id: String;
    infoWindowHtml: String;
    name: String;
    snippet: String;
  end;

  JKmlMouseEvent = class external
    featureData: JKmlFeatureData;
    latLng: JLatLng;
    pixelOffset: JSize;
  end;

  JMouseEvent = class external
    procedure stop;
    latLng: JLatLng;
  end;

  JDataPoint = class external 'Data.Point' (JDataGeometry)
    constructor Create(latLng: JLatLng); overload;
    constructor Create(latLng: JLatLngLiteral); overload;
    function get: JLatLng;
  end;

  JDataMultiPoint = class external 'Data.MultiPoint' (JDataGeometry)
    constructor Create(elements: array of JLatLng); overload;
    constructor Create(elements: array of JLatLngLiteral); overload;
    function getArray: array of JLatLng;
    function getAt(n: Float): JLatLng;
    function getLength: Float;
  end;

  JDataLineString = class external 'Data.LineString'(JDataGeometry)
    constructor Create(elements: array of JLatLng); overload;
    constructor Create(elements: array of JLatLngLiteral); overload;
    function getArray: array of JLatLng;
    function getAt(n: Float): JLatLng;
    function getLength: Float;
  end;

  JDataMultiLineString = class external 'Data.MultiLineString'(JDataGeometry)
    constructor Create(elements: array of JDataLineString); overload;
    constructor Create(elements: array of array of JLatLng); overload;
    constructor Create(elements: array of array of JLatLngLiteral); overload;
    function getArray: array of JDataLineString;
    function getAt(n: Float): JDataLineString;
    function getLength: Float;
  end;

  JDataLinearRing = class external 'Data.LinearRing'(JDataGeometry)
    constructor Create(elements: array of JLatLng); overload;
    constructor Create(elements: array of JLatLngLiteral); overload;
    function getArray: array of JLatLng;
    function getAt(n: Float): JLatLng;
    function getLength: Float;
  end;

  JDataPolygon = class external 'Data.Polygon'(JDataGeometry)
    constructor Create(elements: array of JDataLinearRing); overload;
    constructor Create(elements: array of array of JLatLng); overload;
    constructor Create(elements: array of array of JLatLngLiteral); overload;
    function getArray: array of JDataLinearRing;
    function getAt(n: Float): JDataLinearRing;
    function getLength: Float;
  end;

  JDataMultiPolygon = class external 'Data.MultiPolygon'(JDataGeometry)
    constructor Create(elements: array of JDataPolygon); overload;
    constructor Create(elements: array of JDataLinearRing); overload;
    constructor Create(elements: array of array of JLatLng); overload;
    constructor Create(elements: array of array of JLatLngLiteral); overload;
    function getArray: array of JDataPolygon;
    function getAt(n: Float): JDataPolygon;
    function getLength: Float;
  end;

  JDataGeometryCollection = class external 'Data.GeometryCollection'(JDataGeometry)
    constructor Create(elements: array of array of JDataGeometry); overload;
    constructor Create(elements: array of array of array of JLatLng); overload;
    constructor Create(elements: array of array of array of JLatLngLiteral); overload;
    function getArray: array of JDataGeometry;
    function getAt(n: Float): JDataGeometry;
    function getLength: Float;
  end;

type
  // data
  JDataMouseEvent = class external (JMouseEvent)
    feature: JDataFeature;
  end;

  JDataAddFeatureEvent = class external
    feature: JDataFeature;
  end;

  JDataRemoveFeatureEvent = class external
    feature: JDataFeature;
  end;

  JDataSetGeometryEvent = class external
    feature: JDataFeature;
    newGeometry: JDataGeometry;
    oldGeometry: JDataGeometry;
  end;

  JDataSetPropertyEvent = class external
    feature: JDataFeature;
    name: String;
    newValue: Variant;
    oldValue: Variant;
  end;

  JDataRemovePropertyEvent = class external
    feature: JDataFeature;
    name: String;
    oldValue: Variant;
  end;

//geometry

type
  Jencoding = class external 'encoding'
    function decodePath(encodedPath: String): array of JLatLng;
    function encodePath(path: array of Variant): String;
  end;

  Jspherical = class external 'spherical'
    function computeArea(path: array of Variant): Float; overload;
    function computeArea(path: array of Variant; radius: Float): Float; overload;
    function computeDistanceBetween(from: JLatLng; to: JLatLng): Float; overload;
    function computeDistanceBetween(from: JLatLng; to: JLatLng; radius: Float): Float; overload;
    function computeHeading(from: JLatLng; to: JLatLng): Float;
    function computeLength(path: array of Variant): Float; overload;
    function computeLength(path: array of Variant; radius: Float): Float; overload;
    function computeOffset(from: JLatLng; distance: Float; heading: Float): JLatLng; overload;
    function computeOffset(from: JLatLng; distance: Float; heading: Float; radius: Float): JLatLng; overload;
    function computeOffsetOrigin(to: JLatLng; distance: Float; heading: Float): JLatLng; overload;
    function computeOffsetOrigin(to: JLatLng; distance: Float; heading: Float; radius: Float): JLatLng; overload;
    function computeSignedArea(loop: array of Variant): Float; overload;
    function computeSignedArea(loop: array of Variant; radius: Float): Float; overload;
    function interpolate(from: JLatLng; to: JLatLng; fraction: Float): JLatLng;
  end;

  Jpoly = class external 'poly'
    function containsLocation(point: JLatLng; polygon: JPolygon): Boolean;
    function isLocationOnEdge(point: JLatLng; poly: JPolygon): Boolean; overload;
    function isLocationOnEdge(point: JLatLng; poly: JPolyline): Boolean; overload;
    function isLocationOnEdge(point: JLatLng; poly: JPolygon; tolerance: Float): Boolean; overload;
    function isLocationOnEdge(point: JLatLng; poly: JPolyline; tolerance: Float): Boolean; overload;
  end;


  JAdUnitOptions = class external
    backgroundColor: String; // nullable
    borderColor: String; // nullable
    channelNumber: String; // nullable
    format: JAdFormat; // nullable
    map: JMap; // nullable
    position: JControlPosition; // nullable
    publisherId: String; // nullable
    textColor: String; // nullable
    titleColor: String; // nullable
    urlColor: String; // nullable
  end;

  JAdUnit = class external 'adsense.AdUnit'(JMVCObject)
    constructor Create(container: JElement; opts: JAdUnitOptions);
    function getBackgroundColor: String;
    function getBorderColor: String;
    function getChannelNumber: String;
    function getContainer: JElement;
    function getFormat: JAdFormat;
    function getMap: JMap;
    function getPosition: JControlPosition;
    function getPublisherId: String;
    function getTextColor: String;
    function getTitleColor: String;
    function getUrlColor: String;
    procedure setBackgroundColor(backgroundColor: String);
    procedure setBorderColor(borderColor: String);
    procedure setChannelNumber(channelNumber: String);
    procedure setFormat(format: JAdFormat);
    procedure setMap(map: JMap);
    procedure setPosition(position: JControlPosition);
    procedure setTextColor(textColor: String);
    procedure setTitleColor(titleColor: String);
    procedure setUrlColor(urlColor: String);
  end;


//places

type
  JComponentRestrictions = class external
    country: String;
  end;

  JAutocompleteOptions = class external
    bounds: JLatLngBounds; // nullable
    componentRestrictions: JComponentRestrictions; // nullable
    types: array of String; // nullable
  end;

  JPlaceAspectRating = class external
    rating: Float;
    &type: String;
  end;

  JPlaceReview = class external
    aspects: array of JPlaceAspectRating;
    author_name: String;
    author_url: String;
    language: String;
    text: String;
  end;

  JPlaceGeometry = class external
    location: JLatLng;
    viewport: JLatLngBounds;
  end;

  JPhotoOptions = class external
    maxHeight: Float; // nullable
    maxWidth: Float; // nullable
  end;

  JPlacePhoto = class external
    height: Float;
    html_attributions: array of String;
    width: Float;
    function getUrl(opts: JPhotoOptions): String;
  end;

  JPlaceResult = class external
    address_components: array of JGeocoderAddressComponent;
    aspects: array of JPlaceAspectRating;
    formatted_address: String;
    formatted_phone_number: String;
    geometry: JPlaceGeometry;
    html_attributions: array of String;
    icon: String;
    international_phone_number: String;
    name: String;
    permanently_closed: Boolean;
    photos: array of JPlacePhoto;
    place_id: String;
    price_level: Float;
    rating: Float;
    reviews: array of JPlaceReview;
    types: array of String;
    url: String;
    vicinity: String;
    website: String;
  end;

  JAutocomplete = class external 'places.Autocomplete'(JMVCObject)
    constructor Create(inputField: JHTMLInputElement; opts: JAutocompleteOptions);
    function getBounds: JLatLngBounds;
    function getPlace: JPlaceResult;
    procedure setBounds(bounds: JLatLngBounds);
    procedure setComponentRestrictions(restrictions: JComponentRestrictions);
    procedure setTypes(types: array of String);
  end;

  JAutocompletionRequest = class external
    bounds: JLatLngBounds; // nullable
    componentRestrictions: JComponentRestrictions; // nullable
    input: String;
    location: JLatLng; // nullable
    offset: Float; // nullable
    radius: Float; // nullable
    types: array of String; // nullable
  end;

  JPredictionTerm = class external
    offset: Float;
    value: String;
  end;

  JPredictionSubstring = class external
    _length: Float;
    offset: Float;
  end;

  JAutocompletePrediction = class external
    description: String;
    matched_substrings: array of JPredictionSubstring;
    place_id: String;
    terms: array of JPredictionTerm;
    types: array of String;
  end;

  JQueryAutocompletionRequest = class external
    bounds: JLatLngBounds; // nullable
    input: String; // nullable
    location: JLatLng; // nullable
    offset: Float; // nullable
    radius: Float; // nullable
  end;

  JQueryAutocompletePrediction = class external
    description: String;
    matched_substrings: array of JPredictionSubstring;
    place_id: String;
    terms: array of JPredictionTerm;
  end;

  JAutocompleteService = class external 'places.AutocompleteService'
    constructor Create;
    procedure getPlacePredictions(request: JAutocompletionRequest; callback: procedure(result: array of JAutocompletePrediction; status: JPlacesServiceStatus));
    procedure getQueryPredictions(request: JQueryAutocompletionRequest; callback: procedure(result: array of JQueryAutocompletePrediction; status: JPlacesServiceStatus));
  end;

  JSearchBoxOptions = class external
    bounds: JLatLngBounds;
  end;

  JPlaceDetailsRequest = class external
    placeId: String;
  end;

  JPlaceSearchRequest = class external
    bounds: JLatLngBounds; // nullable
    keyword: String; // nullable
    location: Variant {JLatLng or JLatLngLiteral}; // nullable
    maxPriceLevel: Float; // nullable
    minPriceLevel: Float; // nullable
    name: String; // nullable
    openNow: Boolean; // nullable
    radius: Float; // nullable
    rankBy: JRankBy; // nullable
    types: array of String; // nullable
  end;

  JPlaceSearchPagination = class external
    procedure nextPage;
    hasNextPage: Boolean;
  end;

  JRadarSearchRequest = class external
    bounds: JLatLngBounds; // nullable
    keyword: String; // nullable
    location: Variant {JLatLng or JLatLngLiteral}; // nullable
    name: String; // nullable
    radius: Float; // nullable
    types: array of String; // nullable
  end;

  JTextSearchRequest = class external
    bounds: JLatLngBounds; // nullable
    location: Variant {JLatLng or JLatLngLiteral}; // nullable
    query: String;
    radius: Float; // nullable
    types: array of String; // nullable
  end;

  TPlacesServiceGetDetailsCallback = procedure(result: JPlaceResult; status: JPlacesServiceStatus);
  TPlacesServiceNearbySearchCallback = procedure(results: array of JPlaceResult; status: JPlacesServiceStatus; pagination: JPlaceSearchPagination);
  TPlacesServiceSearchCallback = procedure(results: array of JPlaceResult; status: JPlacesServiceStatus);
  JPlacesService = class external 'places.PlacesService'
    constructor Create(attrContainer: JHTMLDivElement); overload;
    constructor Create(attrContainer: JMap); overload;
    procedure getDetails(request: JPlaceDetailsRequest; callback: TPlacesServiceGetDetailsCallback);
    procedure nearbySearch(request: JPlaceSearchRequest; callback: TPlacesServiceNearbySearchCallback);
    procedure radarSearch(request: JRadarSearchRequest; callback: TPlacesServiceSearchCallback);
    procedure textSearch(request: JTextSearchRequest; callback: TPlacesServiceSearchCallback);
  end;

  JSearchBox = class external 'places.SearchBox' (JMVCObject)
    constructor Create(inputField: JHTMLInputElement; opts: JSearchBoxOptions);
    function getBounds: JLatLngBounds;
    function getPlaces: array of JPlaceResult;
    procedure setBounds(bounds: JLatLngBounds);
  end;

  JDrawingControlOptions = class external
    drawingModes: array of JOverlayType; // nullable
    position: JControlPosition; // nullable
  end;

  JDrawingOverlayCompleteEvent = class external
    overlay: Variant {JMarker or JPolygon or JPolyline or JRectangle or JCircle};
    overlayAsMarker: JMarker; external 'overlay';
    overlayAsPolygon: JPolygon; external 'overlay';
    overlayAsPolyline: JPolyline; external 'overlay';
    overlayAsRectangle: JRectangle; external 'overlay';
    overlayAsCircle: JCircle; external 'overlay';
    &type: JOverlayType;
  end;

  JDrawingManagerOptions = class external
    circleOptions: JCircleOptions; // nullable
    drawingControl: Boolean; // nullable
    drawingControlOptions: JDrawingControlOptions; // nullable
    drawingMode: JOverlayType; // nullable
    map: JMap; // nullable
    markerOptions: JMarkerOptions; // nullable
    polygonOptions: JPolygonOptions; // nullable
    polylineOptions: JPolylineOptions; // nullable
    rectangleOptions: JRectangleOptions; // nullable
  end;

  JDrawingManager = class external 'drawing.DrawingManager'(JMVCObject)
    constructor Create(options: JDrawingManagerOptions);
    function getDrawingMode: JOverlayType;
    function getMap: JMap;
    procedure setDrawingMode(drawingMode: JOverlayType);
    procedure setMap(map: JMap);
    procedure setOptions(options: JDrawingManagerOptions);
  end;

  JMapsEngineLayerOptions = class external
    accessToken: String; // nullable
    clickable: Boolean; // nullable
    fitBounds: Boolean; // nullable
    layerId: String; // nullable
    layerKey: String; // nullable
    map: JMap; // nullable
    mapId: String; // nullable
    opacity: Float; // nullable
    suppressInfoWindows: Boolean; // nullable
    zIndex: Float; // nullable
  end;

  JMapsEngineLayerProperties = class external
    name: String;
  end;

  JMapsEngineLayer = class external 'visualization.MapsEngineLayer'(JMVCObject)
    constructor Create(options: JMapsEngineLayerOptions);
    function getLayerId: String;
    function getLayerKey: String;
    function getMap: JMap;
    function getMapId: String;
    function getOpacity: Float;
    function getProperties: JMapsEngineLayerProperties;
    function getStatus: JMapsEngineStatus;
    function getZIndex: Float;
    procedure setLayerId(layerId: String);
    procedure setLayerKey(layerKey: String);
    procedure setMap(map: JMap);
    procedure setMapId(mapId: String);
    procedure setOpacity(opacity: Float);
    procedure setOptions(options: JMapsEngineLayerOptions);
    procedure setZIndex(zIndex: Float);
  end;

  JHeatmapLayerOptions = class external
    data: Variant;
    dissipating: Boolean; // nullable
    gradient: array of String; // nullable
    map: JMap; // nullable
    maxIntensity: Float; // nullable
    opacity: Float; // nullable
    radius: Float; // nullable
  end;

  JWeightedLocation = class external
    location: JLatLng;
    weight: Float;
  end;

  JHeatmapLayer = class external 'visualization.HeatmapLayer'(JMVCObject)
    constructor Create(opts: JHeatmapLayerOptions);
    function getData: JMVCArray;
    function getMap: JMap;
    procedure setData(data: JMVCArray); overload;
    procedure setData(data: array of JLatLng); overload;
    procedure setData(data: array of JWeightedLocation); overload;
    procedure setMap(map: JMap);
  end;

  JVisualizationMouseEvent = class external 'visualization.MouseEvent'
    procedure stop;
  end;

  JVisualizationMapsEventListener = class external 'visualization.MapsEventListener'
  end;

  JMapsEngineMouseEvent = class external
    featureId: String; // nullable
    infoWindowHtml: String; // nullable
    latLng: JLatLng; // nullable
    pixelOffset: JSize; // nullable
  end;

