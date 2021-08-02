within eFMI_TestCases.M21_Interpolation2D.Utilities;
model CombiTable2D "CombiTable2D alternative enabling eFMI Algorithm Code generation"
  extends .Modelica.Blocks.Interfaces.SI2SO;

  parameter Boolean efmi = false
    "= true, selects the interpolation builtin functions of eFMI Algorithm Code,
     otherwise the ordinary MSL table implementation is used";

  parameter Real efmi_u1_data[:]={0,1};
  parameter Real efmi_u2_data[:]={0,1};
  parameter Real efmi_y_data[size(efmi_u1_data,1), size(efmi_u2_data,1)] = [0, 1; -1, -2];
  parameter Integer efmi_interpolation(min = 1, max = 2) = 2;
  parameter Integer efmi_extrapolation(min = 1, max = 2)= 2;

  //parameter Integer efmi_nu1 = size(efmi_u1_data,1);
  //parameter Integer efmi_nu2 = size(efmi_u2_data,1);

protected
  final .Modelica.Blocks.Tables.CombiTable2Ds combiTable2D(
    final tableOnFile = false,
    final table = [0.0, transpose([efmi_u2_data]); efmi_u1_data,efmi_y_data],
    final tableName = "",
    final fileName = "",
    final verboseRead = false,
    final smoothness = if efmi_interpolation == 2
      then .Modelica.Blocks.Types.Smoothness.LinearSegments
      else .Modelica.Blocks.Types.Smoothness.ConstantSegments,
    final extrapolation = if efmi_extrapolation == 2
      then .Modelica.Blocks.Types.Extrapolation.LastTwoPoints
      else .Modelica.Blocks.Types.Extrapolation.HoldLastPoint,
    final verboseExtrapolation = false) if not efmi
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

equation
  if efmi then
    y = eFMI.BuiltinFunctions.interpolation2D(
      u1,
      u2,
      efmi_u1_data,
      size(efmi_u1_data,1),
      efmi_u2_data,
      size(efmi_u2_data,1),
      efmi_y_data,
      efmi_interpolation,
      efmi_extrapolation);
  else
    connect(u1, combiTable2D.u1)
      annotation (Line(
        points = {{-120,60},{-40,60},{-40,6},{-12,6}},
        color = {0,0,127}));
    connect(u2, combiTable2D.u2)
      annotation (Line(
        points = {{-120,-60},{-40,-60},{-40,-6},{-12,-6}},
        color = {0,0,127}));
    connect(combiTable2D.y, y)
      annotation (Line(
        points = {{11,0},{110,0}},
        color = {0,0,127}));
  end if;

  annotation (
    Icon(
      graphics={
        Line(
          points = {{-60.0,40.0},{-60.0,-40.0},{60.0,-40.0},{60.0,40.0},
            {30.0,40.0},{30.0,-40.0},{-30.0,-40.0},{-30.0,40.0},{-60.0,40.0},
             {-60.0,20.0},{60.0,20.0},{60.0,0.0},{-60.0,0.0},{-60.0,-20.0},
             {60.0,-20.0},{60.0,-40.0},{-60.0,-40.0},{-60.0,40.0},{60.0,40.0},
             {60.0,-40.0}}),
        Line(
          points = {{0.0,40.0},{0.0,-40.0}}),
        Line(
          points = {{-60.0,40.0},{-30.0,20.0}}),
        Line(
          points = {{-30.0,40.0},{-60.0,20.0}}),
        Rectangle(
          origin = {2.3077,-0.0},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent = {{-62.3077,0.0},{-32.3077,20.0}}),
        Rectangle(
          origin = {2.3077,-0.0},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent = {{-62.3077,-20.0},{-32.3077,0.0}}),
        Rectangle(
          origin = {2.3077,-0.0},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent = {{-62.3077,-40.0},{-32.3077,-20.0}}),
        Rectangle(
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent = {{-30.0,20.0},{0.0,40.0}}),
        Rectangle(
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent = {{0.0,20.0},{30.0,40.0}}),
        Rectangle(
          origin = {-2.3077,-0.0},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent = {{32.3077,20.0},{62.3077,40.0}}),
        Text(
          extent = {{-82,-56},{100,-78}},
          lineColor={135,135,135},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          textString = "eFMI 2D")}));
end CombiTable2D;
