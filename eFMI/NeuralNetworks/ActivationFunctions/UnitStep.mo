within eFMI.NeuralNetworks.ActivationFunctions;
model UnitStep
  extends Interfaces.ActivationFunction;
  extends Icons.UnitStep;
equation
  for i in 1:size(x, 1) loop
    y[i] = (if x[i] < 0.0 then 0.0 else 1.0);
  end for annotation(__Dymola_Expand = false);
end UnitStep;
