within eFMI_TestCases.S002_LinearEquationSystem.Controllers;
block LinearSystemOfEquations_ScalarInterface
  extends .Modelica.Blocks.Icons.Block;
  extends eFMI_TestCases.Icons.Controller;

  .Modelica.Blocks.Interfaces.RealInput u1(
    min = -1.0e7,
    max = 1.0e7)
    annotation (Placement(transformation(extent = {{-140,40},{-100,80}})));
  .Modelica.Blocks.Interfaces.RealInput u2(
    min = -1.0e7,
    max = 1.0e7)
    annotation (Placement(transformation(extent = {{-140,0},{-100,40}})));
  .Modelica.Blocks.Interfaces.RealInput u3(
    min = -1.0e7,
    max = 1.0e7)
    annotation (Placement(transformation(extent = {{-140,-42},{-100,-2}})));
  .Modelica.Blocks.Interfaces.RealInput u4(
    min = -1.0e7,
    max = 1.0e7)
    annotation (Placement(transformation(extent = {{-140,-80},{-100,-40}})));
  .Modelica.Blocks.Interfaces.RealOutput y1
    annotation (Placement(transformation(extent = {{100,50},{120,70}})));
  .Modelica.Blocks.Interfaces.RealOutput y2
    annotation (Placement(transformation(extent = {{100,10},{120,30}})));
  .Modelica.Blocks.Interfaces.RealOutput y3
    annotation (Placement(transformation(extent = {{100,-30},{120,-10}})));
  .Modelica.Blocks.Interfaces.RealOutput y4
    annotation (Placement(transformation(extent = {{100,-70},{120,-50}})));

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

  F = {u1-x[3]^2, -u4+x[2]*cos(x[1]), -u4+u2*x[4], u2+u3};

  der(x) = v;
  M*der(v) = F;

  y1 = sin(x[1])+x[3];
  y2 = -x[2];
  y3 = pi*2*cos(x[4]-x[2]);
  y4 = x[3]+x[1]/x[4];
end LinearSystemOfEquations_ScalarInterface;
