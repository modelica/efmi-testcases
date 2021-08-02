within eFMI_TestCases.M22_SlipWithSafeDivision.Controllers;
block SimpleDrivenVehicleWithSlip
  extends .Modelica.Blocks.Icons.Block;

  .Modelica.Blocks.Interfaces.RealInput v_ref(
    min = -1.0e7,
    max = 1.0e7)
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealOutput w
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  .Modelica.Mechanics.Translational.Components.Mass mass(
    m = 250,
    s(fixed = true),
    v(fixed = true))
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Utilities.WheelWithLinearSlip wheel(
    wheelRadius = 0.3,
    J = 1,
    stiffness = 20000,
    v_min = 0.1)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  .Modelica.Mechanics.Rotational.Sources.Speed speed(
    exact = true,
    f_crit = 15)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  .Modelica.Blocks.Math.Gain gain(
    final k = 1/wheel.wheelRadius)
    annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
  .Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  .Modelica.Blocks.Continuous.CriticalDamping criticalDamping(
    n = 1,
    f = 15,
    normalized = false,
    initType = .Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));

equation
  connect(wheel.flangeT, mass.flange_a)
    annotation (Line(
      points={{20,0},{30,0}},
      color={0,127,0}));
  connect(speed.flange, wheel.flangeR)
    annotation (Line(
      points={{-10,0},{0,0}},
      color={0,0,0}));
  connect(gain.u, v_ref)
    annotation (Line(
      points={{-94,0},{-120,0}},
      color={0,0,127}));
  connect(mass.flange_b, speedSensor.flange)
    annotation (Line(
      points={{50,0},{60,0}},
      color={0,127,0}));
  connect(speedSensor.v, w)
    annotation (Line(
      points={{81,0},{110,0}},
      color={0,0,127}));
  connect(gain.y, criticalDamping.u)
    annotation (Line(
      points={{-71,0},{-62,0}},
      color={0,0,127}));
  connect(criticalDamping.y, speed.w_ref)
    annotation (Line(
      points={{-39,0},{-32,0}},
      color={0,0,127}));
end SimpleDrivenVehicleWithSlip;
