within eFMI.Tests.Tables;
model Test_CombiTable1Ds_Modelica
  extends .Modelica.Icons.Example;

  parameter Real u_data[:] = {-2, -1,   0, 1,   2};
  parameter Real y_data[size(u_data, 1)] = {-4, -1.5, 0, 1.5, 4};
  parameter Integer nu = size(u_data, 1);

  .Modelica.Blocks.Sources.Sine sine(
    amplitude = 3,
    f = 2)
    annotation (Placement(transformation(extent = {{-60,-10},{-40,10}})));
  eFMI.Tables.CombiTable1Ds table(
    efmi = false,
    final table = [u_data[1:nu], y_data[1:nu]])
    annotation (Placement(transformation(extent = {{-10,-10},{10,10}})));

equation
  connect(sine.y, table.u)
    annotation (Line(
      points = {{-39,0},{-12,0}},
      color = {0,0,127}));

  annotation (
    experiment(StopTime = 1.2));
end Test_CombiTable1Ds_Modelica;
