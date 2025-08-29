within eFMI.NeuralNetworks.Interfaces;
partial model ActivationFunction
  extends Icons.NeuralBlock;
  extends Icons.CoordinateSystem;
  extends TensorFlowOperation(
    final nout = nin);
end ActivationFunction;
