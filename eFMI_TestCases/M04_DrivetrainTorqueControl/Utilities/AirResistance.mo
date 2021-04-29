within eFMI_TestCases.M04_DrivetrainTorqueControl.Utilities;
model AirResistance
  parameter Real c_w=0.27;
  parameter Modelica.SIunits.Area area=2.19;
  parameter Modelica.SIunits.Density rho=1.2;
  Modelica.SIunits.Force F_drag;
  Modelica.SIunits.Velocity v_rel;

  Modelica.Blocks.Interfaces.RealInput v_wind annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,-60})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
equation
  v_rel=v_wind-der(flange_a.s);
  F_drag= sign(v_rel)*0.5*area*rho*v_rel^2*c_w;
  flange_a.f=-F_drag;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={                       Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-140,140},{140,100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Line(
          points={{-100,-100},{-80,-98},{-60,-92},{-40,-82},{-20,-68},{0,-50},{
              20,-28},{40,-2},{60,28},{80,62},{100,100}},
          color={0,0,127}, smooth=Smooth.Bezier)}));
end AirResistance;
