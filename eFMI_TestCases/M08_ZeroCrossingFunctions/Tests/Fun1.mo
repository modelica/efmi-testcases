within eFMI_TestCases.M08_ZeroCrossingFunctions.Tests;
model Fun1
  extends TestSetups.Fun1;

  annotation (
    experiment(
      StopTime = 3,
      Interval = 0.01),
     __iti_namesAtInterface={
       MapName(from="u.y",to="u"),
       MapName(from="func.y",to="y")},
     __fmi_modelExportName = "M08_A",
  __fmi_sourceModel = "eFMI_TestCases.M08_ZeroCrossingFunctions.Controllers.Function1");
end Fun1;
