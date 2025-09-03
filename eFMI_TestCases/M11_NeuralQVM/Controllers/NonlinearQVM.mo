within eFMI_TestCases.M11_NeuralQVM.Controllers;
model NonlinearQVM
  "Reference QVM with non-linear Effects that are learned by the NN."

  extends LinearQVM;

  Components.NonlinearParts.ProgressiveSpring progressiveSpring
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={-28,34})));
  Components.NonlinearParts.FrictionModel frictionModel
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={26,34})));

equation
  connect(wheel_mass.flange_b, frictionModel.flange_a)
    annotation (Line(
      points={{0,4},{0,10},{26,10},{26,24}},
      color={0,127,0}));
  connect(body_mass.flange_a, frictionModel.flange_b)
    annotation (Line(
      points={{0,62},{0,54},{26,54},{26,44}},
      color={0,127,0}));
  connect(wheel_mass.flange_b, progressiveSpring.flange_a)
    annotation (Line(
      points={{0,4},{0,10},{-28,10},{-28,24}},
      color={0,127,0}));
  connect(body_mass.flange_a, progressiveSpring.flange_b)
    annotation (Line(
      points={{0,62},{0,54},{-28,54},{-28,44}},
      color={0,127,0}));

  annotation (
    preferredView = "diagram",
    Icon(
      graphics={
        Line(
          points={{-34,6},{-18,8},{-10,26}},
          color={238,46,47},
          smooth=Smooth.Bezier,
          thickness=1),
        Line(
          points={{34,28},{24,18},{20,22},{20,14}},
          color={102,44,145},
          smooth=Smooth.Bezier,
          thickness=1),
        Line(
          points={{6,2},{16,12},{20,8},{20,16}},
          color={102,44,145},
          smooth=Smooth.Bezier,
          thickness=1)}));
end NonlinearQVM;
