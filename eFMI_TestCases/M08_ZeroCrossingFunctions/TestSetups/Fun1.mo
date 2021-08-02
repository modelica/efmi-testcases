within eFMI_TestCases.M08_ZeroCrossingFunctions.TestSetups;
model Fun1
  extends .Modelica.Icons.Example;

  replaceable Controllers.Function1 func
    constrainedby Controllers.Function1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  Modelica.Blocks.Sources.ExpSine expSine(
    amplitude = 8.9,
    f = 3,
    phase = -0.61086523819802,
    damping = 0.2,
    offset = 1.3,
    startTime = 0.02)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock(
    period = 0.01)
    annotation (Placement(transformation(extent={{-78,42},{-62,58}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked u
    annotation (Placement(transformation(extent={{-36,6},{-24,-6}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold y
    annotation (Placement(transformation(extent={{22,-6},{34,6}})));

equation
  connect(u.y,func. u)
    annotation (Line(
      points={{-23.4,0},{-12,0}},
      color = {0,0,127}));
  connect(expSine.y,u. u)
    annotation (Line(
      points={{-59,0},{-37.2,0}},
      color = {0,0,127}));
  connect(clock.y,u. clock)
    annotation (Line(
      points={{-61.2,50},{-30,50},{-30,7.2}},
      color = {175,175,175},
      pattern = LinePattern.Dot,
      thickness = 0.5));
  connect(y.u,func. y)
    annotation (Line(
      points={{20.8,0},{11,0}},
      color = {0,0,127}));

  annotation (
    experiment(
      StopTime = 3,
      Interval = 0.01));
end Fun1;
