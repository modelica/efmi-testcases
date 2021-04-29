within eFMI_TestCases.M08_ZeroCrossingFunctions.TestSetups;
model Fun2
  extends Fun1(
    redeclare Controllers.Function2 func);
end Fun2;
