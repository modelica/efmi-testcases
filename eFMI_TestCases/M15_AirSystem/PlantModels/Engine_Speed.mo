within eFMI_TestCases.M15_AirSystem.PlantModels;
model Engine_Speed "Crank shaft speed dynamics"
  extends .Modelica.Blocks.Icons.Block;

  import  Modelica.Units.Conversions.to_rpm;

  parameter .Modelica.Units.SI.Time dt_delay = 0.05
    "Injection torque delay time";
  parameter .Modelica.Units.SI.SpecificInternalEnergy Hu = 46.4e6
    "Fuel lower heating value";
  parameter .Modelica.Units.SI.Efficiency eta_i = 0.8276
    "Volumetric efficiency";
  parameter .Modelica.Units.SI.Inertia I = 100
    "Crank shaft load inertia";

  // added 12.12.2019 by O. Lenord to allow reasonable loss power calculation
  parameter .Modelica.Units.SI.Area A_p = 10e-4
    "piston friction area";
  parameter .Modelica.Units.SI.CoefficientOfFriction mue_p = 0.98
    "piston coeff. of friction";
  parameter .Modelica.Units.SI.Length s_p = 0.98
    "piston travel";
  parameter .Modelica.Units.SI.Volume V_p = 1e-3
    "pump volume";
  parameter .Modelica.Units.SI.RotationalDampingConstant kb = 0.1
    "brake friction";

  parameter Boolean ignore_delay = false;

  .Modelica.Blocks.Interfaces.RealInput m_dot_f(
    unit = "kg/s",
    displayUnit = "g/s")
    "Engine port fuel mass flow"
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
  .Modelica.Blocks.Interfaces.RealInput p_i(
    unit = "Pa",
    displayUnit = "bar")
    "Manifold Pressure"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  .Modelica.Blocks.Interfaces.RealOutput n(
    start = .Modelica.Units.Conversions.from_rpm(1000),
    fixed = true,
    unit = "rad/s",
    displayUnit = "rpm")
    "Crank shaft speed"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  .Modelica.Units.SI.MassFlowRate m_dot_f_delayed
    "delayed fuel mass flow rate";

  .Modelica.Units.SI.Power Pf(
    displayUnit = "kW")
    "Friction power";
  .Modelica.Units.SI.Power Pp(
    displayUnit = "kW")
    "Pumping power";
  .Modelica.Units.SI.Power Pb(
    displayUnit = "kW")
    "Load power";
  .Modelica.Units.SI.Power Pc(
    displayUnit = "kW")
    "Combustion power";
  /* changed 12.12.2019 by O. Lenord to allow proper unit checking
  Real Pf(unit="kW") "Friction power";
  Real Pp(unit="kW") "Pumping power";
  Real Pb(unit="kW") "Load power";
  */
initial equation
//  der(n) = 0;

equation
  /* changed 12.12.2019 by O. Lenord, as this is obviously physically wrong
  Pf = p_i + n;
  Pp = p_i + n;
  Pb = n;
  */
  /*The original work defines: Pf+Pp=n*(a0+a1*n+a2*n^2)+n*(a3+a4*n)*p_i
  Due to missing values for a0..a4 the power losses have been approximated as 
  follows using physical properties*/
  if ignore_delay then
      m_dot_f_delayed = m_dot_f;
  else
      m_dot_f_delayed = delay(m_dot_f,dt_delay);
  end if;

  Pf = A_p * p_i * mue_p * 2 * s_p * n / (2 * .Modelica.Constants.pi);
  Pp = V_p * p_i * to_rpm(n)/60;
  Pb = kb * (to_rpm(n)/60)^2;
  Pc = Hu*eta_i*m_dot_f_delayed;
  /* changed 11.12.2019 by O. Lenord, as this is obviously physically wrong
    der(n) = -(1/(I*n)*(Pf + Pp + Pb)) + (1/(I*n)*(Hu*eta_i*m_dot_f*(time - dt_delay)));
  */
  der(n) = (Pc - Pf - Pp - Pb)/(I*n);

  annotation (
    Icon(
      graphics={
        Rectangle(
          extent={{-94,8},{-64,-8}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255}),
        Rectangle(
          extent={{-56,24},{-46,8}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255}),
        Rectangle(
          extent={{-38,12},{-28,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255}),
        Rectangle(
          extent={{-20,-4},{-10,-24}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255}),
        Rectangle(
          extent={{-2,12},{12,-8}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255}),
        Rectangle(
          extent={{20,-4},{30,-22}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255}),
        Rectangle(
          extent={{38,12},{48,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255}),
        Rectangle(
          extent={{56,24},{66,8}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255}),
        Rectangle(
          extent={{76,10},{94,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255}),
        Polygon(
          points={{-64,14},{-64,-26},{-56,-26},{-56,26},{-60,18},{-64,14}},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175},
          pattern=LinePattern.None),
        Polygon(
          points={{-46,28},{-46,4},{-42,-6},{-38,-12},{-38,20},{-42,22},{-42,22},
              {-46,28}},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175},
          pattern=LinePattern.None),
        Polygon(
          points={{-28,14},{-28,-10},{-26,-14},{-20,-26},{-20,-2},{-22,2},{-24,
              10},{-28,14}},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175},
          pattern=LinePattern.None),
        Polygon(
          points={{-10,26},{-2,26},{-2,-12},{-4,-14},{-2,-18},{-2,-20},{-6,-24},
              {-8,-28},{-10,-28},{-10,26}},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175},
          pattern=LinePattern.None),
        Polygon(
          points={{20,26},{12,26},{12,-12},{14,-14},{12,-18},{12,-20},{16,-24},
              {18,-28},{20,-28},{20,26}},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175},
          pattern=LinePattern.None),
        Polygon(
          points={{38,14},{38,-10},{36,-14},{30,-26},{30,-2},{32,2},{34,10},{38,
              14}},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175},
          pattern=LinePattern.None),
        Polygon(
          points={{56,28},{56,4},{52,-6},{48,-12},{48,20},{52,22},{52,22},{56,
              28}},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175},
          pattern=LinePattern.None),
        Polygon(
          points={{76,12},{76,-26},{66,-26},{66,26},{70,18},{76,12}},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175},
          pattern=LinePattern.None),
        Line(
          points={{-76,16}},
          pattern=LinePattern.None,
          smooth=Smooth.Bezier),
        Line(
          points={{-72,14},{-78,16},{-84,14},{-90,4},{-90,-10},{-84,-18},{-76,
              -20},{-72,-14}},
          color={0,0,0},
          smooth=Smooth.Bezier),
        Line(points={{-72,-14},{-72,-20}}, color={0,0,0}),
        Line(points={{-72,-14},{-72,-14},{-78,-16}}, color={0,0,0})}));
end Engine_Speed;
