within eFMI.BuiltinFunctions;
function allFinite2D
  input Real r[:, :];
  output Boolean b;
algorithm
  b := true;
  for i in 1:.size(r, 1) loop
    for j in 1:.size(r, 2) loop
      if not
            (.eFMI.BuiltinFunctions.isFinite(r[i, j])) then
        b := false;
      end if;
    end for;
  end for;

  annotation(Inline = false);
end allFinite2D;
