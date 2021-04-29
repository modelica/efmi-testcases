within eFMI_TestCases.M03_DCMotorSpeedControl.ReferenceTests;
model PIDController_ExplEuler
  extends Tests.PIDController_ExplEuler;

  annotation (
    experiment(
      StopTime = 2.0,
      Interval = 0.001),
   __fmi_InterfaceVariable={
  MapName(from="speedController.wLoadRef",to="wLoadRef"),
  MapName(from="speedController.wMotor",to="wMotor"),
  MapName(from="speedController.vMotor",to="vMotor",isOutput=true)},
  __fmi_OriginalModel_ExportReference="eFMI_TestCases.M03_DCMotorSpeedControl.Tests.PIDController_ExplEuler");
end PIDController_ExplEuler;
