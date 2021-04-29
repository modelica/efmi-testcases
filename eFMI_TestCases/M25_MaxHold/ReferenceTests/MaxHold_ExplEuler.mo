within eFMI_TestCases.M25_MaxHold.ReferenceTests;
model MaxHold_ExplEuler
  extends Tests.MaxHold_ExplEuler;

 annotation (experiment(
      StopTime=6,
      Interval=0.001),
      __fmi_InterfaceVariable={MapName(from="maxHold_WithFilter.u",to="u"),
                             MapName(from="maxHold_WithFilter.y",to="y", isOutput=true, ToleranceSet={ToleranceSetType(absTol64=0.015, absTol32=0.015)})},
     __fmi_OriginalModel_ExportReference="eFMI_TestCases.M25_MaxHold.Tests.MaxHold_ExplEuler");
end MaxHold_ExplEuler;
