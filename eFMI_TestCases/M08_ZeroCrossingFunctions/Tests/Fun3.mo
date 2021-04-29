within eFMI_TestCases.M08_ZeroCrossingFunctions.Tests;
model Fun3
  extends TestSetups.Fun3;

  annotation (
    experiment(
      StopTime = 3,
      Interval = 0.01),
     __iti_namesAtInterface={
       MapName(from="u.y",to="u"),
       MapName(from="func.y",to="y")},
     __fmi_modelExportName = "M08_C",
  __fmi_sourceModel = "eFMI_TestCases.M08_ZeroCrossingFunctions.Controllers.Function3");
end Fun3;
