within eFMI_TestCases.M10_ControlledSliderCrank.TestSetups.Controller3;
model ClosedLoop
    extends TestSetups.ClosedLoop(
    redeclare PlantModels.SliderCrank3 sliderCrank,
    redeclare Controllers.Controller3 controller);

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
          textString="Controller3"),
        Rectangle(
          extent={{0,80},{100,60}},
          lineColor = {28,108,200},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid,
          lineThickness = 1),
        Text(
          extent={{2,62},{98,78}},
          lineColor={28,108,200},
          textString="SliderCrank3")}));
end ClosedLoop;
