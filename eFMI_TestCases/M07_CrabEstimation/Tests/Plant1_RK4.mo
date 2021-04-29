within eFMI_TestCases.M07_CrabEstimation.Tests;
model Plant1_RK4 "Runge Kutta 4th order"
  extends TestSetups.OpenLoop_Plant1(
    clock(
      period = 0.01,
      useSolver = true,
      solverMethod = "ExplicitRungeKutta4"));

  annotation (experiment(StopTime=5.0, Interval=0.01),
   __iti_namesAtInterface={MapName(from="crab.force",to="force"),MapName(from="crab.y1",to="y1"),MapName(from="crab.y2",to="y2")},
   __fmi_modelExportName = "M07_A",
  __fmi_sourceModel = "eFMI_TestCases.M07_CrabEstimation.OnlyPlantInModelica.Plant1");
end Plant1_RK4;
