within eFMI.Icons;
partial class CoordinateSystem
  annotation (
    preferredView = "icon",
    Icon(
      graphics={
        Line(
          points={{-90,0},{90,0}},
          color={190,190,190}),
        Line(
          points={{0,-90},{0,90}},
          color={190,190,190}),
        Polygon(
          points={{-6,80},{6,80},{0,94},{-6,80}},
          lineThickness=0.5,
          fillPattern=FillPattern.Sphere,
          fillColor={190,190,190},
          pattern=LinePattern.None),
        Polygon(
          points={{-6,-4},{6,-4},{0,10},{-6,-4}},
          lineThickness=0.5,
          fillPattern=FillPattern.Sphere,
          fillColor={190,190,190},
          pattern=LinePattern.None,
          origin={84,0},
          rotation=270)}));
end CoordinateSystem;
