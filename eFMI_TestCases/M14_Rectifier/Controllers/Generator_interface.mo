within eFMI_TestCases.M14_Rectifier.Controllers;
partial model Generator_interface "2 inputs and 1 output"
 extends .Modelica.Blocks.Icons.Block;
 extends Icons.Generator;

  .Modelica.Blocks.Interfaces.RealInput U_Ideal
    "Connector of Real input signal 1"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealInput U_Bat
    "Connector of Real input signal 2"
    annotation (Placement(transformation(extent={{140,-20},{100,20}})));
  .Modelica.Blocks.Interfaces.RealOutput I
    "Connector of Real output signal"
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=-90,
      origin={0,-110})));

  annotation (
    Documentation(info="<html>
<p>
Block has two continuous Real input signals u1 and u2 and one
continuous Real output signal y.
</p>
</html>"),
         Icon(graphics={Polygon(
          points={{-78,-42},{-78,-42}},
          lineColor={127,127,127},
          pattern=LinePattern.None,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid), Polygon(
          points={{-78,-42},{-78,2},{-78,-42}},
          lineColor={127,127,127},
          pattern=LinePattern.None,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid)}));
end Generator_interface;
