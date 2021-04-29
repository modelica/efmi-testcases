within eFMI.BuiltinFunctions;
function real1D
  input Integer i1[:];
  output Real r1[.size(i1, 1)];
algorithm
  for i in 1:.size(i1, 1) loop
    r1[i] := .eFMI.BuiltinFunctions.real(i1[i]);
  end for;

  annotation(Inline = false);
end real1D;
