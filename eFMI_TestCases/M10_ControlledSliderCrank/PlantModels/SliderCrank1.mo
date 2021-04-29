within eFMI_TestCases.M10_ControlledSliderCrank.PlantModels;
model SliderCrank1
  extends SliderCrank_interface;

  inner Modelica.Mechanics.MultiBody.World world(
    animateWorld = false,
    gravityArrowLength = 0.1)
    annotation (Placement(transformation(extent = {{-46,-80},{-26,-60}})));

  Modelica.Mechanics.MultiBody.Joints.Revolute rev1(
    useAxisFlange = true,
    cylinderDiameter = 0.02,
    cylinderLength = 0.04)
    annotation (Placement(transformation(extent = {{-18,-60},{2,-80}})));
  Modelica.Mechanics.MultiBody.Joints.SphericalSpherical sphericalSpherical(
    sphereDiameter = 0.02,
    rodDiameter = 0.01,
    rodLength = 0.5)
    annotation (Placement(transformation(
      extent = {{-10,-10},{10,10}},
      rotation = 90,
      origin = {12,-28})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation crank(
    height = 0.01,
    r = {0.1,0.0,0})
    annotation (Placement(transformation(
      extent = {{-10,-10},{10,10}},
      rotation = 90,
      origin = {12,-54})));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper(
    d = 1,
    s_rel(stateSelect=StateSelect.always),
    v_rel(start = 0, fixed = true),
    c = 3000)
    annotation (Placement(transformation(
      extent = {{10,10},{-10,-10}},
      rotation = -90,
      origin = {30,29})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prism1(
    boxWidth = 0.01,
    boxHeight = 0.01,
    boxWidthDirection = {0,-1,0},
    boxColor = {0,230,0},
    animation = false,
    n = {0,-1,0},
    useAxisFlange = false)
    annotation (Placement(transformation(
      extent = {{10,10},{-10,-10}},
      rotation = 90,
      origin = {12,-2})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(
    animation = false,
    r = {0,0.5,0})
    annotation (Placement(transformation(extent = {{-28,4},{-8,24}})));
  Utilities.Mass mass(m = 5, L = 0.1)
    annotation (Placement(transformation(
      extent = {{-10,-10},{10,10}},
      rotation = 90,
      origin = {30,58})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(extent = {{50,58},{70,78}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=0.1)
    annotation (Placement(transformation(extent = {{-80,-100},{-60,-80}})));
  Utilities.Mounting1D mounting1D(n = {0,1,0})
    annotation (Placement(transformation(extent = {{26,-12},{46,8}})));
  Modelica.Mechanics.Translational.Sources.ConstantForce constantForce(
    f_constant = -mass.m*9.81)
    annotation (Placement(transformation(
      extent = {{-10,-10},{10,10}},
      rotation = -90,
      origin = {30,84})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
    annotation (Placement(transformation(extent = {{12,-100},{32,-80}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque1
    annotation (Placement(transformation(extent = {{-76,-8},{-60,8}})));

equation
  connect(rev1.frame_b, crank.frame_a)
    annotation (Line(
      points = {{2,-70},{12,-70},{12,-64}},
      color = {95,95,95},
      thickness = 0.5));
  connect(sphericalSpherical.frame_a, crank.frame_b)
    annotation (Line(
      points = {{12,-38},{12,-38},{12,-44}},
      color = {95,95,95},
      thickness = 0.5));
  connect(prism1.frame_b, sphericalSpherical.frame_b)
    annotation (Line(
      points = {{12,-12},{12,-18}},
      color = {95,95,95},
      thickness = 0.5));
  connect(fixed.frame_b, prism1.frame_a)
    annotation (Line(
      points = {{-8,14},{12,14},{12,8}},
      color = {95,95,95},
      thickness = 0.5));
  connect(world.frame_b, rev1.frame_a)
    annotation (Line(
      points = {{-26,-70},{-26,-70},{-18,-70}},
      color = {95,95,95},
      thickness = 0.5));
  connect(springDamper.flange_b, mass.flange_a)
    annotation (Line(
      points = {{30,39},{30,48}},
      color = {0,127,0}));
  connect(positionSensor.s, s)
    annotation (Line(
      points = {{71,68},{80,68},{80,0},{110,0}},
      color = {0,0,127}));
  connect(inertia1.flange_b, rev1.axis)
    annotation (Line(
      points = {{-60,-90},{-34,-90},{-8,-90},{-8,-80}},
      color = {0,0,0}));
  connect(sphericalSpherical.frame_b, mounting1D.frame_a)
    annotation (Line(
      points = {{12,-18},{12,-16},{36,-16},{36,-12}},
      color = {95,95,95},
      thickness = 0.5));
  connect(mounting1D.flange_b, springDamper.flange_a)
    annotation (Line(
      points = {{46,-2},{58,-2},{58,10},{30,10},{30,19}},
      color = {0,127,0}));
  connect(mass.flange_b, positionSensor.flange)
    annotation (Line(
      points = {{30,68},{38,68},{46,68},{50,68}},
      color = {0,127,0}));
  connect(constantForce.flange, mass.flange_b)
    annotation (Line(
      points = {{30,74},{30,71},{30,68}},
      color = {0,127,0}));
  connect(angleSensor.flange, inertia1.flange_b)
    annotation (Line(
      points = {{12,-90},{-24,-90},{-60,-90}},
      color = {0,0,0}));
  connect(angleSensor.phi, phi)
    annotation (Line(
      points={{33,-90},{60,-90},{60,-70},{110,-70}},
      color = {0,0,127}));
  connect(torque1.flange, inertia1.flange_a)
    annotation (Line(
      points = {{-60,0},{-54,0},{-54,-52},{-90,-52},{-90,-90},{-80,-90}},
      color = {0,0,0}));
  connect(tau, torque1.tau)
    annotation (Line(points = {{-120,0},{-77.6,0}}, color={0,0,127}));

  annotation (
    preferredView = "diagram",
    Icon(
      graphics={
        Text(
          extent = {{80,10},{100,-10}},
          lineColor = {0,0,0},
          textString = "s"),
        Text(
          extent = {{70,-60},{100,-80}},
          lineColor = {0,0,0},
          textString = "phi"),
        Text(
          extent = {{-100,10},{-70,-10}},
          lineColor = {0,0,0},
          textString = "tau"),
        Text(
          extent={{-100,-60},{-20,-100}},
          lineColor={28,108,200},
          textString="v1")}));
end SliderCrank1;
