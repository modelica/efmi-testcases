within eFMI_TestCases.M05_ControlledMixingUnit.Controllers;
model Controller
  extends .Modelica.Blocks.Interfaces.SI2SO(
    u1(min = 0, max = 1000),
    u2(min = 0, max = 1000),
    y(min = 0, max = 1000));
  extends eFMI_TestCases.Icons.Controller;

  parameter .Modelica.Units.SI.Frequency freq=1/300
    "Critical frequency of filter";

  PlantModels.MixingUnit invMixingUnit(final for_inversion = true)
    annotation (Placement(transformation(
      extent = {{8,10},{-12,30}},
      rotation = 0)));
  .Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent = {{52,-8},{68,8}})));
  .Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
    annotation (Placement(transformation(extent = {{-34,4},{22,36}})));
  .Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent = {{-20,-30},{0,-10}})));
  .Modelica.Blocks.Math.Gain gain(k = 20)
    annotation (Placement(transformation(extent = {{12,-30},{32,-10}})));
  .Modelica.Clocked.Examples.Systems.Utilities.ComponentsMixingUnit.CriticalDamping filter(
    n = 3,
    f = freq,
    x(start = {0.49, 0.49,  0.49},
      fixed = {true, false, false}))
    annotation (Placement(transformation(extent={{-70,10},{-50,30}})));

equation
  connect(feedback.y, gain.u)
    annotation (Line(
      points = {{-1,-20},{10,-20}},
      color = {0,0,127}));
  connect(gain.y, add.u2)
    annotation (Line(
      points = {{33,-20},{40,-20},{40,-4.8},{50.4,-4.8}},
      color = {0,0,127},
      smooth = Smooth.None));
  connect(inverseBlockConstraints.y2, invMixingUnit.T_c)
    annotation (Line(
      points = {{17.8,20},{10,20}},
      color = {0,0,127},
      smooth = Smooth.None));
  connect(invMixingUnit.c, inverseBlockConstraints.u2)
    annotation (Line(
      points = {{-14,26},{-22,26},{-22,20},{-28.4,20}},
      color = {0,0,127},
      smooth = Smooth.None));
  connect(invMixingUnit.T, feedback.u1)
    annotation (Line(
      points = {{-14,14},{-30,14},{-30,-20},{-18,-20}},
      color = {0,0,127},
      smooth = Smooth.None));
  connect(filter.y, inverseBlockConstraints.u1)
    annotation (Line(
      points = {{-49,20},{-36.8,20}},
      color = {0,0,127},
      smooth = Smooth.None));
  connect(inverseBlockConstraints.y1, add.u1)
    annotation (Line(
      points = {{23.4,20},{40,20},{40,4.8},{50.4,4.8}},
      color = {0,0,127},
      smooth = Smooth.None));
  connect(u1, filter.u)
    annotation (Line(
      points = {{-120,60},{-90,60},{-90,20},{-72,20}},
      color = {0,0,127}));
  connect(u2, feedback.u2)
    annotation (Line(
      points = {{-120,-60},{-10,-60},{-10,-28}},
      color = {0,0,127}));
  connect(add.y, y)
    annotation (Line(
      points = {{68.8,0},{110,0}},
      color = {0,0,127}));

  annotation (preferredView = "diagram");
end Controller;
