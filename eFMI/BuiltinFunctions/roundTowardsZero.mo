within eFMI.BuiltinFunctions;
function roundTowardsZero
  input  Real r;
  output Real i;
algorithm
  i := (if r >= 0.0
    then .eFMI.BuiltinFunctions.roundDown(r)
    else .eFMI.BuiltinFunctions.roundUp(r));

  annotation(Inline = false);
end roundTowardsZero;
