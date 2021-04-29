within eFMI.BuiltinFunctions;
function realRemainderDown
  input  Real r1;
  input  Real r2;
  output Real y;
algorithm
  y := .mod(r1, r2);

  annotation(Inline = false);
end realRemainderDown;
