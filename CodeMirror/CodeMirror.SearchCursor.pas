unit CodeMirror.SearchCursor;

interface

uses
  ECMA.RegEx, CodeMirror;

type
  JSearchCursor = class external
    function find(reverse: Boolean): Variant {Boolean or array of Variant}; overload;
    function findNext: Variant {Boolean or array of Variant}; overload;
    function findPrevious: Variant {Boolean or array of Variant}; overload;
    function from: JPosition;
    function to: JPosition;
    procedure replace(text: String); overload;
    procedure replace(text: String; origin: String); overload;
  end;

  JDoc = class external
    function getSearchCursor(query: String): JSearchCursor; overload;
    function getSearchCursor(query: JRegExp): JSearchCursor; overload;
    function getSearchCursor(query: String; start: JPosition): JSearchCursor; overload;
    function getSearchCursor(query: JRegExp; start: JPosition): JSearchCursor; overload;
    function getSearchCursor(query: String; start: JPosition; caseFold: Boolean): JSearchCursor; overload;
    function getSearchCursor(query: JRegExp; start: JPosition; caseFold: Boolean): JSearchCursor; overload;
  end;

