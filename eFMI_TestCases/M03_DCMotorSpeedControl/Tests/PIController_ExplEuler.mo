within eFMI_TestCases.M03_DCMotorSpeedControl.Tests;
model PIController_ExplEuler
  extends TestSetups.PI.OpenLoop(
    final is_clocked = true,
    final clock(
      useSolver = true,
      solverMethod = "ExplicitEuler",
      period = 0.005));

  annotation (
    experiment(
      StopTime = 2.0,
      Interval = 0.005),
   __iti_namesAtInterface={
  MapName(from="speedController.wLoadRef",to="wLoadRef"),
  MapName(from="speedController.wMotor",to="wMotor"),
  MapName(from="speedController.vMotor",to="vMotor")},
  __fmi_modelExportName = "M03_A",
  __fmi_sourceModel = "eFMI_TestCases.M03_DCMotorSpeedControl.Controllers.PI.SpeedController");
end PIController_ExplEuler;
