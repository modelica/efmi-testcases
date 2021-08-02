within eFMI_TestCases.M02_SimplePID.PlantModels;
model SimpleDrivetrain "Very simple model of a driveline"
  extends .Modelica.Blocks.Icons.Block;
  extends Icons.Drivetrain;

  parameter .Modelica.Units.SI.Inertia J = 10
    "Moment of inertia";

  .Modelica.Blocks.Interfaces.RealInput tau
    "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealOutput w
    "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  .Modelica.Mechanics.Rotational.Components.Inertia inertia1(
    phi(
      fixed = true,
      start = 0),
    J = 1,
    a(fixed = true,
      start = 0))
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  .Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  .Modelica.Mechanics.Rotational.Components.SpringDamper spring(
    c = 1e4,
    d = 100,
    stateSelect = StateSelect.prefer,
    w_rel(fixed = true),
    phi_rel(fixed = true))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  .Modelica.Mechanics.Rotational.Components.Inertia inertia2(
    J = 2)
    annotation (Placement(transformation(extent={{28,-10},{48,10}})));
  .Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  .Modelica.Mechanics.Rotational.Sources.ConstantTorque loadTorque(
    tau_constant = 10,
    useSupport = false)
    annotation (Placement(transformation(extent={{80,-10},{60,10}})));

equation
  connect(spring.flange_b,inertia2. flange_a)
    annotation (Line(
      points={{10,0},{28,0}}));
  connect(inertia1.flange_b,spring. flange_a)
    annotation (Line(
      points={{-30,0},{-10,0}}));
  connect(torque.flange,inertia1. flange_a)
    annotation (Line(
      points={{-60,0},{-50,0}}));
  connect(speedSensor.flange,inertia1. flange_b)
    annotation (Line(
      points={{-10,-40},{-20,-40},{-20,0},{-30,0}}));
  connect(loadTorque.flange,inertia2. flange_b)
    annotation (Line(
      points={{60,0},{48,0}}));
  connect(tau, torque.tau)
    annotation (Line(
      points={{-120,0},{-82,0}},
      color={0,0,127}));
  connect(speedSensor.w, w)
    annotation (Line(
      points={{11,-40},{96,-40},{96,0},{110,0}},
      color={0,0,127}));
end SimpleDrivetrain;
