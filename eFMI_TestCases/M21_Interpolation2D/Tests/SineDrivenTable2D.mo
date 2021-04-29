within eFMI_TestCases.M21_Interpolation2D.Tests;
model SineDrivenTable2D
  extends TestSetups.SineDrivenTable2D;

  annotation (
    experiment(
      StopTime = 1.2,
      Interval = 0.01),
    __iti_namesAtInterface={
      MapName(from="controller.u1",to="u1"),
      MapName(from="controller.u2",to="u2"),
      MapName(from="controller.y",to="y")},
    __fmi_modelExportName = "M21_A",
  __fmi_sourceModel = "eFMI_TestCases.M21_Interpolation2D.Controllers.Table2D");
end SineDrivenTable2D;
