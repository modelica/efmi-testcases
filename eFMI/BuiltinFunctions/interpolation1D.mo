within eFMI.BuiltinFunctions;
function interpolation1D "Constant/linear interpolation in 1D with extrapolation"
  input  Real    x;
  input  Real    x_data[:];               // strict monotonically increasing values
  input  Integer nx;                      // 1 <= nx <= size(x_data, 1)
  input  Real    y_data[size(x_data, 1)];
  input  Integer interpolation;
  input  Integer extrapolation(min = 1, max = 2);

  output Real    y;

protected
  .Modelica.Blocks.Types.ExternalCombiTable1D table;
  final parameter .Modelica.Blocks.Types.Smoothness table_smoothness=
    .eFMI.Tables.convertInterpolation(interpolation);
  final parameter .Modelica.Blocks.Types.Extrapolation table_extrapolation=
    if extrapolation == 1
    then Modelica.Blocks.Types.Extrapolation.HoldLastPoint
    else Modelica.Blocks.Types.Extrapolation.LastTwoPoints;

algorithm
  .assert(
    size(x_data, 1) > 0,
    "eFMI.BuiltinFunctions.interpolation1D: Table is empty.");
  .assert(
    nx > 0 and nx <= .size(x_data, 1),
    "eFMI.BuiltinFunctions.interpolation1D: nx is wrong.");

  table := .Modelica.Blocks.Types.ExternalCombiTable1D(
    "NoName",
    "NoName",
    [x_data, y_data],
    {2},
    table_smoothness,
    table_extrapolation,
    false);

  if table_smoothness == .Modelica.Blocks.Types.Smoothness.ConstantSegments then
    y := .Modelica.Blocks.Tables.Internal.getTable1DValueNoDer(
      table,
      1,
      x);
  else
    y := .Modelica.Blocks.Tables.Internal.getTable1DValue(
      table,
      1,
      x);
  end if;

  annotation (
    Inline = false,
    smoothOrder(
      normallyConstant = x_data,
      normallyConstant = nx,
      normallyConstant = y_data,
      normallyConstant = interpolation,
      normallyConstant = extrapolation) = 1,
    Documentation(info="<html>
Constant or linear interpolation in [x_data[1:nx], y_data[1:nx1]]
with extrapolation, given the abszissa value x.
</html>"));
end interpolation1D;
