unit UglifyJS;

interface

//'uglify-js'

type
  JAST_Toplevel = class;

  JTokenizer = class external
    &type: String;
    file: String;
    value: String;
    line: Integer;
    col: Integer;
    nlb: Boolean;
    comments_before: array of String;
  end;

  JTreeWalker = class external
  end;

  JTreeTransformer = class external(JTreeWalker)
  end;

  JAST_Node = class external
    start: JAST_Node;
    &end: JAST_Node;
    function transform(tt: JTreeTransformer): JAST_Toplevel;
  end;

  JOutputStream = class external
    function get: String;
    function toString: String;
    procedure indent; overload;
    procedure indent(half: Boolean); overload;
    function indentation: Integer;
    function current_width: Integer;
    function should_break: Boolean;
    procedure newline;
    procedure print(str: String);
    procedure space;
    procedure comma;
    procedure colon;
    function last: String;
    procedure semicolon;
    procedure force_semicolon;
    procedure to_ascii(str: String);
    procedure print_name(name: String);
    procedure print_string(str: String);
    function next_indent: Integer;
    procedure with_indent(col: Integer; func: procedure);
    procedure with_block(func: procedure);
    procedure with_parens(func: procedure);
    procedure with_square(func: procedure);
    procedure add_mapping(token: JAST_Node); overload;
    procedure add_mapping(token: JAST_Node; name: String); overload;
    function option(name: String): Variant;
    function line: Integer;
    function col: Integer;
    procedure push_node(node: JAST_Node);
    function pop_node: JAST_Node;
    function stack: Variant;
    function parent(n: Float): JAST_Node;
  end;

  JSourceMapOptions = class external
    file: String; // nullable
    root: String; // nullable
    orig: Variant {JObject or JJSON}; // nullable
  end;

  JBeautifierOptions = class external
    indent_start: Integer; // nullable
    indent_level: Integer; // nullable
    quote_keys: Boolean; // nullable
    space_colon: Boolean; // nullable
    ascii_only: Boolean; // nullable
    inline_script: Boolean; // nullable
    width: Integer; // nullable
    max_line_len: Integer; // nullable
    ie_proof: Boolean; // nullable
    beautify: Boolean; // nullable
    source_map: JSourceMapOptions; // nullable
    bracketize: Boolean; // nullable
    comments: Boolean; // nullable
    semicolons: Boolean; // nullable
  end;

  JAST_Toplevel = class external(JAST_Node)
    procedure figure_out_scope;
    procedure compute_char_frequency;
    procedure mangle_names;
    procedure print(stream: JOutputStream);
    function print_to_string: String; overload;
    function print_to_string(options: JBeautifierOptions): String; overload;
  end;

  JMinifyOutput = class external
    code: String;
    map: String;
  end;

  JParseOptions = class external
    strict: Boolean; // nullable
    filename: String; // nullable
    toplevel: JAST_Toplevel; // nullable
  end;

  JMinifyOptions = class external
    spidermonkey: Boolean; // nullable
    outSourceMap: String; // nullable
    sourceRoot: String; // nullable
    inSourceMap: String; // nullable
    fromString: Boolean; // nullable
    warnings: Boolean; // nullable
    mangle: JObject; // nullable
    output: JMinifyOutput; // nullable
    compress: JObject; // nullable
  end;

  JSourceMap = class external
    procedure add(source: String; gen_line, gen_col, orig_line, orig_col: Integer); overload;
    procedure add(source: String; gen_line, gen_col, orig_line, orig_col: Integer; name: String); overload;
//    function get: JMOZ_SourceMap.SourceMapGenerator;
    function toString: String;
  end;

  JCompressorOptions = class external
    sequences: Boolean; // nullable
    properties: Boolean; // nullable
    dead_code: Boolean; // nullable
    drop_debugger: Boolean; // nullable
    unsafe: Boolean; // nullable
    conditionals: Boolean; // nullable
    comparisons: Boolean; // nullable
    evaluate: Boolean; // nullable
    booleans: Boolean; // nullable
    loops: Boolean; // nullable
    unused: Boolean; // nullable
    hoist_funs: Boolean; // nullable
    hoist_vars: Boolean; // nullable
    if_return: Boolean; // nullable
    join_vars: Boolean; // nullable
    cascade: Boolean; // nullable
    side_effects: Boolean; // nullable
    warnings: Boolean; // nullable
    global_defs: JObject; // nullable
  end;

  TVisitor = function(node: JAST_Node; descend: procedure): Boolean;

function minify(files: String): JMinifyOutput; overload; external;
function minify(files: array of String): JMinifyOutput; overload; external;
function minify(files: String; options: JMinifyOptions): JMinifyOutput; overload; external;
function minify(files: array of String; options: JMinifyOptions): JMinifyOutput; overload; external;
function parse(code: String): JAST_Toplevel; overload; external;
function parse(code: String; options: JParseOptions): JAST_Toplevel; overload; external;
function OutputStream: JOutputStream; overload; external;
function OutputStream(options: JBeautifierOptions): JOutputStream; overload; external;
function SourceMap: JSourceMap; overload; external;
function SourceMap(options: JSourceMapOptions): JSourceMap; overload; external;
function Compressor: JAST_Toplevel; overload; external;
function Compressor(options: JCompressorOptions): JAST_Toplevel; overload; external;
function TreeWalker(visitor: TVisitor): JTreeWalker; external;
function TreeTransformer(before: TVisitor; after: TVisitor): JTreeTransformer; external;