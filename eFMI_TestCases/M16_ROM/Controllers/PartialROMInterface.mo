within eFMI_TestCases.M16_ROM.Controllers;
partial model PartialROMInterface
  extends .Modelica.Blocks.Icons.Block;

  .Modelica.Blocks.Interfaces.RealInput n(
    min = 0,
    max = 1e7)
    "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealInput tau(
    min = -1e7,
    max = 1e7)
    "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
  .Modelica.Blocks.Interfaces.RealOutput y[12]
    "Connector of Real output signals"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  annotation (
    Icon(
      graphics={
        Line(points={{-50,72},{-50,-72}}, color={0,0,0}),
        Line(points={{-24,72},{-24,-72}}, color={0,0,0}),
        Line(points={{2,72},{2,-72}}, color={0,0,0}),
        Line(points={{52,72},{52,-72}}, color={0,0,0}),
        Line(points={{26,72},{26,-72}}, color={0,0,0}),
        Line(
          points={{0,72},{0,-72}},
          color={0,0,0},
          origin={0,52},
          rotation=-90),
        Line(
          points={{0,72},{0,-72}},
          color={0,0,0},
          origin={0,26},
          rotation=-90),
        Line(
          points={{0,72},{0,-72}},
          color={0,0,0},
          origin={0,0},
          rotation=-90),
        Line(
          points={{0,72},{0,-72}},
          color={0,0,0},
          origin={0,-26},
          rotation=-90),
        Line(
          points={{0,72},{0,-72}},
          color={0,0,0},
          origin={0,-52},
          rotation=-90),
        Text(
          extent={{-160,40},{-118,20}},
          lineColor={28,108,200},
          textString="n"),
        Text(
          extent={{-160,-40},{-118,-60}},
          lineColor={28,108,200},
          fontName="Symbol",
          textString="t"),
        Text(
          extent={{100,30},{142,10}},
          lineColor={28,108,200},
          textString="y[12]")}));
end PartialROMInterface;
