within eFMI_TestCases.M19_Interpolation1D.TestSetups;
model SineDrivenTable1D
  extends .Modelica.Icons.Example;

  // WARNING: Do NOT modify the controller HERE:
  replaceable Controllers.Table1D controller
    annotation (Placement(transformation(extent = {{-10,-10},{10,10}})));

  .Modelica.Blocks.Sources.Sine sine(
    amplitude = 3,
    f = 2)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock(
    period = 0.01)
    annotation (Placement(transformation(extent={{-78,42},{-62,58}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked sample
    annotation (Placement(transformation(extent={{-36,6},{-24,-6}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold hold
    annotation (Placement(transformation(extent={{24,-6},{36,6}})));

equation
  connect(sample.y, controller.u)
    annotation (Line(
      points = {{-23.4,0},{-12,0}},
      color = {0,0,127}));
  connect(sine.y, sample.u)
    annotation (Line(
      points = {{-59,0},{-37.2,0}},
      color = {0,0,127}));
  connect(controller.y, hold.u)
    annotation (Line(
      points = {{11,0},{22.8,0}},
      color = {0,0,127}));
  connect(clock.y, sample.clock)
    annotation (Line(
      points = {{-61.2,50},{-30,50},{-30,7.2}},
      color = {175,175,175},
      pattern = LinePattern.Dot,
      thickness = 0.5));

  annotation (
    experiment(
      StopTime = 1.2,
      Interval = 0.01));
end SineDrivenTable1D;
