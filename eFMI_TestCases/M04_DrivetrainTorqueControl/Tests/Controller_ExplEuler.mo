within eFMI_TestCases.M04_DrivetrainTorqueControl.Tests;
model Controller_ExplEuler
  extends TestSetups.OpenLoop(
    final is_clocked = true,
    clock(
      useSolver = true,
      period = 5e-4,
      solverMethod = "ExplicitEuler"));

  annotation (
    experiment(
      StopTime = 20,
      Interval = 5e-4),
       __iti_namesAtInterface={MapName(from="controller.M_desired",to="M_desired"),MapName(from="controller.wRel",to="wRel"),MapName(from="controller.M_motor",to="M_motor")},
    __fmi_modelExportName = "M04_A",
  __fmi_sourceModel = "eFMI_TestCases.M04_DrivetrainTorqueControl.Controllers.Controller");
end Controller_ExplEuler;
