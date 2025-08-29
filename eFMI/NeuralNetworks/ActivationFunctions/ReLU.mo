within eFMI.NeuralNetworks.ActivationFunctions;
model ReLU
  extends Interfaces.ActivationFunction;
  extends Icons.ReLU;

equation
  for i in 1:size(x, 1) loop
    y[i] = .max(0.0, x[i]);
  end for annotation(__Dymola_Expand = false);
end ReLU;
