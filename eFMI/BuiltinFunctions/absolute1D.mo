within eFMI.BuiltinFunctions;
function absolute1D
  input Real x[:];
  output Real y[.size(x, 1)];
algorithm
  for i in 1:.size(x, 1) loop
    y[i] := .eFMI.BuiltinFunctions.absolute(x[i]);
  end for;

  annotation(Inline = false);
end absolute1D;
