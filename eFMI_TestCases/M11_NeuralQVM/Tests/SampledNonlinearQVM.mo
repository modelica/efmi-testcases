within eFMI_TestCases.M11_NeuralQVM.Tests;
model SampledNonlinearQVM
  "Sampled version of the non-linear QVM."

  extends SampledLinearQVM(
    redeclare Controllers.NonlinearQVM prediction_model);

  annotation (
    preferredView = "diagram");
end SampledNonlinearQVM;
