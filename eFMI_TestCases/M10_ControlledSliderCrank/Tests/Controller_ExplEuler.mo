within eFMI_TestCases.M10_ControlledSliderCrank.Tests;
model Controller_ExplEuler
  extends TestSetups.Controller3.OpenLoop(
    final is_clocked = true,
    final clock(
      period = 0.0001,
      useSolver = true,
      solverMethod = "ExplicitEuler"));
  extends .eFMI_TestCases.Icons.PerformanceTest;

  annotation (
    experiment(
      StopTime = 10.0,
      Interval = 0.0001,
      Tolerance = 1e-06),
    __Dymola_experimentFlags(
      Hidden(InitializeClockedDiscretizedStates = true),
      Advanced(
        GenerateVariableDependencies = false,
        OutputModelicaCode = false)),
    __iti_namesAtInterface={MapName(from="controller.s_ref",to="s_ref"),MapName(from="controller.phi",to="phi"),MapName(from="controller.tau",to="tau")},
    __fmi_modelExportName = "M10_B",
  __fmi_sourceModel = "eFMI_TestCases.M10_ControlledSliderCrank.Controllers.Controller3");
end Controller_ExplEuler;
