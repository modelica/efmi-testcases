within eFMI.BuiltinFunctions;
function realRemainderDown2D
  input  Real r1[:, :];
  input  Real r2[.size(r1, 1), .size(r1, 2)];
  output Real y[.size(r1, 1), .size(r1, 2)];
algorithm
  for i in 1:.size(r1, 1) loop
    for j in 1:.size(r1, 2) loop
      y[i, j] := .eFMI.BuiltinFunctions.realRemainderDown(r1[i, j], r2[i, j]);
    end for;
  end for;

  annotation(Inline = false);
end realRemainderDown2D;
