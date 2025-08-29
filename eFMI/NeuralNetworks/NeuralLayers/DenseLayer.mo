within eFMI.NeuralNetworks.NeuralLayers;
model DenseLayer "Dense -- i.e., fully connected -- neuron layer."
  extends Interfaces.NeuralLayer(
    final nin = size(weights, 2),
    redeclare DenseActivation activationType(
      final weights = weights,
      final biases = biases));

  parameter Real[:, :] weights
    "Weight table of the dense layer.";
  parameter Real[size(weights, 1)] biases
    "Bias table of the dense layer.";

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
