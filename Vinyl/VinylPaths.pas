unit VinylPaths;

interface

uses
  NodeJS.Stream;

type
  JPaths = class external 'vinyl-paths.Paths' (JReadWriteStream)
    paths: array of String;
  end;

  TPathsCallback = function(path: String; callback: procedure): Variant;

var
  Paths external 'vinyl-paths.paths': function(callback: TPathsCallback): JPaths;