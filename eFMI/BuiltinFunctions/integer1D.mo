within eFMI.BuiltinFunctions;
function integer1D
  input Real r1[:];
  output Integer i1[.size(r1, 1)];
algorithm
  for i in 1:.size(r1, 1) loop
    i1[i] := .eFMI.BuiltinFunctions.integer(r1[i]);
  end for;

  annotation(Inline = false);
end integer1D;
