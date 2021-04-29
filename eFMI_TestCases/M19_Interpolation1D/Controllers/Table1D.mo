within eFMI_TestCases.M19_Interpolation1D.Controllers;
block Table1D
  extends Modelica.Blocks.Interfaces.SISO(u(min = -4.0, max = 4.0));
  extends eFMI_TestCases.Icons.Controller;

  eFMI.Tables.CombiTable1Ds table(
    efmi = true,
    final efmi_nu = 5,
    final table = [{-2, -1, 0, 1, 2}, {-4, -1.5, 0, 1.5, 4}])
    annotation (Placement(transformation(extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = 4.5)
    annotation (Placement(transformation(extent = {{40,-10},{60,10}})));

equation
  connect(table.u, u)
    annotation (Line(
      points = {{-12,0},{-120,0}},
      color = {0,0,127}));
  connect(table.y[1], limiter.u)
    annotation (Line(
      points = {{11,0},{38,0}},
      color = {0,0,127}));
  connect(limiter.y, y)
    annotation (Line(
      points = {{61,0},{110,0}},
      color = {0,0,127}));
end Table1D;
