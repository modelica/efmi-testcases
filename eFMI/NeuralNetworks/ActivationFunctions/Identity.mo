within eFMI.NeuralNetworks.ActivationFunctions;
model Identity
  extends Interfaces.ActivationFunction;
  extends Icons.Identity;

equation
  /*
  y = x
    annotation(__Dymola_Expand = false);
  */
  connect(x, y)
    annotation (Line(
      points={{-100,0},{100,0}},
      color={129,129,129},
      thickness=1));
end Identity;
