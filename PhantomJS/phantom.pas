unit Phantom;

// Project: https://github.com/sgentle/phantomjs-node
// TypeScript Definitions by: 
//   horiuchi <https://github.com/horiuchi/>

interface

type
  JICreateOptions = class external
    binary: String; // nullable
    hostname: String; // nullable
    path: String; // nullable
    port: Float; // nullable
  end;

  JIPaperSizeOptions = class external
    width: String; // nullable
    height: String; // nullable
    format: String; // nullable
    orientation: String; // nullable
    margin: Variant; // nullable
  end;

  JWebPage = class external
    procedure open(url: String; callback: procedure(status: String));
    procedure close;
    procedure get(key: String; callback: procedure(result: Variant));
    procedure set(key: String; value: Variant); overload;
    procedure set(key: String; value: Variant; callback: procedure(result: Variant)); overload;
    procedure setHeaders(headers: JObject); overload;
    procedure setHeaders(headers: JObject; callback: procedure); overload;
    procedure setViewportSize(width: Float; height: Float); overload;
    procedure setViewportSize(width: Float; height: Float; callback: procedure); overload;
    procedure setPaperSize(options: JIPaperSizeOptions); overload;
    procedure setPaperSize(options: JIPaperSizeOptions; callback: procedure); overload;
    procedure setZoomFactor(factor: Float); overload;
    procedure setZoomFactor(factor: Float; callback: procedure); overload;
    procedure evaluate(callback: procedure);
(*
    procedure evaluate(callback: function: JR; returnCallback: procedure(result: JR));
    procedure evaluate(callback: procedure(arg: JT); returnCallback: procedure; arg: JT);
    procedure evaluate(callback: procedure(arg: JT): JR; returnCallback: procedure(result: JR); arg: JT);
    procedure evaluate(callback: procedure(arg1: JT1; arg2: JT2): JR; returnCallback: procedure(result: JR); arg1: JT1; arg2: JT2);
    procedure evaluate(callback: procedure(arg1: JT1; arg2: JT2; arg3: JT3): JR; returnCallback: procedure(result: JR); arg1: JT1; arg2: JT2; arg3: JT3);
*)
    procedure includeJs(url: String); overload;
    procedure includeJs(url: String; callback: procedure); overload;
    procedure injectJs(filename: String); overload;
    procedure injectJs(filename: String; callback: procedure(res: Boolean)); overload;
    procedure sendEvent(mouseEventType: String; mouseX: Float; mouseY: Float); overload;
    procedure sendEvent(mouseEventType: String; mouseX: Float; mouseY: Float; button: String); overload;
    procedure sendEvent(keyboardEventType, key: String); overload;
    procedure sendEvent(keyboardEventType, key: String; null1: Variant); overload;
    procedure sendEvent(keyboardEventType, key: String; null1, null2: Variant); overload;
    procedure sendEvent(keyboardEventType, key: String; null1, null2: Variant; modifier: Float); overload;
    procedure uploadFile(selector: String; filename: String);
    procedure render(filename: String); overload;
    procedure render(filename: String; callback: procedure); overload;
    procedure render(filename: String; options: record
      format: String; // nullable
      quality: String; // nullable
    end); overload;
    procedure render(filename: String; options: 
      record
        format: String; // nullable
        quality: String; // nullable
      end; callback: procedure); overload;
    procedure renderBase64(&type: String; callback: procedure(data: String));
    procedure goBack;
    procedure goForward;
    procedure reload;
    procedure getContent(callback: procedure(content: String));
    procedure setContent(html, url: String); overload;
    procedure setContent(html, url: String; callback: procedure(status: String)); overload;
    procedure getCookies(callback: procedure(cookies: array of record
      name: String;
      value: String;
      domain: String; // nullable
    end));
  end;

  JPhantomJS = class external
    procedure createPage(callback: procedure(page: JWebPage));
    procedure &exit; overload;
    procedure &exit(returnValue: Float); overload;
    procedure injectJs(filename: String); overload;
    procedure injectJs(filename: String; callback: procedure(result: Boolean)); overload;
    procedure addCookie(name: String; value: String; domain: String); overload;
    procedure addCookie(name: String; value: String; domain: String; callback: procedure(res: Boolean)); overload;
    procedure clearCookies; overload;
    procedure clearCookies(callback: procedure); overload;
    procedure getCookies(callback: procedure(cookies: array of record
      name: String;
      value: String;
      domain: String; // nullable
    end));
  end;

  JPhantom = class external 'phantom'
    procedure create(callback: procedure(ph: JPhantomJS)); overload;
    procedure create(options: JICreateOptions; callback: procedure(ph: JPhantomJS)); overload;
    procedure create(arg: String; callback: procedure(ph: JPhantomJS)); overload;
    procedure create(arg: String; options: JICreateOptions; callback: procedure(ph: JPhantomJS)); overload;
    procedure create(arg1, arg2: String; callback: procedure(ph: JPhantomJS)); overload;
    procedure create(arg1, arg2: String; options: JICreateOptions; callback: procedure(ph: JPhantomJS)); overload;
    procedure create(arg1, arg2, arg3: String; callback: procedure(ph: JPhantomJS)); overload;
    procedure create(arg1, arg2, arg3: String; options: JICreateOptions; callback: procedure(ph: JPhantomJS)); overload;
  end;
