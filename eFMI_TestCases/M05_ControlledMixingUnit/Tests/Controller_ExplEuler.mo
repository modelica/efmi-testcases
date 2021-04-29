within eFMI_TestCases.M05_ControlledMixingUnit.Tests;
model Controller_ExplEuler
  extends TestSetups.OpenLoop(
    final is_clocked = true,
    clock(
      useSolver = true,
      period = 1,
      solverMethod = "ExplicitEuler"));

  annotation (
    experiment(
      StopTime = 300,
      Interval = 1),
    __iti_namesAtInterface={MapName(from="controller.u1",to="u1"),MapName(from="controller.u2",to="u2"),MapName(from="controller.y",to="y")},
    __fmi_modelExportName = "M05_A",
    __fmi_sourceModel = "eFMI_TestCases.M05_ControlledMixingUnit.Controllers.Controller");
end Controller_ExplEuler;
