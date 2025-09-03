within eFMI_TestCases.M11_NeuralQVM.Tests;
model NonlinearQVM
  extends LinearQVM(
    redeclare Controllers.NonlinearQVM prediction_model);

  annotation (
    preferredView = "diagram");
end NonlinearQVM;
