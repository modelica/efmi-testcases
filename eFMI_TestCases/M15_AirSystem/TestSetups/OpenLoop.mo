within eFMI_TestCases.M15_AirSystem.TestSetups;
model OpenLoop
  extends .Modelica.Icons.Example;
  extends .eFMI_TestCases.Utilities.ClockedContinuousTwin;

  replaceable Controllers.AirSystem airSystem
    annotation (Placement(transformation(extent={{-14,-14},{16,16}})));

  // Clocked configuration:
  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock if is_clocked
    annotation (Placement(transformation(extent={{-78,52},{-62,68}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked v if is_clocked
    annotation (Placement(transformation(extent={{-46,26},{-34,14}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample m_dot_f_i if is_clocked
    annotation (Placement(transformation(extent={{-46,-26},{-34,-14}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold T_i if is_clocked
    annotation (Placement(transformation(extent={{44,24},{56,36}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold p_i if is_clocked
    annotation (Placement(transformation(extent={{44,4},{56,16}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold AFR if is_clocked
    annotation (Placement(transformation(extent={{44,-16},{56,-4}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold n if is_clocked
    annotation (Placement(transformation(extent={{44,-36},{56,-24}})));

  .Modelica.Blocks.Sources.Ramp throttle_angle(
    height=30,
    duration=0.3,
    offset=35,
    startTime=0.5)
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  .Modelica.Blocks.Sources.Ramp fuel_mass_flow(
    height=0.0005,
    duration=0.2,
    offset=0.0005,
    startTime=0.5)
    annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));

equation
  if is_clocked then
    // Clocked configuration:
    connect(clock.y, v.clock)
      annotation (Line(
        points={{-61.2,60},{-40,60},{-40,27.2}},
        color = {175,175,175},
        pattern = LinePattern.Dot,
        thickness = 0.5));
    connect(v.y, airSystem.v)
      annotation (Line(
        points = {{-33.4,20},{-24,20},{-24,7},{-15.5,7}},
        color = {0,0,127}));
    connect(m_dot_f_i.y, airSystem.m_dot_f_i)
      annotation (Line(
        points = {{-33.4,-20},{-24,-20},{-24,-5},{-15.5,-5}},
        color = {0,0,127}));
    connect(airSystem.T_i, T_i.u)
      annotation (Line(
        points={{17.5,10},{36,10},{36,30},{42.8,30}},
        color = {0,0,127}));
    connect(airSystem.p_i, p_i.u)
      annotation (Line(
        points={{17.5,4},{40,4},{40,10},{42.8,10}},
        color = {0,0,127}));
    connect(airSystem.AFR, AFR.u)
      annotation (Line(
        points={{17.5,-2},{40,-2},{40,-10},{42.8,-10}},
        color = {0,0,127}));
    connect(airSystem.n, n.u)
      annotation (Line(
        points={{17.5,-8},{36,-8},{36,-30},{42.8,-30}},
        color = {0,0,127}));
    connect(throttle_angle.y, v.u)
      annotation (Line(points={{-59,20},{-47.2,20}}, color={0,0,127}));
    connect(fuel_mass_flow.y, m_dot_f_i.u)
      annotation (Line(points={{-59,-20},{-47.2,-20}}, color={0,0,127}));
  else
    // Continuous configuration:
    connect(throttle_angle.y, airSystem.v);
    connect(fuel_mass_flow.y, airSystem.m_dot_f_i);
  end if;

  annotation (
    experiment(
      StopTime = 4.001));
end OpenLoop;
