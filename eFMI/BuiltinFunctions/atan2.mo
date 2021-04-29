within eFMI.BuiltinFunctions;
function atan2
  input  Real u1;
  input  Real u2;
  output Real y;
algorithm
  y := .atan2(u1, u2);

  annotation(Inline = false);
end atan2;
