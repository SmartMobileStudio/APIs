unit Meteor;

interface

uses
  ECMA.RegEx;

type
  JEJSONable = class external
    // property Item[key: String]: Variant {Float or String or Boolean or JObject or array of Float or array of String or array of JObject or JDate or JUint8Array or JEJSON.CustomType};
  end;

  JJSONable = class external
    // property Item[key: String]: Variant {Float or String or Boolean or JObject or array of Float or array of String or array of JObject};
  end;

  JEJSON = class external(JEJSONable)
  end;

  JMailComposerOptions = class external
    escapeSMTP: Boolean;
    encoding: String;
    charset: String;
    keepBcc: Boolean;
    forceEmbeddedImages: Boolean;
  end;

  JMailComposerStatic = class external
    constructor CreateJMailComposer;
  end;

  JMailComposer = class external
    procedure addHeader(name, value: String);
    procedure setMessageOption(from, &to, body, html: String);
    procedure streamMessage;
    procedure pipe(stream: Variant);
  end;

  JILengthAble = class external
    _length: Float;
  end;

  JITinytestAssertions = class external
    procedure ok(doc: JObject);
    procedure expect_fail;
    procedure fail(doc: JObject);
    function runId: String;
(*
    procedure equal(actual: JT; expected: JT); overload;
    procedure equal(actual: JT; expected: JT; message: String); overload;
    procedure equal(actual: JT; expected: JT; message: String; not: Boolean); overload;
    procedure notEqual(actual: JT; expected: JT); overload;
    procedure notEqual(actual: JT; expected: JT; message: String); overload;
    procedure instanceOf(obj: JObject; klass: JFunction); overload;
    procedure instanceOf(obj: JObject; klass: JFunction; message: String); overload;
    procedure notInstanceOf(obj: JObject; klass: JFunction); overload;
    procedure notInstanceOf(obj: JObject; klass: JFunction; message: String); overload;
*)
    procedure matches(actual: Variant; regexp: JRegExp); overload;
    procedure matches(actual: Variant; regexp: JRegExp; message: String); overload;
    procedure notMatches(actual: Variant; regexp: JRegExp); overload;
    procedure notMatches(actual: Variant; regexp: JRegExp; message: String); overload;
    procedure throws(f: procedure); overload;
    procedure throws(f: procedure; expected: Variant {String or JRegExp}); overload;
    procedure isTrue(v: Boolean); overload;
    procedure isTrue(v: Boolean; msg: String); overload;
    procedure isFalse(v: Boolean); overload;
    procedure isFalse(v: Boolean; msg: String); overload;
    procedure isNull(v: Variant); overload;
    procedure isNull(v: Variant; msg: String); overload;
    procedure isNotNull(v: Variant); overload;
    procedure isNotNull(v: Variant; msg: String); overload;
    procedure isUndefined(v: Variant); overload;
    procedure isUndefined(v: Variant; msg: String); overload;
    procedure isNotUndefined(v: Variant); overload;
    procedure isNotUndefined(v: Variant; msg: String); overload;
    procedure isNan(v: Variant); overload;
    procedure isNan(v: Variant; msg: String); overload;
    procedure isNotNan(v: Variant); overload;
    procedure isNotNan(v: Variant; msg: String); overload;
(*
    procedure include(s: Variant {JArray{<JT>} or JObject or String}; value: Variant); overload;
    procedure include(s: Variant {JArray{<JT>} or JObject or String}; value: Variant; msg: String); overload;
    procedure include(s: Variant {JArray{<JT>} or JObject or String}; value: Variant; msg: String; not: Boolean); overload;
    procedure notInclude(s: Variant {JArray{<JT>} or JObject or String}; value: Variant); overload;
    procedure notInclude(s: Variant {JArray{<JT>} or JObject or String}; value: Variant; msg: String); overload;
    procedure notInclude(s: Variant {JArray{<JT>} or JObject or String}; value: Variant; msg: String; not: Boolean); overload;
*)
    procedure length(obj: JILengthAble; expected_length: Float); overload;
    procedure length(obj: JILengthAble; expected_length: Float; msg: String); overload;
    procedure _stringEqual(actual: String; expected: String); overload;
    procedure _stringEqual(actual: String; expected: String; msg: String); overload;
  end;

  JCompileStepStatic = class external
    constructor CreateJCompileStep;
  end;

  JCompileStep = class external
    function addAsset(options: Variant; path: String; data: Variant {Variant or String}): Variant;
    function addHtml(options: record
      section: String; // nullable
      data: String; // nullable
    end): Variant;
    function addJavaScript(options: record
      path: String; // nullable
      data: String; // nullable
      sourcePath: String; // nullable
    end): Variant;
    function addStylesheet(options: Variant; path: String; data: String; sourceMap: String): Variant;
    arch: Variant;
    declaredExports: Variant;
    function error(options: Variant; message: String): Variant; overload;
    function error(options: Variant; message: String; sourcePath: String): Variant; overload;
    function error(options: Variant; message: String; sourcePath: String; line: Float): Variant; overload;
    function error(options: Variant; message: String; sourcePath: String; line: Float; func: String): Variant; overload;
    fileOptions: Variant;
    fullInputPath: Variant;
    inputPath: Variant;
    inputSize: Variant;
    packageName: Variant;
    pathForSourceMap: Variant;
    function read: Variant; overload;
    function read(n: Float): Variant; overload;
    rootOutputPath: Variant;
  end;

  JPackageAPIStatic = class external
    constructor CreateJPackageAPI;
  end;

  JPackageAPI = class external
    procedure addAssets(filenames: Variant {String or array of String}; architecture: Variant {String or array of String});
    procedure addFiles(filenames: Variant {String or array of String}); overload;
    procedure addFiles(filenames: Variant {String or array of String}; architecture: Variant {String or array of String}); overload;
    procedure addFiles(filenames: Variant {String or array of String}; architecture: Variant {String or array of String}; options: record
      bare: Boolean; // nullable
    end); overload;
    procedure export(exportedObjects: Variant {String or array of String}); overload;
    procedure export(exportedObjects: Variant {String or array of String}; architecture: Variant {String or array of String}); overload;
    procedure export(exportedObjects: Variant {String or array of String}; architecture: Variant {String or array of String}; exportOptions: JObject); overload;
    procedure export(exportedObjects: Variant {String or array of String}; architecture: Variant {String or array of String}; exportOptions: JObject; testOnly: Boolean); overload;
    procedure imply(packageNames: Variant {String or array of String}); overload;
    procedure imply(packageNames: Variant {String or array of String}; architecture: Variant {String or array of String}); overload;
    procedure use(packageNames: Variant {String or array of String}); overload;
    procedure use(packageNames: Variant {String or array of String}; architecture: Variant {String or array of String}); overload;
    procedure use(packageNames: Variant {String or array of String}; architecture: Variant {String or array of String}; options: record
      weak: Boolean; // nullable
      unordered: Boolean; // nullable
    end); overload;
    procedure versionsFrom(meteorRelease: Variant {String or array of String});
  end;

  JReactiveVarStatic = class external
    constructor CreateJReactiveVar{<JT>};
  end;

  JReactiveVar{<T>} = class external
    function get: JT
    procedure set(newValue: JT)
  end;

  JSubscriptionStatic = class external
    constructor CreateJSubscription;
  end;

  JSubscription = class external
    procedure added(collection: String; id: String; fields: JObject)
    procedure changed(collection: String; id: String; fields: JObject)
    connection: JMeteor.Connection;
    procedure error(error: JError)
    procedure onStop(func: JFunction)
    procedure ready
    procedure removed(collection: String; id: String)
    procedure stop
    userId: String;
  end;

  JTemplateStatic = class external
    constructor CreateJTemplate;
    // property Item[templateName: String]: Variant {Variant or JTemplate};
    head: JTemplate;
    function find(selector: String): JBlaze.Template
    function findAll(selector: String): array of JBlaze.Template
    $: Variant;
    body: JTemplate;
    function currentData:     end;
    function instance: JBlaze.TemplateInstance
    function parentData:     end; overload;
    function parentData(numLevels: Float):     end; overload;
    procedure registerHelper(name: String; helperFunction: JFunction)
  end;

  JTemplate = class external
    created: JFunction;
    destroyed: JFunction;
    procedure events(eventMap: JMeteor.EventMap)
    procedure helpers(helpers: record
      // property Item[id: String]: Variant;
    end;)
    onCreated: JFunction;
    onDestroyed: JFunction;
    onRendered: JFunction;
    rendered: JFunction;
  end;

//Match

function Optional(pattern: Variant): Boolean;
function ObjectIncluding(dico: Variant): Boolean;
function OneOf(patterns: array of Variant): Variant;
function Where(condition: Variant): Variant;

var
  Any: Variant;
  String: Variant;
  Integer: Variant;
  Boolean: Variant;
  undefined: Variant;
  Object: Variant;


//Meteor

type
  JUserEmail = class external
    address: String;
    verified: Boolean;
  end;

  JUser = class external
    _id: String; // nullable
    username: String; // nullable
    emails: array of JMeteor.UserEmail; // nullable
    createdAt: Float; // nullable
    profile: Variant; // nullable
    services: Variant; // nullable
  end;

  JLiveQueryHandle = class external
    procedure stop
  end;


//DDP

type
  JDDPStatic = class external
    function subscribe(name: String; rest: array of Variant): JMeteor.SubscriptionHandle
    procedure call(method: String; parameters: array of Variant)
    procedure apply(method: String; parameters: array of Variant)
    function methods(IMeteorMethodsDictionary: Variant): Variant
    function status: JDDPStatus
    procedure reconnect
    procedure disconnect
    procedure onReconnect
  end;

  JDDPStatus = class external
    connected: Boolean;
    status: JMeteor.StatusEnum;
    retryCount: Float;
    retryTime: Float; // nullable
    reason: String; // nullable
  end;


//Mongo

type
  JSelector = class external
    // property Item[key: String]: Variant;
  end;

  JSelector = class external(JObject)
  end;

  JModifier = class external
  end;

  JSortSpecifier = class external
  end;

  JFieldSpecifier = class external
    // property Item[id: String]: JNumber;
  end;


//HTTP

type
  JHTTPRequest = class external
    content: String; // nullable
    data: Variant; // nullable
    query: String; // nullable
    params: record
      // property Item[id: String]: String;
    end;; // nullable
    auth: String; // nullable
    headers: record
      // property Item[id: String]: String;
    end;; // nullable
    timeout: Float; // nullable
    followRedirects: Boolean; // nullable
  end;

  JHTTPResponse = class external
    statusCode: Float; // nullable
    headers: record
      // property Item[id: String]: String;
    end;; // nullable
    content: String; // nullable
    data: Variant; // nullable
  end;

function call(method: String; url: String): JHTTP.HTTPResponse; overload;
function call(method: String; url: String; options: JHTTP.HTTPRequest): JHTTP.HTTPResponse; overload;
function call(method: String; url: String; options: JHTTP.HTTPRequest; asyncCallback: JFunction): JHTTP.HTTPResponse; overload;
function del(url: String): JHTTP.HTTPResponse; overload;
function del(url: String; callOptions: JHTTP.HTTPRequest): JHTTP.HTTPResponse; overload;
function del(url: String; callOptions: JHTTP.HTTPRequest; asyncCallback: JFunction): JHTTP.HTTPResponse; overload;
function get(url: String): JHTTP.HTTPResponse; overload;
function get(url: String; callOptions: JHTTP.HTTPRequest): JHTTP.HTTPResponse; overload;
function get(url: String; callOptions: JHTTP.HTTPRequest; asyncCallback: JFunction): JHTTP.HTTPResponse; overload;
function post(url: String): JHTTP.HTTPResponse; overload;
function post(url: String; callOptions: JHTTP.HTTPRequest): JHTTP.HTTPResponse; overload;
function post(url: String; callOptions: JHTTP.HTTPRequest; asyncCallback: JFunction): JHTTP.HTTPResponse; overload;
function put(url: String): JHTTP.HTTPResponse; overload;
function put(url: String; callOptions: JHTTP.HTTPRequest): JHTTP.HTTPResponse; overload;
function put(url: String; callOptions: JHTTP.HTTPRequest; asyncCallback: JFunction): JHTTP.HTTPResponse; overload;


//Random

function id: String; overload;
function id(numberOfChars: Float): String; overload;
function secret: String; overload;
function secret(numberOfChars: Float): String; overload;
function fraction: Float;
function hexString(numberOfDigits: Float): String;
function choice(array: array of Variant): String;
function choice(str: String): String;


//Meteor

type
  JEvent = class external
    &type: String;
    target: JHTMLElement;
    currentTarget: JHTMLElement;
    which: Float;
    procedure stopPropagation
    procedure stopImmediatePropagation
    procedure preventDefault
    function isPropagationStopped: Boolean
    function isImmediatePropagationStopped: Boolean
    function isDefaultPrevented: Boolean
  end;

  JEventHandlerFunction = class external(JFunction)
    procedure(event: JMeteor.Event; templateInstance: JBlaze.TemplateInstance);
  end;

  JEventMap = class external
    // property Item[id: String]: JMeteor.EventHandlerFunction;
  end;

  JLoginWithExternalServiceOptions = class external
    requestPermissions: array of String; // nullable
    requestOfflineToken: JBoolean; // nullable
    forceApprovalPrompt: JBoolean; // nullable
    userEmail: String; // nullable
    loginStyle: String; // nullable
  end;

  JSubscriptionHandle = class external
    procedure stop
    function ready: Boolean
  end;

procedure loginWithMeteorDeveloperAccount; overload;
procedure loginWithMeteorDeveloperAccount(options: JMeteor.LoginWithExternalServiceOptions); overload;
procedure loginWithMeteorDeveloperAccount(options: JMeteor.LoginWithExternalServiceOptions; callback: JFunction); overload;
procedure loginWithFacebook; overload;
procedure loginWithFacebook(options: JMeteor.LoginWithExternalServiceOptions); overload;
procedure loginWithFacebook(options: JMeteor.LoginWithExternalServiceOptions; callback: JFunction); overload;
procedure loginWithGithub; overload;
procedure loginWithGithub(options: JMeteor.LoginWithExternalServiceOptions); overload;
procedure loginWithGithub(options: JMeteor.LoginWithExternalServiceOptions; callback: JFunction); overload;
procedure loginWithGoogle; overload;
procedure loginWithGoogle(options: JMeteor.LoginWithExternalServiceOptions); overload;
procedure loginWithGoogle(options: JMeteor.LoginWithExternalServiceOptions; callback: JFunction); overload;
procedure loginWithMeetup; overload;
procedure loginWithMeetup(options: JMeteor.LoginWithExternalServiceOptions); overload;
procedure loginWithMeetup(options: JMeteor.LoginWithExternalServiceOptions; callback: JFunction); overload;
procedure loginWithTwitter; overload;
procedure loginWithTwitter(options: JMeteor.LoginWithExternalServiceOptions); overload;
procedure loginWithTwitter(options: JMeteor.LoginWithExternalServiceOptions; callback: JFunction); overload;
procedure loginWithWeibo; overload;
procedure loginWithWeibo(options: JMeteor.LoginWithExternalServiceOptions); overload;
procedure loginWithWeibo(options: JMeteor.LoginWithExternalServiceOptions; callback: JFunction); overload;


//Blaze

type
  JView = class external
    name: String;
    parentView: JBlaze.View;
    isCreated: Boolean;
    isRendered: Boolean;
    isDestroyed: Boolean;
    renderCount: Float;
    procedure autorun(runFunc: JFunction)
    procedure onViewCreated(func: JFunction)
    procedure onViewReady(func: JFunction)
    procedure onViewDestroyed(func: JFunction)
    function firstNode: JNode
    function lastNode: JNode
    template: JBlaze.Template;
    function templateInstance: Variant
  end;

  JTemplate = class external
    viewName: String;
    renderFunction: JFunction;
    function constructView: JBlaze.View
  end;


//BrowserPolicy

type
  Jframing = class external
    procedure disallow
    procedure restrictToOrigin(origin: String)
    procedure allowAll
  end;

  Jcontent = class external
    procedure allowEval
    procedure allowInlineStyles
    procedure allowInlineScripts
    procedure allowSameOriginForAll
    procedure allowDataUrlForAll
    procedure allowOriginForAll(origin: String)
    procedure allowImageOrigin(origin: String)
    procedure allowFrameOrigin(origin: String)
    procedure allowContentTypeSniffing
    procedure allowAllContentOrigin
    procedure allowAllContentDataUrl
    procedure allowAllContentSameOrigin
    procedure disallowAll
    procedure disallowInlineStyles
    procedure disallowEval
    procedure disallowInlineScripts
    procedure disallowFont
    procedure disallowObject
    procedure disallowAllContent
  end;


//Meteor

type
  JEmailFields = class external
    subject: JFunction; // nullable
    text: JFunction; // nullable
  end;

  JEmailTemplates = class external
    from: String;
    siteName: String;
    resetPassword: JMeteor.EmailFields;
    enrollAccount: JMeteor.EmailFields;
    verifyEmail: JMeteor.EmailFields;
  end;

  JConnection = class external
    id: String;
    close: JFunction;
    onClose: JFunction;
    clientAddress: String;
    httpHeaders: JObject;
  end;


//Mongo

type
  JAllowDenyOptions = class external
    insert: (userId: String; doc: Variant): Boolean; // nullable
    update: (userId: String; doc: Variant; fieldNames: array of String; modifier: Variant): Boolean; // nullable
    remove: (userId: String; doc: Variant): Boolean; // nullable
    fetch: array of String; // nullable
    transform: JFunction; // nullable
  end;


MailComposer: JMailComposerStatic;
//Tinytest

procedure add(description: String; func: procedure(test: JITinytestAssertions));
procedure addAsync(description: String; func: procedure(test: JITinytestAssertions));


//Meteor

type
  JTinytest = class external
    procedure add(description: String; func: procedure(test: JITinytestAssertions))
    procedure addAsync(description: String; func: procedure(test: JITinytestAssertions))
  end;


//Accounts

procedure addEmail(userId: String; newEmail: String); overload;
procedure addEmail(userId: String; newEmail: String; verified: Boolean); overload;
procedure changePassword(oldPassword: String; newPassword: String); overload;
procedure changePassword(oldPassword: String; newPassword: String; callback: JFunction); overload;
function createUser(options: record
  username: String; // nullable
  email: String; // nullable
  password: String; // nullable
  profile: JObject; // nullable
end;): String; overload;
function createUser(options: record
  username: String; // nullable
  email: String; // nullable
  password: String; // nullable
  profile: JObject; // nullable
end;; callback: JFunction): String; overload;
function findUserByEmail(email: String): JObject;
function findUserByUsername(username: String): JObject;
procedure forgotPassword(options: record
  email: String; // nullable
end;); overload;
procedure forgotPassword(options: record
  email: String; // nullable
end;; callback: JFunction); overload;
procedure onEmailVerificationLink(callback: JFunction);
procedure onEnrollmentLink(callback: JFunction);
procedure onResetPasswordLink(callback: JFunction);
procedure removeEmail(userId: String; email: String);
procedure resetPassword(token: String; newPassword: String); overload;
procedure resetPassword(token: String; newPassword: String; callback: JFunction); overload;
procedure sendEnrollmentEmail(userId: String); overload;
procedure sendEnrollmentEmail(userId: String; email: String); overload;
procedure sendResetPasswordEmail(userId: String); overload;
procedure sendResetPasswordEmail(userId: String; email: String); overload;
procedure sendVerificationEmail(userId: String); overload;
procedure sendVerificationEmail(userId: String; email: String); overload;
procedure setPassword(userId: String; newPassword: String); overload;
procedure setPassword(userId: String; newPassword: String; options: record
  logout: JObject; // nullable
end;); overload;
procedure setUsername(userId: String; newUsername: String);
procedure verifyEmail(token: String); overload;
procedure verifyEmail(token: String; callback: JFunction); overload;
procedure config(options: record
  sendVerificationEmail: Boolean; // nullable
  forbidClientAccountCreation: Boolean; // nullable
  restrictCreationByEmailDomain: Variant {String or JFunction}; // nullable
  loginExpirationInDays: Float; // nullable
  oauthSecretKey: String; // nullable
end;);
function onLogin(func: JFunction):   stop: ;
end;;
function onLoginFailure(func: JFunction):   stop: ;
end;;
function user: JMeteor.User;
function userId: String;
function loggingIn: Boolean;
procedure logout; overload;
procedure logout(callback: JFunction); overload;
procedure logoutOtherClients; overload;
procedure logoutOtherClients(callback: JFunction); overload;
procedure onCreateUser(func: JFunction);
function validateLoginAttempt(func: JFunction):   stop: ;
end;;
function validateNewUser(func: JFunction): Boolean;

var
  emailTemplates: JMeteor.EmailTemplates;
  ui:     procedure config(options: record
      requestPermissions: JObject; // nullable
      requestOfflineToken: JObject; // nullable
      forceApprovalPrompt: JObject; // nullable
      passwordSignupFields: String; // nullable
    end;)
  end;;


//App

procedure accessRule(domainRule: String); overload;
procedure accessRule(domainRule: String; options: record
  launchExternal: Boolean; // nullable
end;); overload;
procedure configurePlugin(id: String; config: JObject);
procedure icons(icons: JObject);
procedure info(options: record
  id: String; // nullable
  version: String; // nullable
  name: String; // nullable
  description: String; // nullable
  author: String; // nullable
  email: String; // nullable
  website: String; // nullable
end;);
procedure launchScreens(launchScreens: JObject);
procedure setPreference(name: String; value: String); overload;
procedure setPreference(name: String; value: String; platform: String); overload;


//Assets

function getBinary(assetPath: String): JEJSON; overload;
function getBinary(assetPath: String; asyncCallback: JFunction): JEJSON; overload;
function getText(assetPath: String): String; overload;
function getText(assetPath: String; asyncCallback: JFunction): String; overload;


//Blaze

type
  JTemplateStatic = class external
    constructor CreateJTemplate;
    // property Item[templateName: String]: Variant {Variant or JTemplate};
    head: JTemplate;
    function find(selector: String): JBlaze.Template
    function findAll(selector: String): array of JBlaze.Template
    $: Variant;
  end;

  JTemplate = class external
  end;

  JTemplateInstanceStatic = class external
    constructor CreateJTemplateInstance;
  end;

  JTemplateInstance = class external
    function $(selector: String): Variant
    function autorun(runFunc: JFunction): JObject
    data: JObject;
    function find: JBlaze.TemplateInstance overload;
    function find(selector: String): JBlaze.TemplateInstance overload;
    function findAll(selector: String): array of JBlaze.TemplateInstance
    firstNode: JObject;
    lastNode: JObject;
    function subscribe(name: String; args: array of Variant): JMeteor.SubscriptionHandle
    function subscriptionsReady: Boolean
    view: JObject;
  end;

  JViewStatic = class external
    constructor CreateJView;
  end;

  JView = class external
  end;

function Each(argFunc: JFunction; contentFunc: JFunction): JBlaze.View; overload;
function Each(argFunc: JFunction; contentFunc: JFunction; elseFunc: JFunction): JBlaze.View; overload;
function If(conditionFunc: JFunction; contentFunc: JFunction): JBlaze.View; overload;
function If(conditionFunc: JFunction; contentFunc: JFunction; elseFunc: JFunction): JBlaze.View; overload;
function Let(bindings: JFunction; contentFunc: JFunction): JBlaze.View;
function Unless(conditionFunc: JFunction; contentFunc: JFunction): JBlaze.View; overload;
function Unless(conditionFunc: JFunction; contentFunc: JFunction; elseFunc: JFunction): JBlaze.View; overload;
function With(data: Variant {JObject or JFunction}; contentFunc: JFunction): JBlaze.View;
function getData: JObject; overload;
function getData(elementOrView: Variant {JHTMLElement or JBlaze.View}): JObject; overload;
function getView: JBlaze.View; overload;
function getView(element: JHTMLElement): JBlaze.View; overload;
function isTemplate(value: Variant): Boolean;
procedure remove(renderedView: JBlaze.View);
function render(templateOrView: Variant {JTemplate or JBlaze.View}; parentNode: JNode): JBlaze.View; overload;
function render(templateOrView: Variant {JTemplate or JBlaze.View}; parentNode: JNode; nextNode: JNode): JBlaze.View; overload;
function render(templateOrView: Variant {JTemplate or JBlaze.View}; parentNode: JNode; nextNode: JNode; parentView: JBlaze.View): JBlaze.View; overload;
function renderWithData(templateOrView: Variant {JTemplate or JBlaze.View}; data: Variant {JObject or JFunction}; parentNode: JNode): JBlaze.View; overload;
function renderWithData(templateOrView: Variant {JTemplate or JBlaze.View}; data: Variant {JObject or JFunction}; parentNode: JNode; nextNode: JNode): JBlaze.View; overload;
function renderWithData(templateOrView: Variant {JTemplate or JBlaze.View}; data: Variant {JObject or JFunction}; parentNode: JNode; nextNode: JNode; parentView: JBlaze.View): JBlaze.View; overload;
function toHTML(templateOrView: Variant {JTemplate or JBlaze.View}): String;
function toHTMLWithData(templateOrView: Variant {JTemplate or JBlaze.View}; data: Variant {JObject or JFunction}): String;

var
  Template: JTemplateStatic;
  TemplateInstance: JTemplateInstanceStatic;
  View: JViewStatic;
  currentView: JBlaze.View;


//Cordova

procedure depends(dependencies: record
  // property Item[id: String]: String;
end;);


//DDP

function connect(url: String): JDDP.DDPStatic;


//DDPCommon

function MethodInvocation(options: record
end;): Variant;


//EJSON

type
  JCustomTypeStatic = class external
    constructor CreateJCustomType;
  end;

  JCustomType = class external
    function clone: JEJSON.CustomType
    function equals(other: JObject): Boolean
    function toJSONValue: JJSONable
    function typeName: String
  end;

procedure addType(name: String; factory: function(val: JJSONable): JEJSON.CustomType);
function clone(val: JT): JT;
function equals(a: JEJSON; b: JEJSON): Boolean; overload;
function equals(a: JEJSON; b: JEJSON; options: record
  keyOrderSensitive: Boolean; // nullable
end;): Boolean; overload;
function fromJSONValue(val: JJSONable): Variant;
function isBinary(x: JObject): Boolean;
function parse(str: String): JEJSON;
function stringify(val: JEJSON): String; overload;
function stringify(val: JEJSON; options: record
  indent: Variant {Boolean or Float or String}; // nullable
  canonical: Boolean; // nullable
end;): String; overload;
function toJSONValue(val: JEJSON): JJSONable;

var
  CustomType: JCustomTypeStatic;
  newBinary: Variant;


//Match

function test(value: Variant; pattern: Variant): Boolean;


//Meteor

type
  JErrorStatic = class external
    constructor CreateJError;
  end;

  JError = class external
    error: String;
    reason: String; // nullable
    details: String; // nullable
  end;

function absoluteUrl: String; overload;
function absoluteUrl(path: String): String; overload;
function absoluteUrl(path: String; options: record
  secure: Boolean; // nullable
  replaceLocalhost: Boolean; // nullable
  rootUrl: String; // nullable
end;): String; overload;
function apply(name: String; args: array of JEJSONable): Variant; overload;
function apply(name: String; args: array of JEJSONable; options: record
  wait: Boolean; // nullable
  onResultReceived: JFunction; // nullable
end;): Variant; overload;
function apply(name: String; args: array of JEJSONable; options: record
  wait: Boolean; // nullable
  onResultReceived: JFunction; // nullable
end;; asyncCallback: JFunction): Variant; overload;
function call(name: String; args: array of Variant): Variant;
procedure clearInterval(id: Float);
procedure clearTimeout(id: Float);
procedure disconnect;
function loggingIn: Boolean;
procedure loginWith; overload;
procedure loginWith(options: record
  requestPermissions: array of String; // nullable
  requestOfflineToken: Boolean; // nullable
  loginUrlParameters: JObject; // nullable
  userEmail: String; // nullable
  loginStyle: String; // nullable
  redirectUrl: String; // nullable
end;); overload;
procedure loginWith(options: record
  requestPermissions: array of String; // nullable
  requestOfflineToken: Boolean; // nullable
  loginUrlParameters: JObject; // nullable
  userEmail: String; // nullable
  loginStyle: String; // nullable
  redirectUrl: String; // nullable
end;; callback: JFunction); overload;
procedure loginWithPassword(user: Variant {JObject or String}; password: String); overload;
procedure loginWithPassword(user: Variant {JObject or String}; password: String; callback: JFunction); overload;
procedure logout; overload;
procedure logout(callback: JFunction); overload;
procedure logoutOtherClients; overload;
procedure logoutOtherClients(callback: JFunction); overload;
procedure methods(methods: JObject);
procedure onConnection(callback: JFunction);
procedure publish(name: String; func: JFunction);
procedure reconnect;
function setInterval(func: JFunction; delay: Float): Float;
function setTimeout(func: JFunction; delay: Float): Float;
procedure startup(func: JFunction);
function status: JMeteor.StatusEnum;
function subscribe(name: String; args: array of Variant): JMeteor.SubscriptionHandle;
function user: JMeteor.User;
function userId: String;
function wrapAsync(func: JFunction): Variant; overload;
function wrapAsync(func: JFunction; context: JObject): Variant; overload;

var
  Error: JErrorStatic;
  isClient: Boolean;
  isCordova: Boolean;
  isServer: Boolean;
  release: String;
  settings:     // property Item[id: String]: Variant;
  end;;
  users: JMongo.Collection{<JUser>};


//Mongo

type
  JCollectionStatic = class external
    constructor CreateJCollection{<JT>};
  end;

  JCollection{<T>} = class external
    function allow(options: record
      insert: (userId: String; doc: JT): Boolean; // nullable
      update: (userId: String; doc: JT; fieldNames: array of String; modifier: Variant): Boolean; // nullable
      remove: (userId: String; doc: JT): Boolean; // nullable
      fetch: array of String; // nullable
      transform: JFunction; // nullable
    end;): Boolean
    function deny(options: record
      insert: (userId: String; doc: JT): Boolean; // nullable
      update: (userId: String; doc: JT; fieldNames: array of String; modifier: Variant): Boolean; // nullable
      remove: (userId: String; doc: JT): Boolean; // nullable
      fetch: array of String; // nullable
      transform: JFunction; // nullable
    end;): Boolean
    function find: JMongo.Cursor{<JT>} overload;
    function find(selector: Variant {JMongo.Selector or JMongo.ObjectID or String}): JMongo.Cursor{<JT>} overload;
    function find(selector: Variant {JMongo.Selector or JMongo.ObjectID or String}; options: record
      sort: JMongo.SortSpecifier; // nullable
      skip: Float; // nullable
      limit: Float; // nullable
      fields: JMongo.FieldSpecifier; // nullable
      reactive: Boolean; // nullable
      transform: JFunction; // nullable
    end;): JMongo.Cursor{<JT>} overload;
    function findOne: JT overload;
    function findOne(selector: Variant {JMongo.Selector or JMongo.ObjectID or String}): JT overload;
    function findOne(selector: Variant {JMongo.Selector or JMongo.ObjectID or String}; options: record
      sort: JMongo.SortSpecifier; // nullable
      skip: Float; // nullable
      fields: JMongo.FieldSpecifier; // nullable
      reactive: Boolean; // nullable
      transform: JFunction; // nullable
    end;): JT overload;
    function insert(doc: JT): String overload;
    function insert(doc: JT; callback: JFunction): String overload;
    function rawCollection: Variant
    function rawDatabase: Variant
    function remove(selector: Variant {JMongo.Selector or JMongo.ObjectID or String}): Float overload;
    function remove(selector: Variant {JMongo.Selector or JMongo.ObjectID or String}; callback: JFunction): Float overload;
    function update(selector: Variant {JMongo.Selector or JMongo.ObjectID or String}; modifier: JMongo.Modifier): Float overload;
    function update(selector: Variant {JMongo.Selector or JMongo.ObjectID or String}; modifier: JMongo.Modifier; options: record
      multi: Boolean; // nullable
      upsert: Boolean; // nullable
    end;): Float overload;
    function update(selector: Variant {JMongo.Selector or JMongo.ObjectID or String}; modifier: JMongo.Modifier; options: record
      multi: Boolean; // nullable
      upsert: Boolean; // nullable
    end;; callback: JFunction): Float overload;
    function upsert(selector: Variant {JMongo.Selector or JMongo.ObjectID or String}; modifier: JMongo.Modifier):       numberAffected: Float; // nullable
      insertedId: String; // nullable
    end; overload;
    function upsert(selector: Variant {JMongo.Selector or JMongo.ObjectID or String}; modifier: JMongo.Modifier; options: record
      multi: Boolean; // nullable
    end;):       numberAffected: Float; // nullable
      insertedId: String; // nullable
    end; overload;
    function upsert(selector: Variant {JMongo.Selector or JMongo.ObjectID or String}; modifier: JMongo.Modifier; options: record
      multi: Boolean; // nullable
    end;; callback: JFunction):       numberAffected: Float; // nullable
      insertedId: String; // nullable
    end; overload;
    procedure _ensureIndex(indexName: String); overload;
    procedure _ensureIndex(indexName: String; options: record
      // property Item[key: String]: Variant;
    end;); overload;
  end;

  JCursorStatic = class external
    constructor CreateJCursor{<JT>};
  end;

  JCursor{<T>} = class external
    function count: Float
    function fetch: JArray{<JT>}
    procedure forEach(callback: procedure(doc: JT; index: Float; cursor: JMongo.Cursor{<JT>})); overload;
    procedure forEach(callback: procedure(doc: JT; index: Float; cursor: JMongo.Cursor{<JT>}); thisArg: Variant); overload;
    function map(callback: function(doc: JT; index: Float; cursor: JMongo.Cursor{<JT>}): JU): JArray{<JU>} overload;
    function map(callback: function(doc: JT; index: Float; cursor: JMongo.Cursor{<JT>}): JU; thisArg: Variant): JArray{<JU>} overload;
    function observe(callbacks: JObject): JMeteor.LiveQueryHandle
    function observeChanges(callbacks: JObject): JMeteor.LiveQueryHandle
  end;

  JObjectIDStatic = class external
    constructor CreateJObjectID;
  end;

  JObjectID = class external
  end;

var
  Collection: JCollectionStatic;
  Cursor: JCursorStatic;
  ObjectID: JObjectIDStatic;


//Npm

procedure depends(dependencies: record
  // property Item[id: String]: String;
end;);
function require(name: String): Variant;


//Package

procedure describe(options: record
  summary: String; // nullable
  version: String; // nullable
  name: String; // nullable
  git: String; // nullable
  documentation: String; // nullable
  debugOnly: Boolean; // nullable
  prodOnly: Boolean; // nullable
end;);
procedure onTest(func: JFunction);
procedure onUse(func: JFunction);
procedure registerBuildPlugin; overload;
procedure registerBuildPlugin(options: record
  name: String; // nullable
  use: Variant {String or array of String}; // nullable
  sources: array of String; // nullable
  npmDependencies: JObject; // nullable
end;); overload;


//Tracker

type
  JComputation = class external
    firstRun: Boolean;
    procedure invalidate
    invalidated: Boolean;
    procedure onInvalidate(callback: JFunction)
    procedure onStop(callback: JFunction)
    procedure stop
    stopped: Boolean;
  end;

  JDependencyStatic = class external
    constructor CreateJDependency;
  end;

  JDependency = class external
    procedure changed
    function depend: Boolean overload;
    function depend(fromComputation: JTracker.Computation): Boolean overload;
    function hasDependents: Boolean
  end;

procedure Computation;
procedure afterFlush(callback: JFunction);
function autorun(runFunc: procedure(computation: JTracker.Computation)): JTracker.Computation; overload;
function autorun(runFunc: procedure(computation: JTracker.Computation); options: record
  onError: JFunction; // nullable
end;): JTracker.Computation; overload;
procedure flush;
procedure nonreactive(func: JFunction);
procedure onInvalidate(callback: JFunction);

var
  Dependency: JDependencyStatic;
  active: Boolean;
  currentComputation: JTracker.Computation;


//Session

function equals(key: String; value: Variant {String or Float or Boolean or Variant or Variant}): Boolean;
function get(key: String): Variant;
procedure set(key: String; value: Variant {JEJSONable or Variant});
procedure setDefault(key: String; value: Variant {JEJSONable or Variant});


//HTTP

function call(method: String; url: String): JHTTP.HTTPResponse; overload;
function call(method: String; url: String; options: record
  content: String; // nullable
  data: JObject; // nullable
  query: String; // nullable
  params: JObject; // nullable
  auth: String; // nullable
  headers: JObject; // nullable
  timeout: Float; // nullable
  followRedirects: Boolean; // nullable
  npmRequestOptions: JObject; // nullable
  beforeSend: JFunction; // nullable
end;): JHTTP.HTTPResponse; overload;
function call(method: String; url: String; options: record
  content: String; // nullable
  data: JObject; // nullable
  query: String; // nullable
  params: JObject; // nullable
  auth: String; // nullable
  headers: JObject; // nullable
  timeout: Float; // nullable
  followRedirects: Boolean; // nullable
  npmRequestOptions: JObject; // nullable
  beforeSend: JFunction; // nullable
end;; asyncCallback: JFunction): JHTTP.HTTPResponse; overload;
function del(url: String): JHTTP.HTTPResponse; overload;
function del(url: String; callOptions: JObject): JHTTP.HTTPResponse; overload;
function del(url: String; callOptions: JObject; asyncCallback: JFunction): JHTTP.HTTPResponse; overload;
function get(url: String): JHTTP.HTTPResponse; overload;
function get(url: String; callOptions: JObject): JHTTP.HTTPResponse; overload;
function get(url: String; callOptions: JObject; asyncCallback: JFunction): JHTTP.HTTPResponse; overload;
function post(url: String): JHTTP.HTTPResponse; overload;
function post(url: String; callOptions: JObject): JHTTP.HTTPResponse; overload;
function post(url: String; callOptions: JObject; asyncCallback: JFunction): JHTTP.HTTPResponse; overload;
function put(url: String): JHTTP.HTTPResponse; overload;
function put(url: String; callOptions: JObject): JHTTP.HTTPResponse; overload;
function put(url: String; callOptions: JObject; asyncCallback: JFunction): JHTTP.HTTPResponse; overload;


//Email

procedure send(options: record
  from: String; // nullable
  to: Variant {String or array of String}; // nullable
  cc: Variant {String or array of String}; // nullable
  bcc: Variant {String or array of String}; // nullable
  replyTo: Variant {String or array of String}; // nullable
  subject: String; // nullable
  text: String; // nullable
  html: String; // nullable
  headers: JObject; // nullable
  attachments: array of JObject; // nullable
  mailComposer: JMailComposer; // nullable
end;);


CompileStep: JCompileStepStatic;
PackageAPI: JPackageAPIStatic;
ReactiveVar: JReactiveVarStatic;
Subscription: JSubscriptionStatic;
Template: JTemplateStatic;
procedure check(value: Variant; pattern: Variant);
function execFileAsync(command: String): Variant; overload;
function execFileAsync(command: String; args: array of Variant): Variant; overload;
function execFileAsync(command: String; args: array of Variant; options: record
  cwd: JObject; // nullable
  env: JObject; // nullable
  stdio: Variant {array of Variant or String}; // nullable
  destination: Variant; // nullable
  waitForClose: String; // nullable
end;): Variant; overload;
function execFileSync(command: String): JString; overload;
function execFileSync(command: String; args: array of Variant): JString; overload;
function execFileSync(command: String; args: array of Variant; options: record
  cwd: JObject; // nullable
  env: JObject; // nullable
  stdio: Variant {array of Variant or String}; // nullable
  destination: Variant; // nullable
  waitForClose: String; // nullable
end;): JString; overload;
function getExtension: JString;
