within eFMI.BuiltinFunctions;
function safe_asin
  "NaN-free asin of saturate(x, x_min=-1.0, x_max=+1.0)"
  input Real x;
  output Real y;
algorithm
  y := .asin(
    .eFMI.BuiltinFunctions.max(
      .eFMI.BuiltinFunctions.min(x, 1.0),
    -1.0));

  annotation (
  Inline = false,
  Documentation(info="<html>
<p>
This function returns y = asin(x) if -1 &le; x &le; +1 and otherwise returns  
pi/2 (for x &gt; +1) or -pi/2 (for x &lt; -1) instead of NaN.
</p>

<blockquote>
<img src=\"modelica://eFMI/Resources/Images/safe_asin.png\">
</blockquote>

</html>"));
end safe_asin;
