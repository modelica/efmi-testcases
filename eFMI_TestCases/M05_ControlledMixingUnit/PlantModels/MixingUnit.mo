within eFMI_TestCases.M05_ControlledMixingUnit.PlantModels;
model MixingUnit
  extends
    Modelica_Synchronous.Examples.Systems.Utilities.ComponentsMixingUnit.MixingUnit(
    c(start = c_start,
      fixed = not deactivateStateSelect),
    T(start = T_start,
      fixed = not deactivateStateSelect,
      stateSelect = if for_inversion and not
                                            (deactivateStateSelect)
        then StateSelect.always
        else StateSelect.default),
    c0 =  0.848,
    T0 =  308.5,
    a1 =  if for_inversion then a1_inv  else pro * a1_inv,
    a21 = if for_inversion then a21_inv else pro * a21_inv,
    a22 = if for_inversion then a22_inv else pro * a22_inv,
    b =   if for_inversion then b_inv   else pro * b_inv,
    k0 =  if for_inversion then k0_inv  else pro * k0_inv,
    eps = 34.2894,
    T_c(start = T_c_start, fixed = false));

  parameter Boolean for_inversion = false;

  parameter Boolean deactivateStateSelect = false;
  parameter Real a1_inv = 0.2674;
  parameter Real a21_inv = 1.815;
  parameter Real a22_inv = 0.4682;
  parameter Real b_inv = 1.5476;
  parameter Real k0_inv = 1.05e14;
  parameter Real x10 = 0.42;
  parameter Real x20 = 0.01;
  parameter Real pro = 1.5 "Deviations of plant to inverse plant parameters";
  parameter Real u0 = -0.0224;

  final parameter Real c_start(unit = "mol/l") = c0*(1-x10);
  final parameter Modelica.SIunits.Temperature T_start = T0*(1+x20);
  final parameter Real T_c_start = if for_inversion then T0*(1+u0) else 0.0;

  annotation (preferredView = "info");
end MixingUnit;
