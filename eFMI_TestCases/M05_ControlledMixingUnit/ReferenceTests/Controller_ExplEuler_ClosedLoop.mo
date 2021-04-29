within eFMI_TestCases.M05_ControlledMixingUnit.ReferenceTests;
model Controller_ExplEuler_ClosedLoop
  extends TestSetups.ClosedLoop(
    final is_clocked = true,
    clock(
      useSolver = true,
      period = 1,
      solverMethod = "ExplicitEuler"));

 annotation (
    experiment(
      StopTime = 300,
      Interval = 1),
    __fmi_InterfaceVariable={MapName(from="controller.u1",to="u1"),MapName(from="controller.u2",to="u2"),MapName(from="controller.y",to="y",isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M05_ControlledMixingUnit.Tests.Controller_ExplEuler");
end Controller_ExplEuler_ClosedLoop;
