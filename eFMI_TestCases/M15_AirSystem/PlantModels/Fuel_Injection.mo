within eFMI_TestCases.M15_AirSystem.PlantModels;
model Fuel_Injection "Fuel injection dynamics"
    extends Modelica.Blocks.Icons.Block;
    import Modelica.SIunits.Conversions.to_rpm;
    import Modelica.SIunits.Conversions.to_bar;
  Modelica.Blocks.Interfaces.RealInput m_dot_f_i(unit="kg/s",displayUnit="g/s") "Injected fuel mass flow"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput p_i(unit="Pa",displayUnit="bar") "Manifold Pressure"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput n(unit="rad/s",displayUnit="rpm") "Crank shaft speed"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput m_dot_f(unit="kg/s", displayUnit="g/s") "Engine port fuel mass flow"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

Real X_f(unit="1",min=0, max=1) "Proportion of the fuel film";
Real tau_f(unit="s",min=0) "Fuel evaporation";
Modelica.SIunits.MassFlowRate m_dot_fv "Fuel vapour mass flow";
Modelica.SIunits.MassFlowRate m_dot_ff(start=0, fixed=true) "Fuel film mass flow";

initial equation

equation
//change 2020-06-24: consider that n is expected in krpm
  X_f = -0.277*to_bar(p_i) - 0.055e-3*to_rpm(n)/9.54 + 0.68;
  tau_f = 1.35*(-0.672e-3*to_rpm(n) + 1.68)*(to_bar(p_i) - 0.825)^2 + (-0.06e-3*to_rpm(n) + 0.15) + 0.56;
  der(m_dot_ff) = 1/tau_f*(-m_dot_ff + X_f*m_dot_f_i);
  m_dot_fv = (1 - X_f)*m_dot_f_i;
  m_dot_f = m_dot_fv + m_dot_ff;

  annotation (Icon(graphics={
        Polygon(
          points={{4,46},{12,58},{16,60},{20,60},{20,64},{22,68},{24,72},{26,76},
              {30,76},{36,74},{42,70},{44,68},{42,62},{40,58},{36,52},{40,48},{
              40,44},{36,34},{32,42},{24,48},{14,50},{4,46}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={65,65,65},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{4,48},{-6,28},{4,32},{14,30},{22,26},{26,20},{28,12},{36,36},
              {32,44},{24,50},{14,52},{4,48}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-6,28},{4,32},{14,30},{22,26},{26,20},{28,12},{28,10},{24,8},
              {24,14},{20,20},{16,24},{10,26},{4,26},{-2,24},{-4,22},{-6,20},{
              -8,22},{-6,28}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={131,131,131},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-6,20},{-2,24},{4,26},{10,26},{16,24},{20,20},{24,14},{24,8},
              {16,-6},{16,0},{10,8},{0,12},{-8,10},{-12,6},{-6,20}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={204,204,204},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-12,6},{-8,10},{0,12},{10,8},{16,0},{16,-6},{10,-10},{4,-10},
              {-4,-8},{-12,0},{-12,6}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={147,147,147},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-20,-32},{-16,-30},{-10,-32},{-6,-36},{10,-2},{8,2},{2,6},{
              -4,4},{-20,-32}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={197,197,197},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{30,18},{40,14},{56,12},{60,20},{62,28},{54,34},{44,38},{38,
              40},{30,18}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={50,50,50},
          fillPattern=FillPattern.Solid),
        Line(points={{-18,-40},{-30,-58}}, color={238,46,47}),
        Line(points={{-14,-42},{-22,-60}}, color={238,46,47}),
        Line(points={{-10,-44},{-12,-64}}, color={238,46,47}),
        Line(
          points={{-30,-48},{-36,-44},{-42,-44},{-48,-46},{-50,-52},{-52,-58},{
              -50,-64},{-44,-68},{-36,-68},{-30,-66},{-28,-64}},
          color={238,46,47},
          smooth=Smooth.Bezier),
        Line(
          points={{-38,-64},{-40,-64},{-48,-68},{-48,-76},{-42,-84},{-34,-84},{
              -26,-76},{-24,-68}},
          color={238,46,47},
          smooth=Smooth.Bezier),
        Line(
          points={{-6,-54},{2,-56},{6,-60},{6,-70},{0,-78},{-12,-76},{-14,-66}},
          color={238,46,47},
          smooth=Smooth.Bezier),
        Line(
          points={{-32,-76},{-26,-86},{-14,-90},{-4,-82},{-4,-72}},
          color={238,46,47},
          smooth=Smooth.Bezier),
        Polygon(
          points={{-20,-32},{-16,-30},{-10,-32},{-6,-36},{-8,-40},{-14,-40},{
              -20,-36},{-20,-32}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={184,184,184},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier)}));
end Fuel_Injection;
