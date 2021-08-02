within eFMI_TestCases.M08_ZeroCrossingFunctions.Controllers;
block Function1
  extends .Modelica.Blocks.Interfaces.SISO(
    u(min = -1e6,
      max = 1e6));
  extends eFMI_TestCases.Icons.Controller;

equation
  y = .Modelica.Math.Nonlinear.Examples.UtilityFunctions.fun1(u);
end Function1;
