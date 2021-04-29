within eFMI_TestCases.M01_SimplePI.Tests;
model Controller_ExplEuler
  extends TestSetups.OpenLoop(
    is_clocked = true,
    clock(
      period = 0.01,
      useSolver = true,
      solverMethod = "ExplicitEuler"));

  annotation (
    experiment(
      StopTime = 4.0,
      Interval = 0.01),
    __iti_namesAtInterface={MapName(from="y.y",to="y"),MapName(from="r.y",to="r"),MapName(from="controller.u",to="u")},
    __fmi_modelExportName = "M01_A",
    __fmi_sourceModel = "eFMI_TestCases.M01_SimplePI.ModelsToExport.Controller");
end Controller_ExplEuler;
