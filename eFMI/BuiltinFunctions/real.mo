within eFMI.BuiltinFunctions;
function real
  input Integer i;
  output Real r;
algorithm
  r := i;

  annotation(Inline = false);
end real;
