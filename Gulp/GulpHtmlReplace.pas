unit GulpHtmlReplace;

interface

uses
  NodeJS.Stream;

type
  JAdvancedTask = class external
    src: Variant {String or array of String};
    tpl: String;
  end;

  JTasks = class external
    // property Item[taskId: String]: Variant {String or array of String or JAdvancedTask};
  end;

  JOptions = class external
    keepUnassigned: Boolean; // nullable
    keepBlockTags: Boolean; // nullable
    resolvePaths: Boolean; // nullable
  end;

  THtmlReplace = function(tasks: JTasks; options: JOptions): JReadWriteStream;

//"gulp-html-replace"

var
  htmlReplace external 'htmlReplace': THtmlReplace;

