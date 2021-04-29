within eFMI_TestCases.M14_Rectifier.Controllers;
package Rectifiers "Different rectifier implementations"
  extends Modelica.Icons.Package;

  annotation (Icon(graphics={
        Line(points={{-42,54},{-22,36}}, color={127,127,127}),
        Line(points={{-74,2},{-6,70}},  color={127,127,127}),
        Line(points={{-6,70},{66,-2}}, color={127,127,127}),
        Line(points={{66,-2},{-2,-70}}, color={127,127,127}),
        Line(points={{-2,-70},{-74,2}},  color={127,127,127}),
        Line(points={{-10,9},{10,-9}},   color={127,127,127},
          origin={24,39},
          rotation=90),
        Line(points={{-8,7},{10,-11}},   color={127,127,127},
          origin={38,-29},
          rotation=0),
        Line(points={{-9,10},{10,-9}},   color={127,127,127},
          origin={-50,-23},
          rotation=90),
        Polygon(
          points={{-60,36},{-32,44},{-38,16},{-60,36}},
          lineColor={127,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-14,6},{14,14},{8,-14},{-14,6}},
          lineColor={127,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={38,26},
          rotation=90),
        Polygon(
          points={{-14,6},{14,14},{8,-14},{-14,6}},
          lineColor={127,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={-36,-36},
          rotation=90),
        Polygon(
          points={{-14,6},{14,14},{8,-14},{-14,6}},
          lineColor={127,127,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={24,-44},
          rotation=360)}));
end Rectifiers;
