within eFMI_TestCases.M02_SimplePID.TestSetups;
partial model BaseSetup
  extends .eFMI_TestCases.Utilities.ClockedContinuousTwin;
  extends .Modelica.Icons.Example;

  replaceable Controllers.LimPID controller
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));

  Modelica.Blocks.Sources.KinematicPTP kinematicPTP(
    startTime=0.5,
    deltaq={1.57},
    qd_max={1},
    qdd_max={1}) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Continuous.Integrator integrator(
    initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));

  Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock clock if is_clocked
    annotation (Placement(transformation(extent={{-78,42},{-62,58}})));
  Modelica_Synchronous.RealSignals.Sampler.SampleClocked u_s if is_clocked
    annotation (Placement(transformation(extent={{-6,6},{6,-6}})));
  Modelica_Synchronous.RealSignals.Sampler.Sample u_m if is_clocked
    annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={30,-30})));
  Modelica_Synchronous.RealSignals.Sampler.Hold y if is_clocked
    annotation (Placement(transformation(extent={{54,-6},{66,6}})));

equation
  connect(kinematicPTP.y[1],integrator. u)
    annotation (Line(points={{-59,0},{-42,0}},   color={0,0,127}));

  if is_clocked then
    connect(integrator.y, u_s.u)
      annotation (Line(points={{-19,0},{-7.2,0}}, color={0,0,127}));
    connect(clock.y, u_s.clock)
      annotation (Line(
        points={{-61.2,50},{0,50},{0,7.2}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5));
    connect(u_s.y, controller.u_s)
      annotation (Line(points={{6.6,0},{18,0}}, color={0,0,127}));
    connect(controller.y, y.u)
      annotation (Line(points={{41,0},{52.8,0}}, color={0,0,127}));
    connect(u_m.y, controller.u_m)
      annotation (Line(points={{30,-23.4},{30,-12}}, color={0,0,127}));
  else
    connect(integrator.y, controller.u_s);
  end if;

end BaseSetup;
