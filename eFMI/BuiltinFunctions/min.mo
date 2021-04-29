within eFMI.BuiltinFunctions;
function min
  input  Real u1;
  input  Real u2;
  output Real y;
algorithm
   y := (if u1 < u2 then u1 else u2);

   annotation(Inline = false);
end min;
