within eFMI_TestCases.M10_ControlledSliderCrank.TestSetups.Controller2;
model OpenLoop
  extends TestSetups.OpenLoop(
    redeclare Controllers.Controller2 controller);

  annotation (
    experiment(
      StopTime = 10.0),
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
          lineColor={28,108,200},
          textString="Controller2")}));
end OpenLoop;
