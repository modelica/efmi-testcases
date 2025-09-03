within eFMI.NeuralNetworks.Preprocessors;
model MinMaxDenormalize
  "Min-max denormalization."

  extends Interfaces.Preprocessor(
    final nin = size(min, 1),
    final nout = size(min, 1));

  parameter Real[:] min
    "Minimum for each dimension of the training inputs.";
  parameter Real[size(min, 1)] max
    "Maximum for each dimension of the training inputs.";

equation
  y = x .* (max - min) + min;
    //annotation(__Dymola_Expand = false);

  annotation (
    Icon(
      graphics={
        Line(points={{32,60},{32,-60}},   color={0,0,0}),
        Line(points={{-28,40},{-28,-40}},
                                        color={0,0,0}),
        Line(
          points={{-28,40},{32,60}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{-28,-40},{32,-60}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{-38,34},{-38,40},{-18,40},{-18,34}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{-38,-34},{-38,-40},{-18,-40},{-18,-34}},
          color={0,0,0},
          thickness=1)}));
end MinMaxDenormalize;
