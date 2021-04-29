within eFMI.BuiltinFunctions;
function cos
  input  Real x;
  output Real y;
algorithm
  y := .cos(x);

  annotation(Inline = false);
end cos;
