within eFMI_TestCases.M21_Interpolation2D.Tests;
model SineDrivenTable2D_2
  extends TestSetups.SineDrivenTable2D_2;

  annotation (
    experiment(
      StopTime = 1.2,
      Interval = 0.01),
    __iti_namesAtInterface={
      MapName(from="controller.u",to="u"),
      MapName(from="controller.y",to="y")},
    __fmi_modelExportName = "M21_B",
  __fmi_sourceModel = "eFMI_TestCases.M21_Interpolation2D.Controllers.Table2D_2");
end SineDrivenTable2D_2;
