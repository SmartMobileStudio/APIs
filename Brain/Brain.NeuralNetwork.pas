unit Brain.NeuralNetwork;

interface

type
  JTrainReturn = class external
    error: Float;
    iterations: Integer;
  end;
  
  TNeuralNetworkCallback = procedure (Value: JTrainReturn); 

  JTrainOptions = record
    iterations: Integer;
    errorThresh: Float;
    log: Boolean;
    logPeriod: Integer;
    learningRate: Float;
    callback: TNeuralNetworkCallback;
    callbackPeriod: Integer;
  end;
  
  JNeuralNetworkTrainData = record
    input: array of Float;
    output: array of Float;
  end; 

  JNeuralNetworkOptions = record
    learningRate: Float;
    momentum: Float;
    hiddenSizes: Float;
    binaryThresh: Float;
  end;
  
  JTestStats = class external
    error: Float;
    misclasses: Variant;    
  end; 
  
  JTrainStream = class;
  JTrainStreamOptions = class;
  
  TNeuralNetworkFunction = function(Input: array of Float): array of Float;
  
  JNeuralNetwork = class external 'brain.NeuralNetwork'
  protected
    procedure initialize(sizes: array of Integer);

    procedure calculateDeltas(target: array of Float); 
    procedure adjustWeights(learningRate: Float);
  public
    sizes: array of Integer;
    outputLayer: Variant;
    biases: array of Variant;
    weights: array of Variant;
    outputs: array of Variant;

    deltas: array of Variant;
    changes: array of Variant;
    errors: array of Variant;
    
    hiddenSizes: Integer;
    
    constructor Create; overload;  
    constructor Create(Options: JNeuralNetwork); overload;  

    function run(input: array of Float): array of Float;
    function runInput(input: array of Float): array of Float;

    function train(data: array of JNeuralNetworkTrainData): JTrainReturn; overload;
    function train(data: array of JNeuralNetworkTrainData; options: JTrainOptions): JTrainReturn; overload;
    function trainPattern(input, target: array of Float; learningRate: Float): Float;
    
    function formatData(data: Variant): array of Float;
    function test(data: Variant): JTestStats;
    
    function toJSON: Variant; 
    function fromJSON(json: Variant): Variant;
    
    function toFunction: TNeuralNetworkFunction;
    function createTrainStream(opts: JTrainStreamOptions): JTrainStream;
  end;
   
  TTrainStreamFloodCallback = procedure;
  TTrainStreamDoneTrainingCallback = procedure (Value: JTrainReturn);

  JTrainStreamOptions = class external
    neuralNetwork: JNeuralNetwork;
    iterations: Integer;
    errorThresh: Float;
    log: Boolean;
    logPeriod: Integer;
    callback: TNeuralNetworkCallback;
    callbackPeriod: Integer;
    floodCallback: TTrainStreamFloodCallback;
    doneTrainingCallback: TTrainStreamDoneTrainingCallback;
  end; 

  JTrainStream = class external 'brain.TrainStream'
  protected
    function _write(chunk, enc, next: Variant): Variant; 
    procedure trainDatum (datum: Variant); 
    procedure finishStreamIteration; 
  public
    constructor Create; overload;
    constructor Create(Options: JTrainStreamOptions); overload;
  
    neuralNetwork: JNeuralNetwork;
    dataFormatDetermined: Boolean;

    inputKeys: array of Variant;
    outputKeys: array of Variant;
    iterations: Integer;
    errorThresh: Float;
    log: Boolean;
    logPeriod: Integer;
    callback: TNeuralNetworkCallback;
    callbackPeriod: Integer;
    floodCallback: TTrainStreamFloodCallback;
    doneTrainingCallback: TTrainStreamDoneTrainingCallback;

    size: Integer;
    count: Integer;

    sum: Float;  
  end;

function RandomWeight: Float; external 'randomWeight';  
function Zeros(Size: Integer): array of Float; external 'zeros';  
function Randos(Size: Integer): array of Float; external 'randos';  
function MeanSquareError(errors: array of Float): Float; external 'mse';  

{$R 'brain-0.6.3.min.js'}

implementation

end.