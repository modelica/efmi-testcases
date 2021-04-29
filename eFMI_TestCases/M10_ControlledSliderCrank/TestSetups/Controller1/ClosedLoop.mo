within eFMI_TestCases.M10_ControlledSliderCrank.TestSetups.Controller1;
model ClosedLoop
  extends TestSetups.ClosedLoop(
    redeclare PlantModels.SliderCrank1 sliderCrank,
    redeclare Controllers.Controller1 controller);

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
          textString="Controller1"),
        Rectangle(
          extent={{0,80},{100,60}},
          lineColor = {28,108,200},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid,
          lineThickness = 1),
        Text(
          extent={{2,62},{98,78}},
          lineColor={28,108,200},
          textString="SliderCrank1")}));
end ClosedLoop;
