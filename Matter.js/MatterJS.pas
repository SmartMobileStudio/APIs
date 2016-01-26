unit MatterJS;

interface

uses
  W3C.HTML5, W3C.Canvas2DContext, W3C.SVG1;

type
  JVector = class external 'Vector'
    x: Float;
    y: Float;
    function create: JVector; overload;
    function create(x: Float): JVector; overload;
    function create(x, y: Float): JVector; overload;
    function clone(vector: JVector): JVector;
    function cross3(vectorA, vectorB, vectorC: JVector): Float;
    function add(vectorA, vectorB: JVector): JVector; overload;
    function add(vectorA, vectorB, output: JVector): JVector; overload;
    function angle(vectorA, vectorB: JVector): Float;
    function cross(vectorA, vectorB: JVector): Float;
    function &div(vector: JVector; scalar: Float): JVector;
    function dot(vectorA, vectorB: JVector): Float;
    function magnitude(vector: JVector): Float;
    function magnitudeSquared(vector: JVector): Float;
    function mult(vector: JVector; scalar: Float): JVector;
    function neg(vector: JVector): JVector;
    function normalise(vector: JVector): JVector;
    function perp(vector: JVector): JVector; overload;
    function perp(vector: JVector; negate: Boolean): JVector; overload;
    function rotate(vector: JVector; angle: Float): JVector;
    function rotateAbout(vector: JVector; angle: Float; point: JVector): JVector; overload;
    function rotateAbout(vector: JVector; angle: Float; point, output: JVector): JVector; overload;
    function sub(vectorA, vectorB: JVector): JVector; overload;
    function sub(vectorA, vectorB, optional: JVector): JVector; overload;
  end;

  JAxes = class external 'Axes'
    function fromVertices(vertices: array of JVector): array of JVector;
    procedure rotate(axes: array of JVector; angle: Float);
  end;

  JBounds = class external 'Bounds'
  end;

  JIBodyRenderOptionsSprite = class external
    texture: String;
    xScale: Float;
    yScale: Float;
  end;

  JIBodyRenderOptions = class external
    visible: Boolean;
    sprite: JIBodyRenderOptionsSprite;
    fillStyle: String;
    lineWidth: Float;
    strokeStyle: String;
  end;

  JICollisionFilter = class external
    category: Float;
    mask: Float;
    group: Float;
  end;

  JIMousePoint = class external
    x: Float;
    y: Float;
  end;

  JBody = class;

  JIBodyDefinition = class external
    angle: Float; // nullable
    angularSpeed: Float; // nullable
    angularVelocity: Float; // nullable
    area: Float; // nullable
    axes: array of Variant; // nullable
    bounds: JBounds; // nullable
    density: Float; // nullable
    force: JVector; // nullable
    friction: Float; // nullable
    frictionAir: Float; // nullable
    id: Float; // nullable
    inertia: Float; // nullable
    inverseInertia: Float; // nullable
    inverseMass: Float; // nullable
    isSleeping: Boolean; // nullable
    isStatic: Boolean; // nullable
    &label: String; // nullable
    mass: Float; // nullable
    motion: Float; // nullable
    position: JVector; // nullable
    render: JIBodyRenderOptions; // nullable
    restitution: Float; // nullable
    sleepThreshold: Float; // nullable
    slop: Float; // nullable
    speed: Float; // nullable
    timeScale: Float; // nullable
    torque: Float; // nullable
    &type: String; // nullable
    velocity: JVector; // nullable
    vertices: array of Variant; // nullable
    parts: array of Variant; // nullable
    parent: JBody; // nullable
    frictionStatic: Float; // nullable
    collisionFilter: JICollisionFilter; // nullable
  end;

  JBody = class external 'Body'
    procedure applyForce(body: JBody; position, force: JVector);
    function create(options: JIBodyDefinition): JBody;
    procedure rotate(body: JBody; rotation: Float);
    function nextGroup(isNonColliding: Boolean): Float;
    function nextCategory: Float;
    procedure set(body: JBody; settings: Variant); overload;
    procedure set(body: JBody; settings, value: Variant); overload;
    procedure setMass(body: JBody; mass: Float);
    procedure setDensity(body: JBody; density: Float);
    procedure setInterna(body: JBody; interna: Float);
    procedure setVertices(body: JBody; vertices: array of Variant);
    procedure setParts(body, parts: JBody; autoHull: Boolean);
    procedure setPosition(body: JBody; position: JVector);
    procedure setAngle(body: JBody; angle: Float);
    procedure setVelocity(body: JBody; velocity: JVector);
    procedure setAngularVelocity(body: JBody; velocity: Float);
    procedure setStatic(body: JBody; isStatic: Boolean);
    procedure scale(body: JBody; scaleX, scaleY: Float); overload;
    procedure scale(body: JBody; scaleX, scaleY: Float; point: JVector); overload;
    procedure translate(body: JBody; translation: JVector);
    procedure update(body: JBody; deltaTime, timeScale, correction: Float);
    angle: Float;
    angularSpeed: Float;
    angularVelocity: Float;
    area: Float;
    axes: array of Variant;
    bounds: JBounds;
    density: Float;
    force: JVector;
    friction: Float;
    frictionAir: Float;
    id: Float;
    inertia: Float;
    inverseInertia: Float;
    inverseMass: Float;
    isSleeping: Boolean;
    isStatic: Boolean;
    &label: String;
    mass: Float;
    motion: Float;
    position: JVector;
    render: JIBodyRenderOptions;
    restitution: Float;
    sleepThreshold: Float;
    slop: Float;
    speed: Float;
    timeScale: Float;
    torque: Float;
    &type: String;
    velocity: JVector;
    vertices: array of Variant;
    parts: array of Variant;
    parent: JBody;
    frictionStatic: Float;
    collisionFilter: JICollisionFilter;
  end;

  JBodies = class external 'Bodies'
    function circle(x, y, radius: Float): JBody; overload;
    function circle(x, y, radius: Float; options: JIBodyDefinition): JBody; overload;
    function circle(x, y, radius: Float; options: JIBodyDefinition; maxSides: Float): JBody; overload;
    function polygon(x, y, sides, radius: Float): JBody; overload;
    function polygon(x, y, sides, radius: Float; options: JIBodyDefinition): JBody; overload;
    function rectangle(x, y, width, height: Float): JBody; overload;
    function rectangle(x, y, width, height: Float; options: JIBodyDefinition): JBody; overload;
    function trapezoid(x, y, width, height, slope: Float): JBody; overload;
    function trapezoid(x, y, width, height, slope: Float; options: JIBodyDefinition): JBody; overload;
    function fromVertices(x, y: Float; vertexSets: array of Variant): JBody; overload;
    function fromVertices(x, y: Float; vertexSets: array of Variant; options: JIBodyDefinition): JBody; overload;
    function fromVertices(x, y: Float; vertexSets: array of Variant; options: JIBodyDefinition; flagInternal: Boolean): JBody; overload;
    function fromVertices(x, y: Float; vertexSets: array of Variant; options: JIBodyDefinition; flagInternal: Boolean; removeCollinear: Float): JBody; overload;
    function fromVertices(x, y: Float; vertexSets: array of Variant; options: JIBodyDefinition; flagInternal: Boolean; removeCollinear, minimumArea: Float): JBody; overload;
  end;

  JComposite = class;

  JICompositeDefinition = class external
    bodies: array of Variant; // nullable
    composites: array of Variant; // nullable
    constraints: array of Variant; // nullable
    id: Float; // nullable
    isModified: Boolean; // nullable
    &label: String; // nullable
    parent: JComposite; // nullable
    &type: String; // nullable
  end;

  JIConstraintRenderDefinition = class external
    lineWidth: Float;
    strokeStyle: String;
    visible: Boolean;
  end;

  JIConstraintDefinition = class external
    bodyA: JBody; // nullable
    bodyB: JBody; // nullable
    id: Float; // nullable
    &label: String; // nullable
    _length: Float; // nullable
    pointA: JVector; // nullable
    pointB: JVector; // nullable
    render: JIConstraintRenderDefinition; // nullable
    stiffness: Float; // nullable
    &type: String; // nullable
  end;

  JConstraint = class external 'Constraint'
    function create(options: JIConstraintDefinition): JConstraint;
    bodyA: JBody;
    bodyB: JBody;
    id: Float;
    &label: String;
    _length: Float;
    pointA: JVector;
    pointB: JVector;
    render: JIConstraintRenderDefinition;
    stiffness: Float;
    &type: String;
  end;

  JComposite = class external 'Composite'
    function add(composite: JComposite; &object: Variant {JBody or JComposite or JConstraint}): JComposite;
    function allBodies(composite: JComposite): array of Variant;
    function allComposites(composite: JComposite): array of Variant;
    function allConstraints(composite: JComposite): array of Variant;
    procedure clear(composite: JComposite; keepStatic: Boolean); overload;
    procedure clear(composite: JComposite; keepStatic, deep: Boolean); overload;
    function create: JComposite; overload;
    function create(options: JICompositeDefinition): JComposite; overload;
    function get(composite: JComposite; id: Float; &type: String): Variant {JBody or JComposite or JConstraint};
    function move(compositeA: JComposite; objects: array of Variant; compositeB: JComposite): JComposite;
    function rebase(composite: JComposite): JComposite;
    function remove(composite: JComposite; &object: JBody): JComposite; overload;
    function remove(composite: JComposite; &object: JComposite): JComposite; overload;
    function remove(composite: JComposite; &object: JConstraint): JComposite; overload;
    function remove(composite: JComposite; &object: Variant {JBody or JComposite or JConstraint}; deep: Boolean): JComposite; overload;
    procedure setModified(composite: JComposite; isModified: Boolean); overload;
    procedure setModified(composite: JComposite; isModified, updateParents: Boolean); overload;
    procedure setModified(composite: JComposite; isModified, updateParents, updateChildren: Boolean); overload;
    procedure translate(composite: JComposite; translation: JVector); overload;
    procedure translate(composite: JComposite; translation: JVector; recursive: Boolean); overload;
    procedure rotate(composite: JComposite; rotation: Float; point: JVector); overload;
    procedure rotate(composite: JComposite; rotation: Float; point: JVector; recursive: Boolean); overload;
    procedure scale(composite: JComposite; scaleX, scaleY: Float; point: JVector); overload;
    procedure scale(composite: JComposite; scaleX, scaleY: Float; point: JVector; recursive: Boolean); overload;
    bodies: array of Variant;
    composites: array of Variant;
    constraints: array of Variant;
    id: Float;
    isModified: Boolean;
    &label: String;
    parent: JComposite;
    &type: String;
  end;

  JComposites = class external 'Composites'
    function car(xx, yy, width, height, wheelSize: Float): JComposite;
    function chain(composite: JComposite; xOffsetA, yOffsetA, xOffsetB, yOffsetB: Float; options: Variant): JComposite;
    function mesh(composite: JComposite; columns, rows: Float; crossBrace: Boolean; options: Variant): JComposite;
    function newtonsCradle(xx, yy, _number, size, _length: Float): JComposite;
    function pyramid(xx, yy, columns, rows, columnGap, rowGap: Float; callback: procedure): JComposite;
    function softBody(xx, yy, columns, rows, columnGap, rowGap: Float; crossBrace: Boolean; particleRadius: Float; particleOptions, constraintOptions: Variant): JComposite;
    function stack(xx, yy, columns, rows, columnGap, rowGap: Float; callback: procedure): JComposite;
  end;

  JIEngineTimingOptions = class external
    timeScale: Float;
    timestamp: Float;
  end;

  JIGridDefinition = class external
  end;

  JEngine = class;
  JWorld = class;

  JGrid = class external 'Grid'
    function create: JGrid; overload;
    function create(options: JIGridDefinition): JGrid; overload;
    procedure update(grid: JGrid; bodies: array of Variant; engine: JEngine; forceUpdate: Boolean);
    procedure clear(grid: JGrid);
  end;

  JIEngineDefinition = class external
    positionIterations: Float; // nullable
    velocityIterations: Float; // nullable
    constraintIterations: Float; // nullable
    enableSleeping: Boolean; // nullable
    timing: JIEngineTimingOptions; // nullable
    grid: JGrid; // nullable
    world: JWorld; // nullable
  end;

  JMouse = class external 'Mouse'
    function create(element: JHTMLElement): JMouse;
    procedure setElement(mouse: JMouse; element: JHTMLElement);
    procedure clearSourceEvents(mouse: JMouse);
    procedure setOffset(mouse: JMouse; offset: JVector);
    procedure setScale(mouse: JMouse; scale: JVector);
    element: JHTMLElement;
    absolute: JIMousePoint;
    position: JIMousePoint;
    mousedownPosition: JIMousePoint;
    mouseupPosition: JIMousePoint;
    offset: JIMousePoint;
    scale: JIMousePoint;
    wheelDelta: Float;
    button: Float;
    pixelRatio: Float;
  end;

  JIMouseConstraintDefinition = class external
    constraint: JConstraint; // nullable
    collisionFilter: JICollisionFilter; // nullable
    body: JBody; // nullable
    mouse: JMouse; // nullable
    &type: String; // nullable
  end;

  JRender = class;

  JEngine = class external 'Engine'
    procedure clear(engine: JEngine);
    function create: JEngine; overload;
    function create(element: Variant {JHTMLElement or JIEngineDefinition}): JEngine; overload;
    function create(element: Variant {JHTMLElement or JIEngineDefinition}; options: JIEngineDefinition): JEngine; overload;
    procedure merge(engineA, engineB: JEngine);
    function update(engine: JEngine; delta: Float): JEngine; overload;
    function update(engine: JEngine; delta, correction: Float): JEngine; overload;
    procedure run(enige: JEngine);
    broadphase: JGrid;
    constraintIterations: Float;
    enabled: Boolean;
    enableSleeping: Boolean;
    positionIterations: Float;
    render: JRender;
    timing: JIEngineTimingOptions;
    velocityIterations: Float;
    world: JWorld;
  end;

  JMouseConstraint = class external 'MouseConstraint'
    function create(engine: JEngine; options: JIMouseConstraintDefinition): JMouseConstraint;
    constraint: JConstraint;
    collisionFilter: JICollisionFilter;
    body: JBody;
    mouse: JMouse;
    &type: String;
  end;

  JQuery = class external 'Query'
    function ray(bodies: array of Variant; startPoint, endPoint: JVector): array of Variant; overload;
    function ray(bodies: array of Variant; startPoint, endPoint: JVector; rayWidth: Float): array of Variant; overload;
    function region(bodies: array of Variant; bounds: JBounds): array of Variant; overload;
    function region(bodies: array of Variant; bounds: JBounds; outside: Boolean): array of Variant; overload;
    function point(bodies: array of Variant; point: JVector): array of Variant;
  end;

  JIRendererOptions = class external
    width: Float; // nullable
    height: Float; // nullable
    hasBounds: Boolean; // nullable
  end;

  JIRunnerOptions = class external
    isFixed: Boolean; // nullable
    delta: Float; // nullable
  end;

  JIRenderDefinition = class external
    controller: Variant; // nullable
    element: JHTMLElement; // nullable
    canvas: JHTMLCanvasElement; // nullable
    options: JIRendererOptions; // nullable
    bounds: JBounds; // nullable
    context: JCanvasRenderingContext2D; // nullable
    textures: Variant; // nullable
  end;

  JRender = class external 'Render'
    function create(options: JIRenderDefinition): JRender;
    procedure setPixelRatio(render: JRender; pixelRatio: Float);
    procedure world(engine: JEngine);
    controller: Variant;
    element: JHTMLElement;
    canvas: JHTMLCanvasElement;
    options: JIRendererOptions;
    bounds: JBounds;
    context: JCanvasRenderingContext2D;
    textures: Variant;
  end;

  JRunner = class external 'Runner'
    function create(options: JIRunnerOptions): JRunner;
    function run(runner: JRunner; engine: JEngine): JRunner; overload;
    function run(engine: JEngine): JRunner; overload;
    procedure tick(runner: JRunner; engine: JEngine; time: Float);
    procedure stop(runner: JRunner);
    procedure start(runner: JRunner; engine: JEngine);
    enabled: Boolean;
    isFixed: Boolean;
    delta: Float;
  end;

  JSleeping = class external 'Sleeping'
    procedure set(body: JBody; isSleeping: Boolean);
  end;

  JSvg = class external 'Svg'
    function pathToVertices(path: JSVGPathElement; sampleLength: Float): array of Variant;
  end;

  JVertices = class external 'Vertices'
    function mean(vertices: array of Variant): array of Variant;
    function clockwiseSort(vertices: array of Variant): array of Variant;
    function isConvex(vertices: array of Variant): Boolean;
    function hull(vertices: array of Variant): array of Variant;
    function area(vertices: array of Variant; signed: Boolean): Float;
    function centre(vertices: array of Variant): JVector;
    procedure chamfer(vertices, radius: array of Variant; quality, qualityMin, qualityMax: Float);
    function contains(vertices: array of Variant; point: JVector): Boolean;
    procedure create(points: array of Variant; body: JBody);
    function fromPath(path: String; body: JBody): array of Variant;
    function inertia(vertices: array of Variant; mass: Float): Float;
    procedure rotate(vertices: array of Variant; angle: Float; point: JVector);
    procedure scale(vertices: array of Variant; scaleX, scaleY: Float; point: JVector);
    procedure translate(vertices: array of Variant; vector: JVector; scalar: Float);
  end;

  JIWorldDefinition = class external(JICompositeDefinition)
    gravity: JVector; // nullable
    bounds: JBounds; // nullable
  end;

  JWorld = class external 'World'
    function add(world: JWorld; body: Variant {JBody or array of Variant or JComposite or array of Variant or JConstraint or array of Variant}): JWorld;
    function addBody(world: JWorld; body: JBody): JWorld;
    function addComposite(world: JWorld; composite: JComposite): JWorld;
    function addConstraint(world: JWorld; constraint: JConstraint): JWorld;
    procedure clear(world: JWorld; keepStatic: Boolean);
    function create(options: JIWorldDefinition): JWorld;
    gravity: JVector;
    bounds: JBounds;
  end;

  TEventCallback = procedure(e: Variant);

  JIEvent = class external
    name: String;
//    source: JT;
  end;

  JIEventComposite = class external(JIEvent)
    &object: Variant;
  end;

  JIEventTimestamped = class external(JIEvent)
    timestamp: Float;
  end;

  JIEventCollision = class external(JIEventTimestamped)
    pairs: array of Variant;
  end;

  JEvents = class external 'Events'
    { Event names = (sleepStart, sleepEnd, beforeAdd, afterAdd, beforeRemove,
      afterRemove, afterUpdate, beforeRender, afterRender, beforeUpdate,
      collisionActive, collisionEnd, collisionStart, beforeTick, tick,
      afterTick, beforeRender, afterRender, mousedown, mousemove, mouseup}
    procedure on(obj: JEngine; eventname: String; callback: TEventCallback); overload;
    procedure off(obj: Variant; eventName: String; callback: TEventCallback); overload;
    procedure trigger(&object: Variant; eventNames: String; event: TEventCallback); overload;
  end;

  JIBound = class external
    min: record
      x: Float;
      y: Float;
    end;
    max: record
      x: Float;
      y: Float;
    end;
  end;

  JIPair = class external
    id: Float;
    bodyA: JBody;
    bodyB: JBody;
    contacts: Variant;
    activeContacts: Variant;
    separation: Float;
    isActive: Boolean;
    timeCreated: Float;
    timeUpdated: Float;
    inverseMass: Float;
    friction: Float;
    frictionStatic: Float;
    restitution: Float;
    slop: Float;
  end;
