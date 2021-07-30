within eFMI_TestCases.M07_CrabEstimation.Controllers;
partial model PartialPlantInterface "Interface of Crab"
  .Modelica.Blocks.Interfaces.RealInput force(
    min = -1e7,
    max = 1e7)
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealOutput y1
    "Horizontal position of load"
    annotation (Placement(
      transformation(extent={{100,50},{120,70}}),
      iconTransformation(extent={{100,50},{120,70}})));
  .Modelica.Blocks.Interfaces.RealOutput y2
    "Horziontal position of crab"
    annotation (Placement(
      transformation(extent={{100,-70},{120,-50}}),
      iconTransformation(extent={{100,-70},{120,-50}})));

  annotation (
    Icon(
      graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-146,162},{144,102}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Line(points={{-90,40},{20,40}}, color={0,0,0}),
        Rectangle(
          extent={{-80,70},{-40,40}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-60,40},{0,-60}}, color={0,0,0}),
        Ellipse(
          extent={{-20,-40},{20,-80}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{42,80},{102,40}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          textString="y1"),
        Text(
          extent={{42,-40},{102,-80}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          textString="y2")}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}})));
end PartialPlantInterface;
