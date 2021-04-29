within eFMI_TestCases.M06_SkyhookGroundhook.Controllers;
model SkyhookGroundhook
  "Quarter-vehicle Skyhook-Groundhook controller with direct control signal output"
  extends .Modelica.Blocks.Icons.Block;
  extends .eFMI_TestCases.Icons.Controller;

  parameter Real gainSH=4000 "Gain of Skyhook controller";
  parameter Real gainGH=10 "Gain of Skyhook controller";
  parameter Real uDMax=2000 "Upper limits of damper control signals";
  parameter Real uDMin=100 "Lower limits of damper control signals";

  Modelica.Blocks.Interfaces.RealInput v_damper(min=-1e3, max=1e3) "Damper velocity"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),
        iconTransformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput v_body(min=-1e3, max=1e3) "Velocity of vehicle body"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}}),
        iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput v_wheel(min=-1e3, max=1e3) "Velocity of wheel"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}}),
        iconTransformation(extent={{-140,-20},{-100,20}})));

  Skyhook skyhook(gainSH=gainSH)
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Groundhook groundhook(gainGH=gainGH)
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{22,-10},{42,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=uDMax, uMin=uDMin)
    annotation (Placement(transformation(extent={{52,-8},{68,8}})));
  Modelica.Blocks.Interfaces.RealOutput u_damper(min=-1e5, max=1e5) "Control signal of damper"
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
        iconTransformation(extent={{100,-10},{120,10}})));

equation
  connect(add.y, limiter.u)
    annotation (Line(points={{43,0},{50.4,0}}, color={0,0,127}));
  connect(skyhook.u_damper, add.u1)
    annotation (Line(points={{1,30},{10,30},{10,6},{20,6}}, color={0,0,127}));
  connect(groundhook.u_damper, add.u2) annotation (Line(points={{1,-30},{10,-30},
          {10,-6},{20,-6}}, color={0,0,127}));
  connect(v_body, skyhook.v_body) annotation (Line(points={{-120,60},{-68,60},{
          -68,36},{-22,36}},   color={0,0,127}));
  connect(v_wheel, groundhook.v_wheel) annotation (Line(points={{-120,0},{-68,0},
          {-68,-24},{-22,-24}},   color={0,0,127}));
  connect(v_damper, skyhook.v_damper) annotation (Line(points={{-120,-60},{-44,
          -60},{-44,24},{-22,24}},   color={0,0,127}));
  connect(v_damper, groundhook.v_damper) annotation (Line(points={{-120,-60},{
          -44,-60},{-44,-36},{-22,-36}},   color={0,0,127}));
  connect(limiter.y, u_damper)
    annotation (Line(points={{68.8,0},{110,0}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>See Savaresi et al. &quot;Semi-Active Suspension Control Design for Vehicles&quot;, 2010 page 107 ff for details on the Skyhhok-Groundhook controller implementation.</p>
</html>"));
end SkyhookGroundhook;
