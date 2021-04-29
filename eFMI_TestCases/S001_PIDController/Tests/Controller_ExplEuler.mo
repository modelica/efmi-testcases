within eFMI_TestCases.S001_PIDController.Tests;
model Controller_ExplEuler
  extends TestSetups.OpenLoop;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=3, Interval=0.001),
   __iti_namesAtInterface={
  MapName(from="controller.wLoadRef",to="wLoadRef"),
  MapName(from="controller.wMotor",to="wMotor"),
  MapName(from="controller.vMotor",to="vMotor")},
  __fmi_modelExportName = "S001_A",
  __fmi_sourceModel = "eFMI_TestCases.S001_PIDController.ModelsToExport.Controller");
end Controller_ExplEuler;
