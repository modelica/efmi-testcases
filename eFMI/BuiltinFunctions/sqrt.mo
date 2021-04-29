within eFMI.BuiltinFunctions;
function sqrt
  input  Real x;
  output Real y;
algorithm
  y := x^0.5;

  annotation(Inline = false);
end sqrt;
