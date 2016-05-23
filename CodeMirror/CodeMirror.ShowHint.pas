unit CodeMirror.ShowHint;

interface

uses
  W3C.HTML5, CodeMirror;

type
  JHints = class external
    from: JPosition;
    to: JPosition;
    list: array of Variant {JHint or String};
  end;

  JHint = class external
    text: String;
    className: String; // nullable
    displayText: String; // nullable
    from: JPosition; // nullable
    hint: procedure(cm: Variant; data: JHints; cur: JHint); // nullable
    render: procedure(element: JHTMLLIElement; data: JHints; cur: JHint); // nullable
    to: JPosition; // nullable
  end;

  JEditor = class external
    procedure on(eventName: String; handler: procedure(doc: JDoc; event: Variant));
    procedure off(eventName: String; handler: procedure(doc: JDoc; event: Variant));
  end;

  JShowHintOptions = class external
    completeSingle: Boolean;
    hint: function(doc: JDoc): JHints;
  end;

  JDoc = class external
    showHint: procedure(options: JShowHintOptions);
  end;

  JHandle = class external
    procedure moveFocus(n: Float; avoidWrap: Boolean);
    procedure setFocus(n: Float);
    function menuSize: Float;
    _length: Float;
    procedure close;
    procedure pick;
    data: Variant;
  end;

  JEditorConfiguration = class external
    showHint: Boolean; // nullable
    hintOptions: JShowHintOptions; // nullable
  end;

procedure showHint(cm: JDoc); overload; external 'CodeMirror.showHint';
procedure showHint(cm: JDoc; hinter: function(doc: JDoc): JHints); overload; external 'CodeMirror.showHint';
procedure showHint(cm: JDoc; hinter: function(doc: JDoc): JHints; options: JShowHintOptions); overload; external 'CodeMirror.showHint';

var
  Commands external 'commands': Variant;
