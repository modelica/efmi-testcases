within eFMI.NeuralNetworks.Preprocessors;
model StandardScoreDenormalize
  "Standard score (z-score) denormalization."

  extends Interfaces.Preprocessor(
    final nin = size(mean, 1),
    final nout = size(mean, 1));

  parameter Real[:] mean
    "⁠μ (mu): Mean for each dimension of the training inputs.";
  parameter Real[size(mean, 1)] stdDeviation
    "⁠σ (sigma): Standard deviation for each dimension of the training inputs.";

equation
  y = (x .* stdDeviation) + mean
    annotation(__Dymola_Expand = false);

  annotation (
    Icon(
      graphics={
        Line(
          points={{-34,-34},{-34,-38}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          origin={-10,-38},
          points={{-30,0.88},{-25,3.51},{-20,10.82},{-15,25.97},{-10,48.52},
            {-5,70.60},{0,80},{5,70.60},{10,48.52},{15,25.97},{20,10.82},
            {25,3.51},{30,0.88}},
          smooth = Smooth.Bezier),
        Line(
          points={{30,58},{30,-62}},
          color={0,0,0}),
        Line(
          points={{30,58},{6,42}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{30,-62},{6,-48}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{-24,34},{-24,42},{4,42},{4,34}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{-10,40},{-10,-38}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{-24,-12},{-24,-38}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{4,-12},{4,-38}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{-24,-40},{-24,-46},{4,-46},{4,-40}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{14,-34},{14,-38}},
          color={0,0,0},
          pattern=LinePattern.Dot)}));
end StandardScoreDenormalize;
