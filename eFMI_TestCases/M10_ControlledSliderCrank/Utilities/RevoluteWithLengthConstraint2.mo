within eFMI_TestCases.M10_ControlledSliderCrank.Utilities;
model RevoluteWithLengthConstraint2
  "Revolute joint where the rotation angle is computed from a length constraint (1 degree-of-freedom, no potential state)"
  extends .Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;

  final parameter Real e[3](
    each final unit = "1") = .Modelica.Math.Vectors.normalizeWithAssert(n)
    "Unit vector in direction of rotation axis, resolved in frame_a";

  parameter Boolean animation = true
    "= true, if animation shall be enabled";
  parameter .Modelica.Units.SI.Position lengthConstraint(
    start = 1)
    "Fixed length of length constraint";
  parameter .Modelica.Mechanics.MultiBody.Types.Axis n = {0,0,1}
    "Axis of rotation resolved in frame_a (= same as in frame_b)"
    annotation (Evaluate=true);
  parameter .Modelica.Units.NonSI.Angle_deg phi_offset = 0
    "Relative angle offset (angle = phi + from_deg(phi_offset))";
  //parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg phi_guess=0
  //  "Select the configuration such that at initial time |phi - from_deg(phi_guess)| is minimal";
  parameter .Modelica.Units.SI.Distance cylinderLength = world.defaultJointLength
    "Length of cylinder representing the joint axis"
    annotation (Dialog(
      tab="Animation",
      group="if animation = true",
      enable=animation));
  parameter .Modelica.Units.SI.Distance cylinderDiameter = world.defaultJointWidth
    "Diameter of cylinder representing the joint axis"
    annotation (Dialog(
      tab="Animation",
      group="if animation = true",
      enable=animation));

  input .Modelica.Mechanics.MultiBody.Types.Color cylinderColor = .Modelica.Mechanics.MultiBody.Types.Defaults.JointColor
    "Color of cylinder representing the joint axis"
    annotation (Dialog(
      colorSelector=true,
      tab="Animation",
      group="if animation = true",
      enable=animation));
  input .Modelica.Mechanics.MultiBody.Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
    "Reflection of ambient light (= 0: light is completely absorbed)"
    annotation (Dialog(
      tab="Animation",
      group="if animation = true",
      enable=animation));

  parameter Boolean positiveBranch = true
    "Selection of one of the two solutions of the non-linear constraint equation that is used";

  .Modelica.Mechanics.Rotational.Interfaces.Flange_a axis
    "1-dim. rotational flange that drives the joint"
    annotation (Placement(transformation(extent={{10,90},{-10,110}})));
  .Modelica.Mechanics.Rotational.Interfaces.Flange_b bearing
    "1-dim. rotational flange of the drive bearing"
    annotation (Placement(transformation(extent={{-50,90},{-70,110}})));
  .Modelica.Blocks.Interfaces.RealInput position_a[3](
    each final quantity = "Length",
    each final unit = "m")
    "Position vector from frame_a to frame_a side of length constraint, resolved in frame_a of revolute joint"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  .Modelica.Blocks.Interfaces.RealInput position_b[3](
    each final quantity = "Length",
    each final unit = "m")
    "Position vector from frame_b to frame_b side of length constraint, resolved in frame_b of revolute joint"
    annotation (Placement(transformation(extent={{140,-80},{100,-40}})));
  .Modelica.Units.SI.Angle phi "Rotation angle of revolute joint";
  .Modelica.Mechanics.MultiBody.Frames.Orientation R_rel
    "Relative orientation object from frame_a to frame_b";
  .Modelica.Units.SI.Angle angle
    "= phi + from_deg(phi_offset) (relative rotation angle between frame_a and frame_b)";
  .Modelica.Units.SI.Torque tau
    "= axis.tau (driving torque in the axis)";

protected
  .Modelica.Units.SI.Position r_a[3] = position_a
    "Position vector from frame_a to frame_a side of length constraint, resolved in frame_a of revolute joint";
  .Modelica.Units.SI.Position r_b[3] = position_b
    "Position vector from frame_b to frame_b side of length constraint, resolved in frame_b of revolute joint";
  Real e_r_a
    "Projection of r_a on e";
  Real e_r_b
    "Projection of r_b on e";
  Real A
    "Coefficient A of equation: A*cos(phi) + B*sin(phi) + C = 0";
  Real B
    "Coefficient B of equation: A*cos(phi) + B*sin(phi) + C = 0";
  Real C
    "Coefficient C of equation: A*cos(phi) + B*sin(phi) + C = 0";
  Real k1
    "Constant of quadratic equation";
  Real k2
    "Constant of quadratic equation";
  Real k1a(start=1);
  Real k1b;
  Real kcos_angle
    "= k1*cos(angle)";
  Real ksin_angle
    "= k1*sin(angle)";

  .Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape cylinder(
    shapeType = "cylinder",
    color = cylinderColor,
    specularCoefficient = specularCoefficient,
    length = cylinderLength,
    width = cylinderDiameter,
    height = cylinderDiameter,
    lengthDirection = e,
    widthDirection = {0,1,0},
    r_shape = -e*(cylinderLength/2),
    r = frame_a.r_0,
    R = frame_a.R) if world.enableAnimation and animation;

equation
  Connections.branch(frame_a.R, frame_b.R);
  axis.tau = tau;
  axis.phi = phi;
  bearing.phi = 0;

  angle =.Modelica.Units.Conversions.from_deg(phi_offset) + phi;

  // transform kinematic quantities from frame_a to frame_b
  frame_b.r_0 = frame_a.r_0;

  R_rel = .Modelica.Mechanics.MultiBody.Frames.planarRotation(
    e,
    angle,
    der(angle));
  frame_b.R = .Modelica.Mechanics.MultiBody.Frames.absoluteRotation(frame_a.R,
    R_rel);

  // Force and torque balance
  zeros(3) = frame_a.f + .Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel,
    frame_b.f);
  zeros(3) = frame_a.t + .Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel,
    frame_b.t);

  // Compute rotation angle (details, see function "selectBranch")
  e_r_a = e*r_a;
  e_r_b = e*r_b;
  A = -2*(r_b*r_a - e_r_b*e_r_a);
  B = 2*r_b*cross(e, r_a);
  C = r_a*r_a + r_b*r_b - lengthConstraint*lengthConstraint - 2*e_r_b*e_r_a;
  k1 = A*A + B*B;
  k1a = k1 - C*C;

  assert(k1a > 1e-10, "
Singular position of loop (either no or two analytic solutions;
the mechanism has lost one-degree-of freedom in this position).
Try first to use another Modelica.Mechanics.MultiBody.Joints.Assemblies.JointXXX component.
In most cases it is best that the joints outside of the JointXXX
component are revolute and NOT prismatic joints. If this also
lead to singular positions, it could be that this kinematic loop
cannot be solved analytically. In this case you have to build
up the loop with basic joints (NO aggregation JointXXX components)
and rely on dynamic state selection, i.e., during simulation
the states will be dynamically selected in such a way that in no
position a degree of freedom is lost.
");

  k1b = .Modelica.Mechanics.MultiBody.Frames.Internal.maxWithoutEvent(
    k1a,
    1.0e-12);
  k2 = sqrt(k1b);
  kcos_angle = -A*C + (if positiveBranch then B else -B)*k2;
  ksin_angle = -B*C + (if positiveBranch then -A else A)*k2;

  angle = .Modelica.Math.atan2(ksin_angle, kcos_angle);

  annotation (
    Icon(
      graphics={
        Rectangle(
          extent={{-30,10},{10,-10}},
          lineColor={64,64,64},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,-60},{-30,60}},
          lineColor={64,64,64},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255},
          radius=10),
        Rectangle(
          extent={{30,-60},{100,60}},
          lineColor={64,64,64},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255},
          radius=10),
        Text(
          extent={{-139,-168},{137,-111}},
          textString="%name",
          lineColor={0,0,255}),
        Rectangle(extent={{-100,60},{-30,-60}}, lineColor={64,64,64}, radius=10),
        Rectangle(extent={{30,60},{100,-60}}, lineColor={64,64,64}, radius=10),
        Text(
          extent={{-142,-108},{147,-69}},
          textString="n=%n"),
        Line(points={{-60,60},{-60,90}}),
        Line(points={{-20,70},{-60,70}}),
        Line(points={{-20,80},{-20,60}}),
        Line(points={{20,80},{20,60}}),
        Line(points={{20,70},{41,70}}),
        Polygon(
          points={{-9,30},{10,30},{30,50},{-29,50},{-9,30}},
          lineColor={64,64,64},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{10,30},{30,50},{30,-51},{10,-31},{10,30}},
          lineColor={64,64,64},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,90},{10,50}},
          lineColor={64,64,64},
          fillPattern=FillPattern.VerticalCylinder,
          fillColor={192,192,192})}),
    Diagram(
      graphics={
        Rectangle(
          extent={{-100,-60},{-30,60}},
          lineColor={64,64,64},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255},
          radius=10),
        Rectangle(
          extent={{-100,-60},{-30,60}},
          lineColor={64,64,64},
          radius=10),
        Rectangle(
          extent={{-30,10},{10,-10}},
          lineColor={64,64,64},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{30,-60},{100,60}},
          lineColor={64,64,64},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255},
          radius=10),
        Rectangle(
          extent={{30,-60},{100,60}},
          lineColor={64,64,64},
          radius=10),
        Line(points={{-60,60},{-60,96}}),
        Line(points={{-20,70},{-60,70}}),
        Line(points={{-20,80},{-20,60}}),
        Line(points={{20,80},{20,60}}),
        Line(points={{20,70},{41,70}}),
        Polygon(
          points={{-9,30},{10,30},{30,50},{-29,50},{-9,30}},
          lineColor={64,64,64},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{10,30},{30,50},{30,-51},{10,-31},{10,30}},
          lineColor={64,64,64},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,50},{10,100}},
          lineColor={64,64,64},
          fillPattern=FillPattern.VerticalCylinder,
          fillColor={192,192,192})}),
    Documentation(info="<html>
<p>
Joint where frame_b rotates around axis n which is fixed in frame_a.
The two frames coincide when \"phi + phi_offset = 0\", where
\"phi_offset\" is a parameter with a zero default
and \"phi\" is the rotation angle.
</p>
<p>
This variant of the revolute joint is designed to work together
with a length constraint in a kinematic loop. This means that the
angle of the revolute joint, phi, is computed such that the
length constraint is fulfilled.
</p>
<p>
<strong>Usually, this joint should not be used by a user of the MultiBody
library. It is only provided to built-up the Modelica.Mechanics.MultiBody.Joints.Assemblies.JointXYZ
joints.</strong>
</p>

<p>
In releases before version 3.0 of the Modelica Standard Library, it was possible
to activate the torque projection equation (= cut-torque projected to the rotation
axis must be identical to the drive torque of flange axis) via parameter
<strong>axisTorqueBalance</strong>. This is no longer possible, since otherwise this
model would not be \"balanced\" (= same number of unknowns as equations).
Instead, when using this model in version 3.0 and later versions,
the force in the length constraint component (Joints.SphericalSpherical or
Joints.UniversalSpherical) must be calculated such that the driving torque
in direction of the rotation
axis is (RC shall be the name of the instance of RevoluteWithLengthConstraint):
</p>
<pre>
    0 = RC.axis.tau + RC.e*RC.frame_b.t;
</pre>
<p>
If this equation is used, usually the force in the length constraint
and the second derivative of the revolute angle will be part of a linear
algebraic system of equations. In some cases it is possible to solve
this system of equations locally, i.e., provide the rod force directly
as function of the revolute constraint torque. In any case, this projection
equation or an equivalent one has to be provided via variable \"constraintResidue\" in the \"Advanced\"
menu of \"Joints.SphericalSpherical\" or \"Joints.UniversalSpherical\".
</p>

</html>"));
end RevoluteWithLengthConstraint2;
