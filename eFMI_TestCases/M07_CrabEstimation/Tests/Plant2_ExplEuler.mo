within eFMI_TestCases.M07_CrabEstimation.Tests;
model Plant2_ExplEuler
  extends TestSetups.OpenLoop_Plant1;

  annotation (experiment(StopTime = 5.0, Interval = 0.01),
   __iti_namesAtInterface={MapName(from="crab.force",to="force"),MapName(from="crab.y1",to="y1"),MapName(from="crab.y2",to="y2")},
   __fmi_modelExportName = "M07_C",
  __fmi_sourceModel = "eFMI_TestCases.M07_CrabEstimation.OnlyPlantInModelica.Plant2");
end Plant2_ExplEuler;
