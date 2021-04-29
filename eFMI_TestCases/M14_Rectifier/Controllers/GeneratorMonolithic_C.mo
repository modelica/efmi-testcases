within eFMI_TestCases.M14_Rectifier.Controllers;
model GeneratorMonolithic_C "Generator compact ODE form with C-Code"
    extends Generator_interface;

parameter Modelica.SIunits.Resistance R = 0.57 "Resistance";
parameter Modelica.SIunits.Inductance L=0.0164    "Inductance";

Modelica.SIunits.Voltage U_R "Voltage drop over the resistor";

initial equation
  U_R = 0;

equation
  der(U_R) = generatorRHS(R,L,U_Ideal,U_Bat,U_R);
  I = -U_R/R;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                             Text(
          extent={{-98,98},{96,44}},
          lineColor={0,140,72},
          pattern=LinePattern.None,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          textString="C")}),                                     Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end GeneratorMonolithic_C;
