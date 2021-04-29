within eFMI_TestCases.M09_MixingUnit_FBL.ReferenceTests;
model Controller_ExplEuler_ClosedLoop
  extends TestSetups.ClosedLoop(
    final is_clocked = true,
    final clock(
      period = 1,
      useSolver = true,
      solverMethod = "ExplicitEuler"));

  annotation (
    experiment(StopTime=300, Interval=1),
    __fmi_InterfaceVariable={MapName(from="controller.ref",to="ref"),MapName(from="controller.c",to="c"),MapName(from="controller.T",to="T"),MapName(from="controller.T_c",to="T_c",isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M09_MixingUnit_FBL.Tests.Controller_ExplEuler");
end Controller_ExplEuler_ClosedLoop;
