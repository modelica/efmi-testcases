within eFMI.NeuralNetworks.ActivationFunctions;
model Sigmoid
  extends Interfaces.ActivationFunction;
  extends Icons.Sigmoid;

equation
  for i in 1:size(x, 1) loop
    y[i] = 1.0 / (1.0 + .exp(x[i]));
  end for annotation(__Dymola_Expand = false);
end Sigmoid;
