within eFMI_TestCases.M07_CrabEstimation.ReferenceTests;
model Plant2_RK4
  extends Tests.Plant2_RK4;

  annotation (experiment(StopTime = 5.0, Interval = 0.01),
    __fmi_InterfaceVariable={MapName(from="crab.force",to="force"),MapName(from="crab.y1",to="y1",isOutput=true),MapName(from="crab.y2",to="y2",isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M07_CrabEstimation.Tests.Plant2_RK4");
end Plant2_RK4;
