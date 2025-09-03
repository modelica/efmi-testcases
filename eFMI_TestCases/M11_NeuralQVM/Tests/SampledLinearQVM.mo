within eFMI_TestCases.M11_NeuralQVM.Tests;
model SampledLinearQVM
  extends LinearQVM(
    break connect(integrator.y, prediction_model.z_road));

  .Modelica.Clocked.RealSignals.Sampler.SampleClocked sample_z_road
    annotation (Placement(transformation(extent={{-6,6},{6,-6}})));
  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock(
    period = 1.0e-3,
    useSolver = true,
    solverMethod = "ExplicitEuler")
    annotation (Placement(transformation(extent={{-38,42},{-22,58}})));

equation
  connect(clock.y, sample_z_road.clock)
    annotation (Line(
      points={{-21.2,50},{0,50},{0,7.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(integrator.y, sample_z_road.u)
    annotation (Line(
      points={{-19,0},{-7.2,0}},
      color={0,0,127}));
  connect(sample_z_road.y, prediction_model.z_road)
    annotation (Line(
      points={{6.6,0},{16,0}},
      color={0,0,127}));

  annotation (
    preferredView = "diagram",
    experiment(
      StopTime = 60,
      Interval = 1.0e-3,
      Tolerance = 1.0e-05,
      __Dymola_Algorithm = "Euler"));
end SampledLinearQVM;
