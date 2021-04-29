within eFMI_TestCases.M01_SimplePI.ReferenceTests;
model Controller_ImplEuler_ClosedLoop
  extends TestSetups.ClosedLoop(
    is_clocked = true,
    clock(
      period = 0.1,
      useSolver = true,
      solverMethod = "ImplicitEuler"));

  annotation (
    experiment(
      StopTime=4.0,
      Interval=0.1),
    __fmi_InterfaceVariable={MapName(from="y.y",to="y"),MapName(from="r.y",to="r"),MapName(from="controller.u",to="u",isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M01_SimplePI.Tests.Controller_ImplEuler");
end Controller_ImplEuler_ClosedLoop;
