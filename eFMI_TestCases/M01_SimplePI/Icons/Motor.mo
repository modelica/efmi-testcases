within eFMI_TestCases.M01_SimplePI.Icons;
class Motor
  annotation (
    Icon(
      graphics={
        Rectangle(lineColor={64,64,64},
          fillColor={192,192,192},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{4,10},{54,30}}),
        Rectangle(lineColor={64,64,64},
          fillColor={192,192,192},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{38,10},{88,30}}),
        Rectangle(lineColor={64,64,64},
          fillColor={255,255,255},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{16,0},{74,42}},
          radius=10.0),
        Rectangle(
          lineColor = {64,64,64},
          fillColor = {255,255,255},
          extent={{16,0},{74,42}},
          radius = 10),
        Rectangle(
          lineColor={82,0,2},
          fillColor={252,37,57},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-86,-14},{8,58}},
          radius=10.0),
        Polygon(
          fillColor={64,64,64},
          fillPattern=FillPattern.Solid,
          points={{-84,-58},{-74,-58},{-66,-14},{-12,-14},{-4,-54},{8,-54},
            {8,-68},{-84,-68},{-84,-58}})}));
end Motor;
