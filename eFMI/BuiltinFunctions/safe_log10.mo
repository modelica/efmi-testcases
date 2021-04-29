within eFMI.BuiltinFunctions;
function safe_log10
  "NaN-free logarithm to base 10 of saturate(x, x_min=0.0)"
  input Real x;
  output Real y;
algorithm
  y := .log10(if x >= 0.0 then x else 0.0);

  annotation (
  Inline = false,
  Documentation(info="<html>
<p>
This function returns y = log10(x) if >x &ge; 0.0 and otherwise returns  
-Infinity instead of NaN.
</p>

<blockquote>
<img src=\"modelica://eFMI/Resources/Images/safe_log10.png\">
</blockquote>

</html>"));
end safe_log10;
