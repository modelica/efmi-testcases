within eFMI_TestCases.M05_ControlledMixingUnit.TestSetups;
partial model BaseSetup
  extends .eFMI_TestCases.Utilities.ClockedContinuousTwin;
  extends .Modelica.Icons.Example;

  replaceable Controllers.Controller controller
    constrainedby .Modelica.Blocks.Interfaces.SI2SO
    annotation (Placement(transformation(extent = {{-10,-10},{10,10}})));

  .Modelica.Blocks.Sources.Step step(
    height = -0.848*0.3,
    offset = 0.848*(1 - 0.42))
    annotation (Placement(transformation(
      extent = {{-80,-4},{-60,16}},
      rotation = 0)));

  // Clocked configuration:
  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock(
    useSolver = false,
    period = -1.0,
    solverMethod = "") if is_clocked
    annotation (Placement(transformation(extent={{-78,52},{-62,68}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked c if is_clocked
    annotation (Placement(transformation(extent={{-36,12},{-24,0}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample T if is_clocked
    annotation (Placement(transformation(extent={{36,-36},{24,-24}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold T_c if is_clocked
    annotation (Placement(transformation(extent={{24,-6},{36,6}})));

equation
  if is_clocked then
    // Clocked configuration:
    connect(T.y, controller.u2)
      annotation (Line(
        points = {{23.4,-30},{-30,-30},{-30,-6},{-12,-6}},
        color = {0,0,127}));
    connect(controller.y, T_c.u)
      annotation (Line(
        points = {{11,0},{22.8,0}},
        color = {0,0,127}));
    connect(clock.y, c.clock)
      annotation (Line(
        points = {{-61.2,60},{-30,60},{-30,13.2}},
        color = {175,175,175},
        pattern = LinePattern.Dot,
        thickness = 0.5));
    connect(step.y, c.u)
      annotation (Line(
        points = {{-59,6},{-37.2,6}},
        color = {0,0,127}));
    connect(c.y, controller.u1)
      annotation (Line(
        points = {{-23.4,6},{-12,6}},
        color = {0,0,127}));
  else
    // Continuous configuration:
    connect(step.y, controller.u1);
  end if;
end BaseSetup;
