within eFMI.NeuralNetworks.Preprocessors;
model PCA
  "Principal component analysis (PCA)."

  extends Interfaces.Preprocessor(
    final nin = size(A, 2),
    final nout = size(A, 1));

  parameter Real[:, :] A
    "Transformation matrix, based on the eigenvectors of the covariance matrix
     of all training features.";

equation
  y = A * x
    annotation(__Dymola_Expand = false);

  annotation (
    Icon(
      graphics={
        Line(
          points={{40,60},{-40,-60}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{0,0},{20,30}},
          color={140,140,140},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{20,-20},{-20,20}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{0,0},{-10,10}},
          color={140,140,140},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Ellipse(
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          extent={{32,40},{40,48}},
          pattern=LinePattern.None),
        Ellipse(
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          extent={{4,-2},{12,6}},
          pattern=LinePattern.None),
        Ellipse(
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          extent={{-44,-36},{-36,-28}},
          pattern=LinePattern.None),
        Ellipse(
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          extent={{-16,-10},{-8,-2}},
          pattern=LinePattern.None),
        Ellipse(
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          extent={{-6,-28},{2,-20}},
          pattern=LinePattern.None),
        Ellipse(
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          extent={{-6,16},{2,24}},
          pattern=LinePattern.None),
        Ellipse(
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          extent={{-20,-30},{-12,-22}},
          pattern=LinePattern.None),
        Ellipse(
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          extent={{14,32},{22,40}},
          pattern=LinePattern.None)}));
end PCA;
