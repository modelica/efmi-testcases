within eFMI_TestCases.M19_Interpolation1D.Tests;
model SineDrivenTable1D
  extends TestSetups.SineDrivenTable1D;

  annotation (
    experiment(
      StopTime = 1.2,
      Interval = 0.01),
    __iti_namesAtInterface={
      MapName(from="controller.u",to="u"),
      MapName(from="controller.y",to="y")},
    __fmi_modelExportName = "M19_A",
  __fmi_sourceModel = "eFMI_TestCases.M19_Interpolation1D.Controllers.Table1D");
end SineDrivenTable1D;
