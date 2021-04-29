within eFMI_TestCases.M03_DCMotorSpeedControl.TestSetups.PID_Saturated;
model ClosedLoop
  extends TestSetups.ClosedLoop(
    redeclare Controllers.PID.SpeedControllerSaturated speedController);

  annotation (
    experiment(
      StopTime = 2.0),
    Diagram(
      graphics={
        Rectangle(
          extent={{0,100},{100,80}},
          lineColor = {28,108,200},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid,
          lineThickness = 1),
        Text(
          extent={{2,82},{98,98}},
          lineColor = {28,108,200},
          textString = "Saturated PI-controller")}));
end ClosedLoop;
