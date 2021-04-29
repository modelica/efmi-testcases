within eFMI_TestCases.M20_ComplianceWithInterpolation1D.TestSetups;
model OpenLoop
  extends .eFMI_TestCases.Utilities.ClockedContinuousTwin;
  extends .Modelica.Icons.Example;

  replaceable Controllers.DriveTrain driveTrain
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  Modelica.Blocks.Sources.Ramp ramp(height=30, duration=0.5)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

  Modelica_Synchronous.RealSignals.Sampler.SampleClocked w_ref if is_clocked
    annotation (Placement(transformation(extent={{-36,6},{-24,-6}})));
  Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock clock(
    factor=1,
    resolution=Modelica_Synchronous.Types.Resolution.ms,
    useSolver=true,
    solverMethod="Rosenbrock1")  if is_clocked
    annotation (Placement(transformation(extent={{-78,42},{-62,58}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold w if is_clocked
    annotation (Placement(transformation(extent={{34,-6},{46,6}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold torque if is_clocked
    annotation (Placement(transformation(extent={{34,-46},{46,-34}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold w_diff if is_clocked
    annotation (Placement(transformation(extent={{34,34},{46,46}})));

equation
  if is_clocked then
    connect(w_ref.u, ramp.y)
      annotation (Line(
        points={{-37.2,0},{-59,0}},
        color={0,0,127}));
    connect(w_ref.y, driveTrain.w_ref)
      annotation (Line(
        points={{-23.4,0},{-12,0}},
        color={0,0,127}));
    connect(clock.y, w_ref.clock)
      annotation (Line(
        points={{-61.2,50},{-30,50},{-30,7.2}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5));
    connect(driveTrain.w, w.u)
      annotation (Line(
        points={{11,0},{32.8,0}},
        color={0,0,127}));
    connect(driveTrain.torque, torque.u)
      annotation (Line(
        points={{11,-6},{20,-6},{20,-40},{32.8,-40}},
        color={0,0,127}));
    connect(driveTrain.w_diff, w_diff.u)
      annotation (Line(
        points={{11,6},{20,6},{20,40},{32.8,40}},
        color={0,0,127}));
  else
    connect(ramp.y, driveTrain.w_ref);
  end if;
end OpenLoop;
