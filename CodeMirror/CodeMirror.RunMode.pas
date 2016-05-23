unit CodeMirror.RunMode;

interface

uses
  CodeMirror;

procedure runMode(text: String; modespec: Variant; callback: Variant {JHTMLElement or (text: String; style: String)}); overload; external 'CodeMirror.runMode';
procedure runMode(text: String; modespec: Variant; callback: Variant {JHTMLElement or (text: String; style: String)}; options: record
  tabSize: Float; // nullable
  state: Variant; // nullable
end); overload; external 'CodeMirror.runMode';


