within eFMI_TestCases.M24_IntegratorReset.Controllers;
model IntegratorWithReset_Real
  extends .Modelica.Blocks.Interfaces.SISO(
    u(min = -1.0e7,
      max = 1.0e7),
    y(start = y_start));

  parameter Real y_start = 6.5;

  .Modelica.Blocks.Interfaces.RealInput reset(
    min = 0.0,
    max = 1.0)
    annotation (Placement(transformation(extent = {{-140,-100},{-100,-60}})));

equation
  der(y) = u;
  when reset > 0.5 then
    reinit(y, y_start);
  end when;
end IntegratorWithReset_Real;
