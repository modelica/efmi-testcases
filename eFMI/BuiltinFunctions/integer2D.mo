within eFMI.BuiltinFunctions;
function integer2D
  input Real r2[:, :];
  output Integer i2[.size(r2, 1), .size(r2, 2)];
algorithm
  for i in 1:.size(r2, 1) loop
    for j in 1:.size(r2, 2) loop
      i2[i, j] := .eFMI.BuiltinFunctions.integer(r2[i, j]);
    end for;
  end for;

  annotation(Inline = false);
end integer2D;
