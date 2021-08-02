within eFMI.Tables;
model CombiTable1Ds
  "'Modelica.Tables.Interpolation1Ds' alternative enabling eFMI
   GALEC code generation for the MSL 1D table interface."
  extends .Modelica.Blocks.Interfaces.SIMO(final nout = size(columns, 1));

  /* Mimic MSL table interface */

  parameter Boolean tableOnFile = false
    "= true, if table is defined on file or in function usertab"
    annotation (Dialog(
      group = "Table data definition"));
  parameter Real table[:, :] = fill(0.0, 0, 2)
    "Table matrix (grid = first column; e.g., table=[0, 0; 1, 1; 2, 4])"
    annotation (Dialog(
      group = "Table data definition",
      enable = not tableOnFile));
  parameter String tableName = "NoName"
    "Table name on file or in function usertab (see docu)"
    annotation (Dialog(
      group = "Table data definition",
      enable = tableOnFile));
  parameter String fileName = "NoName" "File where matrix is stored"
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
  parameter Integer columns[:] = 2:size(table, 2)
    "Columns of table to be interpolated"
    annotation (Dialog(
      group = "Table data interpretation"));
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
  parameter Integer efmi_nu(min = 2, max = size(efmi_u_data, 1))=
    size(efmi_u_data, 1)
    annotation(Evaluate = true);

protected
  final .Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(
    final tableOnFile = tableOnFile,
    final table = table,
    final tableName = tableName,
    final fileName = fileName,
    final verboseRead = verboseRead,
    final columns = columns,
    final smoothness = smoothness,
    final extrapolation = extrapolation,
    final verboseExtrapolation = verboseExtrapolation) if not efmi
    annotation (Placement(transformation(extent = {{-10,-10},{10,10}})));

  /*
    Implementation note: Unfortunately, the following doesn't work because
     (1) Slicing is not supported in eFMI Algorithm Code.
     (2) The whole idea of the 'interpolation1D' builtin function of the
         Algorithm Code specification is to encode tables in
         *separate parameters*.
         
    final parameter Real efmi_y_data[size(efmi_u_data, 1), size(columns, 1)] =
      table[:, 2:size(table, 2)]
      annotation(Evaluate = true);
    
    if efmi then
      for i in 1:nout loop
        y[i] = .eFMI.BuiltinFunctions.interpolation1D(
          u,
          table[:, 1],
          efmi_nu,
          table[:, columns[i]],
          efmi_interpolation,
          efmi_extrapolation);
      end for;
    end if;
  */

  final parameter Integer efmi_max_columns = 2;
  final parameter Real efmi_u_data[:] = table[:, 1]
    annotation(Evaluate = true);
  final parameter Real efmi_y_data_1[size(efmi_u_data, 1)]=
    table[:, columns[1]]
    annotation(Evaluate = true);
  final parameter Real efmi_y_data_2[:]=
    (if nout >= 2 then table[:, columns[2]] else fill(0.0, 0))
    annotation(Evaluate = true);
  final parameter Integer efmi_interpolation=
    convertSmoothness(smoothness)
    annotation(Evaluate = true);
  final parameter Integer efmi_extrapolation(min = 1, max = 2)=
    (if extrapolation == .Modelica.Blocks.Types.Extrapolation.HoldLastPoint
     then 1 else 2)
    annotation(Evaluate = true);

initial algorithm
  /* Check restrictions on supported MSL table interface */

  assert(
    size(table, 2) > 1 and size(table, 2) <= efmi_max_columns + 1
    and nout >= 1 and nout <= efmi_max_columns,
    "eFMI.Tables.CombiTable1Ds: At least 1 and at most 'efmi_max_columns' columns to interpolate supported.");
  assert(
    not
       (tableOnFile),
    "eFMI.Tables.CombiTable1Ds: Only 'tableOnFile=false' supported.");
  assert(
    tableName == "NoName",
    "eFMI.Tables.CombiTable1Ds: Only 'tableName = \"NoName\"' supported.");
  assert(
    fileName == "NoName",
    "eFMI.Tables.CombiTable1Ds: Only 'fileName = \"NoName\"' supported.");
  assert(
    not
       (verboseExtrapolation),
    "eFMI.Tables.CombiTable1Ds: Only 'verboseExtrapolation = false' supported.");
  assert(
    smoothness == .Modelica.Blocks.Types.Smoothness.ConstantSegments
    or smoothness == .Modelica.Blocks.Types.Smoothness.LinearSegments,
    "eFMI.Tables.CombiTable1Ds: Unsupported smoothness.");
  assert(
    extrapolation == .Modelica.Blocks.Types.Extrapolation.HoldLastPoint
    or extrapolation == .Modelica.Blocks.Types.Extrapolation.LastTwoPoints,
    "eFMI.Tables.CombiTable1Ds: Unsupported extrapolation.");

equation
  if efmi then
    y[1] = .eFMI.BuiltinFunctions.interpolation1D(
      u,
      efmi_u_data,
      efmi_nu,
      efmi_y_data_1,
      efmi_interpolation,
      efmi_extrapolation);
  end if;
  if efmi and nout >= 2 then
    y[2] = .eFMI.BuiltinFunctions.interpolation1D(
      u,
      efmi_u_data,
      efmi_nu,
      efmi_y_data_2,
      efmi_interpolation,
      efmi_extrapolation);
  end if;

  if not
        (efmi) then
    connect(combiTable1Ds.u, u)
      annotation (Line(
        points = {{-12,0},{-120,0}},
        color = {0,0,127}));
    connect(combiTable1Ds.y, y)
      annotation (Line(
        points = {{11,0},{110,0}},
        color = {0,0,127}));
  end if;

  annotation (
    Icon(graphics={
      Line(
        points = {{30,40},{30,-40}}),
      Rectangle(
        fillColor = {255,215,136},
        fillPattern = FillPattern.Solid,
        extent = {{-30,20},{0,40}}),
      Rectangle(
        fillColor = {255,215,136},
        fillPattern = FillPattern.Solid,
        extent = {{-30,0},{0,20}}),
      Rectangle(
        fillColor = {255,215,136},
        fillPattern = FillPattern.Solid,
        extent = {{-30,-20},{0,0}}),
      Rectangle(
        fillColor = {255,215,136},
        fillPattern = FillPattern.Solid,
        extent = {{-30,-40},{0,-20}}),
      Line(
        points = {{-30,40},{30,40}},
        color = {0,0,0}),
      Line(
        points = {{-30,20},{30,20}},
        color = {0,0,0}),
      Line(
        points = {{-30,0},{30,0}},
        color = {0,0,0}),
      Line(
        points = {{-30,-20},{30,-20}},
        color = {0,0,0}),
      Line(
        points = {{-30,-40},{30,-40}},
        color = {0,0,0}),
      Text(
        extent = {{-92,-66},{90,-88}},
        lineColor = {135,135,135},
        fillColor = {255,215,136},
        fillPattern = FillPattern.Solid,
        textString = "eFMI 1D")}));
end CombiTable1Ds;
