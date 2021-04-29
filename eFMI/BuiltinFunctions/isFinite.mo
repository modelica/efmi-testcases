within eFMI.BuiltinFunctions;
function isFinite
  input  Real r;
  output Boolean b;
algorithm
  b := not
          (.eFMI.BuiltinFunctions.isNaN(r))
    and not
           (.eFMI.BuiltinFunctions.isInfinite(r));

  annotation(Inline = false);
end isFinite;
