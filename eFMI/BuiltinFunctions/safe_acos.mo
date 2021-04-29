within eFMI.BuiltinFunctions;
function safe_acos "NaN-free acos of saturate(x, x_min=-1.0, x_max=+1.0)"
  input Real x;
  output Real y;
algorithm
  y := .acos(
    .eFMI.BuiltinFunctions.max(
      .eFMI.BuiltinFunctions.min(x, 1.0),
    -1.0));

  annotation (
    Inline = false,
    Documentation(info="<html>
<p>
This function returns y = acos(x) if -1 &le; x &le; +1 and otherwise returns  
0.0 (for x &gt; +1) or 2*pi (for x &lt; -1) instead of NaN.
</p>

<blockquote>
<img src=\"modelica://eFMI/Resources/Images/safe_acos.png\">
</blockquote>

</html>"));
end safe_acos;
