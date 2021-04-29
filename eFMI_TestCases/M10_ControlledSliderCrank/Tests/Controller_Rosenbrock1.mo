within eFMI_TestCases.M10_ControlledSliderCrank.Tests;
model Controller_Rosenbrock1
  extends TestSetups.Controller1.OpenLoop(
    final is_clocked = true,
    final clock(
      period = 0.001,
      useSolver = true,
      solverMethod = "Rosenbrock1"));

  annotation (
    experiment(
      StopTime = 10.0,
      Interval = 0.001,
      Tolerance = 1e-06),
    __Dymola_experimentFlags(
      Hidden(InitializeClockedDiscretizedStates = true),
      Advanced(
        GenerateVariableDependencies = false,
        OutputModelicaCode = false)),
    __iti_namesAtInterface={MapName(from="controller.s_ref",to="s_ref"),MapName(from="controller.phi",to="phi"),MapName(from="controller.tau",to="tau")},
    __fmi_modelExportName = "M10_A",
  __fmi_sourceModel = "eFMI_TestCases.M10_ControlledSliderCrank.ModelsToExport.Controller");
end Controller_Rosenbrock1;
