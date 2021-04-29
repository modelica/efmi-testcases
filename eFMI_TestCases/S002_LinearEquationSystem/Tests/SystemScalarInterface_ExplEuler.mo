within eFMI_TestCases.S002_LinearEquationSystem.Tests;
model SystemScalarInterface_ExplEuler
  extends TestSetups.OpenLoop_ScalarInterface;

  annotation (
    experiment(
      StopTime = 10.0,
      Interval = 0.01),
    __iti_namesAtInterface={
  MapName(from="controller.u1",to="u1"),
  MapName(from="controller.u2",to="u2"),
  MapName(from="controller.u3",to="u3"),
  MapName(from="controller.u4",to="u4"),
  MapName(from="controller.y1",to="y1"),
  MapName(from="controller.y2",to="y2"),
  MapName(from="controller.y3",to="y3"),
  MapName(from="controller.y4",to="y4")},
  __fmi_modelExportName = "S002_B",
  __fmi_sourceModel = "eFMI_TestCases.S002_LinearEquationSystem.Controllers.LinearSystemOfEquations_ScalarInterface");
end SystemScalarInterface_ExplEuler;
