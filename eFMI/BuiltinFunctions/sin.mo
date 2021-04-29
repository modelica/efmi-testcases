within eFMI.BuiltinFunctions;
function sin
  input  Real x;
  output Real y;
algorithm
  y := .sin(x);

  annotation(Inline = false);
end sin;
