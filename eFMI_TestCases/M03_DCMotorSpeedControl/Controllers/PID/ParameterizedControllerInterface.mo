within eFMI_TestCases.M03_DCMotorSpeedControl.Controllers.PID;
partial block ParameterizedControllerInterface
  extends ControllerInterface;

  parameter Real kd = 0.1
    "Gain";
  parameter .Modelica.Units.SI.Time Ti = 0.1
    "Time Constant for I part (T>0 required)";
  parameter .Modelica.Units.SI.Time Td = 0.1
    "Time Constant for D part (T>0 required)";
end ParameterizedControllerInterface;
