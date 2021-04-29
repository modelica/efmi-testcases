within eFMI.BuiltinFunctions;
function atan21D
  input  Real u1[:];
  input  Real u2[.size(u1, 1)];
  output Real y[.size(u1, 1)];
algorithm
  for i in 1:.size(u1, 1) loop
    y[i] := .eFMI.BuiltinFunctions.atan2(u1[i], u2[i]);
  end for;

  annotation(Inline = false);
end atan21D;
