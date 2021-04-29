within eFMI_TestCases.M03_DCMotorSpeedControl.ReferenceTests;
model PIController_ExplEuler
  extends Tests.PIController_ExplEuler;

  annotation (
    experiment(
      StopTime = 2.0,
      Interval = 0.005),
   __fmi_InterfaceVariable={
  MapName(from="speedController.wLoadRef",to="wLoadRef"),
  MapName(from="speedController.wMotor",to="wMotor"),
  MapName(from="speedController.vMotor",to="vMotor",isOutput=true)},
  __fmi_OriginalModel_ExportReference="eFMI_TestCases.M03_DCMotorSpeedControl.Tests.PIController_ExplEuler");
end PIController_ExplEuler;
