within eFMI_TestCases.S002_LinearEquationSystem.TestSetups;
partial model BaseSetup
  extends .Modelica.Icons.Example;

  .Modelica.Blocks.Sources.ExpSine expSine(
    amplitude = 5,
    f = 2,
    damping = 0.1)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  .Modelica.Blocks.Sources.SawTooth sawTooth(
    amplitude = 6,
    period = 0.4,
    offset = 2)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  .Modelica.Blocks.Sources.Ramp ramp(
    height = -5,
    duration = 8,
    offset = 1.5,
    startTime = 2)
    annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));
  .Modelica.Blocks.Sources.Exponentials exponentials(
    outMax = 4,
    riseTime = 4.6)
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock(
    useSolver = true,
    solverMethod = "ExplicitEuler",
    period = 0.01)
    annotation (Placement(transformation(extent={{-28,62},{-12,78}})));
end BaseSetup;
