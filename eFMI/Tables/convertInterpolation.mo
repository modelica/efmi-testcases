within eFMI.Tables;
function convertInterpolation
  "Convert eFMI interpolation argument to Modelica combi-table smoothness."
  input Integer interpolation
    "eFMI interpolation value.";
  output .Modelica.Blocks.Types.Smoothness smoothness
    "Modelica combi-table smoothness.";
algorithm
  if interpolation == 2 then
    smoothness := .Modelica.Blocks.Types.Smoothness.LinearSegments;
  elseif interpolation == 4 then
    smoothness := .Modelica.Blocks.Types.Smoothness.ContinuousDerivative;
  elseif interpolation == 1 then
    smoothness := .Modelica.Blocks.Types.Smoothness.ConstantSegments;
  elseif interpolation == 3 then
    smoothness := .Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1;
  elseif interpolation == 5 then
    smoothness := .Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative2;
  else
    smoothness := .Modelica.Blocks.Types.Smoothness.ConstantSegments;
    assert(
      false,
      "eFMI.Tables.convertInterpolation: Unknown eFMI interpolation value.");
  end if;
end convertInterpolation;
