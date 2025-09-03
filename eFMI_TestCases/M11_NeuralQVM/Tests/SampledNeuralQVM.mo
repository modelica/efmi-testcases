within eFMI_TestCases.M11_NeuralQVM.Tests;
model SampledNeuralQVM
  extends SampledLinearQVM(
    redeclare Controllers.NeuralQVM prediction_model);

  annotation (
    preferredView = "diagram");
end SampledNeuralQVM;
