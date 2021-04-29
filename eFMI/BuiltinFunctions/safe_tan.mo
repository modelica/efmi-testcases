within eFMI.BuiltinFunctions;
function safe_tan "NaN-free tangent of saturate(x, x_min=-pi/2, x_max=+pi/2)"
  input Real x;
  output Real y;
algorithm
  y := .tan(
    .eFMI.BuiltinFunctions.max(
      .eFMI.BuiltinFunctions.min(
        x,
        .Modelica.Constants.pi / 2),
      -.Modelica.Constants.pi / 2));

  annotation (
    Inline = false,
    Documentation(info="<html>
<p>This function returns y = tan(x) for -pi/2 &le; x &le; pi/2.  
Outside of this range, y holds its last value (-Inf or +Inf).
</p>

<blockquote>
<img src=\"modelica://eFMI/Resources/Images/safe_tan.png\">
</blockquote>

</html>"));
end safe_tan;
