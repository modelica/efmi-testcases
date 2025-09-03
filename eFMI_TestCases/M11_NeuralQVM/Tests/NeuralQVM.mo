within eFMI_TestCases.M11_NeuralQVM.Tests;
model NeuralQVM
  extends LinearQVM(
    redeclare Controllers.NeuralQVM prediction_model);

  annotation (
    preferredView = "diagram");
end NeuralQVM;
