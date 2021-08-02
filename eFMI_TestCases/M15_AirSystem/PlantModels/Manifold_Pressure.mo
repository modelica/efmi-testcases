within eFMI_TestCases.M15_AirSystem.PlantModels;
model Manifold_Pressure "Intake manifold filling dynamics"
  extends .Modelica.Blocks.Icons.Block;

  import  Modelica.Units.Conversions.from_bar;
  import  Modelica.Units.Conversions.from_deg;
  import  Modelica.Units.Conversions.to_rpm;

  /* changed 12.12.2019 by O. Lenord, due to unit mismatch for eq. der(p_i)=...
  constant Real R(unit="J/(mol.K)") = 287e-5 "Specific gas constant for air (muliplied with 1e-5)";
  */
  constant .Modelica.Units.SI.SpecificHeatCapacity R = 287.058
    "Specific gas constant for dry air in SI units";
  constant Real kappa(
    unit = "1") = 1.4
    "Ratio of specific heats for air";
  constant .Modelica.Units.SI.AbsolutePressure p_a(
    displayUnit = "bar") = from_bar(1.01325)
    "Ambient pressure";

  parameter .Modelica.Units.SI.Temperature T_a = 298
    "Ambient temperature";
  parameter .Modelica.Units.SI.Volume V_i = 0.001
    "Intake manifold volume";
  parameter .Modelica.Units.SI.MassFlowRate m_dot_EGR = 0
    "EGR mass flow";
  parameter .Modelica.Units.SI.Temperature T_EGR = 298
    "EGR temperature";
  parameter .Modelica.Units.SI.Volume V_d = 0.001
    "Engine displacement volume";
  parameter .Modelica.Units.SI.Efficiency eta_i = 0.8276
    "Volumetric efficiency";
  parameter Real p_c(unit="1") = 0.5
    "Critical Pressure ratio";
  parameter .Modelica.Units.SI.MassFlowRate m_dot_at0 = 0.001
    "fitting constant, m_dot_at(p_a,T_a,v0)";
  parameter .Modelica.Units.SI.MassFlowRate m_dot_at1 = 10e-6
    "fitting constant, slope of m_dot_at(beta2)";
  parameter .Modelica.Units.NonSI.Angle_deg v0 = 2
    "Constant";

  .Modelica.Blocks.Interfaces.RealInput T_i(
    unit = "K",
    displayUnit = "K")
    "Intake manifold temperature"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  .Modelica.Blocks.Interfaces.RealInput v(
    unit = "deg",
    displayUnit = "deg")
    "Throttle position"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealInput n(
    unit = "rad/s",
    displayUnit = "rpm")
    "Crank shaft speed"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  .Modelica.Blocks.Interfaces.RealOutput p_i(
    start = from_bar(0.75),
    fixed = true,
    unit = "Pa",
    displayUnit = "bar",
    min = 0.0,
    nominal = 1e5)
    "Manifold pressure"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  .Modelica.Blocks.Interfaces.RealOutput m_dot_ap(
    quantity = "MassFlowRate",
    final unit = "kg/s",
    displayUnit = "g/s")
    "Air mass flow into intake port"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
  .Modelica.Blocks.Interfaces.RealOutput m_dot_at(
    quantity = "MassFlowRate",
    final unit = "kg/s",
    displayUnit = "g/s")
    "Air mass flow past throttle plate"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));

  Real p_r(unit = "1")
    "Ratio of manifold pressure over air pressure";
  Real beta_1(unit = "1");
  Real beta_2(unit = "1");
  Real tmp;

initial equation
//    der(p_i)=0; //to ne used instead of p_i(fixed=true)

equation
  /*changed 12.12.2019 by O. Lenord, consider n in rad/s instead of krpm
  m_dot_ap = V_d/(120*R*T_i)*eta_i*p_i*1000*n;
  */
  m_dot_ap = V_d/(120*R*T_i)*eta_i*p_i*to_rpm(n);
  p_r = min(p_i/p_a,1);

  /*changed 2020-06-25 by O. Lenord, applying formula from original SAE paper
  beta_1 = 1 - cos(v) - v0^2/2;*/
  beta_1 = 1 - cos(from_deg(v - v0));

  tmp = (1-((p_r-p_c)/(1-p_c))^2);
  beta_2 = smooth(
    1,
    noEvent(
      if (p_r > p_c) then .Modelica.Fluid.Utilities.regRoot(tmp)
      else 1));
//  beta_2 = smooth(1,noEvent(if (p_r > p_c) then sqrt(tmp) else 1));
//  beta_2 = smooth(1,noEvent(if (p_r > p_c) then .Modelica.Fluid.Utilities.regRoot(1-((p_r-p_c)/(1-p_c))^2) else 1));

  m_dot_at = m_dot_at1*p_a/sqrt(T_a)*beta_1*beta_2 + m_dot_at0;
  der(p_i) = kappa*R/V_i * (-m_dot_ap*T_i + m_dot_at*T_a + m_dot_EGR*T_EGR);

  annotation (
    Icon(
      graphics={
        Polygon(
          points={{38,16},{-10,70},{-24,72},{-46,64},{-56,58},{-64,52},{-72,40},
              {-80,24},{-80,18},{-26,-48},{38,16}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{2,4},{-4,-2},{-10,-12},{-16,-24},{-24,-40},{-26,-48},{-26,
              -50},{-24,-62},{-18,-68},{-12,-70},{10,-70},{36,-66},{50,-62},{60,
              -54},{68,-42},{78,-22},{84,-6},{86,0},{86,6},{82,12},{76,16},{64,
              18},{42,16},{22,14},{8,8},{2,4}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-4,8},{66,-62}},
          lineThickness=0.5,
          fillColor={135,135,135},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={255,255,255}),
        Line(
          points={{-22,-34},{-66,18}},
          color={0,0,0},
          pattern=LinePattern.Dash),
        Line(
          points={{-26,60}},
          color={0,0,0},
          pattern=LinePattern.Dash,
          thickness=0.5),
        Line(
          points={{24,14},{-12,56}},
          color={0,0,0},
          pattern=LinePattern.Dash),
        Polygon(
          points={{-58,48},{-62,44},{-68,36},{-70,26},{-66,18},{-60,12},{-50,10},
              {-40,12},{-28,16},{-20,22},{-12,30},{-8,34},{-6,42},{-6,50},{-12,
              58},{-18,62},{-24,64},{-32,64},{-42,60},{-54,52},{-58,48}},
          lineColor={0,0,0},
          pattern=LinePattern.Dash,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Line(
          points={{20,-16},{6,-2},{6,-10}},
          color={238,46,47},
          thickness=1),
        Line(
          points={{6,-2},{14,-2}},
          color={238,46,47},
          thickness=1),
        Line(
          points={{9,-7},{-5,5},{-5,-3}},
          color={238,46,47},
          origin={49,-7},
          rotation=-90,
          thickness=1),
        Line(
          points={{-4,-6.86543e-17},{4,0}},
          color={238,46,47},
          origin={54,-6},
          rotation=-90,
          thickness=1),
        Line(
          points={{9,-7},{-5,5},{-5,-3}},
          color={238,46,47},
          origin={51,-45},
          rotation=180,
          thickness=1),
        Line(
          points={{-4,-6.86543e-17},{4,0}},
          color={238,46,47},
          origin={52,-50},
          rotation=360,
          thickness=1),
        Line(
          points={{7,-7},{-7,7},{-7,-1}},
          color={238,46,47},
          thickness=1,
          origin={13,-43},
          rotation=90),
        Line(
          points={{-4,0},{4,0}},
          color={238,46,47},
          thickness=1,
          origin={6,-46},
          rotation=90),
        Line(
          points={{-7,-13},{-7,7},{-13,1}},
          color={238,46,47},
          thickness=1,
          origin={3,-19},
          rotation=90),
        Line(
          points={{-4,0},{2,-6}},
          color={238,46,47},
          thickness=1,
          origin={-4,-22},
          rotation=90),
        Line(
          points={{-7,-13},{-7,7},{-13,1}},
          color={238,46,47},
          thickness=1,
          origin={25,-55},
          rotation=180),
        Line(
          points={{-4,0},{2,-6}},
          color={238,46,47},
          thickness=1,
          origin={28,-62},
          rotation=180),
        Line(
          points={{-4,0},{2,-6}},
          color={238,46,47},
          thickness=1,
          origin={66,-32},
          rotation=270),
        Line(
          points={{-7,-13},{-7,7},{-13,1}},
          color={238,46,47},
          thickness=1,
          origin={59,-35},
          rotation=270),
        Line(
          points={{-4,0},{2,-6}},
          color={238,46,47},
          thickness=1,
          origin={34,8},
          rotation=360),
        Line(
          points={{-7,-13},{-7,7},{-13,1}},
          color={238,46,47},
          thickness=1,
          origin={37,1},
          rotation=360),
        Ellipse(
          extent={{-14,-52},{-6,-60}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{68,6},{76,-2}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-4,8},{66,-62}}, lineColor={0,0,0})}));
end Manifold_Pressure;
