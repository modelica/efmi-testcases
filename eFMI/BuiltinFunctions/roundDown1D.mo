within eFMI.BuiltinFunctions;
function roundDown1D
  input Real r1[:];
  output Real i1[.size(r1, 1)];
algorithm
  for i in 1:.size(r1, 1) loop
    i1[i] := .eFMI.BuiltinFunctions.roundDown(r1[i]);
  end for;

  annotation(Inline = false);
end roundDown1D;
