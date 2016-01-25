unit Synaptic.Layer;

interface

uses
  Synaptic.Neuron;

{$R 'layer.js'}

type
  TConnectionType = string;
  TConnectionTypeHelper = strict helper for TConnectionType
    const ALL_TO_ALL = 'ALL TO ALL';
    const ONE_TO_ONE = 'ONE TO ONE';
    const ALL_TO_ELSE = 'ALL TO ELSE';
  end;

  TGateType = string;
  TGateTypeHelper = strict helper for TGateType
    const INPUT = 'INPUT';
    const OUTPUT = 'OUTPUT';
    const ONE_TO_ONE = 'ONE TO ONE';
  end;

  JLayer = class;
  JLayerConnection = class external 'Layer.connection'
  protected
    ID: Integer;
    from: JLayer;
    &to: JLayer;
    selfconnection: Boolean;
    &type: TConnectionType;
    connections: Variant;
    list: array of Variant;
    size: Integer;
    gatedfrom: array of Variant;
  public
    constructor Create(fromLayer, toLayer: JLayer; &type: TConnectionType; weights: array of Float);
  end;

  JLayerSetOptions = record
    &layer: JLayer;
    squash: TNeuronSquashFunction;
    bias: Float;
  end;
  
  JLayer = class external 'Layer'
  protected
    size: Integer;
    list: array of Variant;
    &label: Variant;
    connectedTo: array of Variant;
  public
    squash: TNeuronSquashFunction;
    constructor Create(Size: Integer);
    
    function project(neuron: JLayer): JLayerConnection; overload;
    function project(neuron: JLayer; connectionType: TConnectionType): JLayerConnection; overload;
    function project(neuron: JLayer; connectionType: TConnectionType; wheights: array of Float): JLayerConnection; overload;
    procedure gate(connection: JLayerConnection; gateType: TGateType);
    
    function activate: array of Float; overload;
    function activate(input: array of Float): array of Float; overload;
    function activate(input: array of Integer): array of Float; overload;

    procedure propagate(learningRate: Float; input: array of Float);

    procedure clear;
    procedure reset;

    function selfconnected: Boolean;
    function connected(layer: JLayer): Boolean;
    function neurons: array of JNeuron;

    function &set: JLayer; overload;
    function &set(options: JLayerSetOptions): JLayer; overload;
    procedure add(neuron: JNeuron);
  end;
    