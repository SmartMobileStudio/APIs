unit Bootstrap;

interface

type
  JModalOptions = class external
    backdrop: Variant {Boolean or String}; // nullable
    keyboard: Boolean; // nullable
    show: Boolean; // nullable
    remote: String; // nullable
  end;

  JModalOptionsBackdropString = class external
    backdrop: String; // nullable
    keyboard: Boolean; // nullable
    show: Boolean; // nullable
    remote: String; // nullable
  end;

  JScrollSpyOptions = class external
    offset: Float; // nullable
    target: String; // nullable
  end;

  JTooltipOptions = class external
    animation: Boolean; // nullable
    html: Boolean; // nullable
    placement: Variant {String or JFunction}; // nullable
    selector: String; // nullable
    title: Variant {String or JFunction}; // nullable
    trigger: String; // nullable
    template: String; // nullable
    delay: Variant {Float or JObject}; // nullable
    container: Variant {String or Boolean}; // nullable
    viewport: Variant {String or JFunction or JObject}; // nullable
  end;

  JPopoverOptions = class external
    animation: Boolean; // nullable
    html: Boolean; // nullable
    placement: Variant {String or JFunction}; // nullable
    selector: String; // nullable
    trigger: String; // nullable
    title: Variant {String or JFunction}; // nullable
    template: String; // nullable
    content: Variant; // nullable
    delay: Variant {Float or JObject}; // nullable
    container: Variant {String or Boolean}; // nullable
    viewport: Variant {String or JFunction or JObject}; // nullable
  end;

  JCollapseOptions = class external
    parent: Variant; // nullable
    toggle: Boolean; // nullable
  end;

  JCarouselOptions = class external
    interval: Float; // nullable
    pause: String; // nullable
    wrap: Boolean; // nullable
    keybord: Boolean; // nullable
  end;

  JTypeaheadOptions = class external
    source: Variant; // nullable
    items: Float; // nullable
    minLength: Float; // nullable
    matcher: function(item: Variant): Boolean; // nullable
    sorter: function(items: array of Variant): array of Variant; // nullable
    updater: function(item: Variant): Variant; // nullable
    highlighter: function(item: Variant): String; // nullable
  end;

  JAffixOptions = class external
    offset: Variant {Float or JFunction or JObject}; // nullable
    target: Variant; // nullable
  end;

  JJQuery = class external
    function modal: JJQuery; overload;
    function modal(options: JModalOptions): JJQuery; overload;
    function modal(options: JModalOptionsBackdropString): JJQuery; overload;
    function modal(command: String): JJQuery; overload;
    function dropdown: JJQuery; overload;
    function dropdown(command: String): JJQuery; overload;
    function scrollspy(command: String): JJQuery;
    function scrollspy: JJQuery; overload;
    function scrollspy(options: JScrollSpyOptions): JJQuery; overload;
    function tab: JJQuery; overload;
    function tab(command: String): JJQuery; overload;
    function tooltip: JJQuery; overload;
    function tooltip(options: JTooltipOptions): JJQuery; overload;
    function tooltip(command: String): JJQuery; overload;
    function popover: JJQuery; overload;
    function popover(options: JPopoverOptions): JJQuery; overload;
    function popover(command: String): JJQuery; overload;
    function alert: JJQuery;
    function alert(command: String): JJQuery; overload;
    function button: JJQuery;
    function button(command: String): JJQuery; overload;
    function collapse: JJQuery; overload;
    function collapse(options: JCollapseOptions): JJQuery; overload;
    function collapse(command: String): JJQuery; overload;
    function carousel: JJQuery; overload;
    function carousel(options: JCarouselOptions): JJQuery; overload;
    function carousel(command: String): JJQuery; overload;
    function typeahead: JJQuery; overload;
    function typeahead(options: JTypeaheadOptions): JJQuery; overload;
    function affix: JJQuery; overload;
    function affix(options: JAffixOptions): JJQuery; overload;
  end;

//"bootstrap"
