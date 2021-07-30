within eFMI_TestCases.M06_SkyhookGroundhook.Controllers;
model Groundhook
  "Groundhook damper controller with direct control signal output"
  extends .Modelica.Blocks.Icons.Block;
  extends .eFMI_TestCases.Icons.Controller;

  parameter Real gainGH = 2 "Gain of magic Skyhook controller";

  .Modelica.Blocks.Interfaces.RealInput v_damper
    "Damper velocity"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  .Modelica.Blocks.Interfaces.RealOutput u_damper
    "Control signal of damper"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  .Modelica.Blocks.Interfaces.RealInput v_wheel
    "Velocity of wheel"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));

protected
  Real vWheelDamper = -v_wheel*v_damper;

equation
  if vWheelDamper <= 0 then
      u_damper = 0;
    else
      u_damper = gainGH*abs(v_wheel);
  end if;
end Groundhook;
