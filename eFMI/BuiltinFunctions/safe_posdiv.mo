within eFMI.BuiltinFunctions;
function safe_posdiv
    "NaN-free division of xn by saturate(xd, xd_min=eps)"
    input Real xn;
    input Real xd;
    input Real eps;
    output Real y;
algorithm
      y := xn / (if xd >= eps then xd else eps);

  annotation (
    Inline = false,
    Documentation(info="<html>
<p>This function returns y = xn/xd if xd &gt;= eps and otherwise it returns the approximation y = xn/eps.</p>

<blockquote>
<img src=\"modelica://eFMI/Resources/Images/safe_posdiv.png\">
</blockquote>

</html>"));
end safe_posdiv;
