within eFMI_TestCases.S002_LinearEquationSystem.Controllers;
model LinearSystemOfEquations
  extends .Modelica.Blocks.Icons.Block;
  extends eFMI_TestCases.Icons.Controller;

  .Modelica.Blocks.Interfaces.RealInput u[4](
    each min = -1.0e7,
    each max = 1.0e7)
    "Connector of Real input signals"
    annotation (Placement(transformation(extent = {{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealOutput y[4]
    "Connector of Real output signals"
    annotation (Placement(transformation(extent = {{100,-10},{120,10}})));

  constant Real pi = .Modelica.Constants.pi;

  Real x[4](start = {-3, 7, 19, 1});
  Real v[4](start = zeros(4));
  Real F[4];
  Real M[4,4];

equation
  M = [-sin(x[3]+x[4]),     x[4]^2-x[2]^3,  -4*exp(x[3]*x[1]), cos(-x[2])*x[3];
       (x[2]+2*x[4])/x[1], -x[1],            x[1]*x[2],        sin(x[1]*x[2]*x[3]);
       -x[4]+x[2]*x[1],     6*pi*cos(x[2]), -x[2],             2*(x[1] + sin(x[3]*pi));
        x[1]+cos(x[3]),    -2*x[3]*x[4],    -4*x[3]*cos(x[2]), x[4]-x[1]*x[2]];

  F = {u[1]-x[3]^2, -u[4]+x[2]*cos(x[1]), -u[4]+u[2]*x[4], u[2]+u[3]};

  der(x) = v;
  M*der(v) = F;

  y = {sin(x[1])+x[3], -x[2], pi*2*cos(x[4]-x[2]), x[3]+x[1]/x[4]};
end LinearSystemOfEquations;
