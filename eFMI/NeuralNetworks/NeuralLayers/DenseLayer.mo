within eFMI.NeuralNetworks.NeuralLayers;
model DenseLayer "Dense -- i.e., fully connected -- neuron layer."
  extends Interfaces.NeuralLayer(
    final nin = size(parameters.weights, 2),
    redeclare DenseActivation activationType(
      final weights = parameters.weights,
      final biases = parameters.biases));

  parameter Parameters parameters
    "Parameters (i.e., weights and biases) of the dense layer."
    annotation (Placement(transformation(extent={{-60,22},{-40,42}})));

  record Parameters
    "Dense neural network layer parameters."

    extends Icons.NeuralParameters;

    parameter Real[:, :] weights
      "Weight table of the dense layer.";
    parameter Real[size(weights, 1)] biases
      "Bias table of the dense layer.";

    annotation (
      preferredView = "info",
      __Dymola_eFMI_ExposeTunableParameters = true);
  end Parameters;
protected
  model DenseActivation
    extends Interfaces.ActivationType(
      final nout = size(biases, 1));

    parameter Real[:, :] weights;
    parameter Real[:] biases;

  equation
    y = weights * x + biases
      annotation(__Dymola_Expand = false);
  end DenseActivation;
end DenseLayer;
