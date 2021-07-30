within eFMI_TestCases.M10_ControlledSliderCrank.PlantModels;
model SliderCrank3
  extends SliderCrank_interface;

  inner .Modelica.Mechanics.MultiBody.World world(
    animateWorld = false,
    gravityArrowLength = 0.1)
    annotation (Placement(transformation(extent = {{-46,-80},{-26,-60}})));

  .Modelica.Mechanics.Translational.Components.SpringDamper springDamper(
    stateSelect=StateSelect.always,
    s_rel(
      fixed = true,
      start = 0),
    d = 1,
    v_rel(start = 0, fixed = true),
    c = 3000)
    annotation (Placement(transformation(
      extent = {{10,10},{-10,-10}},
      rotation = -90,
      origin = {30,29})));
  .Modelica.Mechanics.MultiBody.Parts.Fixed fixed(
    animation = false,
    r = {0,0.5,0})
    annotation (Placement(transformation(extent={{-38,10},{-18,30}})));
  Utilities.Mass mass(
    s(fixed=true, start=s_start - 0.05),
                      m = 5, L = 0.1,
    stateSelect=StateSelect.always,
    v(fixed=true))
    annotation (Placement(transformation(
      extent = {{-10,-10},{10,10}},
      rotation = 90,
      origin = {30,58})));
  .Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(extent = {{50,58},{70,78}})));
  .Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=0.1)
    annotation (Placement(transformation(extent = {{-80,-100},{-60,-80}})));
  Utilities.Mounting1D mounting1D(n = {0,1,0})
    annotation (Placement(transformation(extent={{48,-10},{68,10}})));
  .Modelica.Mechanics.Translational.Sources.ConstantForce constantForce(
    f_constant = -mass.m*9.81)
    annotation (Placement(transformation(
      extent = {{-10,-10},{10,10}},
      rotation = -90,
      origin = {30,84})));
  .Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
    annotation (Placement(transformation(extent = {{12,-100},{32,-80}})));
  .Modelica.Mechanics.Rotational.Sources.Torque torque1
    annotation (Placement(transformation(extent = {{-76,-8},{-60,8}})));

  parameter Modelica.Units.SI.Position s_start=0.6;
  //Modelica.Mechanics.MultiBody.Joints.Assemblies.JointSSR
  Utilities.JointSSR2 jointSSR(
    rod1Length = 0.5,
    rRod2_ib = {0.1,0,0},
    positiveBranch = false)
    annotation (Placement(transformation(
      extent={{-20,-20},{20,20}},
      rotation=-90,
      origin={0,-38})));
  .Modelica.Mechanics.MultiBody.Joints.Prismatic prism1(
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
      origin={0,0})));

equation
  connect(springDamper.flange_b, mass.flange_a)
    annotation (Line(
      points = {{30,39},{30,48}},
      color = {0,127,0}));
  connect(positionSensor.s, s)
    annotation (Line(
      points = {{71,68},{80,68},{80,0},{110,0}},
      color = {0,0,127}));
  connect(mounting1D.flange_b, springDamper.flange_a)
    annotation (Line(
      points={{68,0},{74,0},{74,10},{30,10},{30,19}},
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
    annotation (Line(
      points = {{-120,0},{-77.6,0}},
      color={0,0,127}));
  connect(inertia1.flange_b, jointSSR.axis)
    annotation (Line(
      points={{-60,-90},{6,-90},{6,-68},{16,-68},{16,-58}},
      color={0,0,0}));
  connect(world.frame_b, jointSSR.frame_b) annotation (Line(
      points={{-26,-70},{0,-70},{0,-58}},
      color={95,95,95},
      thickness=0.5));
  connect(jointSSR.frame_a, prism1.frame_b) annotation (Line(
      points={{0,-18},{0,-10}},
      color={95,95,95},
      thickness=0.5));
  connect(prism1.frame_a, fixed.frame_b) annotation (Line(
      points={{0,10},{0,20},{-18,20}},
      color={95,95,95},
      thickness=0.5));
  connect(prism1.frame_b, mounting1D.frame_a) annotation (Line(
      points={{0,-10},{0,-16},{58,-16},{58,-10}},
      color={95,95,95},
      thickness=0.5));

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
          textString="v3")}));
end SliderCrank3;
