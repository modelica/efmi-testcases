within eFMI.BuiltinFunctions;
function absolute
  input  Real x;
  output Real y;
algorithm
  y := (if x >= 0.0 then x else -x);

  annotation(Inline = false);
end absolute;
