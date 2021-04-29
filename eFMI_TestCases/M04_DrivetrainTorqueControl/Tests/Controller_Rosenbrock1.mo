within eFMI_TestCases.M04_DrivetrainTorqueControl.Tests;
model Controller_Rosenbrock1
  extends TestSetups.OpenLoop(
    final is_clocked = true,
    clock(
      useSolver = true,
      period = 0.01,
      solverMethod = "Rosenbrock1"));
  extends eFMI_TestCases.Icons.PerformanceTest;

  annotation (
    experiment(
      StopTime = 20,
      Interval = 0.01),
    __iti_namesAtInterface={MapName(from="controller.M_desired",to="M_desired"),MapName(from="controller.wRel",to="wRel"),MapName(from="controller.M_motor",to="M_motor")},
    __fmi_modelExportName = "M04_B",
  __fmi_sourceModel = "eFMI_TestCases.M04_DrivetrainTorqueControl.Controllers.Controller");
end Controller_Rosenbrock1;
