within eFMI.BuiltinFunctions;
function roundUp1D
  input Real r1[:];
  output Real i1[.size(r1, 1)];
algorithm
  for i in 1:.size(r1, 1) loop
    i1[i] := .eFMI.BuiltinFunctions.roundUp(r1[i]);
  end for;

  annotation(Inline = false);
end roundUp1D;
