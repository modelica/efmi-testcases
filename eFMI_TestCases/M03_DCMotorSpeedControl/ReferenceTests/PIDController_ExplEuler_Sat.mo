within eFMI_TestCases.M03_DCMotorSpeedControl.ReferenceTests;
model PIDController_ExplEuler_Sat
  extends TestSetups.OpenLoop(
    final is_clocked = true,
    final clock(
      useSolver = true,
      solverMethod = "ExplicitEuler",
      period = 0.001),
    redeclare final SaturationSimulator speedController);

  annotation (
    experiment(
      StopTime = 2.0,
      Interval = 0.001),
    Diagram(
      graphics={
        Rectangle(
          extent={{-10,90},{90,70}},
          lineColor = {28,108,200},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid,
          lineThickness = 1),
        Text(
          extent = {{-8,72},{88,88}},
          lineColor = {28,108,200},
          textString = "Sampled"),
        Rectangle(
          extent = {{-10,60},{90,40}},
          lineColor = {28,108,200},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid,
          lineThickness = 1),
        Text(
          extent = {{-8,42},{88,58}},
          lineColor = {28,108,200},
          textString = "Via limiter manually saturated PID-controller")}),
   __fmi_InterfaceVariable={
  MapName(from="speedController.wLoadRef",to="wLoadRef"),
  MapName(from="speedController.wMotor",to="wMotor"),
  MapName(from="speedController.vMotor",to="vMotor",isOutput=true)},
  __fmi_OriginalModel_ExportReference="eFMI_TestCases.M03_DCMotorSpeedControl.Tests.PIDController_ExplEuler_Sat");
end PIDController_ExplEuler_Sat;
