within eFMI.NeuralNetworks.Interfaces;
partial model NeuralLayer
  extends Icons.NeuralBlock;
  extends Icons.NeuralLayer;
  extends TensorFlowOperation(
    final nout = activationFunction.nout);

  replaceable ActivationType activationType
    constrainedby ActivationType(
      final nin = nin)
    annotation (Placement(transformation(extent={{-60,-40},{20,40}})));

  replaceable ActivationFunctions.Identity activationFunction
    constrainedby ActivationFunction(
      final nin = activationType.nout)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));

equation
  connect(activationFunction.y, y)
    annotation (Line(
      points={{60,0},{100,0}},
      color={129,129,129},
      thickness=1));
  connect(activationType.y, activationFunction.x)
    annotation (Line(
      points={{20,0},{40,0}},
      color={129,129,129},
      thickness=1));
  connect(x, activationType.x)
    annotation (Line(
      points={{-100,0},{-60,0}},
      color={129,129,129},
      thickness=1));
end NeuralLayer;
