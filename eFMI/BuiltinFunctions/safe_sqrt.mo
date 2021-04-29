within eFMI.BuiltinFunctions;
function safe_sqrt
  "NaN-free square root of saturate(x, x_min=0.0)"
  input Real x;
  output Real y;
algorithm
  y := .eFMI.BuiltinFunctions.sqrt(if x >= 0.0 then x else 0.0);

  annotation (
    Inline = false,
    Documentation(info="<html>
<p>This function returns y = sqrt(x) x &gt;= 0 and otherwise it returns the 
approximation y = 0, instead of NaN</p>

<blockquote>
<img src=\"modelica://eFMI/Resources/Images/safe_sqrt.png\">
</blockquote>

</html>"));
end safe_sqrt;
