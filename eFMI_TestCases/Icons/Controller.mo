within eFMI_TestCases.Icons;
partial class Controller
  annotation (Icon(graphics={
    Rectangle(
      origin = {0,40},
      fillColor = {255,255,255},
      fillPattern = FillPattern.Solid,
      extent = {{-40,-20},{40,20}}),
    Rectangle(
      origin = {0,-40},
      fillColor = {128,128,128},
      fillPattern = FillPattern.Solid,
      extent = {{-40,-20},{40,20}}),
    Line(
      origin = {-53.25,-2},
      points = {{13.25,-38},{-16.75,-38},{-16.75,42},{13.25,42}}),
    Line(
      origin = {49.25,0},
      points = {{-9.25,40},{20.75,40},{20.75,-40},{-9.25,-40}}),
    Polygon(
      points = {{60,-32},{40,-40},{60,-48},{60,-32}},
      fillColor = {0,0,0},
      fillPattern = FillPattern.Solid,
      pattern = LinePattern.None),
    Polygon(
      points = {{-60,48},{-40,40},{-60,32},{-60,48}},
      fillColor = {0,0,0},
      fillPattern = FillPattern.Solid,
      pattern = LinePattern.None)}));
end Controller;
