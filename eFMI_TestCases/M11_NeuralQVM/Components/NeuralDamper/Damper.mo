within eFMI_TestCases.M11_NeuralQVM.Components.NeuralDamper;
model Damper "neuralDamper_NN_modul"
  extends .eFMI.Icons.NeuralNetwork;
  extends .Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;

  NeuralNet damperNN
    annotation (Placement(transformation(extent={{-80,-80},{80,80}})));

equation
  damperNN.x[1] = v_rel;
  f = damperNN.y[1];

  annotation (
    preferredView = "diagram");
end Damper;
