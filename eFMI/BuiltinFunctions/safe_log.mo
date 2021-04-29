within eFMI.BuiltinFunctions;
function safe_log
  "NaN-free natural logarithm of saturate(x, x_min=0.0)"
  input Real x;
  output Real y;
algorithm
  y := .log(if x >= 0.0 then x else 0.0);

  annotation (
  Inline = false,
  Documentation(info="<html>
<p>
This function returns y = log(x) if >x &ge; 0.0 and otherwise returns  
-Infinity instead of NaN.
</p>

<blockquote>
<img src=\"modelica://eFMI/Resources/Images/safe_log.png\">
</blockquote>

</html>"));
end safe_log;
