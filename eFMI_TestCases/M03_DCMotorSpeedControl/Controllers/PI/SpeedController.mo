within eFMI_TestCases.M03_DCMotorSpeedControl.Controllers.PI;
block SpeedController "Speed controller as continuous-time system."
  extends ParameterizedControllerInterface;

  .Modelica.Blocks.Math.Gain gain(
    k = gearRatio)
    annotation (Placement(transformation(extent = {{-50,-10},{-30,10}})));
  .Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent = {{-10,-10},{10,10}})));
  .Modelica.Blocks.Continuous.PI PI(
    k = k,
    T = T,
    initType = .Modelica.Blocks.Types.Init.InitialState,
    x_start = 0,
    y(min = -100, max = 100))
    annotation (Placement(transformation(extent = {{20,-10},{40,10}})));
  .Modelica.Blocks.Nonlinear.Limiter limiter(uMax = 400)
    annotation (Placement(transformation(extent = {{60,-10},{80,10}})));

equation
  connect(gain.u, wLoadRef)
    annotation (Line(
      points = {{-52,0},{-120,0}},
      color = {0,0,127}));
  connect(gain.y, feedback.u1)
    annotation (Line(
      points = {{-29,0},{-8,0}},
      color = {0,0,127}));
  connect(feedback.u2, wMotor)
    annotation (Line(
      points = {{0,-8},{0,-120}},
      color = {0,0,127}));
  connect(feedback.y, PI.u)
    annotation (Line(
      points = {{9,0},{18,0}},
      color = {0,0,127}));
  connect(limiter.y, vMotor)
    annotation (Line(
      points = {{81,0},{110,0}},
      color = {0,0,127}));
  connect(limiter.u, PI.y)
    annotation (Line(
      points = {{58,0},{41,0}},
      color = {0,0,127}));
end SpeedController;
