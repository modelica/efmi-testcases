within eFMI_TestCases.M14_Rectifier.ReferenceTests;
model Generator_Dassl
  extends TestSetups.Generator.OpenLoop;

  annotation (
    experiment(
      StopTime=3.0,
      Interval=0.001,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"),
      __fmi_InterfaceVariable={
    MapName(from="generator.U_Ideal",to="U_Ideal"),
    MapName(from="generator.U_Bat",to="U_Bat"),
    MapName(from="generator.I",to="I",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=5,relTol64=0.12, absTol32=7,relTol32=0.2)})},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M14_Rectifier.Tests.Generator_ExplEuler");
end Generator_Dassl;
