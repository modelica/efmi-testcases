within eFMI.BuiltinFunctions;
function integer
  input Real r;
  output Integer i;
algorithm
  i := .integer(r);

  annotation(Inline = false);
end integer;
