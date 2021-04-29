within eFMI.BuiltinFunctions;
function hasInfinite2D
  input Real r[:, :];
  output Boolean b;
algorithm
  b := false;
  for i in 1:.size(r, 1) loop
    for j in 1:.size(r, 2) loop
      if .eFMI.BuiltinFunctions.isInfinite(r[i, j]) then
        b := true;
      end if;
    end for;
  end for;

  annotation(Inline = false);
end hasInfinite2D;
