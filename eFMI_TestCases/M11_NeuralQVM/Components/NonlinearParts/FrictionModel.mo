within eFMI_TestCases.M11_NeuralQVM.Components.NonlinearParts;
model FrictionModel
  "Non-linear Friction model of the damper"

  extends .Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  extends Icons.Damper;
  extends Icons.Nonlinear2;

  parameter Real F_brk = 45;
  parameter Real F_C = 35;
  parameter Real v_brk = 0.02;
  parameter Real d_lin = 150;

  Real term1;
  Real term2;
  Real term3;
  Real v_C;
  Real v_St;

equation
  v_C = v_brk/10;
  v_St = v_brk/sqrt(2);
  term1 = sqrt(2*exp(1))*(F_brk-F_C)*exp(-(v_rel/v_St)^2)*(v_rel/v_St);
  term2 = F_C*tanh(v_rel/v_C);
  term3 = d_lin*v_rel;
  f = term1 + term2 + term3;

  annotation(
    preferredView = "text");
end FrictionModel;
