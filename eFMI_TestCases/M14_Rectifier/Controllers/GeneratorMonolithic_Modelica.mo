within eFMI_TestCases.M14_Rectifier.Controllers;
model GeneratorMonolithic_Modelica
  "Generator comapt ODE formulation in Modelica code"
    extends Generator_interface(
   U_Ideal(min = -51.0, max = 51.0),
   U_Bat(min = 0.0, max = 15.2),
   I(min = -1e3, max = 1e3));

parameter Modelica.SIunits.Resistance R = 0.57 "Resistance";
parameter Modelica.SIunits.Inductance L=0.0164    "Inductance";

Modelica.SIunits.Voltage U_R "Voltage drop over the resistor";

initial equation
  U_R = 0;

equation
  der(U_R) =
    if U_R>=0.0 then
      R/L*(U_Ideal - U_Bat - U_R)
    else
      R/L*(U_Ideal + U_Bat - U_R);

  I = -U_R/R;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                             Text(
          extent={{-98,98},{96,44}},
          lineColor={0,140,72},
          pattern=LinePattern.None,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          textString="Modelica")}),                              Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end GeneratorMonolithic_Modelica;
