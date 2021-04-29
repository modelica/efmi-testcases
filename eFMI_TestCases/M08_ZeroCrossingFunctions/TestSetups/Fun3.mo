within eFMI_TestCases.M08_ZeroCrossingFunctions.TestSetups;
model Fun3
  extends Fun1(
    expSine(offset = 10),
    redeclare Controllers.Function3 func);
end Fun3;
