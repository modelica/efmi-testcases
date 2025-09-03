within eFMI_TestCases.M11_NeuralQVM.Components.NeuralSpring;
model Spring "neuralSpring_NN_modul"
  extends .eFMI.Icons.NeuralNetwork;
  extends .Modelica.Mechanics.Translational.Interfaces.PartialCompliant;

  NeuralNet springNN
    annotation (Placement(transformation(extent={{-80,-80},{80,80}})));

equation
  springNN.x[1] = s_rel;
  f = springNN.y[1];

  annotation (
    preferredView = "diagram");
end Spring;
