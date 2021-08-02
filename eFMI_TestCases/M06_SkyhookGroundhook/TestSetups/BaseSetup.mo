within eFMI_TestCases.M06_SkyhookGroundhook.TestSetups;
partial model BaseSetup
  extends .Modelica.Icons.Example;

  replaceable Controllers.SkyhookGroundhook controller
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock(
    period = 0.001,
    useSolver = true,
    solverMethod = "ExplicitEuler")
    annotation (Placement(transformation(extent={{-78,72},{-62,88}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked v_body
    annotation (Placement(transformation(extent={{-36,26},{-24,14}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample v_wheel
    annotation (Placement(transformation(extent={{-36,-6},{-24,6}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample v_damper
    annotation (Placement(transformation(extent={{-36,-26},{-24,-14}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold u_damper
    annotation (Placement(transformation(extent={{24,-6},{36,6}})));

equation
  connect(clock.y, v_body.clock)
    annotation (Line(
      points={{-61.2,80},{-30,80},{-30,27.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(v_body.y, controller.v_body)
    annotation (Line(
      points={{-23.4,20},{-20,20},{-20,6},{-12,6}},
      color={0,0,127}));
  connect(v_wheel.y, controller.v_wheel)
    annotation (Line(
      points={{-23.4,0},{-12,0}},
      color={0,0,127}));
  connect(v_damper.y, controller.v_damper)
    annotation (Line(
      points={{-23.4,-20},{-20,-20},{-20,-6},{-12,-6}},
      color={0,0,127}));
  connect(controller.u_damper, u_damper.u)
    annotation (Line(
      points={{11,0},{22.8,0}},
      color={0,0,127}));
end BaseSetup;
