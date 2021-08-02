within eFMI_TestCases.M22_SlipWithSafeDivision.TestSetups;
model OpenLoop
  extends .Modelica.Icons.Example;

  replaceable Controllers.SimpleDrivenVehicleWithSlip vehicle
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  .Modelica.Blocks.Sources.TimeTable timeTable(
    table=[0.0,0.0; 3,0.0; 6,30; 10,30; 13,0; 16,0])
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked v_ref
    annotation (Placement(transformation(extent={{-46,-6},{-34,6}})));
  .Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock clock(
    factor = 2,
    resolution = .Modelica.Clocked.Types.Resolution.ms,
    useSolver = true,
    solverMethod = "ExplicitEuler")
    annotation (Placement(transformation(extent={{-78,-58},{-62,-42}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold w
    annotation (Placement(transformation(extent={{34,-6},{46,6}})));

equation
  connect(timeTable.y, v_ref.u)
    annotation (Line(
      points={{-59,0},{-47.2,0}},
      color={0,0,127}));
  connect(v_ref.y, vehicle.v_ref)
    annotation (Line(
      points={{-33.4,0},{-12,0}},
      color={0,0,127}));
  connect(clock.y, v_ref.clock)
    annotation (Line(
      points={{-61.2,-50},{-40,-50},{-40,-7.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(vehicle.w, w.u)
    annotation (Line(
      points={{11,0},{32.8,0}},
      color={0,0,127}));

  annotation (
    experiment(
      StopTime = 16.0));
end OpenLoop;
