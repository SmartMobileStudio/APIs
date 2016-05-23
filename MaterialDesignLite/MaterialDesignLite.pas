unit MaterialDesignLite;

interface

uses
  W3C.DOM, W3C.HTML5;

type
  JComponentConfigPublic = class external
    procedure &constructor(element: JHTMLElement);
    classAsString: String;
    cssClass: String;
    widget: Variant {String or Boolean}; // nullable
  end;

  JComponentHandler = class external 'MaterialDesignLite.ComponentHandler'
    procedure upgradeDom; overload;
    procedure upgradeDom(jsClass: String); overload;
    procedure upgradeDom(jsClass: String; cssClass: String); overload;
    procedure upgradeElement(element: JHTMLElement); overload;
    procedure upgradeElement(element: JHTMLElement; jsClass: String); overload;
    procedure upgradeElements(elements: JHTMLElement); overload;
    procedure upgradeElements(elements: array of JHTMLElement); overload;
    procedure upgradeElements(elements: JNodeList); overload;
    procedure upgradeElements(elements: JHTMLCollection); overload;
    procedure upgradeAllRegistered;
    procedure registerUpgradedCallback(jsClass: String; callback: function(element: JHTMLElement): Variant);
    procedure register(config: JComponentConfigPublic);
    procedure downgradeElements(nodes: JNode); overload;
    procedure downgradeElements(nodes: array of JNode); overload;
    procedure downgradeElements(nodes: JNodeList); overload;
  end;

var
  ComponentHandler external 'componentHandler': JComponentHandler;