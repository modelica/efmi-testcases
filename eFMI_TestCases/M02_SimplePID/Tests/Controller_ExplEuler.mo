within eFMI_TestCases.M02_SimplePID.Tests;
model Controller_ExplEuler
  extends TestSetups.OpenLoop(
    is_clocked = true,
    clock(
      period = 0.0001,
      useSolver = true,
      solverMethod = "ExplicitEuler"));

  annotation (
    experiment(
      StopTime = 4.0,
      Interval = 0.0001),
    __iti_namesAtInterface={MapName(from="u_s.y",to="u_s"),MapName(from="u_m.y",to="u_m"),MapName(from="controller.y",to="y")},
    __fmi_modelExportName = "M02_A",
    __fmi_sourceModel = "eFMI_TestCases.M02_SimplePID.Controllers.LimPID");
end Controller_ExplEuler;
