within eFMI;
package BuiltinFunctions "Modelica-based implementations of the builtin functions of eFMI GALEC"
  extends .Modelica.Icons.Package;

  extends .eFMI.Icons.Function
    annotation(IconMap(extent = {{-60,-60},{60,60}}));

  annotation (preferredView = "Info", Documentation(info="<html>
<p><b>Warning:</b> The eFMI GALEC specification has rigorous requirements on error handling and qNaN propagation. Its builtin functions are safe and well-defined for any NaN or +/-&infin; arguments. They also signal errors if undefined. This behaviour can <i>not</i> be expressed in Modelica. The builtin function implementations in this package are <i>not</i> satisfying the GALEC specification w.r.t. qNaN propagation and error handling. For example, the contained <span style=\"font-family: Courier New;\">isNaN(r)</span> is just a mockup, always returning <span style=\"font-family: Courier New;\">false.</span></p>
</html>"));
end BuiltinFunctions;
