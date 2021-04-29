within eFMI.Tables;
function convertSmoothness
  "Convert Modelica combi-table smoothness to eFMI interpolation argument."
  input Modelica.Blocks.Types.Smoothness smoothness
    "Modelica combi-table smoothness.";
  output Integer interpolation
    "eFMI interpolation value.";
algorithm
  if smoothness == Modelica.Blocks.Types.Smoothness.LinearSegments then
    interpolation := 2;
  elseif smoothness == Modelica.Blocks.Types.Smoothness.ContinuousDerivative then
    interpolation := 4;
  elseif smoothness == Modelica.Blocks.Types.Smoothness.ConstantSegments then
    interpolation := 1;
  elseif smoothness == Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1 then
    interpolation := 3;
  elseif smoothness == Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative2 then
    interpolation := 5;
  else
    interpolation := 1;
    assert(false, "eFMI.Tables.convertSmoothness: Unknown smoothness.");
  end if;
end convertSmoothness;
