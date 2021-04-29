within eFMI_TestCases.M14_Rectifier.Controllers;
function generatorRHS
  input Modelica.SIunits.Resistance R "Resistance";
  input Modelica.SIunits.Inductance L "Inductance";
  input Modelica.SIunits.Voltage U_Ideal "Ideal generator voltage (input)";
  input Modelica.SIunits.Voltage U_Bat "Battery voltage (input)";
  input Modelica.SIunits.Voltage U_R "Voltage drop over the resistor";
  output Modelica.SIunits.VoltageSlope dU_R "Derivative of the voltage drop over the resistor U_R";

  external "C" dU_R = generator_voltageSlope(R,L,U_Ideal,U_Bat,U_R) annotation(Include="#include \"generator_voltageSlope.c\"", IncludeDirectory="modelica://eFMI_TestCases/M14_Rectifier/Resources/C-Code");

end generatorRHS;
