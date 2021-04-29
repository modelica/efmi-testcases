within eFMI_TestCases.S002_LinearEquationSystem.Tests;
model System_ExplEuler
  extends TestSetups.OpenLoop_VectorInterface;

  annotation (
    experiment(
      StopTime = 10.0,
      Interval = 0.01),
    __iti_namesAtInterface={
  MapName(from="controller.u",to="u"),
  MapName(from="controller.y",to="y")},
  __fmi_modelExportName = "S002_A",
  __fmi_sourceModel = "eFMI_TestCases.S002_LinearEquationSystem.Controllers.LinearSystemOfEquations");
end System_ExplEuler;
