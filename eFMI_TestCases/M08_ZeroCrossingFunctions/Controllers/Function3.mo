within eFMI_TestCases.M08_ZeroCrossingFunctions.Controllers;
block Function3
  extends .Modelica.Blocks.Interfaces.SISO(
    u(min = 1e-6,
      max = 1e6));
  extends eFMI_TestCases.Icons.Controller;

  parameter Real p[2] = {5, 0.6789};
  parameter Real m = 1.5;

equation
  y = .Modelica.Math.Nonlinear.Examples.UtilityFunctions.fun3(u, p = p, m = m);
end Function3;
