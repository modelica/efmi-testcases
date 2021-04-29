within eFMI.BuiltinFunctions;
function real2D
  input Integer i2[:, :];
  output Real r2[.size(i2, 1), .size(i2, 2)];
algorithm
  for i in 1:.size(i2, 1) loop
    for j in 1:.size(i2, 2) loop
      r2[i, j] := .eFMI.BuiltinFunctions.real(i2[i, j]);
    end for;
  end for;

  annotation(Inline = false);
end real2D;
