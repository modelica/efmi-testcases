within eFMI_TestCases.M08_ZeroCrossingFunctions.ReferenceTests;
model Fun2
  extends Tests.Fun2;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
  experiment(
      StopTime=3,
      Interval=0.01),
     __fmi_InterfaceVariable={MapName(from="u.y",to="u"),MapName(from="y.u",to="y",isOutput=true)},
     __fmi_OriginalModel_ExportReference="eFMI_TestCases.M08_ZeroCrossingFunctions.Tests.Fun2");
end Fun2;
