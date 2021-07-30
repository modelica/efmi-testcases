within eFMI_TestCases.S001_PIDController.TestSetups;
model OpenLoop
  extends .Modelica.Icons.Example;

  replaceable Controllers.PIDController controller
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));

  .Modelica.Blocks.Sources.Ramp ramp(
    height = 3.0,
    duration = 1)
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  .Modelica.Blocks.Sources.Ramp ramp1(
    height = 300,
    duration = 1,
    offset = 0.01)
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  .Modelica.Blocks.Sources.Sine sine(
    amplitude = 4.6,
    f = 6)
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
  .Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-30,-60},{-10,-40}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked wLoadRef
    annotation (Placement(transformation(extent={{-46,16},{-34,4}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample wMotor
    annotation (Placement(transformation(
      extent={{-6,-6},{6,6}},
      rotation=90,
      origin={0,-22})));
  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock(
    period = 0.001,
    useSolver = true,
    solverMethod = "ExplicitEuler")
    annotation (Placement(transformation(extent={{-78,62},{-62,78}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold vMotor
    annotation (Placement(transformation(extent={{36,4},{48,16}})));

equation
  connect(ramp1.y,add. u1)
    annotation (Line(
      points={{-59,-30},{-40,-30},{-40,-44},{-32,-44}},
      color={0,0,127}));
  connect(sine.y,add. u2)
    annotation (Line(
      points={{-59,-70},{-40,-70},{-40,-56},{-32,-56}},
      color={0,0,127}));
  connect(ramp.y,wLoadRef. u)
    annotation (Line(
      points={{-59,10},{-47.2,10}},
      color={0,0,127}));
  connect(wLoadRef.y,controller. wLoadRef)
    annotation (Line(
      points={{-33.4,10},{-12,10}},
      color={0,0,127}));
  connect(add.y,wMotor. u)
    annotation (Line(
      points={{-9,-50},{0,-50},{0,-29.2}},
      color={0,0,127}));
  connect(wMotor.y,controller. wMotor)
    annotation (Line(
      points={{0,-15.4},{0,-2}},
      color={0,0,127}));
  connect(clock.y,wLoadRef. clock)
    annotation (Line(
      points={{-61.2,70},{-40,70},{-40,17.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(controller.vMotor,vMotor. u)
    annotation (Line(points={{11,10},{34.8,10}}, color={0,0,127}));

  annotation (
    experiment(
      StopTime = 3.0));
end OpenLoop;
