within eFMI_TestCases.M02_SimplePID.Icons;
class Drivetrain
  annotation (
    Icon(
      graphics={
        Rectangle(
          extent={{-90,10},{-60,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{90,10},{60,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Polygon(
          points={{-60,-60},{-60,60},{-50,60},{-30,40},{30,40},{40,10},{60,10},
              {60,-10},{40,-10},{30,-40},{20,-40},{15,-35},{6,-45},{-30,-45},{
              -40,-38},{-49,-60},{-60,-60}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-53,0},{-36,0}}, color={0,0,0}),
        Line(points={{-53,23},{-45,23},{-38,18}}, color={0,0,0}),
        Line(points={{-53,36},{-44,36},{-36,30}}, color={0,0,0}),
        Line(points={{-55,-19},{-47,-19},{-40,-16}}, color={0,0,0}),
        Line(points={{-53,-35},{-46,-35},{-43,-31}}, color={0,0,0}),
        Line(points={{-27,29},{21,29},{28,14}}, color={0,0,0}),
        Line(points={{-9,-1},{21,-1}}, color={0,0,0}),
        Line(points={{-33,-34},{-30,-34},{7,-34}}, color={0,0,0}),
        Line(points={{-90,10},{-90,-10}}, color={0,0,0}),
        Line(points={{90,10},{90,-10}}, color={0,0,0}),
        Ellipse(
          extent={{-26,22},{26,-28}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-20,22},{22,-30}},
          lineColor={0,0,255},
          textString="N")}));
end Drivetrain;
