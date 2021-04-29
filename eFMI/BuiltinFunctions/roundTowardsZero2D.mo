within eFMI.BuiltinFunctions;
function roundTowardsZero2D
  input Real r2[:, :];
  output Real i2[.size(r2, 1), .size(r2, 2)];
algorithm
  for i in 1:.size(r2, 1) loop
    for j in 1:.size(r2, 2) loop
      i2[i, j] := .eFMI.BuiltinFunctions.roundTowardsZero(r2[i, j]);
    end for;
  end for;

  annotation(Inline = false);
end roundTowardsZero2D;
