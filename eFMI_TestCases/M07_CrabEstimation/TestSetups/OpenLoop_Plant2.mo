within eFMI_TestCases.M07_CrabEstimation.TestSetups;
model OpenLoop_Plant2
  extends OpenLoop_Plant1(
    redeclare Controllers.Plant2 crab);
end OpenLoop_Plant2;
