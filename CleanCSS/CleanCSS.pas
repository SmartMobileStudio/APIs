unit CleanCSS;

interface

type
  JCleanCSSOptions = class external
    advanced: Boolean; // nullable
    aggressiveMerging: Boolean; // nullable
    benchmark: Boolean; // nullable
    compatibility: JObject; // nullable
    debug: Boolean; // nullable
    inliner: JObject; // nullable
    keepBreaks: Boolean; // nullable
    keepSpecialComments: Variant {String or Float}; // nullable
    mediaMerging: Boolean; // nullable
    processImport: Boolean; // nullable
    processImportFrom: array of String; // nullable
    rebase: Boolean; // nullable
    relativeTo: String; // nullable
    restructuring: Boolean; // nullable
    root: String; // nullable
    roundingPrecision: Float; // nullable
    semanticMerging: Boolean; // nullable
    shorthandCompacting: Boolean; // nullable
    sourceMap: Variant {Boolean or String}; // nullable
    sourceMapInlineSources: Boolean; // nullable
    target: String; // nullable
  end;

  JCleanCSSOutput = class external
    styles: String;
    sourceMap: String;
    errors: array of String;
    warnings: array of String;
    stats: record
      originalSize: Float;
      minifiedSize: Float;
      timeSpent: Float;
      efficiency: Float;
    end;
  end;

  JCleanCSS = class external 'clean-css.CleanCSS'
    constructor Create(options: JCleanCSSOptions);
    function minify(sources: String): JCleanCSSOutput; overload;
    function minify(sources: array of String): JCleanCSSOutput; overload;
    function minify(sources: JObject): JCleanCSSOutput; overload;
    function minify(sources: String; callback: procedure(error: Variant; minified: JCleanCSSOutput)): JCleanCSSOutput; overload;
    function minify(sources: array of String; callback: procedure(error: Variant; minified: JCleanCSSOutput)): JCleanCSSOutput; overload;
    function minify(sources: JObject; callback: procedure(error: Variant; minified: JCleanCSSOutput)): JCleanCSSOutput; overload;
  end;