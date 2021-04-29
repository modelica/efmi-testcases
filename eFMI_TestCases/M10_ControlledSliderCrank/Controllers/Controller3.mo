within eFMI_TestCases.M10_ControlledSliderCrank.Controllers;
model Controller3
  extends Controller_interface;

  parameter Modelica.SIunits.Position s_start=0.6;

  Modelica.Blocks.Math.Gain gain(k = 10)
    annotation (Placement(transformation(
      extent = {{20,-30},{40,-10}},
      rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(
      extent = {{-10,-30},{10,-10}},
      rotation = 0)));
  PlantModels.SliderCrank3 sliderCrank(world(
      enableAnimation=false,
      animateWorld=false,
      animateGravity=false), s_start=s_start)
    annotation (Placement(transformation(extent={{26,6},{-2,34}})));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
    annotation (Placement(transformation(extent = {{-28,0},{48,40}})));
  Modelica.Blocks.Continuous.CriticalDamping criticalDamping(
    f = 2,
    n = 3)
    annotation (Placement(transformation(extent = {{-60,10},{-40,30}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent = {{68,-6},{80,6}})));

equation
  connect(feedback.y, gain.u)
    annotation (Line(
      points = {{9,-20},{18,-20}},
      color = {0,0,127}));
  connect(sliderCrank.s, inverseBlockConstraints.u2)
    annotation (Line(points={{-3.4,20},{-20.4,20}}, color={0,0,127}));
  connect(criticalDamping.y, inverseBlockConstraints.u1)
    annotation (Line(
      points = {{-39,20},{-31.8,20}},
      color = {0,0,127}));
  connect(gain.y, add.u2)
    annotation (Line(
      points = {{41,-20},{52,-20},{52,-3.6},{66.8,-3.6}},
      color = {0,0,127}));
  connect(inverseBlockConstraints.y1, add.u1)
    annotation (Line(
      points = {{49.9,20},{52,20},{52,3.6},{66.8,3.6}},
      color = {0,0,127}));
  connect(sliderCrank.phi, feedback.u1) annotation (Line(points={{-3.4,10.2},{-20,
          10.2},{-20,-20},{-8,-20}}, color={0,0,127}));
  connect(phi, feedback.u2)
    annotation (Line(
      points={{-120,-70},{0,-70},{0,-28}},
      color = {0,0,127}));
  connect(s_ref, criticalDamping.u)
    annotation (Line(
      points={{-120,70},{-80,70},{-80,20},{-62,20}},
      color = {0,0,127}));
  connect(add.y, tau)
    annotation (Line(
      points = {{80.6,0},{110,0}},
      color = {0,0,127}));
  connect(sliderCrank.tau, inverseBlockConstraints.y2)
    annotation (Line(points={{28.8,20},{42.3,20}}, color={0,0,127}));

  annotation (preferredView = "diagram", Icon(graphics={Text(
          extent={{-40,20},{40,-20}},
          lineColor={28,108,200},
          textString="v3")}));
end Controller3;
