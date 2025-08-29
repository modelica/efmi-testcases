within eFMI.NeuralNetworks.ActivationFunctions;
model Tanh
  extends Interfaces.ActivationFunction;
  extends Icons.Tanh;

equation
  y = .tanh(x)
    annotation(__Dymola_Expand = false);
end Tanh;
