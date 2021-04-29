within eFMI_TestCases.M22_SlipWithSafeDivision.Utilities;
model WheelWithLinearSlip
  "Simple 1-dim. model of wheel with a tire with linear slip"

  import SI=Modelica.SIunits;
  parameter Modelica.SIunits.Radius wheelRadius;
  parameter SI.Inertia J "Wheel inertia";
  parameter SI.Force stiffness "Slip stiffness (fDrive = stiffness*slip)";
  parameter SI.Velocity v_min
    "Minimum vehicle velocity for slip calculation";

  Modelica.Mechanics.Rotational.Interfaces.Flange_a flangeR "Flange of rotational shaft"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flangeT
    "Flange of translational rod" annotation (Placement(transformation(
          extent={{90,10},{110,-10}})));

  Real slip "Longitudinal slip = (R*w - v)/R*abs(w)";
  SI.Force fDrive "Driving force of wheel";
  SI.AngularVelocity w "Angular velocity of wheel axis";
  SI.Velocity v "Velocity of wheel center";
  SI.Velocity v_roll "Rolling velocity of wheel";
  SI.Velocity v_slip "Slip velocity of wheel";
protected
  SI.Velocity absv;
equation
  w = der(flangeR.phi);
  v = der(flangeT.s);

  v_roll = w*wheelRadius;
  v_slip = v - v_roll;
  absv = noEvent(abs(v));
  slip = eFMI.BuiltinFunctions.safe_posdiv(-v_slip, absv, v_min);
  fDrive = slip*stiffness;
  flangeT.f = -fDrive;

  J*der(w) = flangeR.tau - fDrive*wheelRadius;

  annotation (
    Icon(
      coordinateSystem(preserveAspectRatio=true,
        extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
      Rectangle(  lineColor={64,64,64},
        fillColor={192,192,192},
        fillPattern=FillPattern.HorizontalCylinder,
        extent={{-100.0,-10.0},{-46.0,10.0}}),
      Ellipse(  lineColor={64,64,64},
        fillColor={255,255,255},
        fillPattern=FillPattern.HorizontalCylinder,
        extent={{-50.0,-80.0},{10.0,80.0}}),
      Rectangle(  lineColor={64,64,64},
        fillColor={255,255,255},
        pattern=LinePattern.None,
        fillPattern=FillPattern.HorizontalCylinder,
        extent={{-20.0,-80.0},{12.0,80.0}}),
      Ellipse(  lineColor={64,64,64},
        fillColor={128,128,128},
        fillPattern=FillPattern.Solid,
        extent={{-16.0,-80.0},{44.0,80.0}}),
      Ellipse(  lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        extent={{-2.0,-52.0},{34.0,52.0}}),
      Ellipse(  lineColor={64,64,64},
        fillColor={192,192,192},
        fillPattern=FillPattern.HorizontalCylinder,
        extent={{12.0,-10.0},{20.0,10.0}}),
      Rectangle(  lineColor={64,64,64},
        fillColor={192,192,192},
        pattern=LinePattern.None,
        fillPattern=FillPattern.HorizontalCylinder,
        extent={{16.0,-10.0},{60.0,10.0}}),
      Ellipse(  fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        extent={{56.0,-10.0},{64.0,10.0}}),
      Text(  lineColor={0,0,255},
        extent={{-150.0,90.0},{150.0,130.0}},
        textString="%name"),
      Polygon(  lineColor={0,127,0},
        fillColor={0,127,0},
        fillPattern=FillPattern.Solid,
        points={{80.0,10.0},{80.0,26.0},{60.0,26.0},{60.0,20.0},{70.0,20.0},{70.0,-20.0},{60.0,-20.0},{60.0,-26.0},{80.0,-26.0},{80.0,-10.0},{90.0,-10.0},{90.0,10.0},{80.0,10.0}}),
      Line(  points={{-100.0,-20.0},{-60.0,-20.0}}),
      Line(  points={{-76,-20},{-76,-100}},
          color={0,0,0},
          pattern=LinePattern.Dot),
      Line(  points={{-100.0,20.0},{-60.0,20.0}}),
      Line(  points={{100,-100},{-100,-100}},
        color={0,127,0}),
      Line(  points={{70,-26},{70,-26},{70,-26},{70,-100}},
        color={0,127,0},
          pattern=LinePattern.Dot),
      Line(  origin={-2.5,80.0},
        points={{-17.5,0.0},{17.5,0.0}},
        color={64,64,64}),
      Line(  origin={-2.5,-80.0},
        points={{-17.5,0.0},{17.5,0.0}},
        color={64,64,64}),
      Line(  origin={38.0,10.0},
        points={{-22.0,0.0},{22.0,0.0}},
        color={64,64,64}),
      Line(  origin={38.0,-10.0},
        points={{-22.0,0.0},{22.0,0.0}},
        color={64,64,64})}), Documentation(info="<html>
<p>
A simple kinematic model of a rolling wheel which has no inertia and
no rolling resistance. This component defines the kinematic constraint:
</p>

<pre>
   (flangeR.phi - internalSupportR.phi)*wheelRadius = (flangeT.s - internalSupportT.s);
</pre>
</html>"));
end WheelWithLinearSlip;
