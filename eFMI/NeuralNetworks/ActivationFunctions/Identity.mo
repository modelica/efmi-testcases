within eFMI.NeuralNetworks.ActivationFunctions;
model Identity
  extends Interfaces.ActivationFunction;
  extends Icons.Identity;

equation
  y = x
    annotation(__Dymola_Expand = false);
end Identity;
