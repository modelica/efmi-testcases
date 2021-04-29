within eFMI_TestCases.M14_Rectifier.ReferenceTests;
model GeneratorMonolithic_ExplEuler
  extends Tests.GeneratorMonolithic_ExplEuler;

  annotation (experiment(
      StopTime=3.0,
      Interval=0.001),
       __fmi_InterfaceVariable={
    MapName(from="generator.U_Ideal",to="U_Ideal"),
    MapName(from="generator.U_Bat",to="U_Bat"),
    MapName(from="generator.I",to="I",isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M14_Rectifier.Tests.GeneratorMonolithic_ExplEuler");
end GeneratorMonolithic_ExplEuler;
