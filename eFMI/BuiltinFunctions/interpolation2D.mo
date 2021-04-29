within eFMI.BuiltinFunctions;
function interpolation2D
  "Constant/linear interpolation in 2D with extrapolation"
  input  Real    x1;
  input  Real    x2;
  input  Real    x1_data[:];              // strict monotonically increasing values
  input  Integer nx1;                     // 1 <= nx1 <= size(x1_data, 1)
  input  Real    x2_data[:];              // strict monotonically increasing values
  input  Integer nx2;                     // 1 <= nx2 <= size(x2_data, 1)
  input  Real    y_data[size(x1_data, 1), size(x2_data,1)];
  input  Integer interpolation;
  input  Integer extrapolation(min = 1, max = 2);

  output Real    y;

protected
  .Modelica.Blocks.Types.ExternalCombiTable2D table;
  final parameter Modelica.Blocks.Types.Smoothness table_smoothness=
    .eFMI.Tables.convertInterpolation(interpolation);
  final parameter .Modelica.Blocks.Types.Extrapolation table_extrapolation=
    if extrapolation == 1
    then Modelica.Blocks.Types.Extrapolation.HoldLastPoint
    else Modelica.Blocks.Types.Extrapolation.LastTwoPoints;

algorithm
  .assert(
    size(x1_data, 1) > 0,
    "eFMI.BuiltinFunctions.interpolation2D: Table is empty.");
  .assert(
    size(x2_data, 1) > 0,
    "eFMI.BuiltinFunctions.interpolation2D: Table is empty.");
  .assert(
    nx1 > 0 and nx1 <= .size(x1_data, 1),
    "eFMI.BuiltinFunctions.interpolation2D: nx1 is wrong.");
  .assert(
    nx2 > 0 and nx2 <= .size(x2_data, 1),
    "eFMI.BuiltinFunctions.interpolation2D: nx2 is wrong.");

  table := .Modelica.Blocks.Types.ExternalCombiTable2D(
    "NoName",
    "NoName",
    [ 0,               .transpose([x2_data[1:nx2]]);
     [x1_data[1:nx1]], y_data[1:nx1,1:nx2]],
    table_smoothness,
    table_extrapolation,
    false);

  if table_smoothness == .Modelica.Blocks.Types.Smoothness.ConstantSegments then
    y := .Modelica.Blocks.Tables.Internal.getTable2DValueNoDer(
      table,
      x1,
      x2);
  else
    y := .Modelica.Blocks.Tables.Internal.getTable2DValue(
      table,
      x1,
      x2);
  end if;

  annotation (
    Inline = false,
    smoothOrder(
      normallyConstant = x1_data,
      normallyConstant = nx1,
      normallyConstant = x2_data,
      normallyConstant = nx2,
      normallyConstant = y_data,
      normallyConstant = interpolation,
      normallyConstant = extrapolation) = 1,
    Documentation(info="<html>
Constant or linear interpolation with x1_data[1:nx1], x2_data[1:nx2]
abszissa vectors and y_data[1:nx1, 1:nx2] ordinate matrix, 
given the abszissa values x1, x2.
</html>"));
end interpolation2D;
