within eFMI.NeuralNetworks.Preprocessors;
model MinMaxNormalize
  "Min-max normalization."

  extends Interfaces.Preprocessor(
    final nin = size(min, 1),
    final nout = size(min, 1));

  parameter Real[:] min
    "Minimum for each dimension of the training inputs.";
  parameter Real[size(min, 1)] max
    "Maximum for each dimension of the training inputs.";

equation
  y = (x - min) ./ (max - min)
    annotation(__Dymola_Expand = false);

  annotation (
    Icon(
      graphics={
        Line(
          points={{-30,60},{-30,-60}},
          color={0,0,0}),
        Line(
          points={{30,40},{30,-40}},
          color={0,0,0}),
        Line(
          points={{-30,60},{30,40}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{-30,-60},{30,-40}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{20,34},{20,40},{40,40},{40,34}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{20,-34},{20,-40},{40,-40},{40,-34}},
          color={0,0,0},
          thickness=1)}));
end MinMaxNormalize;
