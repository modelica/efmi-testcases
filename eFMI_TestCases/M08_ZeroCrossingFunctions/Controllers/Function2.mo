within eFMI_TestCases.M08_ZeroCrossingFunctions.Controllers;
block Function2
  extends Modelica.Blocks.Interfaces.SISO(u(min=-1e6, max=1e6));
  extends eFMI_TestCases.Icons.Controller;

  parameter Real w = 3.0;

equation
  y = Modelica.Math.Nonlinear.Examples.UtilityFunctions.fun2(u, w = w);
end Function2;
