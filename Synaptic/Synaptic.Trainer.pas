unit Synaptic.Trainer;

interface

uses
  Synaptic.Network;

{$R 'trainer.js'}

type
  TTrainingSetItem = record
    input: array of Float;
    output: array of Float;
  end;
  TTrainingSet = array of TTrainingSetItem;
  
  JTrainerCost = class external 'Trainer.cost'
    class function CROSS_ENTROPY(target, output: Float): Float;
    class function MSE(target, output: Float): Float;
    class function BINARY(target, output: Float): Float;
  end;

  TTrainerCostFunction = function (target, output: Float): Float;

  JCrossValidate = class external
    testSize: Integer;
    testError: Float;
  end;
  
  JTrainerOptions = record
    rate: Float;
    iterations: Integer;
    error: Float;
    shuffle: Boolean;
    log: Integer;
    cost: TTrainerCostFunction;
    crossValidate: JCrossValidate;
  end;
  
  JTrainerResult = class external
    error: Float;
    iterations: Integer;
    time: Float;
  end;

  JDSROptions = record
    targets: array of Integer;
    distractors: array of Integer;
    prompts: array of Integer;
    _length: Integer; external 'length';
    success: Float;
    iterations: Integer;
    rate: Float;
    log: Integer;
    cost: Float;
  end;
  
  TTrainerCallback = procedure(result: JTrainerResult);

  JTrainer = class external 'Trainer'
  protected
    network: JNetwork;
    rate: Float;
    iterations: Integer;
    error: Float;
    shuffle: Boolean;
    cost: TTrainerCostFunction;
    crossValidate: JCrossValidate;
  public
    constructor Create(Network: JNetwork);
    
    function train(trainingSet: TTrainingSet): JTrainerResult; overload;
    function train(trainingSet: TTrainingSet;
      Options: JTrainerOptions): JTrainerResult; overload;

    procedure workerTrain(trainingSet: TTrainingSet;
      callback: TTrainerCallback); overload;
    procedure workerTrain(trainingSet: TTrainingSet;
      callback: TTrainerCallback; options: JTrainerOptions); overload;

    function test(trainingSet: TTrainingSet): JTrainerResult; overload;
    function test(trainingSet: TTrainingSet; Options: JTrainerOptions): JTrainerResult; overload;

    function &XOR: JTrainerResult; overload;
    function &XOR(Options: JTrainerOptions): JTrainerResult; overload;

    procedure DSR(options: JDSROptions);

    procedure ERG; overload;
    procedure ERG(options: JTrainerOptions); overload;

    procedure timingTask; overload;
    procedure timingTask(options: JTrainerOptions); overload;
  end;
    