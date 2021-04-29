within eFMI_TestCases.S001_PIDController.Controllers;
model PIDController
  extends Modelica.Blocks.Icons.Block;
  extends Icons.Controller;

  parameter Real k(min=0, max=1e3) = 10 "Gain";
  parameter Real kd(min=0, max=1e3) = 0.1 "Gain";

  parameter Modelica.SIunits.Time Ti(min=1e-7, max=100) = 0.1
    "Time Constant for I part (T>0 required)";
  parameter Modelica.SIunits.Time Td(min=1e-7, max=100) = 0.1
    "Time Constant for D part (T>0 required)";

  parameter Real gearRatio(min=10, max=500) = 105;

  Modelica.Blocks.Interfaces.RealInput wLoadRef(min=-1e5, max=1e5)
    "Reference angular velocity of load"
    annotation (Placement(transformation(extent = {{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput wMotor(min=-1e5, max=1e5)
    "Measured angular velocity of motor"
    annotation (Placement(transformation(
      extent = {{-20,-20},{20,20}},
      rotation = 90,
      origin = {0,-120})));
  Modelica.Blocks.Interfaces.RealOutput vMotor(min=-1e7, max=1e7)
    "Motor voltage"
    annotation (Placement(transformation(extent = {{100,-10},{120,10}})));

  Modelica.Blocks.Math.Gain gain(k=gearRatio)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  eFMI_TestCases.S001_PIDController.Utilities.PID PID(
    k=k,
    Ti=Ti,
    Td=Td,
    kd=kd) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  eFMI_TestCases.S001_PIDController.Utilities.Limiter limiter(uMax(
      min=10,
      max=1e6) = 400)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));

equation
  connect(gain.y,feedback. u1)
    annotation (Line(
      points={{-19,0},{-8,0}},
      color = {0,0,127}));
  connect(feedback.y,PID. u)
    annotation (Line(points={{9,0},{18,0}}, color={0,0,127}));
  connect(limiter.u,PID. y)
    annotation (Line(points={{58,0},{41,0}}, color={0,0,127}));
  connect(limiter.y, vMotor)
    annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
  connect(wMotor, feedback.u2) annotation (Line(points={{0,-120},{0,-8}},
                          color={0,0,127}));
  connect(wLoadRef, gain.u)
    annotation (Line(points={{-120,0},{-42,0}}, color={0,0,127}));
end PIDController;
