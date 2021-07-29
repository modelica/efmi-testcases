within eFMI.Tables;
model CombiTable2Ds
  "'Modelica.Tables.CombiTable2Ds' alternative enabling eFMI
   GALEC code generation for the MSL 2D table interface."
  extends .Modelica.Blocks.Interfaces.SI2SO;
  extends .eFMI.Icons.Table;

  /* Mimic MSL table interface */

  parameter Boolean tableOnFile = false
    "= true, if table is defined on file or in function usertab"
    annotation (Dialog(
      group = "Table data definition"));
  parameter Real table[:, :] = fill(0.0, 1, 1)
    "Table matrix (grid u1 = first column, grid u2 = first row; e.g., table=[0, 0; 0, 1])"
    annotation (Dialog(
      group = "Table data definition",
      enable = not tableOnFile));
  parameter String tableName = "NoName"
    "Table name on file or in function usertab (see docu)"
    annotation (Dialog(
      group = "Table data definition",
      enable = tableOnFile));
  parameter String fileName = "NoName"
    "File where matrix is stored"
    annotation (Dialog(
      group = "Table data definition",
      enable = tableOnFile,
      loadSelector(
        filter = "Text files (*.txt);;MATLAB MAT-files (*.mat)",
        caption = "Open file in which table is present")));
  parameter Boolean verboseRead = true
    "= true, if info message that file is loading is to be printed"
    annotation (Dialog(
      group = "Table data definition",
      enable = tableOnFile));
  parameter .Modelica.Blocks.Types.Smoothness smoothness=
    Modelica.Blocks.Types.Smoothness.LinearSegments
    "Smoothness of table interpolation"
    annotation (Dialog(
      group = "Table data interpretation"));
  parameter .Modelica.Blocks.Types.Extrapolation extrapolation=
    Modelica.Blocks.Types.Extrapolation.LastTwoPoints
    "Extrapolation of data outside the definition range"
    annotation (Dialog(
      group = "Table data interpretation"));
  parameter Boolean verboseExtrapolation = false
    "= true, if warning messages are to be printed if table input is outside the definition range"
    annotation (Dialog(
      group = "Table data interpretation",
      enable = extrapolation == .Modelica.Blocks.Types.Extrapolation.LastTwoPoints or extrapolation == Modelica.Blocks.Types.Extrapolation.HoldLastPoint));

  /* eFMI specific table interface */

  parameter Boolean efmi = true
    "= true, selects the interpolation builtin functions of eFMI Algorithm Code,
     otherwise the ordinary MSL table implementation is used";
  parameter Integer efmi_nu1(min = 2, max = size(efmi_u1_data, 1))=
    size(efmi_u1_data, 1)
    annotation(Evaluate = true);
  parameter Integer efmi_nu2(min = 2, max = size(efmi_u2_data, 1))=
    size(efmi_u2_data, 1)
    annotation(Evaluate = true);

protected
  final .Modelica.Blocks.Tables.CombiTable2Ds combiTable2D(
    final tableOnFile = tableOnFile,
    final table = table,
    final tableName = tableName,
    final fileName = fileName,
    final verboseRead = verboseRead,
    final smoothness = smoothness,
    final extrapolation = extrapolation,
    final verboseExtrapolation = verboseExtrapolation) if not efmi
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  final parameter Real efmi_u1_data[:] = table[2:size(table, 1), 1]
    annotation(Evaluate = true);
  final parameter Real efmi_u2_data[:] = table[1, 2:size(table, 2)]
    annotation(Evaluate = true);
  final parameter Real efmi_y_data[size(efmi_u1_data, 1), size(efmi_u2_data, 1)]=
    table[2:size(table, 1), 2:size(table, 2)]
    annotation(Evaluate = true);
  final parameter Integer efmi_interpolation=
    convertSmoothness(smoothness)
    annotation(Evaluate = true);
  final parameter Integer efmi_extrapolation(min = 1, max = 2)=
    (if extrapolation == .Modelica.Blocks.Types.Extrapolation.HoldLastPoint
     then 1 else 2)
    annotation(Evaluate = true);

  final parameter Boolean map_u2_to_1D = size(efmi_u1_data, 1) == 1
    annotation(Evaluate = true);
  final parameter Boolean map_u1_to_1D = size(efmi_u2_data, 1) == 1
    annotation(Evaluate = true);
  final parameter Real efmi_y_data_1D
    [if map_u2_to_1D then size(efmi_u2_data, 1) else size(efmi_u1_data, 1)]=
    (if map_u2_to_1D
     then table[2, 2:size(table, 2)]
     else table[2:size(table, 1), 2])
    annotation(Evaluate = true);

initial algorithm
  /* Check restrictions on supported MSL table interface */

  assert(
    size(table, 1) >= 2 and size(table, 2) >= 2,
    "eFMI.Tables.CombiTable2D: Tables must be at least 2x2.");
  assert(
    not
       (map_u2_to_1D and map_u1_to_1D),
    "eFMI.Tables.CombiTable2D: At least one dimension must be interpolated.");
  assert(
    not
       (tableOnFile),
    "eFMI.Tables.CombiTable2D: Only 'tableOnFile=false' supported.");
  assert(
    tableName == "NoName",
    "eFMI.Tables.CombiTable2D: Only 'tableName = \"NoName\"' supported.");
  assert(
    fileName == "NoName",
    "eFMI.Tables.CombiTable2D: Only 'fileName = \"NoName\"' supported.");
  assert(
    not
       (verboseExtrapolation),
    "eFMI.Tables.CombiTable2D: Only 'verboseExtrapolation = false' supported.");
  assert(
    smoothness == .Modelica.Blocks.Types.Smoothness.ConstantSegments
    or smoothness == .Modelica.Blocks.Types.Smoothness.LinearSegments,
    "eFMI.Tables.CombiTable2D: Unsupported smoothness.");
  assert(
    extrapolation == .Modelica.Blocks.Types.Extrapolation.HoldLastPoint
    or extrapolation == .Modelica.Blocks.Types.Extrapolation.LastTwoPoints,
    "eFMI.Tables.CombiTable2D: Unsupported extrapolation.");

equation
  if efmi and not
                 (map_u2_to_1D) and not
                                       (map_u1_to_1D) then
    y = .eFMI.BuiltinFunctions.interpolation2D(
      u1,
      u2,
      efmi_u1_data,
      efmi_nu1,
      efmi_u2_data,
      efmi_nu2,
      efmi_y_data,
      efmi_interpolation,
      efmi_extrapolation);
  elseif efmi and map_u2_to_1D then
    y = .eFMI.BuiltinFunctions.interpolation1D(
      u2,
      efmi_u2_data,
      efmi_nu2,
      efmi_y_data_1D,
      efmi_interpolation,
      efmi_extrapolation);
  elseif efmi and map_u1_to_1D then
    y = .eFMI.BuiltinFunctions.interpolation1D(
      u1,
      efmi_u1_data,
      efmi_nu1,
      efmi_y_data_1D,
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
        Text(
          extent = {{-82,-56},{100,-78}},
          lineColor={135,135,135},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          textString = "eFMI 2D")}));
end CombiTable2Ds;
