within eFMI_TestCases.M01_SimplePI.Tests;
model Controller_ImplEuler
  extends TestSetups.OpenLoop(
    is_clocked = true,
    clock(
      period = 0.1,
      useSolver = true,
      solverMethod = "ImplicitEuler"));

  annotation (
    experiment(
      StopTime = 4.0,
      Interval = 0.1),
    __iti_namesAtInterface={MapName(from="y.y",to="y"),MapName(from="r.y",to="r"),MapName(from="controller.u",to="u")},
    __fmi_modelExportName = "M01_B",
    __fmi_sourceModel = "eFMI_TestCases.M01_SimplePI.Controllers.PI",
    __Dymola_experimentFlags(Hidden(InitializeClockedDiscretizedStates = true)));
end Controller_ImplEuler;
