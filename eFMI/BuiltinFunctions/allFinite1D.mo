within eFMI.BuiltinFunctions;
function allFinite1D
  input Real r[:];
  output Boolean b;
algorithm
  b := true;
  for i in 1:.size(r, 1) loop
    if not
          (.eFMI.BuiltinFunctions.isFinite(r[i])) then
      b := false;
    end if;
  end for;

  annotation(Inline = false);
end allFinite1D;
