within eFMI_TestCases.M09_MixingUnit_FBL.ReferenceTests;
model Controller_Rosenbrock1_ClosedLoop
 extends TestSetups.ClosedLoop(
   final is_clocked = true,
   final clock(
      period = 5,
      useSolver = true,
      solverMethod = "Rosenbrock1"));

  annotation (
    experiment(StopTime=300, Interval=5),
    __fmi_InterfaceVariable={MapName(from="controller.ref",to="ref"),MapName(from="controller.c",to="c"),MapName(from="controller.T",to="T"),MapName(from="controller.T_c",to="T_c",isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M09_MixingUnit_FBL.Tests.Controller_Rosenbrock1");
end Controller_Rosenbrock1_ClosedLoop;
