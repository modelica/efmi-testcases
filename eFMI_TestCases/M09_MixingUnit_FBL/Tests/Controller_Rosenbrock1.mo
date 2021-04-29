within eFMI_TestCases.M09_MixingUnit_FBL.Tests;
model Controller_Rosenbrock1
  extends TestSetups.OpenLoop(
    final is_clocked = true,
    final clock(
      period = 5,
      useSolver = true,
      solverMethod = "Rosenbrock1"));

  annotation (
    experiment(StopTime = 300, Interval = 5),
    __iti_namesAtInterface={MapName(from="controller.ref",to="ref"),MapName(from="controller.c",to="c"),MapName(from="controller.T",to="T"),MapName(from="controller.T_c",to="T_c")},
    __fmi_modelExportName = "M09_B",
  __fmi_sourceModel = "eFMI_TestCases.M09_MixingUnit_FBL.Controllers.Controller");
end Controller_Rosenbrock1;
