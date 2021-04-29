within eFMI_TestCases.S001_PIDController.ReferenceTests;
model Controller_ExplEuler
  extends Tests.Controller_ExplEuler;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=3, Interval=0.001),
   __fmi_InterfaceVariable={
  MapName(from="controller.wLoadRef",to="wLoadRef"),
  MapName(from="controller.wMotor",to="wMotor"),
  MapName(from="controller.vMotor",to="vMotor",isOutput=true)},
  __fmi_OriginalModel_ExportReference="eFMI_TestCases.S001_PIDController.Tests.Controller_ExplEuler");
end Controller_ExplEuler;
