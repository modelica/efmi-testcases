within eFMI_TestCases.M03_DCMotorSpeedControl.TestSetups;
partial model BaseSetup
  extends .eFMI_TestCases.Utilities.ClockedContinuousTwin;
  extends .Modelica.Icons.Example;

  parameter Boolean is_clocked = false
    "Configures whether the ontroller is embedded as clocked partition or not.";

  .Modelica.Blocks.Sources.Ramp ramp(
    height = 3.0,
    duration = 1)
    annotation (Placement(transformation(extent = {{-70,-10},{-50,10}})));

  replaceable Controllers.ControllerInterface speedController
    constrainedby Controllers.ControllerInterface
    annotation (Placement(transformation(extent = {{-10,-10},{10,10}})));

  // Clocked configuration:
  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock(
    useSolver = false,
    period = -1.0,
    solverMethod = "") if is_clocked
    "Must still be configured when 'clocked = true'."
    annotation (Placement(transformation(extent={{-68,42},{-52,58}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked wLoadRef if is_clocked
    annotation (Placement(transformation(extent={{-36,6},{-24,-6}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold vMotor if is_clocked
    annotation (Placement(transformation(extent={{26,-6},{38,6}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample wMotor if is_clocked
    annotation (
      Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={0,-30})));

equation
  if is_clocked then
    connect(clock.y, wLoadRef.clock)
      annotation (Line(
        points = {{-51.2,50},{-30,50},{-30,7.2}},
        color = {175,175,175},
        pattern = LinePattern.Dot,
        thickness = 0.5));
    connect(ramp.y, wLoadRef.u)
      annotation (Line(
        points = {{-49,0},{-37.2,0}},
        color = {0,0,127}));
    connect(wLoadRef.y, speedController.wLoadRef)
      annotation (Line(
        points={{-23.4,0},{-12,0}},
        color = {0,0,127}));
    connect(speedController.vMotor, vMotor.u)
      annotation (Line(
        points = {{11,0},{24.8,0}},
        color = {0,0,127}));
    connect(wMotor.y, speedController.wMotor)
      annotation (Line(
        points={{0,-23.4},{0,-12}},
        color = {0,0,127}));
  else
    connect(ramp.y, speedController.wLoadRef);
  end if;

  annotation (
    Diagram(
      graphics={
        Rectangle(
          extent={{0,100},{100,80}},
          lineColor = {238,46,47},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid,
          lineThickness = 1),
        Text(
          extent={{2,82},{96,98}},
          lineColor = {238,46,47},
          textString = "Partial: Controller must be redeclared.")}));
end BaseSetup;
