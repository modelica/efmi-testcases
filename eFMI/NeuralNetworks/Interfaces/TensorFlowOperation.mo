within eFMI.NeuralNetworks.Interfaces;
partial model TensorFlowOperation
  parameter Integer nin
    "Number of inputs.";
  parameter Integer nout
    "Number of outputs.";

  TensorFlowInput[nin] x
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
        iconTransformation(extent={{-120,-20},{-80,20}})));
  TensorFlowOutput[nout] y
    annotation (Placement(transformation(extent={{80,-20},{120,20}}),
        iconTransformation(extent={{80,-20},{120,20}})));
end TensorFlowOperation;
