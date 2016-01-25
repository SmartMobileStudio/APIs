unit Synaptic.Architect;

interface

uses
  Synaptic.Network, Synaptic.Trainer;

{$R 'architect.js'}

type
  JArchitect = class external 'Architect' (JNetwork)
  public
    trainer: JTrainer;
  end;

  JPerceptron = class external 'Architect.Perceptron' (JArchitect)
  public
    constructor Create(args: array of Integer); external ;
  end;

  JLSTM = class external 'Architect.LSTM' (JArchitect)
  public
    constructor Create(args: array of Integer);
  end;
  
  JLiquid = class external 'Architect.Liquid' (JArchitect)
  public
    constructor Create(inputs, hidden, outputs, connections, gates: Integer);
  end;
  
  JHopfield = class external 'Architect.Hopfield' (JArchitect)
  public
    constructor Create(inputs, hidden, outputs, connections, gates: Integer);
  end;    