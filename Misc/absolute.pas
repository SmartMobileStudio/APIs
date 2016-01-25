unit Absolute;

interface

uses
  NodeJS.Core;

type
  JAbsolute = class external
  public
    function absolute(path: String): Boolean;
  end;

var Absolute := JAbs(RequireModule('absolute'));