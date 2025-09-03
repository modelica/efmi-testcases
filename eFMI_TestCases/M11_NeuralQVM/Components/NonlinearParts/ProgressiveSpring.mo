within eFMI_TestCases.M11_NeuralQVM.Components.NonlinearParts;
model ProgressiveSpring
  extends .Modelica.Mechanics.Translational.Interfaces.PartialCompliant;
  extends Icons.Spring;
  extends Icons.Nonlinear1;

  parameter Real c1 = 500;
  parameter Real c2 = 0;
  constant Real s_u = 0.03;

equation
  f = (c1*(s_rel + s_u))^2 + c2*s_rel - (c1*s_u)^2;

  annotation(
    preferredView = "text");
end ProgressiveSpring;
