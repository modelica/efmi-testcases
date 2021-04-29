within eFMI_TestCases.S002_LinearEquationSystem.ReferenceTests;
model System_ExplEuler
  extends Tests.System_ExplEuler;

  annotation (
    experiment(
      StopTime = 10.0,
      Interval = 0.01),
    __fmi_InterfaceVariable={
  MapName(from="controller.u",to="u",dimensions={4}),
  MapName(from="controller.y",to="y",dimensions={4},isOutput=true, ToleranceSet={ToleranceSetType(absTol32=5e-3,relTol32=1e-4)})},
  __fmi_OriginalModel_ExportReference="eFMI_TestCases.S002_LinearEquationSystem.Tests.System_ExplEuler");
end System_ExplEuler;
