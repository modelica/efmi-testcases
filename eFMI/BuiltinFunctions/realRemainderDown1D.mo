within eFMI.BuiltinFunctions;
function realRemainderDown1D
  input  Real r1[:];
  input  Real r2[.size(r1, 1)];
  output Real y[.size(r1, 1)];
algorithm
  for i in 1:.size(r1, 1) loop
    y[i] := .eFMI.BuiltinFunctions.realRemainderDown(r1[i], r2[i]);
  end for;

  annotation(Inline = false);
end realRemainderDown1D;
