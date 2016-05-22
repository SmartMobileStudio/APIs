unit GulpCoffeeify;

interface

uses
  NodeJS.Stream;

//"gulp-coffeeify"

type
  JAliases = class external
    cwd: String; // nullable
    base: String; // nullable
  end;

  JTransforms = class external
    ext: String; // nullable
    function transform(data: String): String;
  end;

  JOption = class external
    options: record
      debug: Boolean; // nullable
      paths: array of String; // nullable
    end; // nullable
    aliases: JAliases; // nullable
    transforms: JTransforms; // nullable
  end;

  TCoffeeify = function(option: JOption): JReadWriteStream;

var
  coffeeify external 'coffeeify': TCoffeeify;
