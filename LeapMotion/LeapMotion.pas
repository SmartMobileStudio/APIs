unit LeapMotion;

interface

uses
  W3C.WebSocket;

type
  JFrame = class;
  JHand = class;
  JFinger = class;
  JController = class;

  JVector3 = class external 'Vector3'
    x: Float;
    y: Float;
    z: Float;
    constructor Create(x: Float; y: Float; z: Float);
    function opposite: JVector3;
    function plus(other: JVector3): JVector3;
    function plusAssign(other: JVector3): JVector3;
    function minus(other: JVector3): JVector3;
    function minusAssign(other: JVector3): JVector3;
    function multiply(scalar: Float): JVector3;
    function multiplyAssign(scalar: Float): JVector3;
    function divide(scalar: Float): JVector3;
    function divideAssign(scalar: Float): JVector3;
    function isEqualTo(other: JVector3): Boolean;
    function angleTo(other: JVector3): Float;
    function cross(other: JVector3): JVector3;
    function distanceTo(other: JVector3): Float;
    function dot(other: JVector3): Float;
    function isValid: Boolean;
    function invalid: JVector3;
    function magnitude: Float;
    function magnitudeSquared: Float;
    function normalized: JVector3;
    pitch: Float;
    yaw: Float;
    roll: Float;
    function zero: JVector3;
    function xAxis: JVector3;
    function yAxis: JVector3;
    function zAxis: JVector3;
    function left: JVector3;
    function right: JVector3;
    function down: JVector3;
    function up: JVector3;
    function forward: JVector3;
    function backward: JVector3;
    function toString: String;
  end;

  JMatrix = class external 'Matrix'
    origin: JVector3;
    xBasis: JVector3;
    yBasis: JVector3;
    zBasis: JVector3;
    constructor Create(x: JVector3; y: JVector3; z: JVector3; _origin: JVector3);
    procedure setRotation(_axis: JVector3; angleRadians: Float);
    function transformPoint(inVector: JVector3): JVector3;
    function transformDirection(inVector: JVector3): JVector3;
    function rigidInverse: JMatrix;
    function multiply(other: JMatrix): JMatrix;
    function multiplyAssign(other: JMatrix): JMatrix;
    function isEqualTo(other: JMatrix): Boolean;
    function identity: JMatrix;
    function toString: String;
  end;

  JPointable = class external 'Pointable'
    direction: JVector3;
    frame: JFrame;
    hand: JHand;
    id: Float;
    _length: Float;
    width: Float;
    tipPosition: JVector3;
    tipVelocity: JVector3;
    isFinger: Boolean;
    isTool: Boolean;
    constructor Create;
    function isValid: Boolean;
    function isEqualTo(other: JPointable): Boolean;
    function invalid: JPointable;
    function toString: String;
  end;

  JFinger = class external 'Finger'(JPointable)
    constructor Create;
    function invalid: JFinger;
  end;

  JTool = class external 'Tool'(JPointable)
    constructor Create;
    function invalid: JTool;
  end;

  JHand = class external 'Hand'
    direction: JVector3;
    fingers: array of JFinger;
    frame: JFrame;
    id: Float;
    palmNormal: JVector3;
    palmPosition: JVector3;
    palmVelocity: JVector3;
    pointables: array of JPointable;
    sphereCenter: JVector3;
    sphereRadius: Float;
    tools: array of JTool;
    rotation: JMatrix;
    scaleFactorNumber: Float;
    translationVector: JVector3;
    constructor Create;
    function isValid: Boolean;
    function isEqualTo(other: JHand): Boolean;
    function finger(id: Float): JFinger;
    function tool(id: Float): JTool;
    function pointable(id: Float): JPointable;
    function rotationAxis(sinceFrame: JFrame): JVector3;
    function rotationAngle(sinceFrame: JFrame): Float; overload;
    function rotationAngle(sinceFrame: JFrame; axis: JVector3): Float; overload;
    function rotationMatrix(sinceFrame: JFrame): JMatrix;
    function scaleFactor(sinceFrame: JFrame): Float;
    function translation(sinceFrame: JFrame): JVector3;
    function invalid: JHand;
  end;

  JGesture = class external 'Gesture'
    class var STATE_INVALID: Float;
    class var STATE_START: Float;
    class var STATE_UPDATE: Float;
    class var STATE_STOP: Float;
    class var TYPE_INVALID: Float;
    class var TYPE_SWIPE: Float;
    class var TYPE_CIRCLE: Float;
    class var TYPE_SCREEN_TAP: Float;
    class var TYPE_KEY_TAP: Float;
    duration: Float;
    durationSeconds: Float;
    frame: JFrame;
    hands: array of JHand;
    id: Float;
    pointables: array of JPointable;
    state: Float;
    &type: Float;
    constructor Create;
    function isEqualTo(other: JGesture): Boolean;
    function isValid: Boolean;
    function invalid: JGesture;
    function toString: String;
  end;

  JCircleGesture = class external 'CircleGesture'(JGesture)
    class var classType: Float;
    center: JVector3;
    normal: JVector3;
    pointable: JPointable;
    progress: Float;
    radius: Float;
    constructor Create;
  end;

  JKeyTapGesture = class external 'KeyTapGesture'(JGesture)
    class var classType: Float;
    direction: JVector3;
    pointable: JPointable;
    position: JVector3;
    progress: Float;
    constructor Create;
  end;

  JScreenTapGesture = class external 'ScreenTapGesture'(JGesture)
    class var classType: Float;
    direction: JVector3;
    pointable: JPointable;
    position: JVector3;
    progress: Float;
    constructor Create;
  end;

type
  JSwipeGesture = class external 'SwipeGesture'(JGesture)
    class var classType: Float;
    direction: JVector3;
    pointable: JPointable;
    position: JVector3;
    speed: Float;
    startPosition: JVector3;
    constructor Create;
  end;

  JFrame = class external 'Frame'
    fingers: array of JFinger;
    hands: array of JHand;
    pointables: array of JPointable;
    _gestures: array of JGesture;
    id: Float;
    timestamp: Float;
    tools: array of JTool;
    rotation: JMatrix;
    scaleFactorNumber: Float;
    translationVector: JVector3;
    controller: JController;
    constructor Create;
    function hand(id: Float): JHand;
    function finger(id: Float): JFinger;
    function tool(id: Float): JTool;
    function pointable(id: Float): JPointable;
    function gesture(id: Float): JGesture;
    function gestures: array of JGesture; overload;
    function gestures(sinceFrame: JFrame): array of JGesture; overload;
    function rotationAxis(sinceFrame: JFrame): JVector3;
    function rotationAngle(sinceFrame: JFrame): Float; overload;
    function rotationAngle(sinceFrame: JFrame; axis: JVector3): Float; overload;
    function rotationMatrix(sinceFrame: JFrame): JMatrix;
    function scaleFactor(sinceFrame: JFrame): Float;
    function translation(sinceFrame: JFrame): JVector3;
    function isEqualTo(other: JFrame): Boolean;
    function isValid: Boolean;
    function invalid: JFrame;
  end;

  JListener = class external
    procedure onConnect(controller: JController);
    procedure onDisconnect(controller: JController);
    procedure onExit(controller: JController);
    procedure onFrame(controller: JController; frame: JFrame);
    procedure onInit(controller: JController);
  end;

  JLeapEvent = class external 'LeapEvent'
    class var LEAPMOTION_INIT: String;
    class var LEAPMOTION_CONNECTED: String;
    class var LEAPMOTION_DISCONNECTED: String;
    class var LEAPMOTION_EXIT: String;
    class var LEAPMOTION_FRAME: String;
  protected
    _type: Variant;
    _target: Variant;
  public
    frame: JFrame;
    constructor Create(&type: String; targetListener: JListener; frame: JFrame);
    function getTarget: Variant;
    function getType: String;
  end;

  JEventDispatcher = class external 'EventDispatcher'
  protected
    _listeners: Variant;
  public
    constructor Create;
    function hasEventListener(&type: String; listener: procedure): Boolean;
    procedure addEventListener(typeStr: String; listenerFunc: procedure);
    procedure removeEventListener(typeStr: String; listenerFunc: procedure);
    procedure dispatchEvent(evt: JLeapEvent);
  end;

  JController = class external 'Controller'(JEventDispatcher)
  protected
    listener: Variant;
    latestFrame: Variant;
    procedure getHandByID(frame: Variant; id: Variant);
    procedure getPointableByID(frame: Variant; id: Variant);
  public
    frameHistory: array of JFrame;
    connection: JWebSocket;
    _isConnected: Boolean;
    _isGesturesEnabled: Boolean;
    constructor Create(host: String);
  public
    function frame: JFrame; overload;
    function frame(history: Float): JFrame; overload;
    procedure setListener(listener: JListener);
    procedure enableGesture(&type: Float); overload;
    procedure enableGesture(&type: Float; enable: Boolean); overload;
    function isGestureEnabled(&type: Float): Boolean;
    function isConnected: Boolean;
  end;

  JDefaultListener = class external 'DefaultListener'(JEventDispatcher)
    constructor Create;
    procedure onConnect(controller: JController);
    procedure onDisconnect(controller: JController);
    procedure onExit(controller: JController);
    procedure onFrame(controller: JController; frame: JFrame);
    procedure onInit(controller: JController);
  end;

  JLeapUtil = class external 'LeapUtil'
    class var PI: Float;
    class var DEG_TO_RAD: Float;
    class var RAD_TO_DEG: Float;
    class var TWO_PI: Float;
    class var HALF_PI: Float;
    class var EPSILON: Float;
    constructor Create;
    function toDegrees(radians: Float): Float;
    function isNearZero(value: Float): Boolean;
    function vectorIsNearZero(inVector: JVector3): Boolean;
    function extractRotation(mtxTransform: JMatrix): JMatrix;
    function rotationInverse(mtxRot: JMatrix): JMatrix;
    function rigidInverse(mtxTransform: JMatrix): JMatrix;
    function componentWiseMin(vLHS: JVector3; vRHS: JVector3): JVector3;
    function componentWiseMax(vLHS: JVector3; vRHS: JVector3): JVector3;
    function componentWiseScale(vLHS: JVector3; vRHS: JVector3): JVector3;
    function componentWiseReciprocal(inVector: JVector3): JVector3;
    function minComponent(inVector: JVector3): Float;
    function maxComponent(inVector: JVector3): Float;
    function heading(inVector: JVector3): Float;
    function elevation(inVector: JVector3): Float;
    function normalizeSpherical(vSpherical: JVector3): JVector3;
    function cartesianToSpherical(vCartesian: JVector3): JVector3;
    function sphericalToCartesian(vSpherical: JVector3): JVector3;
    function clamp(inVal: Float; minVal: Float; maxVal: Float): Float;
    function lerp(a: Float; b: Float; coefficient: Float): Float;
    function lerpVector(vec1: JVector3; vec2: JVector3; coefficient: Float): JVector3;
  end;