unit Raphael;

interface

uses
  ECMA.JSON, W3C.HTML5, W3C.SVG1;

type
  JRaphaelSet = class;
  JRaphaelMatrix = class;
  JRaphaelPaper = class;
  JRaphaelStatic = class;

  JBoundingBox = class external
    x: Float;
    y: Float;
    x2: Float;
    y2: Float;
    width: Float;
    height: Float;
  end;

  JRaphaelAnimation = class external
    function delay(delay: Float): JRaphaelAnimation;
    function &repeat(&repeat: Float): JRaphaelAnimation;
  end;

  JRaphaelFont = class external
    w: Float;
    face: Variant;
    glyphs: Variant;
  end;

  JRaphaelAnimateParams = class external
    // property Item[key: String]: Variant;
  end;

  JRaphaelElement = class external
    function animate(params: JRaphaelAnimateParams; ms: Float): JRaphaelElement; overload;
    function animate(params: JRaphaelAnimateParams; ms: Float; easing: String): JRaphaelElement; overload;
    function animate(params: JRaphaelAnimateParams; ms: Float; easing: String; callback: procedure): JRaphaelElement; overload;
    function animate(animation: JRaphaelAnimation): JRaphaelElement; overload;
    function animateWith(el: JRaphaelElement; anim: JRaphaelAnimation; params: Variant; ms: Float): JRaphaelElement; overload;
    function animateWith(el: JRaphaelElement; anim: JRaphaelAnimation; params: Variant; ms: Float; easing: String): JRaphaelElement; overload;
    function animateWith(el: JRaphaelElement; anim: JRaphaelAnimation; params: Variant; ms: Float; easing: String; callback: procedure): JRaphaelElement; overload;
    function animateWith(el: JRaphaelElement; anim: JRaphaelAnimation; animation: JRaphaelAnimation): JRaphaelElement; overload;
    function attr(attrName: String; value: Variant): JRaphaelElement; overload;
    function attr(attrName: String): Variant; overload;
    function attr(attrNames: array of String): array of Variant; overload;
    function attr(params: Variant): JRaphaelElement; overload;
    function click(handler: procedure): JRaphaelElement;
    function clone: JRaphaelElement;
    function data(key: String): Variant; overload;
    function data(key: String; value: Variant): JRaphaelElement; overload;
    function dblclick(handler: procedure): JRaphaelElement;
    function drag(onmove: procedure(dx: Float; dy: Float; x: Float; y: Float; event: JDragEvent); onstart: procedure(x: Float; y: Float; event: JDragEvent); onend: procedure(DragEvent: Variant)): JRaphaelElement; overload;
    function drag(onmove: procedure(dx: Float; dy: Float; x: Float; y: Float; event: JDragEvent); onstart: procedure(x: Float; y: Float; event: JDragEvent); onend: procedure(DragEvent: Variant); mcontext: Variant): JRaphaelElement; overload;
    function drag(onmove: procedure(dx: Float; dy: Float; x: Float; y: Float; event: JDragEvent); onstart: procedure(x: Float; y: Float; event: JDragEvent); onend: procedure(DragEvent: Variant); mcontext: Variant; scontext: Variant): JRaphaelElement; overload;
    function drag(onmove: procedure(dx: Float; dy: Float; x: Float; y: Float; event: JDragEvent); onstart: procedure(x: Float; y: Float; event: JDragEvent); onend: procedure(DragEvent: Variant); mcontext: Variant; scontext: Variant; econtext: Variant): JRaphaelElement; overload;
    function getBBox: JBoundingBox; overload;
    function getBBox(isWithoutTransform: Boolean): JBoundingBox; overload;
    function glow: JRaphaelSet; overload;
    function glow(glow: record
      width: Float; // nullable
      fill: Boolean; // nullable
      opacity: Float; // nullable
      offsetx: Float; // nullable
      offsety: Float; // nullable
      color: String; // nullable
    end): JRaphaelSet; overload;
    function hide: JRaphaelElement;
    function hover(f_in: procedure; f_out: procedure): JRaphaelElement; overload;
    function hover(f_in: procedure; f_out: procedure; icontext: Variant): JRaphaelElement; overload;
    function hover(f_in: procedure; f_out: procedure; icontext: Variant; ocontext: Variant): JRaphaelElement; overload;
    id: String;
    function insertAfter(el: JRaphaelElement): JRaphaelElement;
    function insertBefore(el: JRaphaelElement): JRaphaelElement;
    function isPointInside(x: Float; y: Float): Boolean;
    function isVisible: Boolean;
    matrix: JRaphaelMatrix;
    function mousedown(handler: procedure): JRaphaelElement;
    function mousemove(handler: procedure): JRaphaelElement;
    function mouseout(handler: procedure): JRaphaelElement;
    function mouseover(handler: procedure): JRaphaelElement;
    function mouseup(handler: procedure): JRaphaelElement;
    next: JRaphaelElement;
    node: JSVGElement;
    function onDragOver(f: procedure): JRaphaelElement;
    paper: JRaphaelPaper;
    function pause: JRaphaelElement; overload;
    function pause(anim: JRaphaelAnimation): JRaphaelElement; overload;
    prev: JRaphaelElement;
    raphael: JRaphaelStatic;
    procedure remove;
    function removeData: JRaphaelElement; overload;
    function removeData(key: String): JRaphaelElement; overload;
    function resume: JRaphaelElement; overload;
    function resume(anim: JRaphaelAnimation): JRaphaelElement; overload;
    procedure setTime(anim: JRaphaelAnimation); overload;
    function setTime(anim: JRaphaelAnimation; value: Float): JRaphaelElement; overload;
    function show: JRaphaelElement;
    function status: array of record
      anim: JRaphaelAnimation;
      status: Float;
    end; overload;
    function status(anim: JRaphaelAnimation): Float; overload;
    function status(anim: JRaphaelAnimation; value: Float): JRaphaelElement; overload;
    function stop: JRaphaelElement; overload;
    function stop(anim: JRaphaelAnimation): JRaphaelElement; overload;
    function toBack: JRaphaelElement;
    function toFront: JRaphaelElement;
    function touchcancel(handler: procedure): JRaphaelElement;
    function touchend(handler: procedure): JRaphaelElement;
    function touchmove(handler: procedure): JRaphaelElement;
    function touchstart(handler: procedure): JRaphaelElement;
    function transform: String; overload;
    function transform(tstr: String): JRaphaelElement; overload;
    function unclick(handler: procedure): JRaphaelElement;
    function undblclick(handler: procedure): JRaphaelElement;
    function undrag: JRaphaelElement;
    function unhover: JRaphaelElement; overload;
    function unhover(f_in: procedure; f_out: procedure): JRaphaelElement; overload;
    function unmousedown(handler: procedure): JRaphaelElement;
    function unmousemove(handler: procedure): JRaphaelElement;
    function unmouseout(handler: procedure): JRaphaelElement;
    function unmouseover(handler: procedure): JRaphaelElement;
    function unmouseup(handler: procedure): JRaphaelElement;
    function untouchcancel(handler: procedure): JRaphaelElement;
    function untouchend(handler: procedure): JRaphaelElement;
    function untouchmove(handler: procedure): JRaphaelElement;
    function untouchstart(handler: procedure): JRaphaelElement;
  end;

  JRaphaelPath = class external(JRaphaelElement)
    function getPointAtLength(_length: Float): record
      x: Float;
      y: Float;
      alpha: Float;
    end;
    function getSubpath(from: Float; to: Float): String;
    function getTotalLength: Float;
  end;

  JRaphaelSet = class external
    procedure clear;
    function exclude(element: JRaphaelElement): Boolean;
    function forEach(callback: procedure): JRaphaelSet; overload;
    function forEach(callback: procedure; thisArg: Variant): JRaphaelSet; overload;
    function pop: JRaphaelElement;
    function push(RaphaelElement: array of Variant): JRaphaelSet;
    function splice(index: Float; count: Float): JRaphaelSet; overload;
    function splice(index: Float; count: Float; insertion: array of JRaphaelElement): JRaphaelSet; overload;
    _length: Float;
    // property Item[key: Integer]: JRaphaelElement;
    function animate(params: JRaphaelAnimateParams; ms: Float): JRaphaelSet; overload;
    function animate(params: JRaphaelAnimateParams; ms: Float; easing: String): JRaphaelSet; overload;
    function animate(params: JRaphaelAnimateParams; ms: Float; easing: String; callback: procedure): JRaphaelSet; overload;
    function animate(animation: JRaphaelAnimation): JRaphaelSet; overload;
    function animateWith(el: JRaphaelElement; anim: JRaphaelAnimation; params: Variant; ms: Float): JRaphaelSet; overload;
    function animateWith(el: JRaphaelElement; anim: JRaphaelAnimation; params: Variant; ms: Float; easing: String): JRaphaelSet; overload;
    function animateWith(el: JRaphaelElement; anim: JRaphaelAnimation; params: Variant; ms: Float; easing: String; callback: procedure): JRaphaelSet; overload;
    function animateWith(el: JRaphaelElement; anim: JRaphaelAnimation; animation: JRaphaelAnimation): JRaphaelSet; overload;
    function attr(attrName: String; value: Variant): JRaphaelSet; overload;
(* TODO
    function attr(params: record
      // property Item[key: String]: Variant;
    end): JRaphaelSet; overload;
*)
    function attr(attrName: String): Variant; overload;
    function attr(attrNames: array of String): array of Variant; overload;
    function click(handler: procedure): JRaphaelSet;
    function clone: JRaphaelSet;
    function data(key: String): Variant; overload;
    function data(key: String; value: Variant): JRaphaelSet; overload;
    function dblclick(handler: procedure): JRaphaelSet;
    function drag(onmove: procedure(dx: Float; dy: Float; x: Float; y: Float; event: JDragEvent); onstart: procedure(x: Float; y: Float; event: JDragEvent); onend: procedure(DragEvent: Variant)): JRaphaelSet; overload;
    function drag(onmove: procedure(dx: Float; dy: Float; x: Float; y: Float; event: JDragEvent); onstart: procedure(x: Float; y: Float; event: JDragEvent); onend: procedure(DragEvent: Variant);  mcontext: Variant): JRaphaelSet; overload;
    function drag(onmove: procedure(dx: Float; dy: Float; x: Float; y: Float; event: JDragEvent); onstart: procedure(x: Float; y: Float; event: JDragEvent); onend: procedure(DragEvent: Variant);  mcontext, scontext: Variant): JRaphaelSet; overload;
    function drag(onmove: procedure(dx: Float; dy: Float; x: Float; y: Float; event: JDragEvent); onstart: procedure(x: Float; y: Float; event: JDragEvent); onend: procedure(DragEvent: Variant);  mcontext, scontext, econtext: Variant): JRaphaelSet; overload;
    function getBBox: JBoundingBox; overload;
    function getBBox(isWithoutTransform: Boolean): JBoundingBox; overload;
    function glow: JRaphaelSet; overload;
    function glow(glow: record
      width: Float; // nullable
      fill: Boolean; // nullable
      opacity: Float; // nullable
      offsetx: Float; // nullable
      offsety: Float; // nullable
      color: String; // nullable
    end): JRaphaelSet; overload;
    function hide: JRaphaelSet;
    function hover(f_in: procedure; f_out: procedure): JRaphaelSet; overload;
    function hover(f_in: procedure; f_out: procedure; icontext: Variant): JRaphaelSet; overload;
    function hover(f_in: procedure; f_out: procedure; icontext: Variant; ocontext: Variant): JRaphaelSet; overload;
    id: String;
    function insertAfter(el: JRaphaelElement): JRaphaelSet;
    function insertBefore(el: JRaphaelElement): JRaphaelSet;
    function isPointInside(x: Float; y: Float): Boolean;
    function isVisible: Boolean;
    matrix: JRaphaelMatrix;
    function mousedown(handler: procedure): JRaphaelSet;
    function mousemove(handler: procedure): JRaphaelSet;
    function mouseout(handler: procedure): JRaphaelSet;
    function mouseover(handler: procedure): JRaphaelSet;
    function mouseup(handler: procedure): JRaphaelSet;
    next: JRaphaelSet;
    function onDragOver(f: procedure): JRaphaelSet;
    paper: JRaphaelPaper;
    function pause: JRaphaelSet; overload;
    function pause(anim: JRaphaelAnimation): JRaphaelSet; overload;
    prev: JRaphaelSet;
    raphael: JRaphaelStatic;
    procedure remove;
    function removeData: JRaphaelSet; overload;
    function removeData(key: String): JRaphaelSet; overload;
    function resume: JRaphaelSet; overload;
    function resume(anim: JRaphaelAnimation): JRaphaelSet; overload;
    procedure setTime(anim: JRaphaelAnimation); overload;
    function setTime(anim: JRaphaelAnimation; value: Float): JRaphaelSet; overload;
    function show: JRaphaelSet;
    function status: array of record
      anim: JRaphaelAnimation;
      status: Float;
    end;
    function status(anim: JRaphaelAnimation): Float; overload;
    function status(anim: JRaphaelAnimation; value: Float): JRaphaelSet; overload;
    function stop: JRaphaelSet; overload;
    function stop(anim: JRaphaelAnimation): JRaphaelSet; overload;
    function toBack: JRaphaelSet;
    function toFront: JRaphaelSet;
    function touchcancel(handler: procedure): JRaphaelSet;
    function touchend(handler: procedure): JRaphaelSet;
    function touchmove(handler: procedure): JRaphaelSet;
    function touchstart(handler: procedure): JRaphaelSet;
    function transform: String; overload;
    function transform(tstr: String): JRaphaelSet; overload;
    function unclick(handler: procedure): JRaphaelSet;
    function undblclick(handler: procedure): JRaphaelSet;
    function undrag: JRaphaelSet;
    function unhover: JRaphaelSet; overload;
    function unhover(f_in: procedure; f_out: procedure): JRaphaelSet; overload;
    function unmousedown(handler: procedure): JRaphaelSet;
    function unmousemove(handler: procedure): JRaphaelSet;
    function unmouseout(handler: procedure): JRaphaelSet;
    function unmouseover(handler: procedure): JRaphaelSet;
    function unmouseup(handler: procedure): JRaphaelSet;
    function untouchcancel(handler: procedure): JRaphaelSet;
    function untouchend(handler: procedure): JRaphaelSet;
    function untouchmove(handler: procedure): JRaphaelSet;
    function untouchstart(handler: procedure): JRaphaelSet;
  end;

  JRaphaelMatrix = class external
    function add(a: Float; b: Float; c: Float; d: Float; e: Float; f: Float; matrix: JRaphaelMatrix): JRaphaelMatrix;
    function clone: JRaphaelMatrix;
    function invert: JRaphaelMatrix;
    procedure rotate(a: Float; x: Float; y: Float);
    procedure scale(x: Float); overload;
    procedure scale(x: Float; y: Float); overload;
    procedure scale(x: Float; y: Float; cx: Float); overload;
    procedure scale(x: Float; y: Float; cx: Float; cy: Float); overload;
    function split: record
      dx: Float;
      dy: Float;
      scalex: Float;
      scaley: Float;
      shear: Float;
      rotate: Float;
      isSimple: Boolean;
    end;
    function toTransformString: String;
    procedure translate(x: Float; y: Float);
    function x(x: Float; y: Float): Float;
    function y(x: Float; y: Float): Float;
  end;

  JRaphaelPaper = class external
    function add(JSON: Variant): JRaphaelSet;
    bottom: JRaphaelElement;
    canvas: JSVGSVGElement;
    function circle(x: Float; y: Float; r: Float): JRaphaelElement;
    procedure clear;
    defs: JSVGDefsElement;
    function ellipse(x: Float; y: Float; rx: Float; ry: Float): JRaphaelElement;
    function forEach(callback: function(el: JRaphaelElement): Boolean): JRaphaelPaper; overload;
    function forEach(callback: function(el: JRaphaelElement): Boolean; thisArg: Variant): JRaphaelPaper; overload;
    function getById(id: Float): JRaphaelElement;
    function getElementByPoint(x: Float; y: Float): JRaphaelElement;
    function getElementsByPoint(x: Float; y: Float): JRaphaelSet;
    function getFont(family: String): JRaphaelFont; overload;
    function getFont(family: String; weight: String): JRaphaelFont; overload;
    function getFont(family: String; weight: String; style: String): JRaphaelFont; overload;
    function getFont(family: String; weight: String; style: String; stretch: String): JRaphaelFont; overload;
    function getFont(family: String; weight: Float): JRaphaelFont; overload;
    function getFont(family: String; weight: Float; style: String): JRaphaelFont; overload;
    function getFont(family: String; weight: Float; style: String; stretch: String): JRaphaelFont; overload;
    height: Float;
    function image(src: String; x: Float; y: Float; width: Float; height: Float): JRaphaelElement;
    function path: JRaphaelPath; overload;
    function path(pathString: String): JRaphaelPath; overload;
    function print(x: Float; y: Float; str: String; font: JRaphaelFont): JRaphaelPath; overload;
    function print(x: Float; y: Float; str: String; font: JRaphaelFont; size: Float): JRaphaelPath; overload;
    function print(x: Float; y: Float; str: String; font: JRaphaelFont; size: Float; origin: String): JRaphaelPath; overload;
    function print(x: Float; y: Float; str: String; font: JRaphaelFont; size: Float; origin: String; letter_spacing: Float): JRaphaelPath; overload;
    function rect(x: Float; y: Float; width: Float; height: Float): JRaphaelElement; overload;
    function rect(x: Float; y: Float; width: Float; height: Float; r: Float): JRaphaelElement; overload;
    procedure remove;
    procedure renderfix;
    procedure safari;
    function set: JRaphaelSet; overload;
    function set(elements: array of JRaphaelElement): JRaphaelSet; overload;
    function setFinish: JRaphaelSet;
    procedure setSize(width, height: Float);
    procedure setStart;
    procedure setViewBox(x, y, w, h: Float; fit: Boolean);
    function text(x: Float; y: Float; text: String): JRaphaelElement;
    top: JRaphaelElement;
    width: Float;
  end;

  JRaphaelStatic = class external
(* TODO
    function(container: JHTMLElement; width: Float; height: Float; callback: procedure): JRaphaelPaper;
    function(container: String; width: Float; height: Float; callback: procedure): JRaphaelPaper;
    function(x: Float; y: Float; width: Float; height: Float; callback: procedure): JRaphaelPaper;
    function(all: array of Variant; callback: procedure): JRaphaelPaper;
    function(onReadyCallback: procedure): JRaphaelPaper;
*)
    function angle(x1: Float; y1: Float; x2: Float; y2: Float): Float; overload;
    function angle(x1: Float; y1: Float; x2: Float; y2: Float; x3: Float): Float; overload;
    function angle(x1: Float; y1: Float; x2: Float; y2: Float; x3: Float; y3: Float): Float; overload;
    function animation(params: Variant; ms: Float): JRaphaelAnimation; overload;
    function animation(params: Variant; ms: Float; easing: String): JRaphaelAnimation; overload;
    function animation(params: Variant; ms: Float; easing: String; callback: procedure): JRaphaelAnimation; overload;
    function bezierBBox(p1x: Float; p1y: Float; c1x: Float; c1y: Float; c2x: Float; c2y: Float; p2x: Float; p2y: Float): record
      min: record
        x: Float;
        y: Float;
      end;
      max: record
        x: Float;
        y: Float;
      end;
    end; overload;
    function bezierBBox(bez: array of Variant): record
      min: record
        x: Float;
        y: Float;
      end;
      max: record
        x: Float;
        y: Float;
      end;
    end; overload;
    function color(clr: String): record
      r: Float;
      g: Float;
      b: Float;
      hex: String;
      error: Boolean;
      h: Float;
      s: Float;
      v: Float;
      l: Float;
    end;
    function createUUID: String;
    function deg(deg: Float): Float;
    easing_formulas: Variant;
    el: Variant;
    function findDotsAtSegment(p1x: Float; p1y: Float; c1x: Float; c1y: Float; c2x: Float; c2y: Float; p2x: Float; p2y: Float; t: Float): record
      x: Float;
      y: Float;
      m: record
        x: Float;
        y: Float;
      end;
      n: record
        x: Float;
        y: Float;
      end;
      start: record
        x: Float;
        y: Float;
      end;
      &end: record
        x: Float;
        y: Float;
      end;
      alpha: Float;
    end;
    fn: Variant;
    function format(token: String; parameters: array of Variant): String;
    function fullfill(token: String; json: JJSON): String;
(* TODO
    getColor: record
      function(value: Float): String;
      procedure reset;
    end;
*)
    function getPointAtLength(path: String; _length: Float): record
      x: Float;
      y: Float;
      alpha: Float;
    end;
    function getRGB(colour: String): record
      r: Float;
      g: Float;
      b: Float;
      hex: String;
      error: Boolean;
    end;
    function getSubpath(path: String; from: Float; to: Float): String;
    function getTotalLength(path: String): Float;
    function hsb(h: Float; s: Float; b: Float): String;
    function hsb2rgb(h: Float; s: Float; v: Float): record
      r: Float;
      g: Float;
      b: Float;
      hex: String;
    end;
    function hsl(h: Float; s: Float; l: Float): String;
    function hsl2rgb(h: Float; s: Float; l: Float): record
      r: Float;
      g: Float;
      b: Float;
      hex: String;
    end;
    function &is(o: Variant; &type: String): Boolean;
    function isBBoxIntersect(bbox1: String; bbox2: String): Boolean;
    function isPointInsideBBox(bbox: String; x: Float; y: Float): Boolean;
    function isPointInsidePath(path: String; x: Float; y: Float): Boolean;
    function matrix(a: Float; b: Float; c: Float; d: Float; e: Float; f: Float): JRaphaelMatrix;
    procedure ninja;
    function parsePathString(pathString: String): array of String; overload;
    function parsePathString(pathString: array of String): array of String; overload;
    function parseTransformString(TString: String): array of String; overload;
    function parseTransformString(TString: array of String): array of String; overload;
    function path2curve(pathString: String): array of String; overload;
    function path2curve(pathString: array of String): array of String; overload;
    function pathBBox(path: String): JBoundingBox;
    function pathIntersection(path1: String; path2: String): array of record
      x: Float;
      y: Float;
      t1: Float;
      t2: Float;
      segment1: Float;
      segment2: Float;
      bez1: array of Variant;
      bez2: array of Variant;
    end;
    function pathToRelative(pathString: String): array of String; overload;
    function pathToRelative(pathString: array of String): array of String; overload;
    function rad(deg: Float): Float;
    function registerFont(font: JRaphaelFont): JRaphaelFont;
    function rgb(r: Float; g: Float; b: Float): String;
    function rgb2hsb(r: Float; g: Float; b: Float): record
      h: Float;
      s: Float;
      b: Float;
    end;
    function rgb2hsl(r: Float; g: Float; b: Float): record
      h: Float;
      s: Float;
      l: Float;
    end;
    procedure setWindow(newwin: JWindow);
    function snapTo(values: Float; value: Float): Float; overload;
    function snapTo(values: Float; value: Float; tolerance: Float): Float; overload;
    function snapTo(values: array of Float; value: Float): Float; overload;
    function snapTo(values: array of Float; value: Float; tolerance: Float): Float; overload;
    st: Variant;
    svg: Boolean;
    function toMatrix(path: String; transform: String): JRaphaelMatrix; overload;
    function toMatrix(path: String; transform: array of String): JRaphaelMatrix; overload;
    function transformPath(path: String; transform: String): String; overload;
    function transformPath(path: String; transform: array of String): String; overload;
    &type: String;
    vml: Boolean;
  end;

var Raphael external 'Raphael': JRaphaelStatic;
