within eFMI.BuiltinFunctions;
function roundUp
  input  Real r;
  output Real i;
algorithm
  i := .ceil(r);

  annotation(Inline = false);
end roundUp;
