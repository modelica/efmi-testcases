within eFMI_TestCases.M03_DCMotorSpeedControl.Controllers.PID;
model SpeedControllerSaturated
  extends SpeedController(
    PID(
      I(y(min = -500, max = 500))),
    wLoadRef(min = 0.125, max = 2.7),
    wMotor(min = 0, max = 250),
    vMotor(min = 80, max = 350));
end SpeedControllerSaturated;
