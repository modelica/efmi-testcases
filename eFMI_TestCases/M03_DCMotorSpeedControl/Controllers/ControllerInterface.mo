within eFMI_TestCases.M03_DCMotorSpeedControl.Controllers;
partial block ControllerInterface
  "Common interface of DC-motor speed controllers."
  extends Modelica.Blocks.Icons.Block;
  extends Icons.Controller;

  parameter Real gearRatio = 105;
  parameter Real k = 10
    "Gain";

  Modelica.Blocks.Interfaces.RealInput wLoadRef(min = -1e4, max = 1e4)
    "Reference angular velocity of load"
    annotation (Placement(transformation(extent = {{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput wMotor(min = -1e4, max = 1e4)
    "Measured angular velocity of motor"
    annotation (Placement(transformation(
      extent = {{-20,-20},{20,20}},
      rotation = 90,
      origin = {0,-120})));
  Modelica.Blocks.Interfaces.RealOutput vMotor(min = -1e5, max = 1e5)
    "Motor voltage"
    annotation (Placement(transformation(extent = {{100,-10},{120,10}})));
end ControllerInterface;
