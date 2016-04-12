unit JohnnyFive;

interface

type
  JAccelerometer = class external 'johnny-five.Accelerometer'
    constructor Create(option: Variant {JAccelerometerGeneralOption or JAccelerometerAnalogOption or JAccelerometerMPU6050Option or JAccelerometerMMA7361Option});
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jchange; cb: procedure);
// TODO:    procedure on(event: Jdata; cb: procedure(freq: Variant));
    procedure hasAxis(name: String);
    procedure enable;
    procedure disable;
  end;

  JAnimation = class external 'johnny-five.Animation'
    constructor Create(option: Variant {JServo or JArray{<JServo>});
    procedure enqueue(segment: Variant);
    procedure play;
    procedure pause;
    procedure stop;
    procedure next;
    procedure speed(speed: array of Float);
    target: Float;
    duration: Float;
    cuePoints: array of Float;
    keyFrames: Float;
    easing: String;
    loop: Boolean;
    loopback: Float;
    metronomic: Boolean;
    progress: Float;
    currentSpeed: Float;
    fps: Float;
  end;

  JButton = class external 'johnny-five.Button'
    constructor Create(pin: Variant {Float or String or JButtonOptions});
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jhold; cb: procedure(holdTime: Float));
// TODO:    procedure on(event: Jdown; cb: procedure);
// TODO:    procedure on(event: Jpress; cb: procedure);
// TODO:    procedure on(event: Jup; cb: procedure);
// TODO:    procedure on(event: Jrelease; cb: procedure);
  end;

  JBoardOptions = class external
    id: Variant {Float or String}; // nullable
    port: Variant {String or Variant}; // nullable
    repl: Boolean; // nullable
  end;

  JPinState = class external
    supportedModes: array of Float;
    mode: Float;
    value: Float;
    report: Float;
    analogChannel: Float;
  end;

  JPin = class external 'johnny-five.Pin'
    constructor Create(option: Variant {Float or String or JPinOption});
    procedure query(cb: procedure(pin: JPinState));
    procedure high;
    procedure low;
    procedure read(cb: procedure(value: Float)); overload;
    procedure read(pin: Integer; cb: procedure(data: Float)); overload;
    procedure write(value: Float); overload;
    procedure write(pin: Integer; value: Float); overload;
  end;

  JRepl = class external
    procedure inject(&object: Variant);
  end;

  JBoard = class external 'johnny-five.Board'
    constructor Create(option: JBoardOptions);
    procedure on(event: String; cb: procedure);
//    procedure on(event: Jready; cb: procedure);
//    procedure on(event: Jconnect; cb: procedure);
    procedure pinMode(pin: Integer; mode: Float);
    procedure analogWrite(pin: Integer; value: Float);
    procedure analogRead(pin: Integer; cb: procedure(item: Float));
    procedure digitalWrite(pin: Integer; value: Float);
    procedure digitalRead(pin: Integer; cb: procedure(item: Float));
    procedure shiftOut(dataPin: JPin; clockPin: JPin; isBigEndian: Boolean; value: Float);
    procedure wait(ms: Float; cb: procedure);
    procedure loop(ms: Float; cb: procedure);
    isReady: Boolean;
    io: Variant;
    id: String;
    pins: array of JPin;
    port: String;
    inject: JRepl;
  end;

  JAccelerometerOption = class external
    controller: String;
  end;

  JAccelerometerGeneralOption = class external
    controller: String; // nullable
  end;

  JAccelerometerAnalogOption = class external(JAccelerometerGeneralOption)
    pins: array of String;
    sensitivity: Float; // nullable
    aref: Float; // nullable
    zeroV: Variant {Float or array of Float}; // nullable
    autoCalibrate: Boolean; // nullable
  end;

  JAccelerometerMPU6050Option = class external(JAccelerometerGeneralOption)
    sensitivity: Float; // nullable
  end;

  JAccelerometerMMA7361Option = class external(JAccelerometerGeneralOption)
    sleepPin: Variant {Float or String}; // nullable
  end;

  JButtonOptions = class external
    pin: Variant {Float or String};
    invert: Boolean; // nullable
    isPullup: Boolean; // nullable
    holdtime: Float; // nullable
  end;

  JCompassOptions = class external
    controller: String;
    gauss: Float; // nullable
  end;

  JESCOption = class external
    pin: Variant {Float or String};
    range: array of Float; // nullable
    startAt: Float; // nullable
  end;

  JGyroGeneralOption = class external
    controller: String; // nullable
  end;

  JGyroAnalogOption = class external(JGyroGeneralOption)
    pins: array of String;
    sensitivity: Float;
    resolution: Float; // nullable
  end;

  JGyroMPU6050Option = class external(JGyroGeneralOption)
    sensitivity: Float;
  end;

  JIMUGeneralOption = class external
    controller: String; // nullable
    freq: Float; // nullable
  end;

  JIMUMPU6050Option = class external(JIMUGeneralOption)
    address: Float;
  end;

  JJoystickOption = class external
    pins: array of String;
  end;

  JLCDGeneralOption = class external
    rows: Float; // nullable
    cols: Float; // nullable
  end;

  JLCDI2COption = class external(JLCDGeneralOption)
    controller: String;
    backlight: Float; // nullable
  end;

  JLCDParallelOption = class external(JLCDGeneralOption)
    pins: array of Variant;
    backlight: Float; // nullable
  end;

  JLedOption = class external
    pin: Integer;
    &type: String; // nullable
    controller: String; // nullable
    address: Float; // nullable
    isAnode: Boolean; // nullable
  end;

  JMotorOption = class external
    pins: Variant;
    current: Variant; // nullable
    invertPWM: Boolean; // nullable
    address: Float; // nullable
    controller: String; // nullable
    register: Variant; // nullable
    bits: Variant; // nullable
  end;

  JPiezoOption = class external
    pin: Integer;
  end;

  JPinOption = class external
    id: Variant {Float or String}; // nullable
    pin: Variant {Float or String};
    &type: String; // nullable
  end;

  JPingOption = class external
    pin: Variant {Float or String};
    freq: Float; // nullable
    pulse: Float; // nullable
  end;

  JRelayOption = class external
    pin: Variant {Float or String};
    &type: String; // nullable
  end;

  JSensorOption = class external
    pin: Variant {Float or String};
    freq: Boolean; // nullable
    threshold: Float; // nullable
  end;

  JServoGeneralOption = class external
    pin: Variant {Float or String};
    range: array of Float; // nullable
    &type: String; // nullable
    startAt: Float; // nullable
    isInverted: Boolean; // nullable
    center: Boolean; // nullable
    controller: String; // nullable
  end;

  JServoPCA9685Option = class external(JServoGeneralOption)
    address: Float; // nullable
  end;

  JServoSweepOpts = class external
    range: array of Float;
    interval: Float; // nullable
    step: Float; // nullable
  end;

  JShiftRegisterOption = class external
    pins: Variant;
  end;

  JSonarOption = class external
    pin: Variant {Float or String};
    device: String;
    freq: Float; // nullable
    threshold: Float; // nullable
  end;

  JStepperOption = class external
    pins: Variant;
    stepsPerRev: Float;
    &type: Float;
    rpm: Float; // nullable
    direction: Float; // nullable
  end;

  JTemperatureOption = class external
    controller: String; // nullable
    pin: Variant {String or Float};
    toCelsius: function(val: Float): Float; // nullable
    freq: Float; // nullable
  end;

  JCompass = class external 'johnny-five.Compass'
    constructor Create(option: JCompassOptions);
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jchange; cb: procedure);
// TODO:    procedure on(event: Jdata; cb: procedure(data: Variant));
  end;

  JESC = class external 'johnny-five.ESC'
    constructor Create(option: Variant {Float or String or JESCOption});
    procedure speed(value: Float);
    procedure min;
    procedure max;
    procedure stop;
  end;

  JGyro = class external 'johnny-five.Gyro'
    constructor Create(option: Variant {JGyroGeneralOption or JGyroAnalogOption or JGyroMPU6050Option});
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jchange; cb: procedure);
// TODO:    procedure on(event: Jdata; cb: procedure(data: Variant));
    procedure recalibrate;
  end;

  JIMU = class external 'johnny-five.IMU'
    constructor Create(option: Variant {JIMUGeneralOption or JIMUMPU6050Option});
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jchange; cb: procedure);
// TODO:    procedure on(event: Jdata; cb: procedure(data: Variant));
  end;

  JJoystick = class external 'johnny-five.Joystick'
    constructor Create(option: JJoystickOption);
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jdata; cb: procedure(data: Variant));
// TODO:    procedure on(event: Jchange; cb: procedure);
// TODO:    procedure on(event: Jaxismove; cb: procedure(error: JError; date: JDate));
    axis: array of Float;
    raw: array of Float;
  end;

  JLCD = class external 'johnny-five.LCD'
    constructor Create(option: Variant {JLCDGeneralOption or JLCDI2COption or JLCDParallelOption});
    procedure print(message: String);
    procedure useChar(char: String);
    procedure clear;
    procedure cursor(row, col: Integer);
    procedure home;
    procedure display;
    procedure noDisplay;
    procedure blink;
    procedure noBlink;
    procedure autoscroll;
    procedure noAutoscroll;
  end;

  JLed = class external 'johnny-five.Led'
    constructor Create(option: Variant {Float or JLedOption});
    procedure on;
    procedure off;
    procedure toggle;
    procedure strobe(ms: Float);
    procedure blink; overload;
    procedure blink(ms: Float); overload;
    procedure brightness(val: Float);
    procedure fade(brightness: Float; ms: Float);
    procedure fadeIn(ms: Float);
    procedure fadeOut(ms: Float);
    procedure pulse(ms: Float);
    procedure stop(ms: Float);
  end;

  JMotor = class external 'johnny-five.Motor'
    constructor Create(option: Variant {array of Float or JMotorOption});
    procedure forward(speed: Float);
    procedure fwd(speed: Float);
    procedure reverse(speed: Float);
    procedure rev(speed: Float);
    procedure start; overload;
    procedure start(speed: Float); overload;
    procedure stop;
    procedure brake;
    procedure release;
  end;

  JPiezo = class external 'johnny-five.Piezo'
    constructor Create(option: Variant {Float or JPiezoOption});
    procedure frequency(frequency, duration: Float);
    procedure play(tune: Variant); overload;
    procedure play(tune: Variant; cb: procedure); overload;
    procedure tone(frequency, duration: Float);
    procedure noTone;
    procedure off;
  end;

  JPing = class external 'johnny-five.Ping'
    constructor Create(option: Variant {Float or JPingOption});
  end;

  JRelay = class external 'johnny-five.Relay'
    constructor Create(option: Variant {Float or JRelayOption});
    procedure open;
    procedure close;
    procedure toggle;
  end;

  JSensor = class external 'johnny-five.Sensor'
    constructor Create(option: Variant {Float or String or JSensorOption});
    function scale(_low, _high: Float): JSensor; overload;
    function scale(range: array of Float): JSensor; overload;
    function scale: JSensor; overload;
    function booleanAt(barrier: Float): Boolean;
    procedure within(range: array of Float; cb: procedure);
    procedure on(event: String; cb: procedure);
// TODO:   procedure on(event: Jdata; cb: procedure(data: Variant));
// TODO:   procedure on(event: Jchange; cb: procedure);
  end;

  JServo = class external 'johnny-five.Servo'
    constructor Create(option: Variant {Float or String or JServoGeneralOption});
    procedure to(degrees: Float); overload;
    procedure to(degrees, ms: Float); overload;
    procedure to(degrees, ms, rage: Float); overload;
    procedure min;
    procedure max;
    procedure center;
    procedure sweep; overload;
    procedure sweep(range: array of Float); overload;
    procedure sweep(opt: JServoSweepOpts); overload;
    procedure stop;
    procedure cw(speed: Float);
    procedure ccw(speed: Float);
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jmove:complete; cb: procedure);
  end;

  JShiftRegister = class external 'johnny-five.ShiftRegister'
    constructor Create(option: JShiftRegisterOption);
    procedure send(value: array of Float);
  end;

  JSonar = class external 'johnny-five.Sonar'
    constructor Create(option: Variant {Float or String or JSonarOption});
    procedure within(range: array of Float; cb: procedure); overload;
    procedure within(range: array of Float; &unit: String; cb: procedure); overload;
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jdata; cb: procedure(data: Variant));
// TODO:    procedure on(event: Jchange; cb: procedure);
  end;

  JStepper = class external 'johnny-five.Stepper'
    constructor Create(option: Variant {Float or String or JStepperOption});
    procedure step(stepsOrOpts: Variant; cb: procedure);
    function rpm: JStepper; overload;
    function rpm(value: Float): JStepper; overload;
    function speed: JStepper; overload;
    function speed(value: Float): JStepper; overload;
    function direction: JStepper; overload;
    function direction(value: Float): JStepper; overload;
    function accel: JStepper; overload;
    function accel(value: Float): JStepper; overload;
    function decel: JStepper; overload;
    function decel(value: Float): JStepper; overload;
    function cw: JStepper;
    function ccw: JStepper;
    procedure within(range: array of Float; cb: procedure); overload;
    procedure within(range: array of Float; &unit: String; cb: procedure); overload;
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jdata; cb: procedure(data: Variant));
// TODO:    procedure on(event: Jchange; cb: procedure);
  end;

  JTemperature = class external 'johnny-five.Temperature'
    constructor Create(option: JTemperatureOption);
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jdata; cb: procedure(data: Variant));
// TODO:    procedure on(event: Jchange; cb: procedure);
  end;

  JMotion = class external 'johnny-five.IR.Motion'
    constructor Create(option: Variant {Float or JMotionOption});
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jdata; cb: procedure(data: Variant));
// TODO:    procedure on(event: Jmotionstart; cb: procedure);
// TODO:    procedure on(event: Jmotionend; cb: procedure);
// TODO:    procedure on(event: Jcalibrated; cb: procedure);
  end;

  JProximity = class external 'johnny-five.IR.Proximity'
    constructor Create(option: Variant {Float or JPloximityOption});
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jdata; cb: procedure(data: Variant));
// TODO:    procedure on(event: Jchange; cb: procedure);
  end;

  JMotionOption = class external
    pin: Variant {Float or String};
  end;

  JPloximityOption = class external
    pin: Variant {Float or String};
    controller: String;
  end;

  JArrayOption = class external
    pins: Variant {array of Float or array of String};
    emitter: Variant {Float or String};
    freq: Float; // nullable
  end;

  JLoadCalibrationOption = class external
    min: array of Float;
    max: array of Float;
  end;

  JArray = class external 'johnny-five.Reflect.Array'
    constructor Create(option: JArrayOption);
    procedure enable;
    procedure disable;
    procedure calibrate;
    procedure calibrateUntil(predicate: procedure);
    procedure loadCalibration(option: JLoadCalibrationOption);
    procedure on(event: String; cb: procedure);
// TODO:    procedure on(event: Jdata; cb: procedure(data: Variant));
// TODO:    procedure on(event: JcalibratedData; cb: procedure(data: Variant));
// TODO:    procedure on(event: Jline; cb: procedure(data: Variant));
  end;

  JDigitsOption = class external
    pins: Variant;
    devices: Float; // nullable
  end;

  JMatrixOption = class external
    pins: Variant;
    devices: Float; // nullable
  end;

  JMatrixIC2Option = class external
    controller: String;
    addresses: JArray{<Variant>}; // nullable
    isBicolor: Boolean; // nullable
    dims: Variant; // nullable
    rotation: Float; // nullable
  end;

  JRGBOption = class external
    pins: array of Float;
    isAnode: Boolean; // nullable
    controller: String; // nullable
  end;

  JTYPE = class external 'johnny-five.Stepper.TYPE'
    DRIVER: Float;
    TWO_WIRE: Float;
    FOUR_WIRE: Float;
  end;

  JDigits = class external 'johnny-five.Led.Digits'
    constructor Create(option: JDigitsOption);
    procedure on; overload;
    procedure on(index: Integer); overload;
    procedure off; overload;
    procedure off(index: Integer); overload;
    procedure clear; overload;
    procedure clear(index: Integer); overload;
    procedure brightness(value: Float); overload;
    procedure brightness(index: Integer; value: Float); overload;
    procedure draw(position, character: Integer); overload;
    procedure draw(index, position, character: Integer); overload;
  end;

  JMatrix = class external 'johnny-five.Led.Matrix'
    constructor Create(option: Variant {JMatrixOption or JMatrixIC2Option});
    procedure on; overload;
    procedure on(index: Integer); overload;
    procedure off; overload;
    procedure off(index: Integer); overload;
    procedure clear; overload;
    procedure clear(index: Integer); overload;
    procedure brightness(value: Float); overload;
    procedure brightness(index: Integer; value: Float); overload;
    procedure led(row, col: Integer; state: Variant); overload;
    procedure led(index, row, col: Integer; state: Variant); overload;
    procedure row(row: Integer; val: Float); overload;
    procedure row(index, row: Integer; val: Float); overload;
    procedure column(row: Integer; val: Float); overload;
    procedure column(index, row: Integer; val: Float); overload;
    procedure draw(position, character: Integer); overload;
    procedure draw(index, position, character: Integer); overload;
  end;

  JRGB = class external 'johnny-five.Led.RGB'
    constructor Create(option: JRGBOption);
    procedure on;
    procedure off;
    procedure color(value: Float);
    procedure toggle;
    procedure strobe(ms: Float);
    procedure brightness(value: Float);
    procedure fadeIn(ms: Float);
    procedure fadeOut(ms: Float);
    procedure pulse(ms: Float);
    procedure stop(ms: Float);
  end;
