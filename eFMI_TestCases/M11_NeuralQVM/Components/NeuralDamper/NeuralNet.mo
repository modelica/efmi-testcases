within eFMI_TestCases.M11_NeuralQVM.Components.NeuralDamper;
model NeuralNet
  extends .eFMI.NeuralNetworks.Interfaces.NeuralNetwork(
    redeclare .eFMI.NeuralNetworks.Preprocessors.MinMaxNormalize preprocessor(
      min = {0.0},
      max = {0.333333333}),
    redeclare .eFMI.NeuralNetworks.Preprocessors.MinMaxDenormalize postprocessor(
      min = {0.0},
      max = {100.0}));

  parameter Parametrization parameters
    annotation (Placement(transformation(extent={{-6,8},{6,20}})));

  .eFMI.NeuralNetworks.NeuralLayers.DenseLayer denseLayer1(
    redeclare .eFMI.NeuralNetworks.ActivationFunctions.ReLU activationFunction,
    parameters(
      weights = parameters.layer_1_weights,
      biases = parameters.layer_1_bias))
    annotation (Placement(transformation(extent={{-36,-6},{-24,6}})));

  .eFMI.NeuralNetworks.NeuralLayers.DenseLayer denseLayer2(
    redeclare .eFMI.NeuralNetworks.ActivationFunctions.ReLU activationFunction,
    parameters(
      weights = parameters.layer_2_weights,
      biases = parameters.layer_2_bias))
    annotation (Placement(transformation(extent={{-16,-6},{-4,6}})));

  .eFMI.NeuralNetworks.NeuralLayers.DenseLayer denseLayer3(
    redeclare .eFMI.NeuralNetworks.ActivationFunctions.ReLU activationFunction,
    parameters(
      weights = parameters.layer_3_weights,
      biases = parameters.layer_3_bias))
    annotation (Placement(transformation(extent={{4,-6},{16,6}})));

  .eFMI.NeuralNetworks.NeuralLayers.DenseLayer denseLayer4(
    parameters(
      weights = parameters.layer_4_weights,
      biases = parameters.layer_4_bias))
    annotation (Placement(transformation(extent={{24,-6},{36,6}})));

equation

  connect(preprocessor.y, denseLayer1.x)
    annotation (Line(
      points={{-50,0},{-36,0}},
      color={129,129,129},
      thickness=1));
  connect(denseLayer1.y, denseLayer2.x)
    annotation (Line(
      points={{-24,0},{-16,0}},
      color={129,129,129},
      thickness=1));
  connect(denseLayer2.y,denseLayer3. x)
    annotation (Line(
      points={{-4,0},{4,0}},
      color={129,129,129},
      thickness=1));
  connect(denseLayer3.y,denseLayer4. x)
    annotation (Line(
      points={{16,0},{24,0}},
      color={129,129,129},
      thickness=1));
  connect(denseLayer4.y, postprocessor.x)
    annotation (Line(
      points={{36,0},{50,0}},
      color={129,129,129},
      thickness=1));

  annotation (
    preferredView = "diagram",
    Diagram(coordinateSystem(extent={{-100,-20},{100,20}})));
end NeuralNet;
