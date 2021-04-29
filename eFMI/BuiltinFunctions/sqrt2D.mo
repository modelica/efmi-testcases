within eFMI.BuiltinFunctions;
function sqrt2D
  input Real x[:, :];
  output Real y[.size(x, 1), .size(x, 2)];
algorithm
  for i in 1:.size(x, 1) loop
    for j in 1:.size(x, 2) loop
      y[i, j] := .eFMI.BuiltinFunctions.sqrt(x[i, j]);
    end for;
  end for;

  annotation(Inline = false);
end sqrt2D;
