within eFMI_TestCases.M24_IntegratorReset.ReferenceTests;
model IntegratorReset_Real_ExplEuler
  extends Tests.IntegratorReset_Real_ExplEuler;

annotation (experiment(StopTime=8, Interval = 0.01),
      __fmi_InterfaceVariable={MapName(from="integratorWithReset.u",to="u"),
                             MapName(from="integratorWithReset.reset",to="reset"),
                             MapName(from="integratorWithReset.y",to="y",isOutput=true)},
     __fmi_OriginalModel_ExportReference="eFMI_TestCases.M24_IntegratorReset.Tests.IntegratorReset_Real_ExplEuler");
end IntegratorReset_Real_ExplEuler;
