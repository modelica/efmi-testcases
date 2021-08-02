within eFMI_TestCases.M21_Interpolation2D.Controllers;
block Table2D_2
  // TODO: Change ranges to u(min = {-4.0, -5.0}, max={4.0, 5.0}) as soon as
  //  element individual ranges are supported in GALEC:
  extends .Modelica.Blocks.Interfaces.MIMO(
    final nin = 2,
    final nout = 2,
    u(each min = -5.0, each max = 5.0));
  extends .eFMI_TestCases.Icons.Controller;

  parameter Real table_u1Data[5] = {-2,-1,0, 1,2};
  parameter Real table_u2Data[3] = {-3, 0, 3};

  parameter Real table_yData[5,3] = [2,3,6;
                                     1,0,9;
                                    -3,5,2;
                                     1,2,7;
                                    -6,-3,2];

  Utilities.CombiTable2D   table2(
    efmi = true,
    efmi_u1_data=table_u1Data,
    efmi_u2_data=table_u2Data,
    efmi_y_data=table_yData,
    efmi_interpolation=2,
    efmi_extrapolation=2)
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));

  .Modelica.Blocks.Nonlinear.Limiter limiter2(
    uMax = 6)
    annotation (Placement(transformation(extent={{38,-60},{58,-40}})));

  Utilities.CombiTable2D   table1(
    efmi = true,
    efmi_u1_data=table_u1Data,
    efmi_u2_data=table_u2Data,
    efmi_y_data=table_yData,
    efmi_interpolation=2,
    efmi_extrapolation=2)
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));

  .Modelica.Blocks.Nonlinear.Limiter limiter1(
    uMax = 6.0)
    annotation (Placement(transformation(extent={{40,40},{60,60}})));

equation
  connect(table2.y, limiter2.u)
    annotation (Line(
      points={{11,-50},{36,-50}},
      color={0,0,127}));
  connect(limiter2.y, y[1])
    annotation (Line(
      points={{59,-50},{80,-50},{80,0},{108,0},{108,-2.5},{110,-2.5}},
      color={0,0,127}));
  connect(table2.u2, u[2])
    annotation (Line(
      points={{-12,-56},{-90,-56},{-90,0},{-110,0},{-110,2},{-116,2},{-116,5},{-120,5}},
      color={0,0,127}));
  connect(table2.u1, u[1])
    annotation (Line(
      points={{-12,-44},{-50,-44},{-50,0},{-112,0},{-112,-5},{-120,-5}},
      color={0,0,127}));
  connect(u[2], table1.u1)
    annotation (Line(
      points={{-120,5},{-118,5},{-118,6},{-114,6},{-114,0},{-90,0},{-90,56},{-12,56}},
      color={0,0,127}));
  connect(table1.y, limiter1.u)
    annotation (Line(
      points={{11,50},{38,50}},
      color={0,0,127}));
  connect(limiter1.y, y[2])
    annotation (Line(
      points={{61,50},{80,50},{80,0},{108,0},{108,2.5},{110,2.5}},
      color={0,0,127}));
  connect(table2.u1, table1.u2)
    annotation (Line(
      points={{-12,-44},{-50,-44},{-50,44},{-12,44}},
      color={0,0,127}));
end Table2D_2;
