within eFMI.NeuralNetworks.Preprocessing;
model StandardScoreNormalize
  "Standard score (z-score) normalization."

  extends Interfaces.Preprocessing(final ninout = size(mean, 1));

  parameter Real[:] mean
    "⁠μ (mu): Mean for each dimension of the training inputs.";
  parameter Real[size(mean, 1)] stdDeviation
    "⁠σ (sigma): Standard deviation for each dimension of the training inputs.";

equation
  y = (x - mean) ./ stdDeviation
    annotation(__Dymola_Expand = false);

  annotation (
    Icon(
      graphics={
        Line(
          points={{-14,-32},{-14,-36}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          origin={10,-36},
          points={{-30,0.88},{-25,3.51},{-20,10.82},{-15,25.97},{-10,48.52},
            {-5,70.60},{0,80},{5,70.60},{10,48.52},{15,25.97},{20,10.82},
            {25,3.51},{30,0.88}},
          smooth = Smooth.Bezier),
        Line(
          points={{-30,60},{-30,-60}},
          color={0,0,0}),
        Line(
          points={{-6,-44},{-30,-60}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{-6,46},{-30,60}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{-4,36},{-4,44},{24,44},{24,36}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{10,42},{10,-36}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{-4,-10},{-4,-36}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{24,-10},{24,-36}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{-4,-38},{-4,-44},{24,-44},{24,-38}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{34,-32},{34,-36}},
          color={0,0,0},
          pattern=LinePattern.Dot)}));
end StandardScoreNormalize;
