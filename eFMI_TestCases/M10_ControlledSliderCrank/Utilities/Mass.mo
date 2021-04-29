within eFMI_TestCases.M10_ControlledSliderCrank.Utilities;
model Mass "Sliding mass with inertia"
  extends Modelica.Mechanics.Translational.Interfaces.PartialRigid(
    s(start = 0, stateSelect = stateSelect));

  parameter Modelica.SIunits.Mass m(min = 0, start = 1)
    "Mass of the sliding mass";
  parameter StateSelect stateSelect = StateSelect.default
    "Priority to use s and v as states"
    annotation (Dialog(tab = "Advanced"));

  Modelica.SIunits.Velocity v(start = 0, stateSelect = stateSelect)
    "Absolute velocity of component";
  Modelica.SIunits.Acceleration a(start = 0)
    "Absolute acceleration of component";

equation
  v = der(s);
  a = der(v);
  m*a = flange_a.f + flange_b.f;

  annotation (
    preferredView = "info",
    Icon(graphics={
      Line(points = {{-100,0},{-55,0}}, color={0,127,0}),
      Line(points = {{55,0},{100,0}}, color={0,127,0}),
      Rectangle(
        extent = {{-55,-30},{56,30}},
        lineColor = {0,0,0},
        fillPattern = FillPattern.Sphere,
        fillColor = {255,255,255}),
      Polygon(
        points = {{50,-90},{20,-80},{20,-100},{50,-90}},
        lineColor = {128,128,128},
        fillColor = {128,128,128},
        fillPattern = FillPattern.Solid),
      Line(points = {{-60,-90},{20,-90}}),
      Text(
        extent = {{-150,85},{150,45}},
        textString = "%name",
        lineColor = {0,0,255}),
      Text(
        extent = {{-150,-45},{150,-75}},
        lineColor = {0,0,0},
        textString = "m=%m")}),
    Diagram(coordinateSystem(graphics={
      Line(points = {{-100,0},{-55,0}}, color={0,127,0}),
      Line(points = {{55,0},{100,0}}, color={0,127,0}),
      Rectangle(
        extent = {{-55,-30},{55,30}},
        lineColor = {0,0,0},
        fillPattern = FillPattern.Sphere,
        fillColor = {255,255,255}),
      Polygon(
        points = {{50,-90},{20,-80},{20,-100},{50,-90}},
        lineColor = {128,128,128},
        fillColor = {128,128,128},
        fillPattern = FillPattern.Solid),
      Line(points = {{-60,-90},{20,-90}}),
      Line(points = {{-100,-29},{-100,-61}}),
      Line(points = {{100,-61},{100,-28}}),
      Line(points = {{-98,-60},{98,-60}}),
      Polygon(
        points = {{-101,-60},{-96,-59},{-96,-61},{-101,-60}},
        lineColor = {0,0,0},
        fillColor = {0,0,0},
        fillPattern = FillPattern.Solid),
      Polygon(
        points = {{100,-60},{95,-61},{95,-59},{100,-60}},
        lineColor = {0,0,0},
        fillColor = {0,0,0},
        fillPattern = FillPattern.Solid),
      Text(
        extent = {{-44,-41},{51,-57}},
        textString = "Length L",
        lineColor = {0,0,255}),
      Line(points = {{0,30},{0,53}}, color={0,0,0}),
      Line(points = {{-72,40},{1,40}}),
      Polygon(
        points = {{-7,42},{-7,38},{-1,40},{-7,42}},
        lineColor = {0,0,0},
        fillColor = {0,0,0},
        fillPattern = FillPattern.Solid),
      Text(
        extent = {{-61,53},{-9,42}},
        textString = "Position s",
        lineColor = {0,0,255})})),
    Documentation(info=
   "<html>
      <p>
      Sliding mass with <i>inertia, without friction</i> and two rigidly
      connected flanges.
      </p>
      <p>
      The sliding mass has the length <i>L</i>, the position coordinate <i>s</i>
      is in the middle. Sign convention: A positive force at flange
      <i>flange_a</i> moves the sliding mass in the positive direction. A
      negative force at flange <i>flange_a</i> moves the sliding mass to the
      negative direction.
      </p>
      </html>"));
end Mass;
