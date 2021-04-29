within eFMI_TestCases.M24_IntegratorReset.Controllers;
model IntegratorWithReset_Boolean
  extends Modelica.Blocks.Interfaces.SISO(u(min=-1.0e7, max=1.0e7),
    y(start = y_start));

  parameter Real y_start= 6.5;

  Modelica.Blocks.Interfaces.BooleanInput reset
    annotation (Placement(transformation(extent = {{-140,-100},{-100,-60}})));

equation
  der(y) = u;
  when reset then
    reinit(y, y_start);
  end when;
end IntegratorWithReset_Boolean;
