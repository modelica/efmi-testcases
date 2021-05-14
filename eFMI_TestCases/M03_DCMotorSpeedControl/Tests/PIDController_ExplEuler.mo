within eFMI_TestCases.M03_DCMotorSpeedControl.Tests;
model PIDController_ExplEuler
  extends TestSetups.PID.OpenLoop(
    final is_clocked = true,
    final clock(
      useSolver = true,
      solverMethod = "ExplicitEuler",
      period = 0.001));

  annotation (
    experiment(
      StopTime = 2.0,
      Interval = 0.001),
   __iti_namesAtInterface={
  MapName(from="speedController.wLoadRef",to="wLoadRef"),
  MapName(from="speedController.wMotor",to="wMotor"),
  MapName(from="speedController.vMotor",to="vMotor")},
  __fmi_modelExportName = "M03_B",
  __fmi_sourceModel = "eFMI_TestCases.M03_DCMotorSpeedControl.Controllers.PID.SpeedController");
end PIDController_ExplEuler;
