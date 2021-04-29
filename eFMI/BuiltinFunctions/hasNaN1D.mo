within eFMI.BuiltinFunctions;
function hasNaN1D
  input Real r[:];
  output Boolean b;
algorithm
  b := false;
  for i in 1:.size(r, 1) loop
    if .eFMI.BuiltinFunctions.isNaN(r[i]) then
      b := true;
    end if;
  end for;

  annotation(Inline = false);
end hasNaN1D;
