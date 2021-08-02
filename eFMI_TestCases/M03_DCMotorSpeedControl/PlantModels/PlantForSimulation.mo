within eFMI_TestCases.M03_DCMotorSpeedControl.PlantModels;
block PlantForSimulation
  "Model of DC motor."
  extends .Modelica.Blocks.Icons.Block;
  extends Icons.Drive;

  parameter Real gearRatio = 105;

  .Modelica.Electrical.Analog.Basic.Resistor resistor(
    R = 13.8)
    annotation (Placement(transformation(
      extent = {{-10,-10},{10,10}},
      rotation = 90,
      origin = {-80,40})));
  .Modelica.Electrical.Analog.Basic.Inductor inductor(
    L = 0.061,
    i(start = 0, fixed = true))
    annotation (Placement(transformation(
      extent = {{10,10},{-10,-10}},
      rotation = 90,
      origin = {-50,40})));
  .Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent = {{-90,-60},{-70,-40}})));
  .Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
    annotation (Placement(transformation(
      origin = {-80,0},
      extent = {{-10,10},{10,-10}},
      rotation = 270)));
  .Modelica.Electrical.Analog.Basic.RotationalEMF emf(
    k = 1.016)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  .Modelica.Mechanics.Rotational.Components.Inertia motorInertia(J = 0.0025)
    annotation (Placement(transformation(extent = {{-30,-10},{-10,10}})));
  .Modelica.Mechanics.Rotational.Components.IdealGear idealGear(
    ratio = gearRatio,
    useSupport = false)
    annotation (Placement(transformation(extent = {{0,-10},{20,10}})));
  .Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(
    c = 5.0e5,
    d = 500,
    phi_rel(fixed = true),
    w_rel(fixed = true))
    annotation (Placement(transformation(extent = {{28,-10},{48,10}})));
  .Modelica.Mechanics.Rotational.Components.Inertia loadInertia(
    J = 100,
    phi(fixed = true, start = 0),
    w(fixed = true, start = 0),
    a(fixed = false))
    annotation (Placement(transformation(extent = {{60,-10},{80,10}})));
  .Modelica.Blocks.Interfaces.RealInput vRef
    "Voltage between pin p and n (= p.v - n.v) as input signal"
    annotation (Placement(transformation(extent = {{-140,-20},{-100,20}})));
  .Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(
      extent = {{-10,-10},{10,10}},
      rotation = -90,
      origin = {0,-50})));
  .Modelica.Blocks.Interfaces.RealOutput wMotor
    "Absolute angular velocity of flange as output signal"
    annotation (Placement(transformation(
      extent = {{-10,-10},{10,10}},
      rotation = -90,
      origin = {0,-110})));
  .Modelica.Blocks.Interfaces.RealOutput wLoad
    "Absolute angular velocity of flange as output signal"
    annotation (Placement(transformation(
      extent = {{10,-10},{-10,10}},
      rotation = 180,
      origin = {110,0})));
  .Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1
    annotation (Placement(transformation(
      extent = {{-10,-10},{10,10}},
      rotation = 0,
      origin = {50,-52})));

equation
  connect(signalVoltage.p,resistor. p)
    annotation (Line(
      points = {{-80,10},{-80,30}},
      color = {0,0,255}));
  connect(resistor.n,inductor. p)
    annotation (Line(
      points = {{-80,50},{-80,60},{-50,60},{-50,50}},
      color = {0,0,255}));
  connect(inductor.n,emf. p)
    annotation (Line(
      points = {{-50,30},{-50,10}},
      color = {0,0,255}));
  connect(emf.n,ground. p)
    annotation (Line(
      points = {{-50,-10},{-50,-20},{-80,-20},{-80,-40}},
      color = {0,0,255}));
  connect(motorInertia.flange_a,emf.flange)
    annotation (Line(
      points = {{-30,0},{-40,0}},
      color = {0,0,0}));
  connect(idealGear.flange_b,springDamper. flange_a)
    annotation (Line(
      points = {{20,0},{28,0}},
      color = {0,0,0}));
  connect(springDamper.flange_b,loadInertia. flange_a)
    annotation (Line(
      points = {{48,0},{60,0}},
      color = {0,0,0}));
  connect(motorInertia.flange_b,idealGear. flange_a)
    annotation (Line(
      points = {{-10,0},{0,0}},
      color = {0,0,0}));
  connect(ground.p, signalVoltage.n)
    annotation (Line(
      points = {{-80,-40},{-80,-10}},
      color = {0,0,255}));
  connect(signalVoltage.v, vRef)
    annotation (Line(
      points={{-92,0},{-120,0}},
      color = {0,0,127}));
  connect(motorInertia.flange_b, speedSensor.flange)
    annotation (Line(
      points = {{-10,0},{1.77636e-15,0},{1.77636e-15,-40}},
      color = {0,0,0}));
  connect(speedSensor.w, wMotor)
    annotation (Line(
      points = {{-1.9984e-15,-61},{-1.9984e-15,-80},{0,-80},{0,-110}},
      color = {0,0,127}));
  connect(loadInertia.flange_b, speedSensor1.flange)
    annotation (Line(
      points = {{80,0},{80,-30},{30,-30},{30,-52},{40,-52}},
      color = {0,0,0}));
  connect(speedSensor1.w, wLoad)
    annotation (Line(
      points = {{61,-52},{90,-52},{90,0},{110,0}},
      color = {0,0,127}));
end PlantForSimulation;
