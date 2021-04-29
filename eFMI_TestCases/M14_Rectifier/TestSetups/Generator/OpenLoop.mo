within eFMI_TestCases.M14_Rectifier.TestSetups.Generator;
model OpenLoop
  extends TestSetups.OpenLoop(
    redeclare Controllers.Generator generator);

  annotation (
    experiment(
      StopTime = 3.0),
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
          textString="Generator")}));
end OpenLoop;
