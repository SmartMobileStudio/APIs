unit Three;

interface

uses
  W3C.TypedArray;

//THREE

type
  JEuler = class;
  JMatrix = class;
  JMatrix3 = class;
  JMatrix4 = class;
  JQuaternion = class;
  JCamera = class;
  JBufferAttribute = class;
  JRaycaster = class;
  JRenderTarget = class;
  JWebGLRenderTargetCube = class;
  JRenderer = class;
  JScene = class;
  JBone = class;
  JMesh = class;
  JBox3 = class;
  JGeometry = class;
  JInterleavedBuffer = class;
  JSphere = class;
  JPlane = class;
  JMaterial = class;
  JLoader = class;

  JHSL = class external
    h: Float;
    s: Float;
    l: Float;
  end;

  JVector2 = class external 'Vector2'
    constructor Create(x: Float; y: Float);
    x: Float;
    y: Float;
    width: Float;
    height: Float;
    function set(x, y: Float): JVector2;
    function setX(x: Float): JVector2;
    function setY(y: Float): JVector2;
    procedure setComponent(index: Integer; value: Float);
    function getComponent(index: Integer): Float;
    function clone: JVector2;
    function copy(v: JVector2): JVector2;
    function add(v: JVector2): JVector2;
    function addScalar(s: Float): JVector2;
    function addVectors(a: JVector2; b: JVector2): JVector2;
    function addScaledVector(v: JVector2; s: Float): JVector2;
    function sub(v: JVector2): JVector2;
    function subVectors(a: JVector2; b: JVector2): JVector2;
    function multiply(v: JVector2): JVector2;
    function multiplyScalar(scalar: Float): JVector2;
    function divide(v: JVector2): JVector2;
    function divideScalar(s: Float): JVector2;
    function min(v: JVector2): JVector2;
    function max(v: JVector2): JVector2;
    function clamp(min: JVector2; max: JVector2): JVector2;
    function clampScalar(min: Float; max: Float): JVector2;
    function clampLength(min: Float; max: Float): JVector2;
    function floor: JVector2;
    function ceil: JVector2;
    function round: JVector2;
    function roundToZero: JVector2;
    function negate: JVector2;
    function dot(v: JVector2): Float;
    function lengthSq: Float;
    function length: Float;
    function lengthManhattan: Float;
    function normalize: JVector2;
    function distanceTo(v: JVector2): Float;
    function distanceToSquared(v: JVector2): Float;
    function setLength(_length: Float): JVector2;
    function lerp(v: JVector2; alpha: Float): JVector2;
    function lerpVectors(v1: JVector2; v2: JVector2; alpha: Float): JVector2;
    function equals(v: JVector2): Boolean;
    function fromArray(xy: array of Float): JVector2; overload;
    function fromArray(xy: array of Float; offset: Float): JVector2; overload;
    function toArray: array of Float; overload;
    function toArray(xy: array of Float): array of Float; overload;
    function toArray(xy: array of Float; offset: Float): array of Float; overload;
    function fromAttribute(attribute: JBufferAttribute; index: Integer): JVector2; overload;
    function fromAttribute(attribute: JBufferAttribute; index: Integer; offset: Float): JVector2; overload;
    function rotateAround(center: JVector2; angle: Float): JVector2;
  end;

  JVector3 = class external 'Vector3'
    constructor Create(x: Float; y: Float; z: Float);
    x: Float;
    y: Float;
    z: Float;
    function set(x: Float; y: Float; z: Float): JVector3;
    function setX(x: Float): JVector3;
    function setY(y: Float): JVector3;
    function setZ(z: Float): JVector3;
    procedure setComponent(index: Integer; value: Float);
    function getComponent(index: Integer): Float;
    function clone: JVector3;
    function copy(v: JVector3): JVector3;
    function add(a: JVector3): JVector3;
    function addScalar(s: Float): JVector3;
    function addVectors(a: JVector3; b: JVector3): JVector3;
    function addScaledVector(v: JVector3; s: Float): JVector3;
    function sub(a: JVector3): JVector3;
    function subScalar(s: Float): JVector3;
    function subVectors(a: JVector3; b: JVector3): JVector3;
    function multiply(v: JVector3): JVector3;
    function multiplyScalar(s: Float): JVector3;
    function multiplyVectors(a: JVector3; b: JVector3): JVector3;
    function applyEuler(euler: JEuler): JVector3;
    function applyAxisAngle(axis: JVector3; angle: Float): JVector3;
    function applyMatrix3(m: JMatrix3): JVector3;
    function applyMatrix4(m: JMatrix4): JVector3;
    function applyProjection(m: JMatrix4): JVector3;
    function applyQuaternion(q: JQuaternion): JVector3;
    function project(camrea: JCamera): JVector3;
    function unproject(camera: JCamera): JVector3;
    function transformDirection(m: JMatrix4): JVector3;
    function divide(v: JVector3): JVector3;
    function divideScalar(s: Float): JVector3;
    function min(v: JVector3): JVector3;
    function max(v: JVector3): JVector3;
    function clamp(min, max: JVector3): JVector3;
    function clampScalar(min, max: Float): JVector3;
    function clampLength(min, max: Float): JVector3;
    function floor: JVector3;
    function ceil: JVector3;
    function round: JVector3;
    function roundToZero: JVector3;
    function negate: JVector3;
    function dot(v: JVector3): Float;
    function lengthSq: Float;
    function length: Float;
    function lengthManhattan: Float;
    function normalize: JVector3;
    function setLength(l: Float): JVector3;
    function lerp(v: JVector3; alpha: Float): JVector3;
    function lerpVectors(v1: JVector3; v2: JVector3; alpha: Float): JVector3;
    function cross(a: JVector3): JVector3;
    function crossVectors(a: JVector3; b: JVector3): JVector3;
    function projectOnVector(v: JVector3): JVector3;
    function projectOnPlane(planeNormal: JVector3): JVector3;
    function reflect(vector: JVector3): JVector3;
    function angleTo(v: JVector3): Float;
    function distanceTo(v: JVector3): Float;
    function distanceToSquared(v: JVector3): Float;
    function setFromMatrixPosition(m: JMatrix4): JVector3;
    function setFromMatrixScale(m: JMatrix4): JVector3;
    function setFromMatrixColumn(index: Integer; matrix: JMatrix4): JVector3;
    function equals(v: JVector3): Boolean;
    function fromArray(xyz: array of Float): JVector3; overload;
    function fromArray(xyz: array of Float; offset: Float): JVector3; overload;
    function toArray: array of Float; overload;
    function toArray(xyz: array of Float): array of Float; overload;
    function toArray(xyz: array of Float; offset: Float): array of Float; overload;
    function fromAttribute(attribute: JBufferAttribute; index: Integer): JVector3; overload;
    function fromAttribute(attribute: JBufferAttribute; index: Integer; offset: Float): JVector3; overload;
  end;

  JVector4 = class external 'Vector4'
    constructor Create(x: Float; y: Float; z: Float; w: Float);
    x: Float;
    y: Float;
    z: Float;
    w: Float;
    function set(x: Float; y: Float; z: Float; w: Float): JVector4;
    function setX(x: Float): JVector4;
    function setY(y: Float): JVector4;
    function setZ(z: Float): JVector4;
    function setW(w: Float): JVector4;
    procedure setComponent(index: Integer; value: Float);
    function getComponent(index: Integer): Float;
    function clone: JVector4;
    function copy(v: JVector4): JVector4;
    function add(v: JVector4): JVector4;
    function addScalar(s: Float): JVector4;
    function addVectors(a: JVector4; b: JVector4): JVector4;
    function addScaledVector(v: JVector4; s: Float): JVector4;
    function sub(v: JVector4): JVector4;
    function subScalar(s: Float): JVector4;
    function subVectors(a: JVector4; b: JVector4): JVector4;
    function multiplyScalar(s: Float): JVector4;
    function applyMatrix4(m: JMatrix4): JVector4;
    function divideScalar(s: Float): JVector4;
    function setAxisAngleFromQuaternion(q: JQuaternion): JVector4;
    function setAxisAngleFromRotationMatrix(m: JMatrix3): JVector4;
    function min(v: JVector4): JVector4;
    function max(v: JVector4): JVector4;
    function clamp(min: JVector4; max: JVector4): JVector4;
    function clampScalar(min: Float; max: Float): JVector4;
    function floor: JVector4;
    function ceil: JVector4;
    function round: JVector4;
    function roundToZero: JVector4;
    function negate: JVector4;
    function dot(v: JVector4): Float;
    function lengthSq: Float;
    function length: Float;
    function lengthManhattan: Float;
    function normalize: JVector4;
    function setLength(_length: Float): JVector4;
    function lerp(v: JVector4; alpha: Float): JVector4;
    function lerpVectors(v1: JVector4; v2: JVector4; alpha: Float): JVector4;
    function equals(v: JVector4): Boolean;
    function fromArray(xyzw: array of Float): JVector4; overload;
    function fromArray(xyzw: array of Float; offset: Float): JVector4; overload;
    function toArray: array of Float; overload;
    function toArray(xyzw: array of Float): array of Float; overload;
    function toArray(xyzw: array of Float; offset: Float): array of Float; overload;
    function fromAttribute(attribute: JBufferAttribute; index: Integer): JVector4; overload;
    function fromAttribute(attribute: JBufferAttribute; index: Integer; offset: Float): JVector4; overload;
  end;

  JMatrix3 = class external 'Matrix3'
    constructor Create; overload;
    constructor Create(n11, n12, n13, n21, n22, n23, n31, n32, n33: Float); overload;
    elements: JFloat32Array;
    function set(n11, n12, n13, n21, n22, n23, n31, n32, n33: Float): JMatrix3;
    function identity: JMatrix3;
    function clone: JMatrix3;
    function copy(m: JMatrix3): JMatrix3;
    function applyToVector3Array(&array: array of Float): array of Float; overload;
    function applyToVector3Array(&array: array of Float; offset: Float): array of Float; overload;
    function applyToVector3Array(&array: array of Float; offset: Float; _length: Float): array of Float; overload;
    function applyToBuffer(buffer: JBufferAttribute): JBufferAttribute; overload;
    function applyToBuffer(buffer: JBufferAttribute; offset: Float): JBufferAttribute; overload;
    function applyToBuffer(buffer: JBufferAttribute; offset: Float; _length: Float): JBufferAttribute; overload;
    function multiplyScalar(s: Float): JMatrix3;
    function determinant: Float;
    function getInverse(matrix: JMatrix3): JMatrix3; overload;
    function getInverse(matrix: JMatrix3; throwOnInvertible: Boolean): JMatrix3; overload;
    function getInverse(matrix: JMatrix4): JMatrix3; overload;
    function getInverse(matrix: JMatrix4; throwOnInvertible: Boolean): JMatrix3; overload;
    function transpose: JMatrix3;
    function flattenToArrayOffset(&array: array of Float; offset: Float): array of Float;
    function getNormalMatrix(m: JMatrix4): JMatrix3;
    function transposeIntoArray(r: array of Float): array of Float;
    function fromArray(&array: array of Float): JMatrix3;
    function toArray: array of Float;
  end;

  JMatrix4 = class external 'Matrix4'
    constructor Create(n11, n12, n13, n14, n21, n22, n23, n24, n31, n32, n33, n34, n41, n42, n43, n44: Float);
    elements: JFloat32Array;
    function set(n11, n12, n13, n14, n21, n22, n23, n24, n31, n32, n33, n34, n41, n42, n43, n44: Float): JMatrix4;
    function identity: JMatrix4;
    function clone: JMatrix4;
    function copy(m: JMatrix4): JMatrix4;
    function copyPosition(m: JMatrix4): JMatrix4;
    function extractBasis(xAxis: JVector3; yAxis: JVector3; zAxis: JVector3): JMatrix4;
    function makeBasis(xAxis: JVector3; yAxis: JVector3; zAxis: JVector3): JMatrix4;
    function extractRotation(m: JMatrix4): JMatrix4;
    function makeRotationFromEuler(euler: JEuler): JMatrix4;
    function makeRotationFromQuaternion(q: JQuaternion): JMatrix4;
    function lookAt(eye: JVector3; target: JVector3; up: JVector3): JMatrix4;
    function multiply(m: JMatrix4): JMatrix4;
    function multiplyMatrices(a: JMatrix4; b: JMatrix4): JMatrix4;
    function multiplyToArray(a: JMatrix4; b: JMatrix4; r: array of Float): JMatrix4;
    function multiplyScalar(s: Float): JMatrix4;
    function applyToVector3Array(&array: array of Float): array of Float; overload;
    function applyToVector3Array(&array: array of Float; offset: Float): array of Float; overload;
    function applyToVector3Array(&array: array of Float; offset: Float; _length: Float): array of Float; overload;
    function applyToBuffer(buffer: JBufferAttribute): JBufferAttribute; overload;
    function applyToBuffer(buffer: JBufferAttribute; offset: Float): JBufferAttribute; overload;
    function applyToBuffer(buffer: JBufferAttribute; offset: Float; _length: Float): JBufferAttribute; overload;
    function determinant: Float;
    function transpose: JMatrix4;
    function flattenToArrayOffset(&array: array of Float; offset: Float): array of Float;
    function setPosition(v: JVector3): JVector3;
    function getInverse(m: JMatrix4): JMatrix4; overload;
    function getInverse(m: JMatrix4; throwOnInvertible: Boolean): JMatrix4; overload;
    function scale(v: JVector3): JMatrix4;
    function getMaxScaleOnAxis: Float;
    function makeTranslation(x: Float; y: Float; z: Float): JMatrix4;
    function makeRotationX(theta: Float): JMatrix4;
    function makeRotationY(theta: Float): JMatrix4;
    function makeRotationZ(theta: Float): JMatrix4;
    function makeRotationAxis(axis: JVector3; angle: Float): JMatrix4;
    function makeScale(x: Float; y: Float; z: Float): JMatrix4;
    function compose(translation: JVector3; rotation: JQuaternion; scale: JVector3): JMatrix4;
    function decompose: array of JObject; overload;
    function decompose(translation: JVector3): array of JObject; overload;
    function decompose(translation: JVector3; rotation: JQuaternion): array of JObject; overload;
    function decompose(translation: JVector3; rotation: JQuaternion; scale: JVector3): array of JObject; overload;
    function makeFrustum(left: Float; right: Float; bottom: Float; top: Float; near: Float; far: Float): JMatrix4;
    function makePerspective(fov: Float; aspect: Float; near: Float; far: Float): JMatrix4;
    function makeOrthographic(left: Float; right: Float; top: Float; bottom: Float; near: Float; far: Float): JMatrix4;
    function equals(matrix: JMatrix4): Boolean;
    function fromArray(&array: array of Float): JMatrix4;
    function toArray: array of Float;
  end;

  JColor = class external 'Color'
    constructor Create(color: JColor); overload;
    constructor Create(color: String); overload;
    constructor Create(color: Float); overload;
    constructor Create(r, g, b: Float); overload;
    r: Float;
    g: Float;
    b: Float;
    function set(color: JColor): JColor; overload;
    function set(color: Float): JColor; overload;
    function set(color: String): JColor; overload;
    function setHex(hex: Float): JColor;
    function setRGB(r: Float; g: Float; b: Float): JColor;
    function setHSL(h: Float; s: Float; l: Float): JColor;
    function setStyle(style: String): JColor;
    function clone: JColor;
    function copy(color: JColor): JColor;
    function copyGammaToLinear(color: JColor): JColor; overload;
    function copyGammaToLinear(color: JColor; gammaFactor: Float): JColor; overload;
    function copyLinearToGamma(color: JColor): JColor; overload;
    function copyLinearToGamma(color: JColor; gammaFactor: Float): JColor; overload;
    function convertGammaToLinear: JColor;
    function convertLinearToGamma: JColor;
    function getHex: Float;
    function getHexString: String;
    function getHSL: JHSL;
    function getStyle: String;
    function offsetHSL(h: Float; s: Float; l: Float): JColor;
    function add(color: JColor): JColor;
    function addColors(color1: JColor; color2: JColor): JColor;
    function addScalar(s: Float): JColor;
    function multiply(color: JColor): JColor;
    function multiplyScalar(s: Float): JColor;
    function lerp(color: JColor; alpha: Float): JColor;
    function equals(color: JColor): Boolean;
    function fromArray(rgb: array of Float): JColor; overload;
    function fromArray(rgb: array of Float; offset: Float): JColor; overload;
    function toArray: array of Float; overload;
    function toArray(&array: array of Float): array of Float; overload;
    function toArray(&array: array of Float; offset: Float): array of Float; overload;
  end;

  JColorKeywords = class external 'ColorKeywords'
    aliceblue: Float;
    antiquewhite: Float;
    aqua: Float;
    aquamarine: Float;
    azure: Float;
    beige: Float;
    bisque: Float;
    black: Float;
    blanchedalmond: Float;
    blue: Float;
    blueviolet: Float;
    brown: Float;
    burlywood: Float;
    cadetblue: Float;
    chartreuse: Float;
    chocolate: Float;
    coral: Float;
    cornflowerblue: Float;
    cornsilk: Float;
    crimson: Float;
    cyan: Float;
    darkblue: Float;
    darkcyan: Float;
    darkgoldenrod: Float;
    darkgray: Float;
    darkgreen: Float;
    darkgrey: Float;
    darkkhaki: Float;
    darkmagenta: Float;
    darkolivegreen: Float;
    darkorange: Float;
    darkorchid: Float;
    darkred: Float;
    darksalmon: Float;
    darkseagreen: Float;
    darkslateblue: Float;
    darkslategray: Float;
    darkslategrey: Float;
    darkturquoise: Float;
    darkviolet: Float;
    deeppink: Float;
    deepskyblue: Float;
    dimgray: Float;
    dimgrey: Float;
    dodgerblue: Float;
    firebrick: Float;
    floralwhite: Float;
    forestgreen: Float;
    fuchsia: Float;
    gainsboro: Float;
    ghostwhite: Float;
    gold: Float;
    goldenrod: Float;
    gray: Float;
    green: Float;
    greenyellow: Float;
    grey: Float;
    honeydew: Float;
    hotpink: Float;
    indianred: Float;
    indigo: Float;
    ivory: Float;
    khaki: Float;
    lavender: Float;
    lavenderblush: Float;
    lawngreen: Float;
    lemonchiffon: Float;
    lightblue: Float;
    lightcoral: Float;
    lightcyan: Float;
    lightgoldenrodyellow: Float;
    lightgray: Float;
    lightgreen: Float;
    lightgrey: Float;
    lightpink: Float;
    lightsalmon: Float;
    lightseagreen: Float;
    lightskyblue: Float;
    lightslategray: Float;
    lightslategrey: Float;
    lightsteelblue: Float;
    lightyellow: Float;
    lime: Float;
    limegreen: Float;
    linen: Float;
    magenta: Float;
    maroon: Float;
    mediumaquamarine: Float;
    mediumblue: Float;
    mediumorchid: Float;
    mediumpurple: Float;
    mediumseagreen: Float;
    mediumslateblue: Float;
    mediumspringgreen: Float;
    mediumturquoise: Float;
    mediumvioletred: Float;
    midnightblue: Float;
    mintcream: Float;
    mistyrose: Float;
    moccasin: Float;
    navajowhite: Float;
    navy: Float;
    oldlace: Float;
    olive: Float;
    olivedrab: Float;
    orange: Float;
    orangered: Float;
    orchid: Float;
    palegoldenrod: Float;
    palegreen: Float;
    paleturquoise: Float;
    palevioletred: Float;
    papayawhip: Float;
    peachpuff: Float;
    peru: Float;
    pink: Float;
    plum: Float;
    powderblue: Float;
    purple: Float;
    red: Float;
    rosybrown: Float;
    royalblue: Float;
    saddlebrown: Float;
    salmon: Float;
    sandybrown: Float;
    seagreen: Float;
    seashell: Float;
    sienna: Float;
    silver: Float;
    skyblue: Float;
    slateblue: Float;
    slategray: Float;
    slategrey: Float;
    snow: Float;
    springgreen: Float;
    steelblue: Float;
    tan: Float;
    teal: Float;
    thistle: Float;
    tomato: Float;
    turquoise: Float;
    violet: Float;
    wheat: Float;
    white: Float;
    whitesmoke: Float;
    yellow: Float;
    yellowgreen: Float;
  end;

  JEuler = class external 'Euler'
    constructor Create(x: Float; y: Float; z: Float; order: String);
    x: Float;
    y: Float;
    z: Float;
    order: String;
    function set(x: Float; y: Float; z: Float): JEuler; overload;
    function set(x: Float; y: Float; z: Float; order: String): JEuler; overload;
    function clone: JEuler;
    function copy(euler: JEuler): JEuler;
    function setFromRotationMatrix(m: JMatrix4): JEuler; overload;
    function setFromRotationMatrix(m: JMatrix4; order: String): JEuler; overload;
    function setFromRotationMatrix(m: JMatrix4; order: String; update: Boolean): JEuler; overload;
    function setFromQuaternion(q: JQuaternion): JEuler; overload;
    function setFromQuaternion(q: JQuaternion; order: String): JEuler; overload;
    function setFromQuaternion(q: JQuaternion; order: String; update: Boolean): JEuler; overload;
    function setFromVector3(v: JVector3): JEuler; overload;
    function setFromVector3(v: JVector3; order: String): JEuler; overload;
    function reorder(newOrder: String): JEuler;
    function equals(euler: JEuler): Boolean;
    function fromArray(xyzo: array of Variant): JEuler;
    function toArray: array of Float; overload;
    function toArray(&array: array of Float): array of Float; overload;
    function toArray(&array: array of Float; offset: Float): array of Float; overload;
    function toVector3: JVector3; overload;
    function toVector3(optionalResult: JVector3): JVector3; overload;
    onChange: procedure;
  end;

  JMorphTarget = class external
    name: String;
    vertices: array of JVector3;
  end;

  JMorphColor = class external
    name: String;
    colors: array of JColor;
  end;

  JMorphNormals = class external
    name: String;
    normals: array of JVector3;
  end;

  JKeyframeTrack = class external 'KeyframeTrack'
    constructor Create(name: String; keys: array of Variant);
    name: String;
    keys: array of Variant;
    lastindex: Integer;
    function getAt(time: Float): Variant;
    function shift(timeOffset: Float): JKeyframeTrack;
    function scale(timeScale: Float): JKeyframeTrack;
    function trim(startTime: Float; endTime: Float): JKeyframeTrack;
    function validate: JKeyframeTrack;
    function optimize: JKeyframeTrack;
    function keyComparator(key0: JKeyframeTrack; key1: JKeyframeTrack): Float;
    function parse(json: Variant): JKeyframeTrack;
    function GetTrackTypeForTypeName(typeName: String): Variant;
  end;

  JPropertyBinding = class external 'PropertyBinding'
    constructor Create(rootNode: Variant; trackName: String);
    rootNode: Variant;
    trackName: String;
    referenceCount: Float;
    originalValue: Variant;
    directoryName: String;
    nodeName: String;
    objectName: String;
    objectindex: Integer;
    propertyName: String;
    propertyindex: Integer;
    node: Variant;
    cumulativeValue: Float;
    cumulativeWeight: Float;
    procedure reset;
    procedure accumulate(value: Variant; weight: Float);
    procedure unbind;
    procedure bind;
    procedure apply;
    function parseTrackName(trackName: String): Variant;
    function findNode(root: Variant; nodeName: String): Variant;
  end;

  JBooleanKeyframeTrack = class external 'BooleanKeyframeTrack'(JKeyframeTrack)
    constructor Create(name: String; keys: array of Variant);
    result: Variant;
    procedure setResult(value: Variant);
    function lerpValues(value0: Variant; value1: Variant; alpha: Float): Variant;
    function compareValues(value0: Variant; value1: Variant): Boolean;
    function clone: JBooleanKeyframeTrack;
    function parse(json: Variant): JBooleanKeyframeTrack;
  end;

  JColorKeyframeTrack = class external 'ColorKeyframeTrack'(JKeyframeTrack)
    constructor Create(name: String; keys: array of Variant);
    result: Variant;
    procedure setResult(value: Variant);
    function lerpValues(value0: Variant; value1: Variant; alpha: Float): Variant;
    function compareValues(value0: Variant; value1: Variant): Boolean;
    function clone: JColorKeyframeTrack;
    function parse(json: Variant): JColorKeyframeTrack;
  end;

  JNumberKeyframeTrack = class external 'NumberKeyframeTrack'
    constructor Create;
    result: Variant;
    procedure setResult(value: Variant);
    function lerpValues(value0: Variant; value1: Variant; alpha: Float): Variant;
    function compareValues(value0: Variant; value1: Variant): Boolean;
    function clone: JNumberKeyframeTrack;
    function parse(json: Variant): JNumberKeyframeTrack;
  end;

  JQuaternionKeyframeTrack = class external 'QuaternionKeyframeTrack'
    constructor Create;
    result: Variant;
    procedure setResult(value: Variant);
    function lerpValues(value0: Variant; value1: Variant; alpha: Float): Variant;
    function compareValues(value0: Variant; value1: Variant): Boolean;
    function clone: JQuaternionKeyframeTrack;
    function parse(json: Variant): JQuaternionKeyframeTrack;
  end;

  JStringKeyframeTrack = class external 'StringKeyframeTrack'
    constructor Create;
    result: Variant;
    procedure setResult(value: Variant);
    function lerpValues(value0: Variant; value1: Variant; alpha: Float): Variant;
    function compareValues(value0: Variant; value1: Variant): Boolean;
    function clone: JStringKeyframeTrack;
    function parse(json: Variant): JStringKeyframeTrack;
  end;

  JVectorKeyframeTrack = class external 'VectorKeyframeTrack'
    constructor Create;
    result: Variant;
    procedure setResult(value: Variant);
    function lerpValues(value0: Variant; value1: Variant; alpha: Float): Variant;
    function compareValues(value0: Variant; value1: Variant): Boolean;
    function clone: JVectorKeyframeTrack;
    function parse(json: Variant): JVectorKeyframeTrack;
  end;

  JChannels = class external 'Channels'
    constructor Create;
    mask: Float;
    procedure set(channel: Float);
    procedure enable(channel: Float);
    procedure toggle(channel: Float);
    procedure disable(channel: Float);
  end;

  JObject3D = class external 'Object3D'
    constructor Create;
    id: Float;
    uuid: String;
    name: String;
    &type: String;
    parent: JObject3D;
    channels: JChannels;
    children: array of JObject3D;
    up: JVector3;
    position: JVector3;
    rotation: JEuler;
    quaternion: JQuaternion;
    scale: JVector3;
    modelViewMatrix: record
      value: JMatrix4;
    end;
    normalMatrix: record
      value: JMatrix3;
    end;
    rotationAutoUpdate: Boolean;
    matrix: JMatrix4;
    matrixWorld: JMatrix4;
    matrixAutoUpdate: Boolean;
    matrixWorldNeedsUpdate: Boolean;
    visible: Boolean;
    castShadow: Boolean;
    receiveShadow: Boolean;
    frustumCulled: Boolean;
    renderOrder: Float;
    userData: Variant;
    DefaultUp: JVector3;
    DefaultMatrixAutoUpdate: JVector3;
    procedure applyMatrix(matrix: JMatrix4);
    procedure setRotationFromAxisAngle(axis: JVector3; angle: Float);
    procedure setRotationFromEuler(euler: JEuler);
    procedure setRotationFromMatrix(m: JMatrix4);
    procedure setRotationFromQuaternion(q: JQuaternion);
    function rotateOnAxis(axis: JVector3; angle: Float): JObject3D;
    function rotateX(angle: Float): JObject3D;
    function rotateY(angle: Float): JObject3D;
    function rotateZ(angle: Float): JObject3D;
    function translateOnAxis(axis: JVector3; distance: Float): JObject3D;
    function translate(distance: Float; axis: JVector3): JObject3D;
    function translateX(distance: Float): JObject3D;
    function translateY(distance: Float): JObject3D;
    function translateZ(distance: Float): JObject3D;
    function localToWorld(vector: JVector3): JVector3;
    function worldToLocal(vector: JVector3): JVector3;
    procedure lookAt(vector: JVector3);
    procedure add(&object: JObject3D);
    procedure remove(&object: JObject3D);
    function getChildByName(name: String): JObject3D;
    function getObjectById(id: Float): JObject3D;
    function getObjectByName(name: String): JObject3D;
    function getObjectByProperty(name: String; value: String): JObject3D;
    function getWorldPosition: JVector3; overload;
    function getWorldPosition(optionalTarget: JVector3): JVector3; overload;
    function getWorldQuaternion: JQuaternion; overload;
    function getWorldQuaternion(optionalTarget: JQuaternion): JQuaternion; overload;
    function getWorldRotation: JEuler; overload;
    function getWorldRotation(optionalTarget: JEuler): JEuler; overload;
    function getWorldScale: JVector3; overload;
    function getWorldScale(optionalTarget: JVector3): JVector3; overload;
    function getWorldDirection: JVector3; overload;
    function getWorldDirection(optionalTarget: JVector3): JVector3; overload;
    procedure raycast(raycaster: JRaycaster; intersects: Variant);
    procedure traverse(callback: function(&object: JObject3D): Variant);
    procedure traverseVisible(callback: function(&object: JObject3D): Variant);
    procedure traverseAncestors(callback: function(&object: JObject3D): Variant);
    procedure updateMatrix;
    procedure updateMatrixWorld(force: Boolean);
    function toJSON: Variant; overload;
    function toJSON(meta: Variant): Variant; overload;
    function clone: JObject3D; overload;
    function clone(recursive: Boolean): JObject3D; overload;
    function copy(source: JObject3D): JObject3D; overload;
    function copy(source: JObject3D; recursive: Boolean): JObject3D; overload;
    procedure addEventListener(&type: String; listener: procedure(event: Variant));
    procedure hasEventListener(&type: String; listener: procedure(event: Variant));
    procedure removeEventListener(&type: String; listener: procedure(event: Variant));
    procedure dispatchEvent(event: record
      &type: String;
      target: Variant;
    end);
  end;

  JCamera = class external 'Camera'(JObject3D)
    constructor Create;
    matrixWorldInverse: JMatrix4;
    projectionMatrix: JMatrix4;
    function getWorldDirection: JVector3; overload;
    function getWorldDirection(optionalTarget: JVector3): JVector3; overload;
    procedure lookAt(vector: JVector3);
    function clone: JCamera;
    function copy: JCamera; overload;
    function copy(camera: JCamera): JCamera; overload;
  end;

  JCubeCamera = class external 'CubeCamera'(JObject3D)
    constructor Create(near: Float; far: Float; cubeResolution: Float);
    renderTarget: JWebGLRenderTargetCube;
    procedure updateCubeMap(renderer: JRenderer; scene: JScene);
  end;

  JOrthographicCamera = class external 'OrthographicCamera'(JCamera)
    constructor Create(left: Float; right: Float; top: Float; bottom: Float; near: Float; far: Float);
    zoom: Float;
    left: Float;
    right: Float;
    top: Float;
    bottom: Float;
    near: Float;
    far: Float;
    procedure updateProjectionMatrix;
    function clone: JOrthographicCamera;
    function copy(source: JOrthographicCamera): JOrthographicCamera;
    function toJSON: Variant; overload;
    function toJSON(meta: Variant): Variant; overload;
  end;

  JPerspectiveCamera = class external 'PerspectiveCamera'(JCamera)
    constructor Create(fov: Float; aspect: Float; near: Float; far: Float);
    zoom: Float;
    fov: Float;
    aspect: Float;
    near: Float;
    far: Float;
    procedure setLens(focalLength: Float); overload;
    procedure setLens(focalLength: Float; frameHeight: Float); overload;
    procedure setViewOffset(fullWidth: Float; fullHeight: Float; x: Float; y: Float; width: Float; height: Float);
    procedure updateProjectionMatrix;
    function clone: JPerspectiveCamera;
    function copy(source: JPerspectiveCamera): JPerspectiveCamera;
    function toJSON: Variant; overload;
    function toJSON(meta: Variant): Variant; overload;
  end;

  JBufferAttribute = class external 'BufferAttribute'
    //TODO: constructor Create(&array: JArrayLike{<Float>}; itemSize: Float);
    uuid: String;
    //TODO: &array: JArrayLike{<Float>};
    itemSize: Float;
    dynamic: Boolean;
    updateRange: record
      offset: Float;
      count: Float;
    end;
    version: Float;
    needsUpdate: Boolean;
    _length: Float;
    count: Float;
    function setDynamic(dynamic: Boolean): JBufferAttribute;
    function clone: JBufferAttribute;
    function copy(source: JBufferAttribute): JBufferAttribute;
    function copyAt(index1: Float; attribute: JBufferAttribute; index2: Float): JBufferAttribute;
    //TODO: function copyArray(array: JArrayLike{<Float>}): JBufferAttribute;
    function copyColorsArray(colors: array of record
      r: Float;
      g: Float;
      b: Float;
    end): JBufferAttribute;
    function copyIndicesArray(indices: array of record
      a: Float;
      b: Float;
      c: Float;
    end): JBufferAttribute;
    function copyVector2sArray(vectors: array of record
      x: Float;
      y: Float;
    end): JBufferAttribute;
    function copyVector3sArray(vectors: array of record
      x: Float;
      y: Float;
      z: Float;
    end): JBufferAttribute;
    function copyVector4sArray(vectors: array of record
      x: Float;
      y: Float;
      z: Float;
      w: Float;
    end): JBufferAttribute;
    //TODO: function set(value: JArrayLike{<Float>}): JBufferAttribute; overload;
    //TODO: function set(value: JArrayLike{<Float>}; offset: Float): JBufferAttribute; overload;
    function getX(index: Integer): Float;
    function setX(index: Integer; x: Float): JBufferAttribute;
    function getY(index: Integer): Float;
    function setY(index: Integer; y: Float): JBufferAttribute;
    function getZ(index: Integer): Float;
    function setZ(index: Integer; z: Float): JBufferAttribute;
    function getW(index: Integer): Float;
    function setW(index: Integer; z: Float): JBufferAttribute;
    function setXY(index: Integer; x: Float; y: Float): JBufferAttribute;
    function setXYZ(index: Integer; x: Float; y: Float; z: Float): JBufferAttribute;
    function setXYZW(index: Integer; x: Float; y: Float; z: Float; w: Float): JBufferAttribute;
  end;

  JAnimationClip = class external 'THREE.AnimationClip'
    constructor Create(name: String; duration: Float; tracks: array of JKeyframeTrack);
    name: String;
    tracks: array of JKeyframeTrack;
    duration: Float;
    results: array of Variant;
    function getAt(clipTime: Float): array of Variant;
    function trim: JAnimationClip;
    function optimize: JAnimationClip;
    function CreateFromMorphTargetSequence(name: String; morphTargetSequence: array of JMorphTarget; fps: Float): JAnimationClip;
    function findByName(clipArray: JAnimationClip; name: String): JAnimationClip;
    function CreateClipsFromMorphTargetSequences(morphTargets: array of JMorphTarget; fps: Float): array of JAnimationClip;
    function parse(json: Variant): JAnimationClip;
    function parseAnimation(animation: Variant; bones: array of JBone; nodeName: String): JAnimationClip;
  end;

  JAnimationAction = class external 'THREE.AnimationAction'
    constructor Create(clip: JAnimationClip; startTime: Float; timeScale: Float; weight: Float; loop: Boolean);
    clip: JAnimationClip;
    localRoot: JMesh;
    startTime: Float;
    timeScale: Float;
    weight: Float;
    // TODO: loop: JAnimationActionLoopStyles;
    loopCount: Float;
    enabled: Boolean;
    actionTime: Float;
    clipTime: Float;
    propertyBindings: array of JPropertyBinding;
    function setLocalRoot(localRoot: JMesh): JAnimationAction;
    function updateTime(clipDeltaTime: Float): Float;
    function syncWith(action: JAnimationAction): JAnimationAction;
    function warpToDuration(duration: Float): JAnimationAction;
    function init(time: Float): JAnimationAction;
    function update(clipDeltaTime: Float): array of Variant;
    function getTimeScaleAt(time: Float): Float;
    function getWeightAt(time: Float): Float;
  end;

  JAnimationMixer = class external 'THREE.AnimationMixer'
    constructor Create(root: Variant);
    root: Variant;
    time: Float;
    timeScale: Float;
    actions: JAnimationAction;
    propertyBindingMap: Variant;
    procedure addAction(action: JAnimationAction);
    function removeAllActions: JAnimationMixer;
    function removeAction(action: JAnimationAction): JAnimationMixer;
    function findActionByName(name: String): JAnimationAction;
    function play(action: JAnimationAction): JAnimationMixer; overload;
    function play(action: JAnimationAction; optionalFadeInDuration: Float): JAnimationMixer; overload;
    function fadeOut(action: JAnimationAction; duration: Float): JAnimationMixer;
    function fadeIn(action: JAnimationAction; duration: Float): JAnimationMixer;
    function warp(action: JAnimationAction; startTimeScale: JNumberKeyframeTrack; endTimeScale: JNumberKeyframeTrack; duration: Float): JAnimationMixer;
    function crossFade(fadeOutAction: JAnimationAction; fadeInAction: JAnimationAction; duration: Float; warp: Boolean): JAnimationMixer;
    function update(deltaTime: Float): JAnimationMixer;
  end;

  JInt8Attribute = class external 'Int8Attribute'(JBufferAttribute)
    constructor Create(&array: Variant; itemSize: Float);
  end;

  JUint8Attribute = class external 'Uint8Attribute'(JBufferAttribute)
    constructor Create(&array: Variant; itemSize: Float);
  end;

  JUint8ClampedAttribute = class external 'Uint8ClampedAttribute'(JBufferAttribute)
    constructor Create(&array: Variant; itemSize: Float);
  end;

  JInt16Attribute = class external 'Int16Attribute'(JBufferAttribute)
    constructor Create(&array: Variant; itemSize: Float);
  end;

  JUint16Attribute = class external 'Uint16Attribute'(JBufferAttribute)
    constructor Create(&array: Variant; itemSize: Float);
  end;

  JInt32Attribute = class external 'Int32Attribute'(JBufferAttribute)
    constructor Create(&array: Variant; itemSize: Float);
  end;

  JUint32Attribute = class external 'Uint32Attribute'(JBufferAttribute)
    constructor Create(&array: Variant; itemSize: Float);
  end;

  JFloat32Attribute = class external 'Float32Attribute'(JBufferAttribute)
    constructor Create(&array: Variant; itemSize: Float);
  end;

  JFloat64Attribute = class external 'Float64Attribute'(JBufferAttribute)
    constructor Create(&array: Variant; itemSize: Float);
  end;

  JBoundingSphere = class external
    radius: Float;
  end;

  JDirectGeometry = class external 'DirectGeometry'
    constructor Create;
    id: Float;
    uuid: String;
    name: String;
    &type: String;
    indices: array of Float;
    vertices: array of JVector3;
    normals: array of JVector3;
    colors: array of JColor;
    uvs: array of JVector2;
    uvs2: array of JVector2;
    groups: array of record
      start: Float;
      materialIndex: Integer;
    end;
    morphTargets: array of JMorphTarget;
    skinWeights: array of Float;
    skinIndices: array of Float;
    boundingBox: JBox3;
    boundingSphere: JBoundingSphere;
    verticesNeedUpdate: Boolean;
    normalsNeedUpdate: Boolean;
    colorsNeedUpdate: Boolean;
    uvsNeedUpdate: Boolean;
    groupsNeedUpdate: Boolean;
    procedure computeBoundingBox;
    procedure computeBoundingSphere;
    procedure computeGroups(geometry: JGeometry);
    function fromGeometry(geometry: JGeometry): JDirectGeometry;
    procedure dispose;
    procedure addEventListener(&type: String; listener: procedure(event: Variant));
    procedure hasEventListener(&type: String; listener: procedure(event: Variant));
    procedure removeEventListener(&type: String; listener: procedure(event: Variant));
    procedure dispatchEvent(event: record
      &type: String;
      target: Variant;
    end);
  end;

  JBufferGeometry = class external 'BufferGeometry'
    constructor Create;
    Maxindex: Integer;
    id: Float;
    uuid: String;
    name: String;
    &type: String;
    index: JBufferAttribute;
    attributes: Variant {JBufferAttribute or array of JInterleavedBufferAttribute};
    morphAttributes: Variant;
    groups: array of record
      start: Float;
      count: Float;
      materialindex: Integer; // nullable
    end;
    boundingBox: JBox3;
    boundingSphere: JBoundingSphere;
    drawRange: record
      start: Float;
      count: Float;
    end;
    procedure addIndex(index: JBufferAttribute);
    function getIndex: JBufferAttribute;
    procedure setIndex(index: JBufferAttribute);
    function addAttribute(name: String; &array: Variant; itemSize: Float): Variant; overload;
    procedure addAttribute(name: String; attribute: Variant {JBufferAttribute or JInterleavedBufferAttribute}); overload;
    function getAttribute(name: String): Variant {JBufferAttribute or JInterleavedBufferAttribute};
    procedure removeAttribute(name: String);
    function drawcalls: Variant;
    function offsets: Variant;
    procedure addDrawCall(start: Float; count: Float); overload;
    procedure addDrawCall(start: Float; count: Float; index: Integer); overload;
    procedure clearDrawCalls;
    procedure addGroup(start: Float; count: Float); overload;
    procedure addGroup(start: Float; count: Float; materialindex: Integer); overload;
    procedure clearGroups;
    procedure setDrawRange(start: Float; count: Float);
    procedure applyMatrix(matrix: JMatrix4);
    function rotateX(angle: Float): JBufferGeometry;
    function rotateY(angle: Float): JBufferGeometry;
    function rotateZ(angle: Float): JBufferGeometry;
    function translate(x: Float; y: Float; z: Float): JBufferGeometry;
    function scale(x: Float; y: Float; z: Float): JBufferGeometry;
    procedure lookAt(v: JVector3);
    function center: JVector3;
    procedure setFromObject(&object: JObject3D);
    procedure updateFromObject(&object: JObject3D);
    function fromGeometry(geometry: JGeometry): JBufferGeometry; overload;
    function fromGeometry(geometry: JGeometry; settings: Variant): JBufferGeometry; overload;
    function fromDirectGeometry(geometry: JDirectGeometry): JBufferGeometry;
    procedure computeBoundingBox;
    procedure computeBoundingSphere;
    procedure computeFaceNormals;
    procedure computeVertexNormals;
    procedure computeOffsets(size: Float);
    function merge(geometry: JBufferGeometry; offset: Float): JBufferGeometry;
    procedure normalizeNormals;
    function toJSON: Variant;
    function clone: JBufferGeometry;
    function copy(source: JBufferGeometry): JBufferGeometry;
    procedure dispose;
    procedure addEventListener(&type: String; listener: procedure(event: Variant));
    procedure hasEventListener(&type: String; listener: procedure(event: Variant));
    procedure removeEventListener(&type: String; listener: procedure(event: Variant));
    procedure dispatchEvent(event: record
      &type: String;
      target: Variant;
    end);
  end;

  JClock = class external 'Clock'
    constructor Create(autoStart: Boolean);
    autoStart: Boolean;
    startTime: Float;
    oldTime: Float;
    elapsedTime: Float;
    running: Boolean;
    procedure start;
    procedure stop;
    function getElapsedTime: Float;
    function getDelta: Float;
  end;

  JEventDispatcher = class external 'EventDispatcher'
    constructor Create;
    procedure addEventListener(&type: String; listener: procedure(event: Variant));
    procedure hasEventListener(&type: String; listener: procedure(event: Variant));
    procedure removeEventListener(&type: String; listener: procedure(event: Variant));
    procedure dispatchEvent(event: record
      &type: String;
      target: Variant;
    end);
  end;

  JFace3 = class external 'Face3'
    constructor Create(a, b, c: Float; normal: JVector3; color: JColor; materialindex: Integer); overload;
    constructor Create(a, b, c: Float; normal: JVector3; vertexColors: array of JColor; materialindex: Integer); overload;
    constructor Create(a, b, c: Float; vertexNormals: array of JVector3; color: JColor; materialindex: Integer); overload;
    constructor Create(a, b, c: Float; vertexNormals: array of JVector3; vertexColors: array of JColor; materialindex: Integer); overload;
    a: Float;
    b: Float;
    c: Float;
    normal: JVector3;
    vertexNormals: array of JVector3;
    color: JColor;
    vertexColors: array of JColor;
    vertexTangents: array of Float;
    materialindex: Integer;
    function clone: JFace3;
  end;

  JGeometry = class external 'Geometry'
    constructor Create;
    id: Float;
    uuid: String;
    name: String;
    &type: String;
    vertices: array of JVector3;
    colors: array of JColor;
    faces: array of JFace3;
    faceVertexUvs: array of array of array of JVector2;
    morphTargets: array of JMorphTarget;
    morphNormals: array of JMorphNormals;
    skinWeights: array of Float;
    skinIndices: array of Float;
    lineDistances: array of Float;
    boundingBox: JBox3;
    boundingSphere: JBoundingSphere;
    verticesNeedUpdate: Boolean;
    elementsNeedUpdate: Boolean;
    uvsNeedUpdate: Boolean;
    normalsNeedUpdate: Boolean;
    colorsNeedUpdate: Boolean;
    lineDistancesNeedUpdate: Boolean;
    groupsNeedUpdate: Boolean;
    procedure applyMatrix(matrix: JMatrix4);
    function rotateX(angle: Float): JGeometry;
    function rotateY(angle: Float): JGeometry;
    function rotateZ(angle: Float): JGeometry;
    function translate(x, y, z: Float): JGeometry;
    function scale(x: Float; y: Float; z: Float): JGeometry;
    procedure lookAt(vector: JVector3);
    function fromBufferGeometry(geometry: JBufferGeometry): JGeometry;
    function center: JVector3;
    function normalize: JGeometry;
    procedure computeFaceNormals;
    procedure computeVertexNormals; overload;
    procedure computeVertexNormals(areaWeighted: Boolean); overload;
    procedure computeMorphNormals;
    procedure computeLineDistances;
    procedure computeBoundingBox;
    procedure computeBoundingSphere;
    procedure merge(geometry: JGeometry; matrix: JMatrix); overload;
    procedure merge(geometry: JGeometry; matrix: JMatrix; materialIndexOffset: Float); overload;
    procedure mergeMesh(mesh: JMesh);
    function mergeVertices: Float;
    procedure sortFacesByMaterialIndex;
    function toJSON: Variant;
    function clone: JGeometry;
    function copy(source: JGeometry): JGeometry;
    procedure dispose;
    bones: array of JBone;
    animation: JAnimationClip;
    animations: array of JAnimationClip;
    procedure addEventListener(&type: String; listener: procedure(event: Variant));
    procedure hasEventListener(&type: String; listener: procedure(event: Variant));
    procedure removeEventListener(&type: String; listener: procedure(event: Variant));
    procedure dispatchEvent(event: record
      &type: String;
      target: Variant;
    end);
  end;

  JInstancedBufferAttribute = class external 'InstancedBufferAttribute'(JBufferAttribute)
    // TODO: constructor Create(data: JArrayLike{<Float>}; itemSize: Float; meshPerAttribute: Float);
    meshPerAttribute: Float;
    function clone: JInstancedBufferAttribute;
    function copy(source: JInstancedBufferAttribute): JInstancedBufferAttribute;
  end;

  JInstancedBufferGeometry = class external 'InstancedBufferGeometry'(JBufferGeometry)
    constructor Create;
    groups: array of record
      start: Float;
      count: Float;
      instances: Float;
    end;
    procedure addGroup(start: Float; count: Float; instances: Float);
    function clone: JInstancedBufferGeometry;
    function copy(source: JInstancedBufferGeometry): JInstancedBufferGeometry;
  end;

  JInterleavedBufferAttribute = class external 'InterleavedBufferAttribute'
    constructor Create(interleavedBuffer: JInterleavedBuffer; itemSize: Float; offset: Float);
    uuid: String;
    data: JInterleavedBuffer;
    itemSize: Float;
    offset: Float;
    _length: Float;
    count: Float;
    function getX(index: Integer): Float;
    function setX(index: Integer; x: Float): JInterleavedBufferAttribute;
    function getY(index: Integer): Float;
    function setY(index: Integer; y: Float): JInterleavedBufferAttribute;
    function getZ(index: Integer): Float;
    function setZ(index: Integer; z: Float): JInterleavedBufferAttribute;
    function getW(index: Integer): Float;
    function setW(index: Integer; z: Float): JInterleavedBufferAttribute;
    function setXY(index: Integer; x: Float; y: Float): JInterleavedBufferAttribute;
    function setXYZ(index: Integer; x: Float; y: Float; z: Float): JInterleavedBufferAttribute;
    function setXYZW(index: Integer; x: Float; y: Float; z: Float; w: Float): JInterleavedBufferAttribute;
  end;

  JInterleavedBuffer = class external 'InterleavedBuffer'
    // TODO: constructor Create(&array: JArrayLike{<Float>}; stride: Float);
    // TODO: &array: JArrayLike{<Float>};
    stride: Float;
    dynamic: Boolean;
    updateRange: record
      offset: Float;
      count: Float;
    end;
    version: Float;
    _length: Float;
    count: Float;
    needsUpdate: Boolean;
    function setDynamic(dynamic: Boolean): JInterleavedBuffer;
    function clone: JInterleavedBuffer;
    function copy(source: JInterleavedBuffer): JInterleavedBuffer;
    function copyAt(index1: Float; attribute: JInterleavedBufferAttribute; index2: Float): JInterleavedBuffer;
    //TODO: function set(value: JArrayLike{<Float>}; index: Integer): JInterleavedBuffer;
  end;

  JInstancedInterleavedBuffer = class external 'InstancedInterleavedBuffer'(JInterleavedBuffer)
    //TODO: constructor Create(&array: JArrayLike{<Float>}; stride: Float; meshPerAttribute: Float);
    meshPerAttribute: Float;
    function clone: JInstancedInterleavedBuffer;
    function copy(source: JInstancedInterleavedBuffer): JInstancedInterleavedBuffer;
  end;

  JRay = class external 'Ray'
    constructor Create(origin: JVector3; direction: JVector3);
    origin: JVector3;
    direction: JVector3;
    function set(origin: JVector3; direction: JVector3): JRay;
    function clone: JRay;
    function copy(ray: JRay): JRay;
    function at(t: Float): JVector3; overload;
    function at(t: Float; optionalTarget: JVector3): JVector3; overload;
    function recast(t: Float): JRay;
    function closestPointToPoint(point: JVector3): JVector3; overload;
    function closestPointToPoint(point: JVector3; optionalTarget: JVector3): JVector3; overload;
    function distanceToPoint(point: JVector3): Float;
    function distanceSqToPoint(point: JVector3): Float;
    function distanceSqToSegment(v0: JVector3; v1: JVector3): Float; overload;
    function distanceSqToSegment(v0: JVector3; v1: JVector3; optionalPointOnRay: JVector3): Float; overload;
    function distanceSqToSegment(v0: JVector3; v1: JVector3; optionalPointOnRay: JVector3; optionalPointOnSegment: JVector3): Float; overload;
    function isIntersectionSphere(sphere: JSphere): Boolean;
    function intersectSphere(sphere: JSphere): JVector3; overload;
    function intersectSphere(sphere: JSphere; optionalTarget: JVector3): JVector3; overload;
    function isIntersectionPlane(plane: JPlane): Boolean;
    function distanceToPlane(plane: JPlane): Float;
    function intersectPlane(plane: JPlane): JVector3; overload;
    function intersectPlane(plane: JPlane; optionalTarget: JVector3): JVector3; overload;
    function isIntersectionBox(box: JBox3): Boolean;
    function intersectBox(box: JBox3): JVector3; overload;
    function intersectBox(box: JBox3; optionalTarget: JVector3): JVector3; overload;
    function intersectTriangle(a: JVector3; b: JVector3; c: JVector3; backfaceCulling: Boolean): JVector3; overload;
    function intersectTriangle(a: JVector3; b: JVector3; c: JVector3; backfaceCulling: Boolean; optionalTarget: JVector3): JVector3; overload;
    function applyMatrix4(matrix4: JMatrix4): JRay;
    function equals(ray: JRay): Boolean;
  end;

  JRaycasterParameters = class external
    Mesh: Variant; // nullable
    Line: Variant; // nullable
    LOD: Variant; // nullable
    Points: Variant; // nullable
    Sprite: Variant; // nullable
  end;

  JProgress = class external
    total: Float;
    loaded: Float;
  end;

  JIntersection = class external
    distance: Float;
    point: JVector3;
    face: JFace3;
    &object: JObject3D;
  end;

  JRaycaster = class external 'Raycaster'
    constructor Create(origin: JVector3; direction: JVector3; near: Float; far: Float);
    ray: JRay;
    near: Float;
    far: Float;
    params: JRaycasterParameters;
    precision: Float;
    linePrecision: Float;
    procedure set(origin: JVector3; direction: JVector3);
    procedure setFromCamera(coords: record
      x: Float;
      y: Float;
    end; camera: JCamera);
    function intersectObject(&object: JObject3D): array of JIntersection; overload;
    function intersectObject(&object: JObject3D; recursive: Boolean): array of JIntersection; overload;
    function intersectObjects(objects: array of JObject3D): array of JIntersection; overload;
    function intersectObjects(objects: array of JObject3D; recursive: Boolean): array of JIntersection; overload;
  end;

  JLight = class external 'Light'(JObject3D)
    constructor Create(hex: Variant {Float or String});
    color: JColor;
    receiveShadow: Boolean;
    shadowCameraFov: Float;
    shadowCameraLeft: Float;
    shadowCameraRight: Float;
    shadowCameraTop: Float;
    shadowCameraBottom: Float;
    shadowCameraNear: Float;
    shadowCameraFar: Float;
    shadowBias: Float;
    shadowDarkness: Float;
    shadowMapWidth: Float;
    shadowMapHeight: Float;
    function clone: JLight; overload;
    function clone(recursive: Boolean): JLight; overload;
    function copy(source: JLight): JLight;
    function toJSON(meta: Variant): Variant;
  end;

  JLightShadow = class external 'LightShadow'
    constructor Create(camera: JCamera);
    camera: JCamera;
    bias: Float;
    darkness: Float;
    mapSize: JVector2;
    map: JRenderTarget;
    matrix: JMatrix4;
    procedure copy(source: JLightShadow);
    function clone: JLightShadow;
  end;

  JAmbientLight = class external 'AmbientLight'(JLight)
    constructor Create(hex: Variant {Float or String});
    function clone: JAmbientLight; overload;
    function clone(recursive: Boolean): JAmbientLight; overload;
    function copy(source: JAmbientLight): JAmbientLight;
  end;

  JDirectionalLight = class external 'DirectionalLight'(JLight)
    constructor Create(hex: Variant {Float or String}; intensity: Float);
    target: JObject3D;
    intensity: Float;
    shadow: JLightShadow;
    function clone: JDirectionalLight; overload;
    function clone(recursive: Boolean): JDirectionalLight; overload;
    function copy(source: JDirectionalLight): JDirectionalLight;
  end;

  JHemisphereLight = class external 'HemisphereLight'(JLight)
    constructor Create(skyColorHex: Variant {Float or String}; groundColorHex: Variant {Float or String}; intensity: Float);
    groundColor: JColor;
    intensity: Float;
    function clone: JHemisphereLight; overload;
    function clone(recursive: Boolean): JHemisphereLight; overload;
    function copy(source: JHemisphereLight): JHemisphereLight;
  end;

  JPointLight = class external 'PointLight'(JLight)
    constructor Create(hex: Variant {Float or String}; intensity: Float; distance: Float; decay: Float);
    intensity: Float;
    distance: Float;
    decay: Float;
    shadow: JLightShadow;
    function clone: JPointLight; overload;
    function clone(recursive: Boolean): JPointLight; overload;
    function copy(source: JPointLight): JPointLight;
  end;

  JSpotLight = class external 'SpotLight'(JLight)
    constructor Create(hex: Variant {Float or String}; intensity: Float; distance: Float; angle: Float; exponent: Float; decay: Float);
    target: JObject3D;
    intensity: Float;
    distance: Float;
    angle: Float;
    exponent: Float;
    decay: Float;
    shadow: JLightShadow;
    function clone: JSpotLight; overload;
    function clone(recursive: Boolean): JSpotLight; overload;
    function copy(source: JPointLight): JSpotLight;
  end;

  JLoaderHandler = class external
    handlers: array of Variant;
    procedure add(regex: String; loader: JLoader);
    function get(file: String): JLoader;
  end;

  JCache = class external
    enabled: Boolean;
    files: array of Variant;
    procedure add(key: String; file: Variant);
    function get(key: String): Variant;
    procedure remove(key: String);
    procedure clear;
  end;

  JLoader = class external 'Loader'
    constructor Create;
    onLoadStart: procedure;
    onLoadProgress: procedure;
    onLoadComplete: procedure;
    crossOrigin: String;
    function extractUrlBase(url: String): String;
    function initMaterials(materials: array of JMaterial; texturePath: String): array of JMaterial;
    function createMaterial(m: JMaterial; texturePath: String): Boolean; overload;
    function createMaterial(m: JMaterial; texturePath: String; crossOrigin: String): Boolean; overload;
    Handlers: JLoaderHandler;
  end;

  JAnimationLoader = class external 'AnimationLoader'
    constructor Create(manager: JLoadingManager);
    manager: JLoadingManager;
    procedure load(url: String; onLoad: procedure(animations: array of JAnimationClip)); overload;
    procedure load(url: String; onLoad: procedure(animations: array of JAnimationClip); onProgress: procedure(event: Variant)); overload;
    procedure load(url: String; onLoad: procedure(animations: array of JAnimationClip); onProgress: procedure(event: Variant); onError: procedure(event: Variant)); overload;
    procedure setCrossOrigin(crossOrigin: String)
    procedure parse(json: Variant; onLoad: procedure(animations: array of JAnimationClip))
  end;

  JBinaryTextureLoader = class external 'BinaryTextureLoader'
    constructor Create(manager: JLoadingManager);
    manager: JLoadingManager;
    procedure load(url: String; onLoad: procedure(dataTexture: JDataTexture)); overload;
    procedure load(url: String; onLoad: procedure(dataTexture: JDataTexture); onProgress: procedure(event: Variant)); overload;
    procedure load(url: String; onLoad: procedure(dataTexture: JDataTexture); onProgress: procedure(event: Variant); onError: procedure(event: Variant)); overload;
    procedure setCrossOrigin(crossOrigin: String)
  end;

  JBufferGeometryLoader = class external 'BufferGeometryLoader'
    constructor Create(manager: JLoadingManager);
    manager: JLoadingManager;
    procedure load(url: String; onLoad: procedure(bufferGeometry: JBufferGeometry)); overload;
    procedure load(url: String; onLoad: procedure(bufferGeometry: JBufferGeometry); onProgress: procedure(event: Variant)); overload;
    procedure load(url: String; onLoad: procedure(bufferGeometry: JBufferGeometry); onProgress: procedure(event: Variant); onError: procedure(event: Variant)); overload;
    procedure setCrossOrigin(crossOrigin: String)
    function parse(json: Variant): JBufferGeometry
  end;

  JCompressedTextureLoader = class external 'CompressedTextureLoader'
    constructor Create(manager: JLoadingManager);
    manager: JLoadingManager;
    procedure load(url: String; onLoad: procedure(texture: JCompressedTexture)); overload;
    procedure load(url: String; onLoad: procedure(texture: JCompressedTexture); onProgress: procedure(event: Variant)); overload;
    procedure load(url: String; onLoad: procedure(texture: JCompressedTexture); onProgress: procedure(event: Variant); onError: procedure(event: Variant)); overload;
    procedure setCrossOrigin(crossOrigin: String)
  end;

  JCubeTextureLoader = class external 'CubeTextureLoader'
    constructor Create(manager: JLoadingManager);
    manager: JLoadingManager;
    procedure load(urls: JArray{<String>}); overload;
    procedure load(urls: JArray{<String>}; onLoad: procedure(texture: JCubeTexture)); overload;
    procedure load(urls: JArray{<String>}; onLoad: procedure(texture: JCubeTexture); onProgress: procedure(event: Variant)); overload;
    procedure load(urls: JArray{<String>}; onLoad: procedure(texture: JCubeTexture); onProgress: procedure(event: Variant); onError: procedure(event: Variant)); overload;
    procedure setCrossOrigin(crossOrigin: String)
  end;

  JImageLoader = class external 'ImageLoader'
    constructor Create(manager: JLoadingManager);
    cache: JCache;
    manager: JLoadingManager;
    crossOrigin: String;
    function load(url: String): JHTMLImageElement; overload;
    function load(url: String; onLoad: procedure(image: JHTMLImageElement)): JHTMLImageElement; overload;
    function load(url: String; onLoad: procedure(image: JHTMLImageElement); onProgress: procedure(event: Variant)): JHTMLImageElement; overload;
    function load(url: String; onLoad: procedure(image: JHTMLImageElement); onProgress: procedure(event: Variant); onError: procedure(event: Variant)): JHTMLImageElement; overload;
    procedure setCrossOrigin(crossOrigin: String)
  end;

  JJSONLoader = class external 'JSONLoader'(JLoader)
    constructor Create(manager: JLoadingManager);
    manager: JLoadingManager;
    withCredentials: Boolean;
    procedure load(url: String); overload;
    procedure load(url: String; onLoad: procedure(geometry: JGeometry; materials: array of JMaterial)); overload;
    procedure load(url: String; onLoad: procedure(geometry: JGeometry; materials: array of JMaterial); onProgress: procedure(event: Variant)); overload;
    procedure load(url: String; onLoad: procedure(geometry: JGeometry; materials: array of JMaterial); onProgress: procedure(event: Variant); onError: procedure(event: Variant)); overload;
    procedure setCrossOrigin(crossOrigin: String)
    procedure setTexturePath(value: String)
    function parse(json: Variant):       geometry: JGeometry;
      materials: array of JMaterial; // nullable
    end; overload;
    function parse(json: Variant; texturePath: String):       geometry: JGeometry;
      materials: array of JMaterial; // nullable
    end; overload;
  end;

  JLoadingManager = class external 'LoadingManager'
    constructor Create(onLoad: ; onProgress: (url: String; loaded: Float; total: Float); onError: );
    onStart: ;
    onLoad: ;
    onProgress: (item: Variant; loaded: Float; total: Float);
    onError: ;
    procedure itemStart(url: String)
    procedure itemEnd(url: String)
    procedure itemError(url: String)
  end;

  JMaterialLoader = class external 'MaterialLoader'
    constructor Create(manager: JLoadingManager);
    manager: JLoadingManager;
    textures: record
      // property Item[key: String]: JTexture;
    end;;
    procedure load(url: String; onLoad: procedure(material: JMaterial))
    procedure setCrossOrigin(crossOrigin: String)
    procedure setTextures(textures: record
      // property Item[key: String]: JTexture;
    end;)
    function getTexture(name: String): JTexture
    function parse(json: Variant): JMaterial
  end;

  JObjectLoader = class external 'ObjectLoader'
    constructor Create(manager: JLoadingManager);
    manager: JLoadingManager;
    texturePass: String;
    procedure load(url: String); overload;
    procedure load(url: String; onLoad: procedure(&object: JObject3D)); overload;
    procedure setTexturePath(value: String)
    procedure setCrossOrigin(crossOrigin: String)
    function parse(json: Variant): JT; overload;
    function parse(json: Variant; onLoad: procedure(&object: JObject3D)): JT; overload;
    function parseGeometries(json: Variant): array of Variant
    function parseMaterials(json: Variant; textures: array of JTexture): array of JMaterial
    function parseImages(json: Variant; onLoad: procedure): array of Variant
    function parseTextures(json: Variant; images: Variant): array of JTexture
    function parseObject(data: Variant; geometries: array of Variant; materials: array of JMaterial): JT
  end;

  JTextureLoader = class external 'TextureLoader'
    constructor Create(manager: JLoadingManager);
    manager: JLoadingManager;
    crossOrigin: String;
    function load(url: String): JTexture; overload;
    function load(url: String; onLoad: procedure(texture: JTexture)): JTexture; overload;
    procedure setCrossOrigin(crossOrigin: String)
  end;

  JXHRLoader = class external 'XHRLoader'
    constructor Create(manager: JLoadingManager);
    cache: JCache;
    manager: JLoadingManager;
    responseType: String;
    crossOrigin: String;
    function load(url: String): Variant; overload;
    function load(url: String; onLoad: procedure(responseText: String)): Variant; overload;
    function load(url: String; onLoad: procedure(responseText: String); onProgress: procedure(event: Variant)): Variant; overload;
    function load(url: String; onLoad: procedure(responseText: String); onProgress: procedure(event: Variant); onError: procedure(event: Variant)): Variant; overload;
    procedure setResponseType(responseType: String)
    procedure setCrossOrigin(crossOrigin: String)
    procedure setWithCredentials(withCredentials: String)
  end;

  JMaterial = class external 'Material'
    constructor Create;
    id: Float;
    uuid: String;
    name: String;
    &type: String;
    side: JSide;
    opacity: Float;
    transparent: Boolean;
    blending: JBlending;
    blendSrc: JBlendingDstFactor;
    blendDst: JBlendingSrcFactor;
    blendEquation: JBlendingEquation;
    blendSrcAlpha: Float;
    blendDstAlpha: Float;
    blendEquationAlpha: Float;
    depthFunc: JDepthModes;
    depthTest: Boolean;
    depthWrite: Boolean;
    colorWrite: Boolean;
    precision: Variant;
    polygonOffset: Boolean;
    polygonOffsetFactor: Float;
    polygonOffsetUnits: Float;
    alphaTest: Float;
    overdraw: Float;
    visible: Boolean;
    needsUpdate: Boolean;
    procedure setValues(values: JObject)
    function toJSON: Variant; overload;
    function toJSON(meta: Variant): Variant; overload;
    function clone: JMaterial
    function clone: JMaterial; overload;
    function clone(source: JMaterial): JMaterial; overload;
    procedure update
    procedure dispose
    procedure addEventListener(&type: String; listener: procedure(event: Variant))
    procedure hasEventListener(&type: String; listener: procedure(event: Variant))
    procedure removeEventListener(&type: String; listener: procedure(event: Variant))
    procedure dispatchEvent(event: record
      &type: String;
      target: Variant;
    end;)
  end;

  JLineBasicMaterial = class external 'LineBasicMaterial'(JMaterial)
    constructor Create(parameters: JLineBasicMaterialParameters);
    color: JColor;
    linewidth: Float;
    linecap: String;
    linejoin: String;
    vertexColors: JColors;
    fog: Boolean;
    function clone: JLineBasicMaterial
    function copy(source: JLineBasicMaterial): JLineBasicMaterial
  end;

  JLineDashedMaterial = class external 'LineDashedMaterial'(JMaterial)
    constructor Create(parameters: JLineDashedMaterialParameters);
    color: JColor;
    linewidth: Float;
    scale: Float;
    dashSize: Float;
    gapSize: Float;
    vertexColors: JColors;
    fog: Boolean;
    function clone: JLineDashedMaterial
    function copy(source: JLineDashedMaterial): JLineDashedMaterial
  end;

  JMeshBasicMaterial = class external 'MeshBasicMaterial'(JMaterial)
    constructor Create(parameters: JMeshBasicMaterialParameters);
    color: JColor;
    map: JTexture;
    aoMap: JTexture;
    aoMapIntensity: Float;
    specularMap: JTexture;
    alphaMap: JTexture;
    envMap: JTexture;
    combine: JCombine;
    reflectivity: Float;
    refractionRatio: Float;
    fog: Boolean;
    shading: JShading;
    wireframe: Boolean;
    wireframeLinewidth: Float;
    wireframeLinecap: String;
    wireframeLinejoin: String;
    vertexColors: JColors;
    skinning: Boolean;
    morphTargets: Boolean;
    function clone: JMeshBasicMaterial
    function copy(source: JMeshBasicMaterial): JMeshBasicMaterial
  end;

  JMeshDepthMaterial = class external 'MeshDepthMaterial'(JMaterial)
    constructor Create(parameters: JMeshDepthMaterialParameters);
    wireframe: Boolean;
    wireframeLinewidth: Float;
    function clone: JMeshDepthMaterial
    function copy(source: JMeshDepthMaterial): JMeshDepthMaterial
  end;

  JMeshLambertMaterial = class external 'MeshLambertMaterial'(JMaterial)
    constructor Create(parameters: JMeshLambertMaterialParameters);
    color: JColor;
    emissive: JColor;
    map: JTexture;
    specularMap: JTexture;
    alphaMap: JTexture;
    envMap: JTexture;
    combine: JCombine;
    reflectivity: Float;
    refractionRatio: Float;
    fog: Boolean;
    wireframe: Boolean;
    wireframeLinewidth: Float;
    wireframeLinecap: String;
    wireframeLinejoin: String;
    vertexColors: JColors;
    skinning: Boolean;
    morphTargets: Boolean;
    morphNormals: Boolean;
    function clone: JMeshLambertMaterial
    function copy(source: JMeshLambertMaterial): JMeshLambertMaterial
  end;

  JMeshNormalMaterial = class external 'MeshNormalMaterial'(JMaterial)
    constructor Create(parameters: JMeshNormalMaterialParameters);
    wireframe: Boolean;
    wireframeLinewidth: Float;
    morphTargets: Boolean;
    function clone: JMeshNormalMaterial
    function copy(source: JMeshNormalMaterial): JMeshNormalMaterial
  end;

  JMeshPhongMaterial = class external 'MeshPhongMaterial'(JMaterial)
    constructor Create(parameters: JMeshPhongMaterialParameters);
    color: JColor;
    emissive: JColor;
    specular: JColor;
    shininess: Float;
    metal: Boolean;
    map: JTexture;
    lightMap: JTexture;
    lightMapIntensity: Float;
    aoMap: JTexture;
    aoMapIntensity: Float;
    emissiveMap: JTexture;
    bumpMap: JTexture;
    bumpScale: Float;
    normalMap: JTexture;
    normalScale: JVector2;
    displacementMap: JTexture;
    displacementScale: Float;
    displacementBias: Float;
    specularMap: JTexture;
    alphaMap: JTexture;
    envMap: JTexture;
    combine: JCombine;
    reflectivity: Float;
    refractionRatio: Float;
    fog: Boolean;
    shading: JShading;
    wireframe: Boolean;
    wireframeLinewidth: Float;
    wireframeLinecap: String;
    wireframeLinejoin: String;
    vertexColors: JColors;
    skinning: Boolean;
    morphTargets: Boolean;
    morphNormals: Boolean;
    function clone: JMeshPhongMaterial
    function copy(source: JMeshPhongMaterial): JMeshPhongMaterial
  end;

  JMultiMaterial = class external 'MultiMaterial'(JMaterial)
    constructor Create(materials: array of JMaterial);
    materials: array of JMaterial;
    function toJSON: Variant
    function clone: JMultiMaterial
  end;

  JMeshFaceMaterial = class external 'MeshFaceMaterial'(JMultiMaterial)
  end;

  JPointsMaterial = class external 'PointsMaterial'(JMaterial)
    constructor Create(parameters: JPointsMaterialParameters);
    color: JColor;
    map: JTexture;
    size: Float;
    sizeAttenuation: Boolean;
    vertexColors: Boolean;
    fog: Boolean;
    function clone: JPointsMaterial
    function copy(source: JPointsMaterial): JPointsMaterial
  end;

  JRawShaderMaterial = class external 'RawShaderMaterial'(JShaderMaterial)
    constructor Create(parameters: JShaderMaterialParameters);
  end;

  JShaderMaterial = class external 'ShaderMaterial'(JMaterial)
    constructor Create(parameters: JShaderMaterialParameters);
    defines: Variant;
    uniforms: Variant;
    vertexShader: String;
    fragmentShader: String;
    shading: JShading;
    linewidth: Float;
    wireframe: Boolean;
    wireframeLinewidth: Float;
    fog: Boolean;
    lights: Boolean;
    vertexColors: JColors;
    skinning: Boolean;
    morphTargets: Boolean;
    morphNormals: Boolean;
    derivatives: Boolean;
    defaultAttributeValues: Variant;
    index0AttributeName: String;
    function clone: JShaderMaterial
    function copy(source: JShaderMaterial): JShaderMaterial
    function toJSON(meta: Variant): Variant
  end;

  JSpriteMaterial = class external 'SpriteMaterial'(JMaterial)
    constructor Create(parameters: JSpriteMaterialParameters);
    color: JColor;
    map: JTexture;
    rotation: Float;
    fog: Boolean;
    function clone: JSpriteMaterial
    function copy(source: JSpriteMaterial): JSpriteMaterial
  end;

  JBox2 = class external 'Box2'
    constructor Create(min: JVector2; max: JVector2);
    max: JVector2;
    min: JVector2;
    function set(min: JVector2; max: JVector2): JBox2
    function setFromPoints(points: array of JVector2): JBox2
    function setFromCenterAndSize(center: JVector2; size: JVector2): JBox2
    function clone: JBox2
    function copy(box: JBox2): JBox2
    function makeEmpty: JBox2
    function empty: Boolean
    function center: JVector2; overload;
    function center(optionalTarget: JVector2): JVector2; overload;
    function size: JVector2; overload;
    function size(optionalTarget: JVector2): JVector2; overload;
    function expandByPoint(point: JVector2): JBox2
    function expandByVector(vector: JVector2): JBox2
    function expandByScalar(scalar: Float): JBox2
    function containsPoint(point: JVector2): Boolean
    function containsBox(box: JBox2): Boolean
    function getParameter(point: JVector2): JVector2
    function isIntersectionBox(box: JBox2): Boolean
    function clampPoint(point: JVector2): JVector2; overload;
    function clampPoint(point: JVector2; optionalTarget: JVector2): JVector2; overload;
    function distanceToPoint(point: JVector2): Float
    function intersect(box: JBox2): JBox2
    function union(box: JBox2): JBox2
    function translate(offset: JVector2): JBox2
    function equals(box: JBox2): Boolean
  end;

  JBox3 = class external 'Box3'
    constructor Create(min: JVector3; max: JVector3);
    max: JVector3;
    min: JVector3;
    function set(min: JVector3; max: JVector3): JBox3
    function setFromPoints(points: array of JVector3): JBox3
    function setFromCenterAndSize(center: JVector3; size: JVector3): JBox3
    function setFromObject(&object: JObject3D): JBox3
    function clone: JBox3
    function copy(box: JBox3): JBox3
    function makeEmpty: JBox3
    function empty: Boolean
    function center: JVector3; overload;
    function center(optionalTarget: JVector3): JVector3; overload;
    function size: JVector3; overload;
    function size(optionalTarget: JVector3): JVector3; overload;
    function expandByPoint(point: JVector3): JBox3
    function expandByVector(vector: JVector3): JBox3
    function expandByScalar(scalar: Float): JBox3
    function containsPoint(point: JVector3): Boolean
    function containsBox(box: JBox3): Boolean
    function getParameter(point: JVector3): JVector3
    function isIntersectionBox(box: JBox3): Boolean
    function clampPoint(point: JVector3): JVector3; overload;
    function clampPoint(point: JVector3; optionalTarget: JVector3): JVector3; overload;
    function distanceToPoint(point: JVector3): Float
    function getBoundingSphere: JSphere; overload;
    function getBoundingSphere(optionalTarget: JSphere): JSphere; overload;
    function intersect(box: JBox3): JBox3
    function union(box: JBox3): JBox3
    function applyMatrix4(matrix: JMatrix4): JBox3
    function translate(offset: JVector3): JBox3
    function equals(box: JBox3): Boolean
  end;

  JFrustum = class external 'Frustum'
    constructor Create(p0: JPlane; p1: JPlane; p2: JPlane; p3: JPlane; p4: JPlane; p5: JPlane);
    planes: array of JPlane;
    function set: JFrustum; overload;
    function set(p0: Float): JFrustum; overload;
    function set(p0: Float; p1: Float): JFrustum; overload;
    function set(p0: Float; p1: Float; p2: Float): JFrustum; overload;
    function set(p0: Float; p1: Float; p2: Float; p3: Float): JFrustum; overload;
    function set(p0: Float; p1: Float; p2: Float; p3: Float; p4: Float): JFrustum; overload;
    function set(p0: Float; p1: Float; p2: Float; p3: Float; p4: Float; p5: Float): JFrustum; overload;
    function clone: JFrustum
    function copy(frustum: JFrustum): JFrustum
    function setFromMatrix(m: JMatrix4): JFrustum
    function intersectsObject(&object: JObject3D): Boolean
    function intersectsSphere(sphere: JSphere): Boolean
    function intersectsBox(box: JBox3): Boolean
    function containsPoint(point: JVector3): Boolean
  end;

  JLine3 = class external 'Line3'
    constructor Create(start: JVector3; &end: JVector3);
    start: JVector3;
    &end: JVector3;
    function set: JLine3; overload;
    function set(start: JVector3): JLine3; overload;
    function set(start: JVector3; &end: JVector3): JLine3; overload;
    function clone: JLine3
    function copy(line: JLine3): JLine3
    function center: JVector3; overload;
    function center(optionalTarget: JVector3): JVector3; overload;
    function delta: JVector3; overload;
    function delta(optionalTarget: JVector3): JVector3; overload;
    function distanceSq: Float
    function distance: Float
    function at(t: Float): JVector3; overload;
    function at(t: Float; optionalTarget: JVector3): JVector3; overload;
    function closestPointToPointParameter(point: JVector3): Float; overload;
    function closestPointToPointParameter(point: JVector3; clampToLine: Boolean): Float; overload;
    function closestPointToPoint(point: JVector3): JVector3; overload;
    function closestPointToPoint(point: JVector3; clampToLine: Boolean): JVector3; overload;
    function closestPointToPoint(point: JVector3; clampToLine: Boolean; optionalTarget: JVector3): JVector3; overload;
    function applyMatrix4(matrix: JMatrix4): JLine3
    function equals(line: JLine3): Boolean
  end;

  JPlane = class external 'Plane'
    constructor Create(normal: JVector3; constant: Float);
    normal: JVector3;
    constant: Float;
    function set(normal: JVector3; constant: Float): JPlane
    function setComponents(x: Float; y: Float; z: Float; w: Float): JPlane
    function setFromNormalAndCoplanarPoint(normal: JVector3; point: JVector3): JPlane
    function setFromCoplanarPoints(a: JVector3; b: JVector3; c: JVector3): JPlane
    function clone: JPlane
    function copy(plane: JPlane): JPlane
    function normalize: JPlane
    function negate: JPlane
    function distanceToPoint(point: JVector3): Float
    function distanceToSphere(sphere: JSphere): Float
    function projectPoint(point: JVector3): JVector3; overload;
    function projectPoint(point: JVector3; optionalTarget: JVector3): JVector3; overload;
    function orthoPoint(point: JVector3): JVector3; overload;
    function orthoPoint(point: JVector3; optionalTarget: JVector3): JVector3; overload;
    function isIntersectionLine(line: JLine3): Boolean
    function intersectLine(line: JLine3): JVector3; overload;
    function intersectLine(line: JLine3; optionalTarget: JVector3): JVector3; overload;
    function coplanarPoint: JVector3; overload;
    function coplanarPoint(optionalTarget: Boolean): JVector3; overload;
    function applyMatrix4(matrix: JMatrix4): JPlane; overload;
    function applyMatrix4(matrix: JMatrix4; optionalNormalMatrix: JMatrix3): JPlane; overload;
    function translate(offset: JVector3): JPlane
    function equals(plane: JPlane): Boolean
  end;

  JQuaternion = class external 'Quaternion'
    constructor Create(x: Float; y: Float; z: Float; w: Float);
    x: Float;
    y: Float;
    z: Float;
    w: Float;
    function set(x: Float; y: Float; z: Float; w: Float): JQuaternion
    function clone: JQuaternion
    function copy(q: JQuaternion): JQuaternion
    function setFromEuler(euler: JEuler): JQuaternion; overload;
    function setFromEuler(euler: JEuler; update: Boolean): JQuaternion; overload;
    function setFromAxisAngle(axis: JVector3; angle: Float): JQuaternion
    function setFromRotationMatrix(m: JMatrix4): JQuaternion
    function setFromUnitVectors(vFrom: JVector3; vTo: JVector3): JQuaternion
    function inverse: JQuaternion
    function conjugate: JQuaternion
    function dot(v: JVector3): Float
    function lengthSq: Float
    function length: Float
    function normalize: JQuaternion
    function multiply(q: JQuaternion): JQuaternion
    function multiplyQuaternions(a: JQuaternion; b: JQuaternion): JQuaternion
    function multiplyVector3(vector: JVector3): JVector3
    function slerp(qb: JQuaternion; t: Float): JQuaternion
    function equals(v: JQuaternion): Boolean
    function fromArray(n: array of Float): JQuaternion
    function toArray: array of Float
    function fromArray(xyzw: array of Float): JQuaternion; overload;
    function fromArray(xyzw: array of Float; offset: Float): JQuaternion; overload;
    function toArray: array of Float; overload;
    function toArray(xyzw: array of Float): array of Float; overload;
    function toArray(xyzw: array of Float; offset: Float): array of Float; overload;
    onChange: ;
    function slerp(qa: JQuaternion; qb: JQuaternion; qm: JQuaternion; t: Float): JQuaternion
  end;

  JSphere = class external 'Sphere'
    constructor Create(center: JVector3; radius: Float);
    center: JVector3;
    radius: Float;
    function set(center: JVector3; radius: Float): JSphere
    function setFromPoints(points: array of JVector3): JSphere; overload;
    function setFromPoints(points: array of JVector3; optionalCenter: JVector3): JSphere; overload;
    function clone: JSphere
    function copy(sphere: JSphere): JSphere
    function empty: Boolean
    function containsPoint(point: JVector3): Boolean
    function distanceToPoint(point: JVector3): Float
    function intersectsSphere(sphere: JSphere): Boolean
    function clampPoint(point: JVector3): JVector3; overload;
    function clampPoint(point: JVector3; optionalTarget: JVector3): JVector3; overload;
    function getBoundingBox: JBox3; overload;
    function getBoundingBox(optionalTarget: JBox3): JBox3; overload;
    function applyMatrix4(matrix: JMatrix4): JSphere
    function translate(offset: JVector3): JSphere
    function equals(sphere: JSphere): Boolean
  end;

  JSpline = class external 'Spline'
    constructor Create(points: array of JSplineControlPoint);
    points: array of JSplineControlPoint;
    procedure initFromArray(a: array of array of Float)
    function getPoint(k: Float): JSplineControlPoint
    function getControlPointsArray: array of array of Float
    function getLength:       chunks: array of Float;
      total: Float;
    end; overload;
    function getLength(nSubDivisions: Float):       chunks: array of Float;
      total: Float;
    end; overload;
    procedure reparametrizeByArcLength(samplingCoef: Float)
  end;

  JTriangle = class external 'Triangle'
    constructor Create(a: JVector3; b: JVector3; c: JVector3);
    a: JVector3;
    b: JVector3;
    c: JVector3;
    function set(a: JVector3; b: JVector3; c: JVector3): JTriangle
    function setFromPointsAndIndices(points: array of JVector3; i0: Float; i1: Float; i2: Float): JTriangle
    function clone: JTriangle
    function copy(triangle: JTriangle): JTriangle
    function area: Float
    function midpoint: JVector3; overload;
    function midpoint(optionalTarget: JVector3): JVector3; overload;
    function normal: JVector3; overload;
    function normal(optionalTarget: JVector3): JVector3; overload;
    function plane: JPlane; overload;
    function plane(optionalTarget: JVector3): JPlane; overload;
    function barycoordFromPoint(point: JVector3): JVector3; overload;
    function barycoordFromPoint(point: JVector3; optionalTarget: JVector3): JVector3; overload;
    function containsPoint(point: JVector3): Boolean
    function equals(triangle: JTriangle): Boolean
    function normal(a: JVector3; b: JVector3; c: JVector3): JVector3; overload;
    function normal(a: JVector3; b: JVector3; c: JVector3; optionalTarget: JVector3): JVector3; overload;
    function barycoordFromPoint(point: JVector3; a: JVector3; b: JVector3; c: JVector3; optionalTarget: JVector3): JVector3
    function containsPoint(point: JVector3; a: JVector3; b: JVector3; c: JVector3): Boolean
  end;

  JBone = class external 'Bone'(JObject3D)
    constructor Create(skin: JSkinnedMesh);
    skin: JSkinnedMesh;
    function clone: JBone
    function copy(source: JBone): JBone
  end;

  JGroup = class external 'Group'(JObject3D)
    constructor Create;
  end;

  JLOD = class external 'LOD'(JObject3D)
    constructor Create;
    levels: array of Variant;
    procedure addLevel(&object: JObject3D); overload;
    procedure addLevel(&object: JObject3D; distance: Float); overload;
    function getObjectForDistance(distance: Float): JObject3D
    procedure raycast(raycaster: JRaycaster; intersects: Variant)
    procedure update(camera: JCamera)
    function clone: JLOD
    function copy(source: JLOD): JLOD
    function toJSON(meta: Variant): Variant
  end;

  JLensFlare = class external 'LensFlare'(JObject3D)
    constructor Create(texture: JTexture; size: Float; distance: Float; blending: JBlending; color: JColor);
    lensFlares: array of JLensFlareProperty;
    positionScreen: JVector3;
    customUpdateCallback: (&object: JLensFlare);
    procedure add(texture: JTexture); overload;
    procedure add(texture: JTexture; size: Float); overload;
    procedure add(texture: JTexture; size: Float; distance: Float); overload;
    procedure add(texture: JTexture; size: Float; distance: Float; blending: JBlending); overload;
    procedure add(texture: JTexture; size: Float; distance: Float; blending: JBlending; color: JColor); overload;
    procedure add(obj: JObject3D)
    procedure updateLensFlares
    function clone: JLensFlare
    function copy(source: JLensFlare): JLensFlare
  end;

  JLine = class external 'Line'(JObject3D)
    constructor Create(geometry: Variant {JGeometry or JBufferGeometry}; material: Variant {JLineDashedMaterial or JLineBasicMaterial or JShaderMaterial}; mode: Float);
    geometry: Variant {JGeometry or JBufferGeometry};
    material: JMaterial;
    procedure raycast(raycaster: JRaycaster; intersects: Variant)
    function clone: JLine
    function copy(source: JLine): JLine
  end;

  JLineSegments = class external 'LineSegments'(JLine)
    constructor Create(geometry: Variant {JGeometry or JBufferGeometry}; material: Variant {JLineDashedMaterial or JLineBasicMaterial or JShaderMaterial}; mode: Float);
    function clone: JLineSegments
    function copy(source: JLineSegments): JLineSegments
  end;

  JMesh = class external 'Mesh'(JObject3D)
    constructor Create(geometry: JGeometry; material: JMaterial);
    constructor Create(geometry: JBufferGeometry; material: JMaterial);
    geometry: Variant {JGeometry or JBufferGeometry};
    material: JMaterial;
    procedure updateMorphTargets
    function getMorphTargetIndexByName(name: String): Float
    procedure raycast(raycaster: JRaycaster; intersects: Variant)
    function clone: JMesh
    function copy(source: JMesh): JMesh
  end;

  JPoints = class external 'Points'(JObject3D)
    constructor Create(geometry: Variant {JGeometry or JBufferGeometry}; material: Variant {JPointsMaterial or JShaderMaterial});
    geometry: JGeometry;
    material: JMaterial;
    procedure raycast(raycaster: JRaycaster; intersects: Variant)
    function clone: JPoints
    function copy(source: JPoints): JPoints
  end;

  JSkeleton = class external 'Skeleton'
    constructor Create(bones: array of JBone; boneInverses: array of JMatrix4; useVertexTexture: Boolean);
    useVertexTexture: Boolean;
    identityMatrix: JMatrix4;
    bones: array of JBone;
    boneTextureWidth: Float;
    boneTextureHeight: Float;
    boneMatrices: JFloat32Array;
    boneTexture: JDataTexture;
    boneInverses: array of JMatrix4;
    procedure calculateInverses(bone: JBone)
    procedure pose
    procedure update
    function clone: JSkeleton
  end;

  JSkinnedMesh = class external 'SkinnedMesh'(JMesh)
    constructor Create(geometry: Variant {JGeometry or JBufferGeometry}; material: JMeshBasicMaterial; useVertexTexture: Boolean);
    constructor Create(geometry: Variant {JGeometry or JBufferGeometry}; material: JMeshDepthMaterial; useVertexTexture: Boolean);
    constructor Create(geometry: Variant {JGeometry or JBufferGeometry}; material: JMeshFaceMaterial; useVertexTexture: Boolean);
    constructor Create(geometry: Variant {JGeometry or JBufferGeometry}; material: JMeshLambertMaterial; useVertexTexture: Boolean);
    constructor Create(geometry: Variant {JGeometry or JBufferGeometry}; material: JMeshNormalMaterial; useVertexTexture: Boolean);
    constructor Create(geometry: Variant {JGeometry or JBufferGeometry}; material: JMeshPhongMaterial; useVertexTexture: Boolean);
    constructor Create(geometry: Variant {JGeometry or JBufferGeometry}; material: JShaderMaterial; useVertexTexture: Boolean);
    bindMode: String;
    bindMatrix: JMatrix4;
    bindMatrixInverse: JMatrix4;
    procedure bind(skeleton: JSkeleton); overload;
    procedure bind(skeleton: JSkeleton; bindMatrix: JMatrix4); overload;
    procedure pose
    procedure normalizeSkinWeights
    procedure updateMatrixWorld; overload;
    procedure updateMatrixWorld(force: Boolean); overload;
    function clone: JSkinnedMesh
    function copy: JSkinnedMesh; overload;
    function copy(source: JSkinnedMesh): JSkinnedMesh; overload;
    skeleton: JSkeleton;
  end;

  JSprite = class external 'Sprite'(JObject3D)
    constructor Create(material: JMaterial);
    geometry: JBufferGeometry;
    material: JSpriteMaterial;
    procedure raycast(raycaster: JRaycaster; intersects: Variant)
    function clone: JSprite
    function copy: JSprite; overload;
    function copy(source: JSprite): JSprite; overload;
  end;

  JWebGLRenderer = class external 'WebGLRenderer'
    constructor Create(parameters: JWebGLRendererParameters);
    domElement: JHTMLCanvasElement;
    context: JWebGLRenderingContext;
    autoClear: Boolean;
    autoClearColor: Boolean;
    autoClearDepth: Boolean;
    autoClearStencil: Boolean;
    sortObjects: Boolean;
    extensions: JWebGLExtensions;
    gammaFactor: Float;
    gammaInput: Boolean;
    gammaOutput: Boolean;
    shadowMapEnabled: Boolean;
    shadowMapType: JShadowMapType;
    shadowMapCullFace: JCullFace;
    shadowMapDebug: Boolean;
    maxMorphTargets: Float;
    maxMorphNormals: Float;
    autoScaleCubemaps: Boolean;
    info: record
      memory: record
        programs: Float;
        geometries: Float;
        textures: Float;
      end;;
      render: record
        calls: Float;
        vertices: Float;
        faces: Float;
        points: Float;
      end;;
    end;;
    shadowMap: JWebGLShadowMapInstance;
    function getContext: JWebGLRenderingContext
    procedure forceContextLoss
    capabilities: JWebGLCapabilities;
    function supportsVertexTextures: Boolean
    function supportsFloatTextures: Boolean
    function supportsStandardDerivatives: Boolean
    function supportsCompressedTextureS3TC: Boolean
    function supportsCompressedTexturePVRTC: Boolean
    function supportsBlendMinMax: Boolean
    function getPrecision: String
    function getMaxAnisotropy: Float
    function getPixelRatio: Float
    procedure setPixelRatio(value: Float)
    function getSize:       width: Float;
      height: Float;
    end;
    procedure setSize(width: Float; height: Float); overload;
    procedure setSize(width: Float; height: Float; updateStyle: Boolean); overload;
    procedure setViewport; overload;
    procedure setViewport(x: Float); overload;
    procedure setViewport(x: Float; y: Float); overload;
    procedure setViewport(x: Float; y: Float; width: Float); overload;
    procedure setViewport(x: Float; y: Float; width: Float; height: Float); overload;
    procedure setScissor(x: Float; y: Float; width: Float; height: Float)
    procedure enableScissorTest(enable: Boolean)
    procedure setClearColor(color: JColor); overload;
    procedure setClearColor(color: JColor; alpha: Float); overload;
    procedure setClearColor(color: String); overload;
    procedure setClearColor(color: String; alpha: Float); overload;
    procedure setClearColor(color: Float); overload;
    procedure setClearColor(color: Float; alpha: Float); overload;
    procedure setClearAlpha(alpha: Float)
    procedure setClearColorHex(hex: Float; alpha: Float)
    function getClearColor: JColor
    function getClearAlpha: Float
    procedure clear; overload;
    procedure clear(color: Boolean); overload;
    procedure clear(color: Boolean; depth: Boolean); overload;
    procedure clear(color: Boolean; depth: Boolean; stencil: Boolean); overload;
    procedure clearColor
    procedure clearDepth
    procedure clearStencil
    procedure clearTarget(renderTarget: JWebGLRenderTarget; color: Boolean; depth: Boolean; stencil: Boolean)
    procedure resetGLState
    procedure dispose
    procedure updateShadowMap(scene: JScene; camera: JCamera)
    procedure renderBufferImmediate(&object: JObject3D; program: JObject; material: JMaterial)
    procedure renderBufferDirect(camera: JCamera; lights: array of JLight; fog: JFog; material: JMaterial; geometryGroup: Variant; &object: JObject3D)
    procedure renderBuffer(camera: JCamera; lights: array of JLight; fog: JFog; material: JMaterial; geometryGroup: Variant; &object: JObject3D)
    procedure render(scene: JScene; camera: JCamera); overload;
    procedure render(scene: JScene; camera: JCamera; renderTarget: JRenderTarget); overload;
    procedure render(scene: JScene; camera: JCamera; renderTarget: JRenderTarget; forceClear: Boolean); overload;
    procedure renderImmediateObject(camera: JCamera; lights: array of JLight; fog: JFog; material: JMaterial; &object: JObject3D)
    procedure setFaceCulling; overload;
    procedure setFaceCulling(cullFace: JCullFace); overload;
    procedure setFaceCulling(cullFace: JCullFace; frontFace: JFrontFaceDirection); overload;
    procedure setMaterialFaces(material: JMaterial)
    procedure setDepthTest(depthTest: Boolean)
    procedure setDepthWrite(depthWrite: Boolean)
    procedure setBlending(blending: JBlending; blendEquation: JBlendingEquation; blendSrc: JBlendingSrcFactor; blendDst: JBlendingDstFactor)
    procedure uploadTexture(texture: JTexture)
    procedure setTexture(texture: JTexture; slot: Float)
    procedure setRenderTarget(renderTarget: JRenderTarget)
    procedure readRenderTargetPixels(renderTarget: JRenderTarget; x: Float; y: Float; width: Float; height: Float; buffer: Variant)
  end;

  JWebGLRenderTarget = class external 'WebGLRenderTarget'
    constructor Create(width: Float; height: Float; options: JWebGLRenderTargetOptions);
    uuid: String;
    width: Float;
    height: Float;
    wrapS: JWrapping;
    wrapT: JWrapping;
    magFilter: JTextureFilter;
    minFilter: JTextureFilter;
    anisotropy: Float;
    offset: JVector2;
    repeat: JVector2;
    format: Float;
    &type: Float;
    depthBuffer: Boolean;
    stencilBuffer: Boolean;
    generateMipmaps: Boolean;
    shareDepthFrom: Variant;
    procedure setSize(width: Float; height: Float)
    function clone: JWebGLRenderTarget
    function copy(source: JWebGLRenderTarget): JWebGLRenderTarget
    procedure dispose
    procedure addEventListener(&type: String; listener: procedure(event: Variant))
    procedure hasEventListener(&type: String; listener: procedure(event: Variant))
    procedure removeEventListener(&type: String; listener: procedure(event: Variant))
    procedure dispatchEvent(event: record
      &type: String;
      target: Variant;
    end;)
  end;

  JWebGLRenderTargetCube = class external 'WebGLRenderTargetCube'(JWebGLRenderTarget)
    constructor Create(width: Float; height: Float; options: JWebGLRenderTargetOptions);
    activeCubeFace: Float;
  end;

  JWebGLBufferRenderer = class external 'WebGLBufferRenderer'
    constructor Create(_gl: Variant; extensions: Variant; _infoRender: Variant);
    procedure setMode(value: Variant)
    procedure render(start: Variant; count: Variant)
    procedure renderInstances(geometry: Variant)
  end;

  JWebGLCapabilities = class external 'WebGLCapabilities'
    constructor Create(gl: Variant; extensions: Variant; parameters: Variant);
    getMaxPrecision: Variant;
    precision: Variant;
    maxTextures: Variant;
    maxVertexTextures: Variant;
    maxTextureSize: Variant;
    maxCubemapSize: Variant;
    maxAttributes: Variant;
    maxVertexUniforms: Variant;
    maxVaryings: Variant;
    maxFragmentUniforms: Variant;
    vertexTextures: Variant;
    floatFragmentTextures: Variant;
    floatVertexTextures: Variant;
  end;

  JWebGLExtensions = class external 'WebGLExtensions'
    constructor Create(gl: Variant);
    function get(name: String): Variant
  end;

  JWebGLProgram = class external 'WebGLProgram'
    constructor Create(renderer: JWebGLRenderer; code: String; material: JShaderMaterial; parameters: JWebGLRendererParameters);
    function getUniforms: Variant
    function getAttributes: Variant
    uniforms: Variant;
    attributes: Variant;
    id: Float;
    code: String;
    usedTimes: Float;
    program: Variant;
    vertexShader: JWebGLShader;
    fragmentShader: JWebGLShader;
  end;

  JWebGLShader = class external 'WebGLShader'
    constructor Create(gl: Variant; &type: String; &string: String);
  end;

  JLensFlarePlugin = class external 'LensFlarePlugin'
    constructor Create;
    procedure init(renderer: JRenderer)
    procedure render(scene: JScene; camera: JCamera; viewportWidth: Float; viewportHeight: Float)
  end;

  JSpritePlugin = class external 'SpritePlugin'
    constructor Create;
    procedure init(renderer: JRenderer)
    procedure render(scene: JScene; camera: JCamera; viewportWidth: Float; viewportHeight: Float)
  end;

  JFog = class external 'Fog'
    constructor Create(hex: Float; near: Float; far: Float);
    name: String;
    color: JColor;
    near: Float;
    far: Float;
    function clone: JFog
  end;

  JFogExp2 = class external 'FogExp2'
    constructor Create(hex: Variant {Float or String}; density: Float);
    name: String;
    color: JColor;
    density: Float;
    function clone: JFogExp2
  end;

  JScene = class external 'Scene'(JObject3D)
    constructor Create;
    fog: JIFog;
    overrideMaterial: JMaterial;
    autoUpdate: Boolean;
    function copy(source: JScene): JScene
  end;

  JCanvasTexture = class external 'CanvasTexture'(JTexture)
    constructor Create(canvas: Variant {JHTMLImageElement or JHTMLCanvasElement or JHTMLVideoElement}; mapping: JMapping; wrapS: JWrapping; wrapT: JWrapping; magFilter: JTextureFilter; minFilter: JTextureFilter; format: JPixelFormat; &type: JTextureDataType; anisotropy: Float);
    needsUpdate: Boolean;
  end;

  JCompressedTexture = class external 'CompressedTexture'(JTexture)
    constructor Create(mipmaps: array of JImageData; width: Float; height: Float; format: JPixelFormat; &type: JTextureDataType; mapping: JMapping; wrapS: JWrapping; wrapT: JWrapping; magFilter: JTextureFilter; minFilter: JTextureFilter; anisotropy: Float);
    image: record
      width: Float;
      height: Float;
    end;;
    mipmaps: array of JImageData;
    flipY: Boolean;
    generateMipmaps: Boolean;
  end;

  JCubeTexture = class external 'CubeTexture'(JTexture)
    constructor Create(images: array of Variant; mapping: JMapping; wrapS: JWrapping; wrapT: JWrapping; magFilter: JTextureFilter; minFilter: JTextureFilter; format: JPixelFormat; &type: JTextureDataType; anisotropy: Float);
    images: array of Variant;
    function copy(source: JCubeTexture): JCubeTexture
  end;

  JDataTexture = class external 'DataTexture'(JTexture)
    constructor Create(data: JImageData; width: Float; height: Float; format: JPixelFormat; &type: JTextureDataType; mapping: JMapping; wrapS: JWrapping; wrapT: JWrapping; magFilter: JTextureFilter; minFilter: JTextureFilter; anisotropy: Float);
    image: record
      data: JImageData;
      width: Float;
      height: Float;
    end;;
    magFilter: JTextureFilter;
    minFilter: JTextureFilter;
    flipY: Boolean;
    generateMipmaps: Boolean;
  end;

  JTexture = class external 'Texture'
    constructor Create(image: Variant {JHTMLImageElement or JHTMLCanvasElement or JHTMLVideoElement}; mapping: JMapping; wrapS: JWrapping; wrapT: JWrapping; magFilter: JTextureFilter; minFilter: JTextureFilter; format: JPixelFormat; &type: JTextureDataType; anisotropy: Float);
    id: Float;
    uuid: String;
    name: String;
    sourceFile: String;
    image: Variant;
    mipmaps: array of JImageData;
    mapping: JMapping;
    wrapS: JWrapping;
    wrapT: JWrapping;
    magFilter: JTextureFilter;
    minFilter: JTextureFilter;
    anisotropy: Float;
    format: JPixelFormat;
    &type: JTextureDataType;
    offset: JVector2;
    repeat: JVector2;
    generateMipmaps: Boolean;
    premultiplyAlpha: Boolean;
    flipY: Boolean;
    unpackAlignment: Float;
    version: Float;
    needsUpdate: Boolean;
    onUpdate: ;
    DEFAULT_IMAGE: Variant;
    DEFAULT_MAPPING: Variant;
    function clone: JTexture
    function copy(source: JTexture): JTexture
    function toJSON(meta: Variant): Variant
    procedure dispose
    procedure transformUv(uv: JVector)
    procedure addEventListener(&type: String; listener: procedure(event: Variant))
    procedure hasEventListener(&type: String; listener: procedure(event: Variant))
    procedure removeEventListener(&type: String; listener: procedure(event: Variant))
    procedure dispatchEvent(event: record
      &type: String;
      target: Variant;
    end;)
  end;

  JVideoTexture = class external 'VideoTexture'(JTexture)
    constructor Create(video: JHTMLVideoElement; mapping: JMapping; wrapS: JWrapping; wrapT: JWrapping; magFilter: JTextureFilter; minFilter: JTextureFilter; format: JPixelFormat; &type: JTextureDataType; anisotropy: Float);
    generateMipmaps: Boolean;
  end;

  JAudio = class external 'Audio'(JObject3D)
    constructor Create(listener: JAudioListener);
    &type: String;
    context: JAudioContext;
    source: JAudioBufferSourceNode;
    gain: JGainNode;
    panner: JPannerNode;
    autoplay: Boolean;
    startTime: Float;
    playbackRate: Float;
    isPlaying: Boolean;
    function load(file: String): JAudio
    procedure play
    procedure pause
    procedure stop
    procedure connect
    procedure disconnect
    procedure setFilter(value: Variant)
    function getFilter: Variant
    procedure setPlaybackRate(value: Float)
    function getPlaybackRate: Float
    procedure setLoop(value: Boolean)
    function getLoop: Boolean
    procedure setRefDistance(value: Float)
    function getRefDistance: Float
    procedure setRolloffFactor(value: Float)
    function getRolloffFactor: Float
    procedure setVolume(value: Float)
    function getVolume: Float
    procedure updateMatrixWorld; overload;
    procedure updateMatrixWorld(force: Boolean); overload;
  end;

  JAudioListener = class external 'AudioListener'(JObject3D)
    constructor Create;
    &type: String;
    context: JAudioContext;
    procedure updateMatrixWorld; overload;
    procedure updateMatrixWorld(force: Boolean); overload;
  end;

  JCurve = class external 'Curve'
    function getPoint(t: Float): JT
    function getPointAt(u: Float): JT
    function getPoints: array of JT; overload;
    function getPoints(divisions: Float): array of JT; overload;
    function getSpacedPoints: array of JT; overload;
    function getSpacedPoints(divisions: Float): array of JT; overload;
    function getLength: Float
    function getLengths: array of Float; overload;
    function getLengths(divisions: Float): array of Float; overload;
    procedure updateArcLengths
    function getUtoTmapping(u: Float; distance: Float): Float
    function getTangent(t: Float): JT
    function getTangentAt(u: Float): JT
    function create(constructorFunc: JFunction; getPointFunc: JFunction): JFunction
  end;

  JCurvePath = class external 'CurvePath'(JCurve {JT} )
    constructor Create;
    curves: array of JCurve{<JT>};
    autoClose: Boolean;
    procedure add(curve: JCurve{<JT>})
    function checkConnection: Boolean
    procedure closePath
    function getPoint(t: Float): JT
    function getLength: Float
    function getCurveLengths: array of Float
    function createPointsGeometry(divisions: Float): JGeometry
    function createSpacedPointsGeometry(divisions: Float): JGeometry
    function createGeometry(points: array of JT): JGeometry
  end;

  JPath = class external 'Path'(JCurvePath {JVector2} )
    constructor Create(points: array of JVector2);
    actions: array of JPathAction;
    procedure fromPoints(vectors: array of JVector2)
    procedure moveTo(x: Float; y: Float)
    procedure lineTo(x: Float; y: Float)
    procedure quadraticCurveTo(aCPx: Float; aCPy: Float; aX: Float; aY: Float)
    procedure bezierCurveTo(aCP1x: Float; aCP1y: Float; aCP2x: Float; aCP2y: Float; aX: Float; aY: Float)
    procedure splineThru(pts: array of JVector2)
    procedure arc(aX: Float; aY: Float; aRadius: Float; aStartAngle: Float; aEndAngle: Float; aClockwise: Boolean)
    procedure absarc(aX: Float; aY: Float; aRadius: Float; aStartAngle: Float; aEndAngle: Float; aClockwise: Boolean)
    procedure ellipse(aX: Float; aY: Float; xRadius: Float; yRadius: Float; aStartAngle: Float; aEndAngle: Float; aClockwise: Boolean; aRotation: Float)
    procedure absellipse(aX: Float; aY: Float; xRadius: Float; yRadius: Float; aStartAngle: Float; aEndAngle: Float; aClockwise: Boolean; aRotation: Float)
    function getSpacedPoints: array of JVector2; overload;
    function getSpacedPoints(divisions: Float): array of JVector2; overload;
    function getSpacedPoints(divisions: Float; closedPath: Boolean): array of JVector2; overload;
    function getPoints: array of JVector2; overload;
    function getPoints(divisions: Float): array of JVector2; overload;
    function getPoints(divisions: Float; closedPath: Boolean): array of JVector2; overload;
    function toShapes: array of JShape
  end;

  JShape = class external 'Shape'(JPath)
    constructor Create(points: array of JVector2);
    holes: array of JPath;
    function extrude: JExtrudeGeometry; overload;
    function extrude(options: Variant): JExtrudeGeometry; overload;
    function makeGeometry: JShapeGeometry; overload;
    function makeGeometry(options: Variant): JShapeGeometry; overload;
    function getPointsHoles(divisions: Float): array of array of JVector2
    function extractAllPoints(divisions: Float):       shape: array of JVector2;
      holes: array of array of JVector2;
    end;
    function extractPoints(divisions: Float): array of JVector2
  end;

  JArcCurve = class external 'ArcCurve'(JEllipseCurve)
    constructor Create(aX: Float; aY: Float; aRadius: Float; aStartAngle: Float; aEndAngle: Float; aClockwise: Boolean);
  end;

  JCatmullRomCurve3 = class external 'CatmullRomCurve3'(JCurve {JVector3} )
    constructor Create;
  end;

  JClosedSplineCurve3 = class external 'ClosedSplineCurve3'(JCurve {JVector3} )
    constructor Create(points: array of JVector3);
    points: array of JVector3;
  end;

  JCubicBezierCurve = class external 'CubicBezierCurve'(JCurve {JVector2} )
    constructor Create(v0: JVector2; v1: JVector2; v2: JVector2; v3: JVector2);
    v0: JVector2;
    v1: JVector2;
    v2: JVector2;
    v3: JVector2;
  end;

  JCubicBezierCurve3 = class external 'CubicBezierCurve3'(JCurve {JVector3} )
    constructor Create(v0: JVector3; v1: JVector3; v2: JVector3; v3: JVector3);
    v0: JVector3;
    v1: JVector3;
    v2: JVector3;
    v3: JVector3;
  end;

  JEllipseCurve = class external 'EllipseCurve'(JCurve {JVector2} )
    constructor Create(aX: Float; aY: Float; xRadius: Float; yRadius: Float; aStartAngle: Float; aEndAngle: Float; aClockwise: Boolean; aRotation: Float);
    aX: Float;
    aY: Float;
    xRadius: Float;
    yRadius: Float;
    aStartAngle: Float;
    aEndAngle: Float;
    aClockwise: Boolean;
    aRotation: Float;
  end;

  JLineCurve = class external 'LineCurve'(JCurve {JVector2} )
    constructor Create(v1: JVector2; v2: JVector2);
    v1: JVector2;
    v2: JVector2;
  end;

  JLineCurve3 = class external 'LineCurve3'(JCurve {JVector3} )
    constructor Create(v1: JVector3; v2: JVector3);
    v1: JVector3;
    v2: JVector3;
  end;

  JQuadraticBezierCurve = class external 'QuadraticBezierCurve'(JCurve {JVector2} )
    constructor Create(v0: JVector2; v1: JVector2; v2: JVector2);
    v0: JVector2;
    v1: JVector2;
    v2: JVector2;
  end;

  JQuadraticBezierCurve3 = class external 'QuadraticBezierCurve3'(JCurve {JVector3} )
    constructor Create(v0: JVector3; v1: JVector3; v2: JVector3);
    v0: JVector3;
    v1: JVector3;
    v2: JVector3;
  end;

  JSplineCurve = class external 'SplineCurve'(JCurve {JVector2} )
    constructor Create(points: array of JVector2);
    points: array of JVector2;
  end;

  JSplineCurve3 = class external 'SplineCurve3'(JCurve {JVector3} )
    constructor Create(points: array of JVector3);
    points: array of JVector3;
  end;

  JBoxGeometry = class external 'BoxGeometry'(JGeometry)
    constructor Create(width: Float; height: Float; depth: Float; widthSegments: Float; heightSegments: Float; depthSegments: Float);
    parameters: record
      width: Float;
      height: Float;
      depth: Float;
      widthSegments: Float;
      heightSegments: Float;
      depthSegments: Float;
    end;;
    function clone: JBoxGeometry
  end;

  JCircleBufferGeometry = class external 'CircleBufferGeometry'(JGeometry)
    constructor Create(radius: Float; segments: Float; thetaStart: Float; thetaLength: Float);
    parameters: record
      radius: Float;
      segments: Float;
      thetaStart: Float;
      thetaLength: Float;
    end;;
    function clone: JCircleBufferGeometry
  end;

  JCircleGeometry = class external 'CircleGeometry'(JGeometry)
    constructor Create(radius: Float; segments: Float; thetaStart: Float; thetaLength: Float);
    parameters: record
      radius: Float;
      segments: Float;
      thetaStart: Float;
      thetaLength: Float;
    end;;
    function clone: JCircleGeometry
  end;

  JCubeGeometry = class external 'CubeGeometry'(JBoxGeometry)
  end;

  JCylinderGeometry = class external 'CylinderGeometry'(JGeometry)
    constructor Create(radiusTop: Float; radiusBottom: Float; height: Float; radiusSegments: Float; heightSegments: Float; openEnded: Boolean; thetaStart: Float; thetaLength: Float);
    parameters: record
      radiusTop: Float;
      radiusBottom: Float;
      height: Float;
      radialSegments: Float;
      heightSegments: Float;
      openEnded: Boolean;
      thetaStart: Float;
      thetaLength: Float;
    end;;
    function clone: JCylinderGeometry
  end;

  JDodecahedronGeometry = class external 'DodecahedronGeometry'(JGeometry)
    constructor Create(radius: Float; detail: Float);
    parameters: record
      radius: Float;
      detail: Float;
    end;;
    function clone: JDodecahedronGeometry
  end;

  JEdgesGeometry = class external 'EdgesGeometry'(JBufferGeometry)
    constructor Create(geometry: JBufferGeometry; thresholdAngle: Float);
    function clone: JEdgesGeometry
  end;

  JExtrudeGeometry = class external 'ExtrudeGeometry'(JGeometry)
    constructor Create(shape: JShape; options: Variant);
    constructor Create(shapes: array of JShape; options: Variant);
    WorldUVGenerator: record
      function generateTopUV(geometry: JGeometry; indexA: Float; indexB: Float; indexC: Float): array of JVector2
      function generateSideWallUV(geometry: JGeometry; indexA: Float; indexB: Float; indexC: Float; indexD: Float): array of JVector2
    end;;
    procedure addShapeList(shapes: array of JShape); overload;
    procedure addShapeList(shapes: array of JShape; options: Variant); overload;
    procedure addShape(shape: JShape); overload;
    procedure addShape(shape: JShape; options: Variant); overload;
  end;

  JIcosahedronGeometry = class external 'IcosahedronGeometry'(JPolyhedronGeometry)
    constructor Create(radius: Float; detail: Float);
    function clone: JIcosahedronGeometry
  end;

  JLatheGeometry = class external 'LatheGeometry'(JGeometry)
    constructor Create(points: array of JVector3; segments: Float; phiStart: Float; phiLength: Float);
    parameters: record
      points: array of JVector3;
      segments: Float;
      phiStart: Float;
      phiLength: Float;
    end;;
  end;

  JOctahedronGeometry = class external 'OctahedronGeometry'(JPolyhedronGeometry)
    constructor Create(radius: Float; detail: Float);
    function clone: JOctahedronGeometry
  end;

  JParametricGeometry = class external 'ParametricGeometry'(JGeometry)
    constructor Create(func: (u: Float; v: Float): JVector3; slices: Float; stacks: Float);
    parameters: record
      func: (u: Float; v: Float): JVector3;
      slices: Float;
      stacks: Float;
    end;;
  end;

  JPlaneBufferGeometry = class external 'PlaneBufferGeometry'(JBufferGeometry)
    constructor Create(width: Float; height: Float; widthSegments: Float; heightSegments: Float);
    parameters: record
      width: Float;
      height: Float;
      widthSegments: Float;
      heightSegments: Float;
    end;;
    function clone: JPlaneBufferGeometry
  end;

  JPlaneGeometry = class external 'PlaneGeometry'(JGeometry)
    constructor Create(width: Float; height: Float; widthSegments: Float; heightSegments: Float);
    parameters: record
      width: Float;
      height: Float;
      widthSegments: Float;
      heightSegments: Float;
    end;;
    function clone: JPlaneGeometry
  end;

  JPolyhedronGeometry = class external 'PolyhedronGeometry'(JGeometry)
    constructor Create(vertices: array of JVector3; faces: array of JFace3; radius: Float; detail: Float);
    parameters: record
      vertices: array of JVector3;
      faces: array of JFace3;
      radius: Float;
      detail: Float;
    end;;
    function clone: JPolyhedronGeometry
  end;

  JRingGeometry = class external 'RingGeometry'(JGeometry)
    constructor Create(innerRadius: Float; outerRadius: Float; thetaSegments: Float; phiSegments: Float; thetaStart: Float; thetaLength: Float);
    parameters: record
      innerRadius: Float;
      outerRadius: Float;
      thetaSegments: Float;
      phiSegments: Float;
      thetaStart: Float;
      thetaLength: Float;
    end;;
    function clone: JRingGeometry
  end;

  JShapeGeometry = class external 'ShapeGeometry'(JGeometry)
    constructor Create(shape: JShape; options: Variant);
    constructor Create(shapes: array of JShape; options: Variant);
    function addShapeList(shapes: array of JShape; options: Variant): JShapeGeometry
    procedure addShape(shape: JShape); overload;
    procedure addShape(shape: JShape; options: Variant); overload;
  end;

  JSphereBufferGeometry = class external 'SphereBufferGeometry'(JBufferGeometry)
    constructor Create(radius: Float; widthSegments: Float; heightSegments: Float; phiStart: Float; phiLength: Float; thetaStart: Float; thetaLength: Float);
    parameters: record
      radius: Float;
      widthSegments: Float;
      heightSegments: Float;
      phiStart: Float;
      phiLength: Float;
      thetaStart: Float;
      thetaLength: Float;
    end;;
    function clone: JSphereBufferGeometry
  end;

  JSphereGeometry = class external 'SphereGeometry'(JGeometry)
    constructor Create(radius: Float; widthSegments: Float; heightSegments: Float; phiStart: Float; phiLength: Float; thetaStart: Float; thetaLength: Float);
    parameters: record
      radius: Float;
      widthSegments: Float;
      heightSegments: Float;
      phiStart: Float;
      phiLength: Float;
      thetaStart: Float;
      thetaLength: Float;
    end;;
  end;

  JTetrahedronGeometry = class external 'TetrahedronGeometry'(JPolyhedronGeometry)
    constructor Create(radius: Float; detail: Float);
    function clone: JTetrahedronGeometry
  end;

  JTorusGeometry = class external 'TorusGeometry'(JGeometry)
    constructor Create(radius: Float; tube: Float; radialSegments: Float; tubularSegments: Float; arc: Float);
    parameters: record
      radius: Float;
      tube: Float;
      radialSegments: Float;
      tubularSegments: Float;
      arc: Float;
    end;;
    function clone: JTorusGeometry
  end;

  JTorusKnotGeometry = class external 'TorusKnotGeometry'(JGeometry)
    constructor Create(radius: Float; tube: Float; radialSegments: Float; tubularSegments: Float; p: Float; q: Float; heightScale: Float);
    parameters: record
      radius: Float;
      tube: Float;
      radialSegments: Float;
      tubularSegments: Float;
      p: Float;
      q: Float;
      heightScale: Float;
    end;;
    function clone: JTorusKnotGeometry
  end;

  JTubeGeometry = class external 'TubeGeometry'(JGeometry)
    constructor Create(path: JPath; segments: Float; radius: Float; radiusSegments: Float; closed: Boolean; taper: (u: Float): Float);
    parameters: record
      path: JPath;
      segments: Float;
      radius: Float;
      radialSegments: Float;
      closed: Boolean;
      taper: (u: Float): Float;
    end;;
    tangents: array of JVector3;
    normals: array of JVector3;
    binormals: array of JVector3;
    function NoTaper: Float; overload;
    function NoTaper(u: Float): Float; overload;
    function SinusoidalTaper(u: Float): Float
    procedure FrenetFrames(path: JPath; segments: Float; closed: Boolean)
    function clone: JTubeGeometry
  end;

  JWireframeGeometry = class external 'WireframeGeometry'(JBufferGeometry)
    constructor Create(geometry: Variant {JGeometry or JBufferGeometry});
  end;

  JArrowHelper = class external 'ArrowHelper'(JObject3D)
    constructor Create(dir: JVector3; origin: JVector3; _length: Float; hex: Float; headLength: Float; headWidth: Float);
    line: JLine;
    cone: JMesh;
    procedure setDirection(dir: JVector3)
    procedure setLength(_length: Float); overload;
    procedure setLength(_length: Float; headLength: Float); overload;
    procedure setLength(_length: Float; headLength: Float; headWidth: Float); overload;
    procedure setColor(hex: Float)
  end;

  JAxisHelper = class external 'AxisHelper'(JLineSegments)
    constructor Create(size: Float);
  end;

  JBoundingBoxHelper = class external 'BoundingBoxHelper'(JMesh)
    constructor Create(&object: JObject3D; hex: Float);
    &object: JObject3D;
    box: JBox3;
    procedure update
  end;

  JBoxHelper = class external 'BoxHelper'(JLineSegments)
    constructor Create(&object: JObject3D);
    procedure update; overload;
    procedure update(&object: JObject3D); overload;
  end;

  JCameraHelper = class external 'CameraHelper'(JLineSegments)
    constructor Create(camera: JCamera);
    camera: JCamera;
    pointMap: record
      // property Item[id: String]: array of Float;
    end;;
    procedure update
  end;

  JDirectionalLightHelper = class external 'DirectionalLightHelper'(JObject3D)
    constructor Create(light: JLight; size: Float);
    light: JLight;
    lightPlane: JLine;
    targetLine: JLine;
    procedure dispose
    procedure update
  end;

  JEdgesHelper = class external 'EdgesHelper'(JLineSegments)
    constructor Create(&object: JObject3D; hex: Float; thresholdAngle: Float);
  end;

  JFaceNormalsHelper = class external 'FaceNormalsHelper'(JLineSegments)
    constructor Create(&object: JObject3D; size: Float; hex: Float; linewidth: Float);
    &object: JObject3D;
    size: Float;
    procedure update; overload;
    procedure update(&object: JObject3D); overload;
  end;

  JGridHelper = class external 'GridHelper'(JLineSegments)
    constructor Create(size: Float; step: Float);
    color1: JColor;
    color2: JColor;
    procedure setColors(colorCenterLine: Float; colorGrid: Float)
  end;

  JHemisphereLightHelper = class external 'HemisphereLightHelper'(JObject3D)
    constructor Create(light: JLight; sphereSize: Float);
    light: JLight;
    colors: array of JColor;
    lightSphere: JMesh;
    procedure dispose
    procedure update
  end;

  JPointLightHelper = class external 'PointLightHelper'(JObject3D)
    constructor Create(light: JLight; sphereSize: Float);
    light: JLight;
    procedure dispose
    procedure update
  end;

  JSkeletonHelper = class external 'SkeletonHelper'(JLineSegments)
    constructor Create(bone: JObject3D);
    bones: array of JBone;
    root: JObject3D;
    function getBoneList(&object: JObject3D): array of JBone
    procedure update
  end;

  JSpotLightHelper = class external 'SpotLightHelper'(JObject3D)
    constructor Create(light: JLight; sphereSize: Float; arrowLength: Float);
    light: JLight;
    cone: JMesh;
    procedure dispose
    procedure update
  end;

  JVertexNormalsHelper = class external 'VertexNormalsHelper'(JLineSegments)
    constructor Create(&object: JObject3D; size: Float; hex: Float; linewidth: Float);
    &object: JObject3D;
    size: Float;
    procedure update; overload;
    procedure update(&object: JObject3D); overload;
  end;

  JWireframeHelper = class external 'WireframeHelper'(JLineSegments)
    constructor Create(&object: JObject3D; hex: Float);
  end;

  JImmediateRenderObject = class external 'ImmediateRenderObject'(JObject3D)
    constructor Create(material: JMaterial);
    material: JMaterial;
    procedure render(renderCallback: JFunction)
  end;

  JMorphBlendMesh = class external 'MorphBlendMesh'(JMesh)
    constructor Create(geometry: JGeometry; material: JMaterial);
    animationsMap: record
      // property Item[name: String]: JMorphBlendMeshAnimation;
    end;;
    animationsList: array of JMorphBlendMeshAnimation;
    procedure createAnimation(name: String; start: Float; &end: Float; fps: Float)
    procedure autoCreateAnimations(fps: Float)
    procedure setAnimationDirectionForward(name: String)
    procedure setAnimationDirectionBackward(name: String)
    procedure setAnimationFPS(name: String; fps: Float)
    procedure setAnimationDuration(name: String; duration: Float)
    procedure setAnimationWeight(name: String; weight: Float)
    procedure setAnimationTime(name: String; time: Float)
    function getAnimationTime(name: String): Float
    function getAnimationDuration(name: String): Float
    procedure playAnimation(name: String)
    procedure stopAnimation(name: String)
    procedure update(delta: Float)
  end;

  JMaterialParameters = class external
    name: String; // nullable
    side: JSide; // nullable
    opacity: Float; // nullable
    transparent: Boolean; // nullable
    blending: JBlending; // nullable
    blendSrc: JBlendingDstFactor; // nullable
    blendDst: JBlendingSrcFactor; // nullable
    blendEquation: JBlendingEquation; // nullable
    depthTest: Boolean; // nullable
    depthWrite: Boolean; // nullable
    polygonOffset: Boolean; // nullable
    polygonOffsetFactor: Float; // nullable
    polygonOffsetUnits: Float; // nullable
    alphaTest: Float; // nullable
    overdraw: Float; // nullable
    visible: Boolean; // nullable
    needsUpdate: Boolean; // nullable
  end;

  JLineBasicMaterialParameters = class external(JMaterialParameters)
    color: Variant {Float or String}; // nullable
    linewidth: Float; // nullable
    linecap: String; // nullable
    linejoin: String; // nullable
    vertexColors: JColors; // nullable
    fog: Boolean; // nullable
  end;

  JLineDashedMaterialParameters = class external(JMaterialParameters)
    color: Variant {Float or String}; // nullable
    linewidth: Float; // nullable
    scale: Float; // nullable
    dashSize: Float; // nullable
    gapSize: Float; // nullable
    vertexColors: JColors; // nullable
    fog: Boolean; // nullable
  end;

  JMeshBasicMaterialParameters = class external(JMaterialParameters)
    color: Variant {Float or String}; // nullable
    opacity: Float; // nullable
    map: JTexture; // nullable
    aoMap: JTexture; // nullable
    aoMapIntensity: Float; // nullable
    specularMap: JTexture; // nullable
    alphaMap: JTexture; // nullable
    envMap: JTexture; // nullable
    combine: JCombine; // nullable
    reflectivity: Float; // nullable
    refractionRatio: Float; // nullable
    shading: JShading; // nullable
    blending: JBlending; // nullable
    depthTest: Boolean; // nullable
    depthWrite: Boolean; // nullable
    wireframe: Boolean; // nullable
    wireframeLinewidth: Float; // nullable
    vertexColors: JColors; // nullable
    skinning: Boolean; // nullable
    morphTargets: Boolean; // nullable
    fog: Boolean; // nullable
  end;

  JMeshDepthMaterialParameters = class external(JMaterialParameters)
    wireframe: Boolean; // nullable
    wireframeLinewidth: Float; // nullable
  end;

  JMeshLambertMaterialParameters = class external(JMaterialParameters)
    color: Variant {Float or String}; // nullable
    emissive: Float; // nullable
    opacity: Float; // nullable
    map: JTexture; // nullable
    specularMap: JTexture; // nullable
    alphaMap: JTexture; // nullable
    envMap: JTexture; // nullable
    combine: JCombine; // nullable
    reflectivity: Float; // nullable
    refractionRatio: Float; // nullable
    fog: Boolean; // nullable
    wireframe: Boolean; // nullable
    wireframeLinewidth: Float; // nullable
    vertexColors: JColors; // nullable
    skinning: Boolean; // nullable
    morphTargets: Boolean; // nullable
    morphNormals: Boolean; // nullable
  end;

  JMeshNormalMaterialParameters = class external(JMaterialParameters)
    opacity: Float; // nullable
    shading: JShading; // nullable
    blending: JBlending; // nullable
    depthTest: Boolean; // nullable
    depthWrite: Boolean; // nullable
    wireframe: Boolean; // nullable
    wireframeLinewidth: Float; // nullable
  end;

  JMeshPhongMaterialParameters = class external(JMaterialParameters)
    color: Variant {Float or String}; // nullable
    emissive: Float; // nullable
    specular: Float; // nullable
    shininess: Float; // nullable
    opacity: Float; // nullable
    map: JTexture; // nullable
    lightMap: JTexture; // nullable
    lightMapIntensity: Float; // nullable
    aoMap: JTexture; // nullable
    aoMapIntensity: Float; // nullable
    emissiveMap: JTexture; // nullable
    bumpMap: JTexture; // nullable
    bumpScale: Float; // nullable
    normalMap: JTexture; // nullable
    normalScale: JVector2; // nullable
    displacementMap: JTexture; // nullable
    displacementScale: Float; // nullable
    displacementBias: Float; // nullable
    specularMap: JTexture; // nullable
    alphaMap: JTexture; // nullable
    envMap: JTexture; // nullable
    combine: JCombine; // nullable
    reflectivity: Float; // nullable
    refractionRatio: Float; // nullable
    shading: JShading; // nullable
    blending: JBlending; // nullable
    depthTest: Boolean; // nullable
    depthWrite: Boolean; // nullable
    wireframe: Boolean; // nullable
    wireframeLinewidth: Float; // nullable
    vertexColors: JColors; // nullable
    skinning: Boolean; // nullable
    morphTargets: Boolean; // nullable
    morphNormals: Boolean; // nullable
    fog: Boolean; // nullable
  end;

  JPointsMaterialParameters = class external(JMaterialParameters)
    color: Variant {Float or String}; // nullable
    opacity: Float; // nullable
    map: JTexture; // nullable
    size: Float; // nullable
    sizeAttenuation: Boolean; // nullable
    blending: JBlending; // nullable
    depthTest: Boolean; // nullable
    depthWrite: Boolean; // nullable
    vertexColors: JColors; // nullable
    fog: Boolean; // nullable
  end;

  JShaderMaterialParameters = class external(JMaterialParameters)
    defines: Variant; // nullable
    uniforms: Variant; // nullable
    fragmentShader: String; // nullable
    vertexShader: String; // nullable
    shading: JShading; // nullable
    blending: JBlending; // nullable
    depthTest: Boolean; // nullable
    depthWrite: Boolean; // nullable
    wireframe: Boolean; // nullable
    wireframeLinewidth: Float; // nullable
    lights: Boolean; // nullable
    vertexColors: JColors; // nullable
    skinning: Boolean; // nullable
    morphTargets: Boolean; // nullable
    morphNormals: Boolean; // nullable
    fog: Boolean; // nullable
  end;

  JSpriteMaterialParameters = class external(JMaterialParameters)
    color: Variant {Float or String}; // nullable
    opacity: Float; // nullable
    map: JTexture; // nullable
    blending: JBlending; // nullable
    depthTest: Boolean; // nullable
    depthWrite: Boolean; // nullable
    uvOffset: JVector2; // nullable
    uvScale: JVector2; // nullable
    fog: Boolean; // nullable
  end;

  JMath = class external
    function generateUUID: String
    function clamp(value: Float; min: Float; max: Float): Float
    function euclideanModulo(n: Float; m: Float): Float
    function mapLinear(x: Float; a1: Float; a2: Float; b1: Float; b2: Float): Float
    function smoothstep(x: Float; min: Float; max: Float): Float
    function smootherstep(x: Float; min: Float; max: Float): Float
    function random16: Float
    function randInt(low: Float; high: Float): Float
    function randFloat(low: Float; high: Float): Float
    function randFloatSpread(range: Float): Float
    function degToRad(degrees: Float): Float
    function radToDeg(radians: Float): Float
    function isPowerOfTwo(value: Float): Boolean
    function nearestPowerOfTwo(value: Float): Float
    function nextPowerOfTwo(value: Float): Float
  end;

  JMatrix = class external
    elements: JFloat32Array;
    function identity: JMatrix
    function copy(m: JMatrix): JMatrix
    function multiplyScalar(s: Float): JMatrix
    function determinant: Float
    function getInverse(matrix: JMatrix): JMatrix; overload;
    function getInverse(matrix: JMatrix; throwOnInvertible: Boolean): JMatrix; overload;
    function transpose: JMatrix
    function clone: JMatrix
  end;

  JSplineControlPoint = class external
    x: Float;
    y: Float;
    z: Float;
  end;

  JVector = class external
    procedure setComponent(index: Integer; value: Float)
    function getComponent(index: Integer): Float
    function copy(v: JVector): JVector
    function add(v: JVector): JVector
    function addVectors(a: JVector; b: JVector): JVector
    function sub(v: JVector): JVector
    function subVectors(a: JVector; b: JVector): JVector
    function multiplyScalar(s: Float): JVector
    function divideScalar(s: Float): JVector
    function negate: JVector
    function dot(v: JVector): Float
    function lengthSq: Float
    function length: Float
    function normalize: JVector
    function distanceTo(v: JVector): Float
    function distanceToSquared(v: JVector): Float
    function setLength(l: Float): JVector
    function lerp(v: JVector; alpha: Float): JVector
    function equals(v: JVector): Boolean
    function clone: JVector
  end;

  JLensFlareProperty = class external
    texture: JTexture;
    size: Float;
    distance: Float;
    x: Float;
    y: Float;
    z: Float;
    scale: Float;
    rotation: Float;
    opacity: Float;
    color: JColor;
    blending: JBlending;
  end;

  JRenderer = class external
    procedure render(scene: JScene; camera: JCamera)
    procedure setSize(width: Float; height: Float); overload;
    procedure setSize(width: Float; height: Float; updateStyle: Boolean); overload;
    domElement: JHTMLCanvasElement;
  end;

  JWebGLRendererParameters = class external
    canvas: JHTMLCanvasElement; // nullable
    precision: String; // nullable
    alpha: Boolean; // nullable
    premultipliedAlpha: Boolean; // nullable
    antialias: Boolean; // nullable
    stencil: Boolean; // nullable
    preserveDrawingBuffer: Boolean; // nullable
    clearColor: Float; // nullable
    clearAlpha: Float; // nullable
    devicePixelRatio: Float; // nullable
    logarithmicDepthBuffer: Boolean; // nullable
  end;

  JRenderTarget = class external
  end;

  JWebGLRenderTargetOptions = class external
    wrapS: JWrapping; // nullable
    wrapT: JWrapping; // nullable
    magFilter: JTextureFilter; // nullable
    minFilter: JTextureFilter; // nullable
    anisotropy: Float; // nullable
    format: Float; // nullable
    &type: JTextureDataType; // nullable
    depthBuffer: Boolean; // nullable
    stencilBuffer: Boolean; // nullable
  end;

  JShaderChunk = class external
    // property Item[name: String]: String;
    common: String;
    alphamap_fragment: String;
    alphamap_pars_fragment: String;
    alphatest_fragment: String;
    aomap_fragment: String;
    aomap_pars_fragment: String;
    begin_vertex: String;
    beginnormal_vertex: String;
    bumpmap_pars_fragment: String;
    color_fragment: String;
    color_pars_fragment: String;
    color_pars_vertex: String;
    color_vertex: String;
    defaultnormal_vertex: String;
    displacementmap_pars_vertex: String;
    displacementmap_vertex: String;
    emissivemap_fragment: String;
    emissivemap_pars_fragment: String;
    envmap_fragment: String;
    envmap_pars_fragment: String;
    envmap_pars_vertex: String;
    envmap_vertex: String;
    fog_fragment: String;
    fog_pars_fragment: String;
    hemilight_fragment: String;
    lightmap_fragment: String;
    lightmap_pars_fragment: String;
    lights_lambert_pars_vertex: String;
    lights_lambert_vertex: String;
    lights_phong_fragment: String;
    lights_phong_pars_fragment: String;
    lights_phong_pars_vertex: String;
    lights_phong_vertex: String;
    linear_to_gamma_fragment: String;
    logdepthbuf_fragment: String;
    logdepthbuf_pars_fragment: String;
    logdepthbuf_pars_vertex: String;
    logdepthbuf_vertex: String;
    map_fragment: String;
    map_pars_fragment: String;
    map_particle_fragment: String;
    map_particle_pars_fragment: String;
    morphnormal_vertex: String;
    morphtarget_pars_vertex: String;
    morphtarget_vertex: String;
    normal_phong_fragment: String;
    normalmap_pars_fragment: String;
    project_vertex: String;
    shadowmap_fragment: String;
    shadowmap_pars_fragment: String;
    shadowmap_pars_vertex: String;
    shadowmap_vertex: String;
    skinbase_vertex: String;
    skinning_pars_vertex: String;
    skinning_vertex: String;
    skinnormal_vertex: String;
    specularmap_fragment: String;
    specularmap_pars_fragment: String;
    uv2_pars_fragment: String;
    uv2_pars_vertex: String;
    uv2_vertex: String;
    uv_pars_fragment: String;
    uv_pars_vertex: String;
    uv_vertex: String;
    worldpos_vertex: String;
  end;

  JShader = class external
    uniforms: Variant;
    vertexShader: String;
    fragmentShader: String;
  end;

  JWebGLGeometriesInstance = class external
    constructor Create;
    function get(&object: Variant): Variant
  end;

  JWebGLGeometriesStatic = class external
    function(_gl: Variant; extensions: Variant; _infoRender: Variant): JWebGLGeometriesInstance;
  end;

  JWebGLIndexedBufferRendererInstance = class external
    constructor Create;
    procedure setMode(value: Variant)
    procedure setIndex(index: Variant)
    procedure render(start: Variant; count: Variant)
    procedure renderInstances(geometry: Variant)
  end;

  JWebGLIndexedBufferRendererStatic = class external
    function(_gl: Variant; extensions: Variant; _infoRender: Variant): JWebGLIndexedBufferRendererInstance;
  end;

  JWebGLObjectsInstance = class external
    constructor Create;
    function getAttributeBuffer(attribute: Variant): Variant
    function getWireframeAttribute(geometry: Variant): Variant
    procedure update(&object: Variant)
  end;

  JWebGLObjectsStatic = class external
    function(gl: Variant; properties: Variant; info: Variant): JWebGLObjectsInstance;
  end;

  JWebGLProgramsInstance = class external
    constructor Create;
    function getParameters(material: Variant; lights: Variant; fog: Variant; &object: Variant): array of Variant
    function getProgramCode(material: Variant; parameters: Variant): Variant
    function acquireProgram(material: Variant; parameters: Variant; code: Variant): Variant
    procedure releaseProgram(program: Variant)
  end;

  JWebGLProgramsStatic = class external
    function: JWebGLProgramsInstance;
  end;

  JWebGLPropertiesInstance = class external
    constructor Create;
    function get(&object: Variant): Variant
    procedure delete(&object: Variant)
    procedure clear
  end;

  JWebGLPropertiesStatic = class external
    function: JWebGLPropertiesInstance;
  end;

  JWebGLShadowMapInstance = class external
    constructor Create;
    enabled: Boolean;
    autoUpdate: Boolean;
    needsUpdate: Boolean;
    &type: JShadowMapType;
    cullFace: JCullFace;
    procedure render(scene: JScene)
  end;

  JWebGLShadowMapStatic = class external
    function(_renderer: JRenderer; _lights: array of Variant; _objects: array of Variant): JWebGLStateInstance;
  end;

  JWebGLStateInstance = class external
    constructor Create;
    procedure init
    procedure initAttributes
    procedure enableAttribute(attribute: String)
    procedure enableAttributeAndDivisor(attribute: String; meshPerAttribute: Variant; extension: Variant)
    procedure disableUnusedAttributes
    procedure enable(id: String)
    procedure disable(id: String)
    function getCompressedTextureFormats: Variant
    procedure setBlending(blending: Float; blendEquation: Float; blendSrc: Float; blendDst: Float; blendEquationAlpha: Float; blendSrcAlpha: Float; blendDstAlpha: Float)
    procedure setDepthFunc(func: JFunction)
    procedure setDepthTest(depthTest: Float)
    procedure setDepthWrite(depthWrite: Float)
    procedure setColorWrite(colorWrite: Float)
    procedure setFlipSided(flipSided: Float)
    procedure setLineWidth(width: Float)
    procedure setPolygonOffset(polygonoffset: Float; factor: Float; units: Float)
    procedure setScissorTest(scissorTest: Boolean)
    procedure activeTexture(webglSlot: Variant)
    procedure bindTexture(webglType: Variant; webglTexture: Variant)
    procedure compressedTexImage2D
    procedure texImage2D
    procedure reset
  end;

  JWebGLStateStatic = class external
    function(gl: Variant; extensions: Variant; paramThreeToGL: JFunction): JWebGLStateInstance;
  end;

  JRendererPlugin = class external
    procedure init(renderer: JWebGLRenderer)
    procedure render(scene: JScene; camera: JCamera; currentWidth: Float; currentHeight: Float)
  end;

  JIFog = class external
    name: String;
    color: JColor;
    function clone: JIFog
  end;

  JBoundingBox = class external
    minX: Float;
    minY: Float;
    minZ: Float; // nullable
    maxX: Float;
    maxY: Float;
    maxZ: Float; // nullable
  end;

  JPathAction = class external
    action: JPathActions;
    args: Variant;
  end;

  JMorphBlendMeshAnimation = class external
    start: Float;
    &end: Float;
    _length: Float;
    fps: Float;
    duration: Float;
    lastFrame: Float;
    currentFrame: Float;
    active: Boolean;
    time: Float;
    direction: Float;
    weight: Float;
    directionBackwards: Boolean;
    mirroredLoop: Boolean;
  end;

procedure warn; overload;
procedure warn(message: Variant; optionalParams: array of Variant); overload;
procedure error; overload;
procedure error(message: Variant; optionalParams: array of Variant); overload;
procedure log; overload;
procedure log(message: Variant; optionalParams: array of Variant); overload;

var
  REVISION: String;
  CullFaceNone: JCullFace;
  CullFaceBack: JCullFace;
  CullFaceFront: JCullFace;
  CullFaceFrontBack: JCullFace;
  FrontFaceDirectionCW: JFrontFaceDirection;
  FrontFaceDirectionCCW: JFrontFaceDirection;
  BasicShadowMap: JShadowMapType;
  PCFShadowMap: JShadowMapType;
  PCFSoftShadowMap: JShadowMapType;
  FrontSide: JSide;
  BackSide: JSide;
  DoubleSide: JSide;
  NoShading: JShading;
  FlatShading: JShading;
  SmoothShading: JShading;
  NoColors: JColors;
  FaceColors: JColors;
  VertexColors: JColors;
  NoBlending: JBlending;
  NormalBlending: JBlending;
  AdditiveBlending: JBlending;
  SubtractiveBlending: JBlending;
  MultiplyBlending: JBlending;
  CustomBlending: JBlending;
  AddEquation: JBlendingEquation;
  SubtractEquation: JBlendingEquation;
  ReverseSubtractEquation: JBlendingEquation;
  MinEquation: JBlendingEquation;
  MaxEquation: JBlendingEquation;
  ZeroFactor: JBlendingDstFactor;
  OneFactor: JBlendingDstFactor;
  SrcColorFactor: JBlendingDstFactor;
  OneMinusSrcColorFactor: JBlendingDstFactor;
  SrcAlphaFactor: JBlendingDstFactor;
  OneMinusSrcAlphaFactor: JBlendingDstFactor;
  DstAlphaFactor: JBlendingDstFactor;
  OneMinusDstAlphaFactor: JBlendingDstFactor;
  DstColorFactor: JBlendingSrcFactor;
  OneMinusDstColorFactor: JBlendingSrcFactor;
  SrcAlphaSaturateFactor: JBlendingSrcFactor;
  NeverDepth: JDepthModes;
  AlwaysDepth: JDepthModes;
  LessDepth: JDepthModes;
  LessEqualDepth: JDepthModes;
  EqualDepth: JDepthModes;
  GreaterEqualDepth: JDepthModes;
  GreaterDepth: JDepthModes;
  NotEqualDepth: JDepthModes;
  MultiplyOperation: JCombine;
  MixOperation: JCombine;
  AddOperation: JCombine;
  UVMapping: JMapping;
  CubeReflectionMapping: JMapping;
  CubeRefractionMapping: JMapping;
  EquirectangularReflectionMapping: JMapping;
  EquirectangularRefractionMapping: JMapping;
  SphericalReflectionMapping: JMapping;
  RepeatWrapping: JWrapping;
  ClampToEdgeWrapping: JWrapping;
  MirroredRepeatWrapping: JWrapping;
  NearestFilter: JTextureFilter;
  NearestMipMapNearestFilter: JTextureFilter;
  NearestMipMapLinearFilter: JTextureFilter;
  LinearFilter: JTextureFilter;
  LinearMipMapNearestFilter: JTextureFilter;
  LinearMipMapLinearFilter: JTextureFilter;
  UnsignedByteType: JTextureDataType;
  ByteType: JTextureDataType;
  ShortType: JTextureDataType;
  UnsignedShortType: JTextureDataType;
  IntType: JTextureDataType;
  UnsignedIntType: JTextureDataType;
  FloatType: JTextureDataType;
  HalfFloatType: JTextureDataType;
  UnsignedShort4444Type: JPixelType;
  UnsignedShort5551Type: JPixelType;
  UnsignedShort565Type: JPixelType;
  AlphaFormat: JPixelFormat;
  RGBFormat: JPixelFormat;
  RGBAFormat: JPixelFormat;
  LuminanceFormat: JPixelFormat;
  LuminanceAlphaFormat: JPixelFormat;
  RGBEFormat: JPixelFormat;
  RGB_S3TC_DXT1_Format: JCompressedPixelFormat;
  RGBA_S3TC_DXT1_Format: JCompressedPixelFormat;
  RGBA_S3TC_DXT3_Format: JCompressedPixelFormat;
  RGBA_S3TC_DXT5_Format: JCompressedPixelFormat;
  RGB_PVRTC_4BPPV1_Format: JCompressedPixelFormat;
  RGB_PVRTC_2BPPV1_Format: JCompressedPixelFormat;
  RGBA_PVRTC_4BPPV1_Format: JCompressedPixelFormat;
  RGBA_PVRTC_2BPPV1_Format: JCompressedPixelFormat;
  LoopOnce: JAnimationActionLoopStyles;
  LoopRepeat: JAnimationActionLoopStyles;
  LoopPingPong: JAnimationActionLoopStyles;
  AnimationUtils:     function getEqualsFunc(exemplarValue: Variant): Boolean
    function clone(exemplarValue: JT): JT
    function lerp(a: Variant; b: Variant; alpha: Float; interTrack: Boolean): Variant
    function lerp_object(a: Variant; b: Variant; alpha: Float): Variant
    function slerp_object(a: Variant; b: Variant; alpha: Float): Variant
    function lerp_number(a: Variant; b: Variant; alpha: Float): Variant
    function lerp_boolean(a: Variant; b: Variant; alpha: Float): Variant
    function lerp_boolean_immediate(a: Variant; b: Variant; alpha: Float): Variant
    function lerp_string(a: Variant; b: Variant; alpha: Float): Variant
    function lerp_string_immediate(a: Variant; b: Variant; alpha: Float): Variant
    function getLerpFunc(exemplarValue: Variant; interTrack: Boolean): JFunction
  end;;
  Cache: JCache;
  Math: JMath;
  LineStrip: JLineMode;
  LinePieces: JLineMode;
  ShaderChunk: JShaderChunk;
  ShaderLib:     // property Item[name: String]: JShader;
    basic: JShader;
    lambert: JShader;
    phong: JShader;
    particle_basic: JShader;
    dashed: JShader;
    depth: JShader;
    normal: JShader;
    normalmap: JShader;
    cube: JShader;
    equirect: JShader;
    depthRGBA: JShader;
  end;;
  UniformsLib:     common: Variant;
    aomap: Variant;
    lightmap: Variant;
    emissivemap: Variant;
    bumpmap: Variant;
    normalmap: Variant;
    displacementmap: Variant;
    fog: Variant;
    lights: Variant;
    points: Variant;
    shadowmap: Variant;
  end;;
  UniformsUtils:     function merge(uniforms: array of Variant): Variant
    function clone(uniforms_src: Variant): Variant
  end;;
  WebGLGeometries: JWebGLGeometriesStatic;
  WebGLIndexedBufferRenderer: JWebGLIndexedBufferRendererStatic;
  WebGLObjects: JWebGLObjectsStatic;
  WebGLPrograms: JWebGLProgramsStatic;
  WebGLProperties: JWebGLPropertiesStatic;
  WebGLShadowMap: JWebGLShadowMapStatic;
  WebGLState: JWebGLStateStatic;
  CurveUtils:     function tangentQuadraticBezier(t: Float; p0: Float; p1: Float; p2: Float): Float
    function tangentCubicBezier(t: Float; p0: Float; p1: Float; p2: Float; p3: Float): Float
    function tangentSpline(t: Float; p0: Float; p1: Float; p2: Float; p3: Float): Float
    function interpolate(p0: Float; p1: Float; p2: Float; p3: Float; t: Float): Float
  end;;
  ImageUtils:     crossOrigin: String;
    function loadTexture(url: String): JTexture; overload;
    function loadTexture(url: String; mapping: JMapping): JTexture; overload;
    function loadTexture(url: String; mapping: JMapping; onLoad: procedure(texture: JTexture)): JTexture; overload;
    function loadTexture(url: String; mapping: JMapping; onLoad: procedure(texture: JTexture); onError: procedure(message: String)): JTexture; overload;
    function loadTextureCube(&array: array of String): JTexture; overload;
    function loadTextureCube(&array: array of String; mapping: JMapping): JTexture; overload;
    function loadTextureCube(&array: array of String; mapping: JMapping; onLoad: procedure(texture: JTexture)): JTexture; overload;
    function loadTextureCube(&array: array of String; mapping: JMapping; onLoad: procedure(texture: JTexture); onError: procedure(message: String)): JTexture; overload;
    function getNormalMap(image: JHTMLImageElement): JHTMLCanvasElement; overload;
    function getNormalMap(image: JHTMLImageElement; depth: Float): JHTMLCanvasElement; overload;
    function generateDataTexture(width: Float; height: Float; color: JColor): JDataTexture
  end;;
  SceneUtils:     function createMultiMaterialObject(geometry: JGeometry; materials: array of JMaterial): JObject3D
    procedure detach(child: JObject3D; parent: JObject3D; scene: JScene)
    procedure attach(child: JObject3D; scene: JScene; parent: JObject3D)
  end;;
  ShapeUtils:     function area(contour: array of Float): Float
    function triangulate(contour: array of Float; indices: Boolean): array of Float
    function triangulateShape(contour: array of Float; holes: array of Variant): array of Float
    function isClockWise(pts: array of Float): Boolean
    function b2(t: Float; p0: Float; p1: Float; p2: Float): Float
    function b3(t: Float; p0: Float; p1: Float; p2: Float; p3: Float): Float
  end;;
  CurveUtils:     function tangentQuadraticBezier(t: Float; p0: Float; p1: Float; p2: Float): Float
    function tangentCubicBezier(t: Float; p0: Float; p1: Float; p2: Float; p3: Float): Float
    function tangentSpline(t: Float; p0: Float; p1: Float; p2: Float; p3: Float): Float
    function interpolate(p0: Float; p1: Float; p2: Float; p3: Float; t: Float): Float
  end;;


//'three'


