within eFMI.BuiltinFunctions;
function hasInfinite1D
  input Real r[:];
  output Boolean b;
algorithm
  b := false;
  for i in 1:.size(r, 1) loop
    if .eFMI.BuiltinFunctions.isInfinite(r[i]) then
      b := true;
    end if;
  end for;

  annotation(Inline = false);
end hasInfinite1D;
