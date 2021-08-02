within eFMI_TestCases.M04_DrivetrainTorqueControl.TestSetups;
partial model BaseSetup
  extends .eFMI_TestCases.Utilities.ClockedContinuousTwin;
  extends .Modelica.Icons.Example;

  replaceable Controllers.Controller controller constrainedby
    Controllers.ControllerInterface
    annotation (Placement(transformation(extent = {{-10,-10},{10,10}})));

  Utilities.DesiredTorque desiredTorque
    annotation (Placement(transformation(extent = {{-80,-10},{-60,10}})));

  // Clocked configuration:
  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock(
    useSolver = false,
    period = -1.0,
    solverMethod = "") if is_clocked
    "Must still be configured when 'is_clocked = true'."
    annotation (Placement(transformation(extent={{-78,42},{-62,58}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked M_desired if is_clocked
    annotation (Placement(transformation(extent={{-36,6},{-24,-6}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold M_motor if is_clocked
    annotation (Placement(transformation(extent={{26,-6},{38,6}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample wRel if is_clocked annotation (
      Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={30,-30})));

equation
  if is_clocked then
    // Clocked configuration:
    connect(wRel.y, controller.wRel)
      annotation (Line(
        points={{23.4,-30},{0,-30},{0,-12}},
        color = {0,0,127}));
    connect(controller.M_motor, M_motor.u)
      annotation (Line(
        points = {{11.025,0},{24.8,0}},
        color = {0,0,127}));
    connect(desiredTorque.y, M_desired.u)
      annotation (Line(
        points = {{-59.025,0},{-37.2,0}},
        color = {0,0,127}));
    connect(M_desired.y, controller.M_desired)
      annotation (Line(
        points = {{-23.4,0},{-12,0}},
        color = {0,0,127}));
    connect(clock.y, M_desired.clock)
      annotation (Line(
        points = {{-61.2,50},{-30,50},{-30,7.2}},
        color = {175,175,175},
        pattern = LinePattern.Dot,
        thickness = 0.5));
  else
    // Continuous configuration:
    connect(desiredTorque.y, controller.M_desired);
  end if;
end BaseSetup;
