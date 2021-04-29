within eFMI.BuiltinFunctions;
function exp
  input  Real x;
  output Real y;
algorithm
  y := .exp(x);

  annotation(Inline = false);
end exp;
