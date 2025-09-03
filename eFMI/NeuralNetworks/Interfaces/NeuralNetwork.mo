within eFMI.NeuralNetworks.Interfaces;
partial model NeuralNetwork
  extends Icons.NeuralNetwork;
  extends TensorFlowOperation(
    final nin = preprocessor.nin,
    final nout = postprocessor.nout);

  replaceable Preprocessors.Identity preprocessor
    constrainedby Preprocessor
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  replaceable Preprocessors.Identity postprocessor
    constrainedby Preprocessor
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));

equation
  connect(x, preprocessor.x)
    annotation (Line(
      points={{-100,0},{-70,0}},
      color={129,129,129},
      thickness=1));
  connect(postprocessor.y, y)
    annotation (Line(
      points={{70,0},{100,0}},
      color={129,129,129},
      thickness=1));
end NeuralNetwork;
