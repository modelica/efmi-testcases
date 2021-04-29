within eFMI_TestCases.M06_SkyhookGroundhook.Controllers;
model Skyhook "Skyhook damper controller with direct control signal output"
  extends .Modelica.Blocks.Icons.Block;
  extends .eFMI_TestCases.Icons.Controller;

  parameter Real gainSH = 2 "Gain of magic Skyhook controller";

  Modelica.Blocks.Interfaces.RealInput v_damper "Damper velocity"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput u_damper "Control signal of damper"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput v_body "Velocity of vehicle body"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));

protected
  Real vBodyDamper = v_body*v_damper;

equation
  if vBodyDamper <= 0 then
      u_damper = 0;
    else
      u_damper = gainSH*abs(v_body);
  end if;
end Skyhook;
