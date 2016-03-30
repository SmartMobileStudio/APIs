unit FaceBook.SDK;

// Project: https://developers.facebook.com/docs/javascript
// Original TypeScript Definitions by:
//   Joshua Strobl <https://github.com/JoshStrobl>

interface

uses
  W3C.DOM, W3C.HTML5;

type
  JFBUIParams = class external;

  JFBInitParams = class external (JFBUIParams)
    appId: String; // nullable
    authResponse: String; // nullable
    cookie: Boolean; // nullable
    frictionlessRequests: Boolean; // nullable
    hideFlashCallback: procedure; // nullable
    logging: Boolean; // nullable
    status: Boolean; // nullable
    version: String; // nullable
    xfbml: Boolean; // nullable
  end;

  JShareDialogParams = class external (JFBUIParams)
    &method: String;
    href: String;
  end;

  JPageTabDialogParams = class external (JFBUIParams)
    &method: String;
    app_id: String;
    redirect_uri: String; // nullable
    display: Variant; // nullable
  end;

  JRequestsDialogParams = class external (JFBUIParams)
    &method: String;
    app_id: String;
    redirect_uri: String; // nullable
    to: String; // nullable
    message: String;
    action_type: String; // nullable
    object_id: String; // nullable
    filters: Variant {String or record
      name: String;
      user_ids: array of String;
    end};
    suggestions: array of String; // nullable
    exclude_ids: array of String; // nullable
    max_recipients: Float; // nullable
    data: String; // nullable
    title: String; // nullable
  end;

  JSendDialogParams = class external (JFBUIParams)
    &method: String;
    app_id: String;
    redirect_uri: String; // nullable
    display: Variant; // nullable
    to: String; // nullable
    link: String;
  end;

  JPayDialogParams = class external (JFBUIParams)
    &method: String;
    action: String;
    product: String;
    quantity: Float; // nullable
    quantity_min: Float; // nullable
    quantity_max: Float; // nullable
    request_id: String; // nullable
    pricepoint_id: String; // nullable
    test_currency: String; // nullable
  end;

  JFBLoginOptions = class external
    auth_type: String; // nullable
    scope: String; // nullable
    return_scopes: Boolean; // nullable
    enable_profile_selector: Boolean; // nullable
    profile_selector_ids: String; // nullable
  end;

  TResponseObjectHandler = function(fbResponseObject: Variant): Variant;

  JFBSDKEvents = class external
    procedure subscribe(event: String; callback: TResponseObjectHandler);
    procedure unsubscribe(event: String; callback: TResponseObjectHandler);
  end;

  JFBSDKXFBML = class external
    procedure parse; overload;
    procedure parse(ParseElement: JElement); overload;
  end;

  JFBSDKCanvasPrefetcher = class external
    procedure addStaticResource(res: String);
    procedure setCollectionMode(option: String);
  end;

  JFBSDKCanvasSize = class external
    height: Float; // nullable
    width: Float; // nullable
  end;

  JFBSDKCanvasDoneLoading = class external
    time_delta_ms: Float;
  end;

  JFBSDKCanvas = class external 'FBSDKCanvas'
    Prefetcher: JFBSDKCanvasPrefetcher;
    procedure hideFlashElement(element: JElement);
    procedure showFlashElement(element: JElement);
    procedure scrollTo(x, y: Float);
    procedure setAutoGrow(stopTimer: Boolean); overload;
    procedure setAutoGrow(diffInterval: Float); overload;
    procedure setAutoGrow(stopTimer: Boolean; diffInterval: Float); overload;
    procedure setSize(canvasSizeOptions: JFBSDKCanvasSize);
    function setUrlHandler: String; overload;
    function setUrlHandler(handler: procedure): String; overload;
    function setDoneLoading: JFBSDKCanvasDoneLoading; overload;
    function setDoneLoading(handler: procedure): JFBSDKCanvasDoneLoading; overload;
    procedure startTimer;
    procedure stopTimer; overload;
    procedure stopTimer(handler: TResponseObjectHandler); overload;
  end;

  JFBResponseObject = class external
    error: Variant;
  end;

  JFBSDK = class external 'FBSDK'
    procedure init(fbInitObject: JFBInitParams);
    function api(path: String; callback: TResponseObjectHandler): JObject; overload;
    function api(path: String; params: JObject; callback: TResponseObjectHandler): JObject; overload;
    function api(path, method: String; callback: TResponseObjectHandler): JObject; overload;
    function api(path, method: String; params: JObject; callback: TResponseObjectHandler): JObject; overload;
    procedure ui(params: JFBUIParams; handler: TResponseObjectHandler);
    procedure getLoginStatus(handler: TResponseObjectHandler); overload;
    procedure getLoginStatus(handler: TResponseObjectHandler; force: Boolean); overload;
    procedure login(handler: TResponseObjectHandler); overload;
    procedure login(handler: TResponseObjectHandler; params: JFBLoginOptions); overload;
    procedure logout(handler: TResponseObjectHandler);
    function getAuthResponse: JObject;
    Event: JFBSDKEvents;
    XFBML: JFBSDKXFBML;
    Canvas: JFBSDKCanvas;
  end;

	JWindow = partial class external 'Window'
    fbAsyncInit: Variant;
  end;

var FaceBookSDK external 'FB': JFBSDK;
