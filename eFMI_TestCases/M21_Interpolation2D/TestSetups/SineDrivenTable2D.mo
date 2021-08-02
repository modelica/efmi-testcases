within eFMI_TestCases.M21_Interpolation2D.TestSetups;
model SineDrivenTable2D
  extends .Modelica.Icons.Example;

  replaceable Controllers.Table2D controller
    annotation (Placement(transformation(extent = {{0,-10},{20,10}})));

  .Modelica.Blocks.Sources.Sine sine1(
    amplitude = 3,
    f = 2)
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  .Modelica.Blocks.Sources.Sine sine2(
    amplitude = 4,
    f = 1.5)
    annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));

  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock(
    period = 0.01,
    useSolver = true,
    solverMethod = "ExplicitEuler")
    annotation (Placement(transformation(extent={{-78,62},{-62,78}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked u1
    annotation (Placement(transformation(extent={{-36,26},{-24,14}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample u2
    annotation (Placement(transformation(extent={{-36,-14},{-24,-26}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold y
    annotation (Placement(transformation(extent={{34,-6},{46,6}})));

equation
  connect(controller.y, y.u)
    annotation (Line(
      points={{21,0},{32.8,0}},
      color={0,0,127}));
  connect(clock.y, u1.clock)
    annotation (Line(
      points={{-61.2,70},{-30,70},{-30,27.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(sine1.y, u1.u)
    annotation (Line(
      points={{-59,20},{-37.2,20}},
      color={0,0,127}));
  connect(sine2.y, u2.u)
    annotation (Line(
      points={{-59,-20},{-37.2,-20}},
      color={0,0,127}));
  connect(u1.y, controller.u1)
    annotation (Line(
      points={{-23.4,20},{-10,20},{-10,6},{-2,6}},
      color={0,0,127}));
  connect(u2.y, controller.u2)
    annotation (Line(
      points={{-23.4,-20},{-10,-20},{-10,-6},{-2,-6}},
      color={0,0,127}));

  annotation (
    experiment(
      StopTime = 1.2,
      Interval = 0.01));
end SineDrivenTable2D;
