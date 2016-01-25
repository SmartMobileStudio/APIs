unit Synaptic.Network;

interface

uses
  Synaptic.Neuron, Synaptic.Layer;

{$R 'network.js'}

type
  JNetworkConnection = Variant;

  JNetworkSetup = record
    input: JLayer;
    hidden: array of JLayer;
    output: JLayer;
  end;

  JDotOutput = class external
    code: String;
    link: String;
  end;

  TStandaloneFunction = function(input: array of Float): array of Float;

  JNetwork = class external 'Network'
  protected
    layers: JNetworkSetup;
  public
    optimized: JNetwork;

    constructor Create(setup: JNetworkSetup);
    
    function project(otherNetwork: JNetwork): JNetworkConnection; overload;
    function project(otherNetwork: JNetwork; connectionType: TConnectionType): JNetworkConnection; overload;
    procedure gate(connection: JNetworkConnection; gateType: TGateType);
    
    function activate: array of Float; overload;
    function activate(input: array of Float): array of Float; overload;
    function activate(input: array of Integer): array of Float; overload;

    procedure propagate(learningRate: Float; input: array of Float);

    function standalone: TStandaloneFunction;
    function worker: Variant;

    function toJSON: Variant; overload;
    function toJSON(ignoreTraces: Boolean): Variant; overload;
    function toDot: JDotOutput; overload;
    function toDot(edgeConnection: Boolean): JDotOutput; overload;
    function fromJSON(JSON: Variant): Variant;

    procedure clear;
    procedure reset;

    procedure optimize;
    procedure restore;
    procedure setOptimize(value: Boolean);

    function selfconnected: Boolean;
    function connected(network: JNetwork): Boolean;

    function neurons: array of JNeuron;
    function inputs: Integer;
    function outputs: Integer;

    function clone: JNetwork;
    procedure &set(options: JNetworkSetup); overload;
  end;
    