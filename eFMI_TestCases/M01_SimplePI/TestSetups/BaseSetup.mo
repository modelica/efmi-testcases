within eFMI_TestCases.M01_SimplePI.TestSetups;
partial model BaseSetup
  extends .eFMI_TestCases.Utilities.ClockedContinuousTwin;
  extends .Modelica.Icons.Example;

  replaceable Controllers.PI controller
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  .Modelica.Blocks.Sources.Ramp reference(
    duration = 2,
    startTime = 0.1)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock if is_clocked
    annotation (Placement(transformation(extent={{-78,42},{-62,58}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked r if is_clocked
    annotation (Placement(transformation(extent={{-36,6},{-24,-6}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample y if is_clocked annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={0,-30})));
  .Modelica.Clocked.RealSignals.Sampler.Hold u if is_clocked
    annotation (Placement(transformation(extent={{24,-6},{36,6}})));

equation
  if is_clocked then
    connect(clock.y, r.clock)
      annotation (Line(
        points={{-61.2,50},{-30,50},{-30,7.2}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5));
    connect(reference.y, r.u)
      annotation (Line(
        points={{-59,0},{-37.2,0}},
        color={0,0,127}));
    connect(r.y, controller.r)
      annotation (Line(
        points={{-23.4,0},{-12,0}},
        color={0,0,127}));
    connect(y.y, controller.y)
      annotation (Line(
        points={{3.88578e-16,-23.4},{0,-12}},
        color={0,0,127}));
    connect(controller.u, u.u)
      annotation (Line(
        points={{11,0},{22.8,0}},
        color={0,0,127}));
  else
    connect(reference.y, controller.r);
  end if;

end BaseSetup;
