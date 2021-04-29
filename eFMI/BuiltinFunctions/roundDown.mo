within eFMI.BuiltinFunctions;
function roundDown
  input  Real r;
  output Real i;
algorithm
  i := .floor(r);

  annotation(Inline = false);
end roundDown;
