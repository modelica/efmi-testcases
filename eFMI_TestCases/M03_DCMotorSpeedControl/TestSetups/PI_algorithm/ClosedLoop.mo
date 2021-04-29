within eFMI_TestCases.M03_DCMotorSpeedControl.TestSetups.PI_algorithm;
model ClosedLoop
  extends TestSetups.ClosedLoop(
    final clocked = true,
    final clock(
      useSolver = true,
      solverMethod = "ExplicitEuler",
      period = 0.005),
    redeclare final Controllers.PI.SpeedController_algorithm_code speedController);

  annotation (
    experiment(
      StopTime = 2.0),
    Diagram(
      graphics={
        Rectangle(
          extent = {{-10,90},{90,70}},
          lineColor = {28,108,200},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid,
          lineThickness = 1),
        Text(
          extent = {{-8,72},{88,88}},
          lineColor = {28,108,200},
          textString = "Sampled"),
        Rectangle(
          extent = {{-10,60},{90,40}},
          lineColor = {28,108,200},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid,
          lineThickness = 1),
        Text(
          extent = {{-8,42},{88,58}},
          lineColor = {28,108,200},
          textString = "Modelica algorithm controller")}));
end ClosedLoop;
