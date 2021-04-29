within eFMI_TestCases.M15_AirSystem.PlantModels;
model Manifold_Temperature "Manifold temperature dynamics"
    extends Modelica.Blocks.Icons.Block;

  Modelica.Blocks.Interfaces.RealInput p_i(unit="Pa", displayUnit="bar") "Manifold pressure"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput m_dot_ap(unit="kg/s", displayUnit="g/s") "Air mass flow into intake port"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput m_dot_at(unit="kg/s", displayUnit="g/s") "Air mass flow past throttle plate"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealOutput T_i(
    final quantity="ThermodynamicTemperature",
    final unit="K",
    min = 0.0,
    start = 313,
    fixed=true,
    nominal = 300,
    displayUnit="degC")
    "Intake manifold temperature"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  parameter Modelica.SIunits.Volume V_i = 0.001 "Intake manifold volume";
  parameter Modelica.SIunits.MassFlowRate m_dot_EGR(displayUnit="g/s") = 0 "EGR mass flow";
  parameter Modelica.SIunits.Temp_K T_EGR = 298 "EGR temperature";
  parameter Modelica.SIunits.Temp_K T_a = 298 "Ambient temperature";

  constant Modelica.SIunits.SpecificHeatCapacity R = 287.058 "Specific gas constant for air";
  constant Real kappa(unit = "1") = 1.4 "Ratio of specific heats for air";

initial equation

equation

  der(T_i) = T_i*R/(p_i* V_i) * (-m_dot_ap*(kappa-1)* T_i + m_dot_at *(kappa*T_a - T_i) + m_dot_EGR*(kappa*T_EGR - T_i));

 annotation (
    Icon(
      graphics={
        Polygon(
          points={{42,24},{-6,78},{-20,80},{-42,72},{-52,66},{-60,60},{-68,48},
              {-76,32},{-76,26},{-22,-40},{42,24}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{6,12},{0,6},{-6,-4},{-12,-16},{-20,-32},{-22,-40},{-22,-42},
              {-20,-54},{-14,-60},{-8,-62},{14,-62},{40,-58},{54,-54},{64,-46},
              {72,-34},{82,-14},{88,2},{90,8},{90,14},{86,20},{80,24},{68,26},{
              46,24},{26,22},{12,16},{6,12}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-18,-26},{-62,26}},
          color={0,0,0},
          pattern=LinePattern.Dash),
        Line(
          points={{28,22},{-8,64}},
          color={0,0,0},
          pattern=LinePattern.Dash),
        Polygon(
          points={{-54,56},{-58,52},{-64,44},{-66,34},{-62,26},{-56,20},{-46,18},
              {-36,20},{-24,24},{-16,30},{-8,38},{-4,42},{-2,50},{-2,58},{-8,66},
              {-14,70},{-20,72},{-28,72},{-38,68},{-50,60},{-54,56}},
          lineColor={0,0,0},
          pattern=LinePattern.Dash,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-10,-44},{-2,-52}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{72,14},{80,6}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{0,16},{70,-54}},
          lineThickness=0.5,
          fillColor={135,135,135},
          fillPattern=FillPattern.Sphere,
          pattern=LinePattern.None,
          lineColor={255,255,255}),
        Ellipse(
          extent={{0,16},{70,-54}}, lineColor={0,0,0}),
        Ellipse(
          extent={{-56,14},{-38,-4}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-66,-52},{-28,-90}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-64,-54},{-30,-88}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-56,-54},{-38,6}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-54,-58},{-40,6}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-52,-60},{-42,-6}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-62,-56},{-32,-86}},
          lineColor={0,0,0},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-54,12},{-40,-2}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-54,-50},{-48,-50}},
          color={0,0,0},
          pattern=LinePattern.None),
        Line(points={{-54,-48},{-46,-48}}, color={0,0,0}),
        Line(points={{-54,-40},{-46,-40}}, color={0,0,0}),
        Line(points={{-54,-24},{-46,-24}}, color={0,0,0}),
        Line(points={{-54,-32},{-46,-32}}, color={0,0,0}),
        Line(points={{-54,-16},{-46,-16}}, color={0,0,0})}));
end Manifold_Temperature;
