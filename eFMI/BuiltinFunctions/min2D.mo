within eFMI.BuiltinFunctions;
function min2D
  input  Real u1[:, :];
  input  Real u2[.size(u1, 1), .size(u1, 2)];
  output Real y[.size(u1, 1), .size(u1, 2)];
algorithm
  for i in 1:.size(u1, 1) loop
    for j in 1:.size(u1, 2) loop
      y[i, j] := .eFMI.BuiltinFunctions.min(u1[i, j], u2[i, j]);
    end for;
  end for;

  annotation(Inline = false);
end min2D;
