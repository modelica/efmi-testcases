within eFMI_TestCases.M07_CrabEstimation.Tests;
model Plant2_RK4
  extends TestSetups.OpenLoop_Plant2(
    clock(
      period = 0.01,
      useSolver = true,
      solverMethod = "ExplicitRungeKutta4"));

  annotation (experiment(StopTime = 5.0, Interval = 0.01),
   __iti_namesAtInterface={MapName(from="crab.force",to="force"),MapName(from="crab.y1",to="y1"),MapName(from="crab.y2",to="y2")},
   __fmi_modelExportName = "M07_B",
  __fmi_sourceModel = "eFMI_TestCases.M07_CrabEstimation.Controllers.Plant2");
end Plant2_RK4;
