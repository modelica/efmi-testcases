within eFMI_TestCases.M03_DCMotorSpeedControl.Controllers.PI;
partial block ParameterizedControllerInterface
  extends ControllerInterface;

  parameter Modelica.SIunits.Time T = 0.1
    "Time Constant (T>0 required)";
end ParameterizedControllerInterface;
