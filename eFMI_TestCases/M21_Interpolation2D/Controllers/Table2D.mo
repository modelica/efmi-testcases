within eFMI_TestCases.M21_Interpolation2D.Controllers;
block Table2D
  extends Modelica.Blocks.Interfaces.SI2SO(u1(min = -4.0, max = 4.0), u2(min = -5.0, max = 5.0));
  extends eFMI_TestCases.Icons.Controller;

  parameter Real u1_data[:] = {-2, -1, 0, 1, 2};
  parameter Real u2_data[:] = {-3,  0, 3};
  parameter Integer nu1 = size(u1_data, 1);
  parameter Integer nu2 = size(u2_data, 1);
  parameter Real y_data[nu1, nu2] = [u1_data]*transpose([u2_data]);

  eFMI.Tables.CombiTable2D table(
    efmi = true,
    final efmi_nu1 = nu1,
    final efmi_nu2 = nu2,
    final table = [0,                transpose([u2_data[1:nu2]]);
                   [u1_data[1:nu1]], y_data[1:nu1, 1:nu2]])
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = 6.0)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));

equation
  connect(table.y, limiter.u)
    annotation (Line(
      points={{11,0},{38,0}},
      color = {0,0,127}));
  connect(limiter.y, y)
    annotation (Line(
      points={{61,0},{110,0}},
      color = {0,0,127}));
  connect(u1, table.u1)
    annotation (Line(
      points={{-120,60},{-50,60},{-50,6},{-12,6}},
      color = {0,0,127}));
  connect(u2, table.u2)
    annotation (Line(
      points={{-120,-60},{-50,-60},{-50,-6},{-12,-6}},
      color = {0,0,127}));
end Table2D;
