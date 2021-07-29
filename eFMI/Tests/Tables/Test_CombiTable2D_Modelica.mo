within eFMI.Tests.Tables;
model Test_CombiTable2D_Modelica
  extends .Modelica.Icons.Example;

  parameter Real u1_data[:] = {-2, -1, 0, 1, 2};
  parameter Real u2_data[:] = {-3,  0, 3};
  parameter Real y_data[size(u1_data, 1), size(u2_data, 1)]=
    [u1_data]*transpose([u2_data]);
  parameter Integer nu1 = size(u1_data, 1);
  parameter Integer nu2 = size(u2_data, 1);

  Modelica.Blocks.Sources.Sine sine1(
    amplitude = 3,
    f = 2)
    annotation (Placement(transformation(extent = {{-60,10},{-40,30}})));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude = 4,
    f = 1.5)
    annotation (Placement(transformation(extent = {{-60,-30},{-40,-10}})));

  eFMI.Tables.CombiTable2Ds table(
    efmi = false,
    final table = [0,                transpose([u2_data[1:nu2]]);
                   [u1_data[1:nu1]], y_data[1:nu1, 1:nu2]])
    annotation (Placement(transformation(extent = {{-10,-10},{10,10}})));

equation
  connect(sine1.y, table.u1)
    annotation (Line(
      points = {{-39,20},{-26,20},{-26,6},{-12,6}},
      color = {0,0,127}));
  connect(sine2.y, table.u2)
    annotation (Line(
      points = {{-39,-20},{-26,-20},{-26,-6},{-12,-6}},
      color = {0,0,127}));

  annotation (
    experiment(StopTime = 1.2));
end Test_CombiTable2D_Modelica;
