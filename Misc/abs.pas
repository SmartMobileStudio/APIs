unit Abs;

interface

uses
  NodeJS.Core;

type
  JAbs = class external
  public
    function Abs(input: String): String;
  end;

var Abs := JAbs(RequireModule('abs'));