within eFMI_TestCases.M07_CrabEstimation.Controllers;
model Plant1 "Model of Crab"
  extends PartialPlantInterface;

  import  Modelica.Units.SI;
  import  Modelica.Math.*;

  parameter Real m = 2.17
    "Load mass";
  parameter Real J = 1.232
    "Load inertia";
  parameter Real l = 2.15
    "Crab length";
  parameter Real g = 9.81
    "Gravity acceleration";
  parameter Real mCrab = 8.42
    "Crab mass";

  parameter Real angle_init = 1.0;
  parameter Real w_init = -1;
  parameter Real s_init = 0;
  parameter Real v_init = 0;

  inner .Modelica.Mechanics.MultiBody.World world(
    enableAnimation = false,
    n = {0,-1,0},
    animateWorld = false,
    g = g)
    annotation (Placement(transformation(extent={{-90,10},{-70,30}})));

  .Modelica.Mechanics.Translational.Sensors.PositionSensor crabPosition
    annotation (Placement(transformation(extent={{20,-70},{40,-50}})));
  .Modelica.Mechanics.MultiBody.Sensors.RelativePosition relativePosition
    annotation (Placement(transformation(
      extent={{-10,10},{10,-10}},
      rotation=-90,
      origin={70,60})));
  .Modelica.Mechanics.MultiBody.Joints.Revolute revolute(
    w(fixed = true,
      start = w_init),
    phi(
      fixed = true,
      start = angle_init))
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  .Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(
    useAxisFlange = true,
    n = {0,1,0},
    s(start = s_init,
      fixed = true),
    v(start = v_init,
      fixed = true))
    annotation (Placement(transformation(extent={{-30,30},{-10,10}})));
  .Modelica.Mechanics.MultiBody.Parts.Body body(
    r_CM = zeros(3),
    m = m,
    I_33 = J)
    annotation (Placement(transformation(extent={{80,10},{100,30}})));
  .Modelica.Mechanics.MultiBody.Parts.Body bodyCrab(
    r_CM = zeros(3),
    m = mCrab)
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  .Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(
    r = {l,0,0})
    annotation (Placement(transformation(extent={{50,10},{70,30}})));
  .Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(
    animation = false,
    r = {0,0,0},
    n = {0,0,1},
    angle = -90)
    annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
  .Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame
    annotation (Placement(transformation(extent={{20,-50},{40,-30}})));
  .Modelica.Mechanics.Translational.Sources.Force force1
    annotation (Placement(transformation(extent={{-32,-24},{-12,-4}})));

equation
  connect(crabPosition.s,y2)
    annotation (Line(
      points={{41,-60},{110,-60}},
      color={0,0,127}));
  connect(fixedTranslation.frame_a,revolute. frame_b)
    annotation (Line(
      points={{50,20},{40,20}},
      color={95,95,95},
      thickness=0.5));
  connect(body.frame_a,fixedTranslation. frame_b)
    annotation (Line(
      points={{80,20},{70,20}},
      color={95,95,95},
      thickness=0.5));
  connect(world.frame_b,fixedRotation. frame_a)
    annotation (Line(
      points={{-70,20},{-60,20}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedFrame.frame_a,revolute. frame_a)
    annotation (Line(
      points={{20,-40},{10,-40},{10,20},{20,20}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedRotation.frame_b,prismatic. frame_a)
    annotation (Line(
      points={{-40,20},{-30,20}},
      color={95,95,95},
      thickness=0.5));
  connect(prismatic.frame_b,revolute. frame_a)
    annotation (Line(
      points={{-10,20},{20,20}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyCrab.frame_a,revolute. frame_a)
    annotation (Line(
      points={{20,-10},{10,-10},{10,20},{20,20}},
      color={95,95,95},
      thickness=0.5));
  connect(force1.flange, prismatic.axis)
    annotation (Line(
      points={{-12,-14},{-12,14}},
      color={0,127,0}));
  connect(force1.f, force)
    annotation (Line(
      points={{-34,-14},{-80,-14},{-80,0},{-120,0}},
      color={0,0,127}));
  connect(prismatic.axis, crabPosition.flange)
    annotation (Line(
      points={{-12,14},{-12,-60},{20,-60}},
      color={0,127,0}));
  connect(relativePosition.frame_b, fixedTranslation.frame_b)
    annotation (Line(
      points={{70,50},{70,20}},
      color={95,95,95},
      thickness=0.5));
  connect(relativePosition.r_rel[1], y1)
    annotation (Line(
      points={{81.3333,60},{110,60}},
      color={0,0,127}));
  connect(relativePosition.frame_a, fixedRotation.frame_a)
    annotation (Line(
      points={{70,70},{70,78},{-60,78},{-60,20}},
      color={95,95,95},
      thickness=0.5));
end Plant1;
