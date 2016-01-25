unit Synaptic.Neuron;

interface

{$R 'neuron.js'}

type
  JNeuron = class;

  JNeuronConnection = class external
  protected
    ID: Integer;
    from: JNeuron;
    &to: JNeuron;
    weight: Float;
    gain: Float;
    gater: JNeuron;
  public
    constructor Create(fromNeuron, toNeuron: JNeuron; weight: Float);
  end;
  
  JNeuronConnections = class external
    inputs: array of JNeuronConnection;
    projected: array of JNeuronConnection;
    gated: array of JNeuronConnection;
  end;
  
  JNeuronError = class external
    responsibility: Float;
    projected: Float;
    gated: Float;
  end; 
  
  JNeuronSquash = class external 'Neuron.squash'
    class function LOGISTIC(x, derivate: Float): Float;
    class function TANH(x, derivate: Float): Float;
    class function IDENTITY(x, derivate: Float): Float;
    class function HLIM(x, derivate: Float): Float;
    class function RELU(x, derivate: Float): Float;
  end;
  
  TNeuronSquashFunction = function (x, derivate: Float): Float; 
   
  JNeuron = class external 'Neuron'
  protected
    ID: Integer;
    &label: Variant;
    connections: JNeuronConnections;
    error: JNeuronError;
    state: Variant;
    old: Variant;
    activation: Float;
    selfconnection: JNeuronConnection;
    neighbors: array of JNeuron;
    bias: Float; 
    derivative: Float;    
  public
    squash: TNeuronSquashFunction;
    constructor Create;
    
    function project(neuron: JNeuron): JNeuronConnection; overload;
    function project(neuron: JNeuron; weight: Float): JNeuronConnection; overload;
    procedure gate(connection: JNeuronConnection);
    
    function activate: Float; overload;
    function activate(input: Float): Float; overload;
    function activate(input: Integer): Float; overload;

    procedure propagate(learningRate: Float; input: Float);

    procedure clear;
    procedure reset;

    function selfconnected: Boolean;
    function connected(neuron: JNeuron): Boolean;
  end;
    