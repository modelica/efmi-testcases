within eFMI_TestCases.M10_ControlledSliderCrank.Icons;
partial class SliderCrank
  annotation (
    preferredView = "icon",
    Icon(
      graphics={
        Ellipse(
          extent = {{-10,68},{10,60}},
          lineColor = {28,108,200},
          fillColor = {28,108,200},
          fillPattern = FillPattern.VerticalCylinder),
        Rectangle(
          extent = {{-10,76},{10,64}},
          lineColor = {28,108,200},
          fillColor = {28,108,200},
          fillPattern = FillPattern.VerticalCylinder),
        Ellipse(
          extent = {{-10,80},{10,72}},
          lineColor = {28,108,200},
          fillColor = {28,108,200},
          fillPattern = FillPattern.Sphere),
        Polygon(
          points = {{-6,-70},{6,-70},{0,-80},{-6,-70}},
          pattern = LinePattern.None,
          fillPattern = FillPattern.Sphere,
          fillColor = {0,183,91},
          lineColor = {0,0,0}),
        Rectangle(
          extent = {{-2,-70},{2,-40}},
          pattern = LinePattern.None,
          fillPattern = FillPattern.Solid,
          fillColor = {0,183,91},
          lineColor = {0,0,0}),
        Rectangle(
          extent = {{-2,40},{2,60}},
          pattern = LinePattern.None,
          fillPattern = FillPattern.Solid,
          fillColor = {135,135,135},
          lineColor = {0,0,0}),
        Rectangle(
          extent = {{-30,-42},{0,-38}},
          lineColor = {0,0,0},
          pattern = LinePattern.None,
          fillPattern = FillPattern.Solid,
          fillColor = {135,135,135}),
        Ellipse(
          extent = {{-4,-36},{4,-44}},
          fillPattern = FillPattern.Sphere,
          fillColor = {238,46,47},
          pattern = LinePattern.None),
        Polygon(
          points = {{-28,-40},{2,40},{-2,40},{-32,-40},{-28,-40}},
          lineColor = {0,0,0},
          pattern = LinePattern.None,
          fillPattern = FillPattern.HorizontalCylinder,
          fillColor = {135,135,135}),
        Ellipse(
          extent = {{-4,44},{4,36}},
          fillPattern = FillPattern.Sphere,
          fillColor = {238,46,47},
          pattern = LinePattern.None),
        Ellipse(
          extent = {{-34,-36},{-26,-44}},
          fillPattern = FillPattern.Sphere,
          fillColor = {238,46,47},
          pattern = LinePattern.None)}));
end SliderCrank;
