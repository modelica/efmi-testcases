within eFMI_TestCases.M10_ControlledSliderCrank.Utilities;
model Mounting1D
  "Propagate 1-dim. translational support force to 3-dim. system."

  parameter .Modelica.Mechanics.MultiBody.Types.Axis n = {1,0,0}
    "Axis of movement = axis of support force (resolved in frame_a)"
    annotation (Evaluate = true);

  .Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b
    "(right) flange fixed in housing"
    annotation (Placement(transformation(extent = {{110,10},{90,-10}})));
  .Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
    "Frame in which housing is fixed"
    annotation (Placement(transformation(
      origin = {0,-100},
      extent = {{-20,-20},{20,20}},
      rotation = 90)));

equation
  flange_b.s = frame_a.r_0*n;
  frame_a.f = -n*flange_b.f;
  frame_a.t = zeros(3);

  annotation (
    preferredView = "info",
    Icon(graphics={
      Rectangle(
        extent = {{-80,-60},{80,-100}},
        lineColor = {0,0,0},
        fillColor = {255,255,255},
        fillPattern = FillPattern.Solid),
      Text(
        extent = {{-150,60},{150,20}},
        lineColor = {0,0,255},
        textString = "%name"),
      Line(points = {{80,-60},{40,-100}}),
      Line(points = {{40,-60},{0,-100}}),
      Line(points = {{0,-60},{-40,-100}}),
      Line(points = {{-40,-60},{-80,-100}}),
      Line(points = {{0,-60},{0,0}}),
      Line(points = {{0,0},{90,0}})}));
end Mounting1D;
