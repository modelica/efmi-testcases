within eFMI.NeuralNetworks.Interfaces;
partial model TensorFlowOperation
  parameter Integer ninout = 1
    "Number of in- and outputs.";

  TensorFlowInput[ninout] x
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
        iconTransformation(extent={{-120,-20},{-80,20}})));
  TensorFlowOutput[ninout] y
    annotation (Placement(transformation(extent={{80,-20},{120,20}}),
        iconTransformation(extent={{80,-20},{120,20}})));
end TensorFlowOperation;
