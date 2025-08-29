within eFMI.NeuralNetworks.Preprocessors;
model Identity
  extends Interfaces.Preprocessor(
    final nout = nin);

equation
  y = x
    annotation(__Dymola_Expand = false);

  annotation (
    Icon(
      graphics={
        Rectangle(
          extent={{-30,18},{30,8}},
          lineColor={129,129,129},
          lineThickness=1,
          fillColor={129,129,129},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-30,-12},{30,-22}},
          lineColor={129,129,129},
          lineThickness=1,
          fillColor={129,129,129},
          fillPattern=FillPattern.Solid)}));
end Identity;
