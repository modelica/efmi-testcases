within eFMI_TestCases.M16_ROM.TestSetups;
partial model BaseSetup
  extends .eFMI_TestCases.Utilities.ClockedContinuousTwin;
  extends Modelica.Icons.Example;

  // Clocked configuration:
  Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock clock(
    useSolver = false,
    period = -1.0,
    solverMethod = "") if is_clocked
    "Must still be configured when 'is_clocked = true'."
    annotation (Placement(transformation(extent={{-78,42},{-62,58}})));
  Modelica_Synchronous.RealSignals.Sampler.SampleClocked sample_n if is_clocked
    annotation (Placement(transformation(extent={{-36,26},{-24,14}})));
  Modelica_Synchronous.RealSignals.Sampler.Sample sample_tau if is_clocked
    annotation (Placement(transformation(extent={{-36,-26},{-24,-14}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold hold_y[12] if is_clocked
    annotation (Placement(transformation(extent={{64,-6},{76,6}})));

  replaceable Controllers.MatrixEqSystem matrixEqSystem(scalingFactor2D(efmi=
          false)) constrainedby Controllers.PartialROMInterface
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Sources.Sine scaledRPM(
    amplitude=5000,
    freqHz=0.1,
    offset=5500)
    annotation (Placement(transformation(
      origin = {-70,20},
      extent = {{-10, -10}, {10, 10}},
      rotation = 0)));
  Modelica.Blocks.Sources.Sine scaledTorque(
    amplitude=150,
    freqHz=0.05,
    offset=150)
    annotation (Placement(transformation(
      origin = {-70,-20},
      extent = {{-10, -10}, {10, 10}},
      rotation = 0)));
equation
  if is_clocked then
    // Clocked configuration:
    connect(scaledRPM.y,sample_n.u)
      annotation (Line(
        points = {{-59,20},{-37.2,20}},
        color = {0,0,127}));
    connect(scaledTorque.y,sample_tau.u)
      annotation (Line(
        points = {{-59,-20},{-37.2,-20}},
        color = {0,0,127}));
    connect(sample_n.y,matrixEqSystem.n)
      annotation (Line(
        points = {{-23.4,20},{-10,20},{-10,0},{8,0}},
        color = {0,0,127}));
    connect(matrixEqSystem.tau,sample_tau.y)
      annotation (Line(
        points = {{8,-8},{-10,-8},{-10,-20},{-23.4,-20}},
        color = {0,0,127}));
    connect(matrixEqSystem.y,hold_y.u)
      annotation (Line(
        points = {{31,0},{62.8,0}},
        color = {0,0,127}));
    connect(clock.y,sample_n.clock)
      annotation (Line(
        points={{-61.2,50},{-30,50},{-30,27.2}},
        color = {175,175,175},
        pattern = LinePattern.Dot,
        thickness = 0.5));
  else
    // Continuous configuration:
    connect(scaledRPM.y,matrixEqSystem.n);
    connect(scaledTorque.y,matrixEqSystem.tau);
  end if;

end BaseSetup;
