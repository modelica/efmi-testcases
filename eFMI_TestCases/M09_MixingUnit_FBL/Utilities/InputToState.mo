within eFMI_TestCases.M09_MixingUnit_FBL.Utilities;
block InputToState
  Modelica.Blocks.Interfaces.RealInput xs
    annotation (
      useAsInputForState = x,
      Placement(transformation(extent = {{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput x
    annotation (Placement(transformation(extent = {{140,-20},{100,20}})));

  final Real x_xs_clock_partition = xs - x
    "Dummy variable relating 'x' and 'xs', such that they are within the same
     clock partition";

  annotation (
    preferredView = "info",
    Icon(graphics={
      Rectangle(
        extent = {{-100,60},{100,-60}},
        lineColor = {28,108,200}),
      Polygon(
        points = {{100,0},{60,18},{60,-18},{100,0}},
        lineColor = {0,0,127},
        fillColor = {0,0,127},
        fillPattern = FillPattern.Solid),
      Line(
        points = {{-100,0},{60,0}},
        color = {28,108,200},
        pattern = LinePattern.Dash),
      Text(
        extent = {{-100,54},{100,20}},
        lineColor = {28,108,200},
        pattern = LinePattern.Dash,
        fillColor = {0,0,127},
        fillPattern = FillPattern.Solid,
        textString = "input to"),
      Text(
        extent = {{-100,-20},{100,-54}},
        lineColor = {28,108,200},
        pattern = LinePattern.Dash,
        fillColor = {0,0,127},
        fillPattern = FillPattern.Solid,
        textString = "state")}));
end InputToState;
