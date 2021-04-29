within eFMI_TestCases.S002_LinearEquationSystem.ReferenceTests;
model SystemScalarInterface_ExplEuler
  extends Tests.SystemScalarInterface_ExplEuler;

  annotation (
    experiment(
      StopTime = 10.0,
      Interval = 0.01),
    __fmi_InterfaceVariable={
  MapName(from="controller.u1",to="u1"),
  MapName(from="controller.u2",to="u2"),
  MapName(from="controller.u3",to="u3"),
  MapName(from="controller.u4",to="u4"),
  MapName(from="controller.y1",to="y1",isOutput=true, ToleranceSet={ToleranceSetType(absTol32=5e-3,relTol32=1e-4)}),
  MapName(from="controller.y2",to="y2",isOutput=true, ToleranceSet={ToleranceSetType(absTol32=5e-3,relTol32=1e-4)}),
  MapName(from="controller.y3",to="y3",isOutput=true, ToleranceSet={ToleranceSetType(absTol32=5e-3,relTol32=1e-4)}),
  MapName(from="controller.y4",to="y4",isOutput=true, ToleranceSet={ToleranceSetType(absTol32=5e-3,relTol32=1e-4)})},
  __fmi_OriginalModel_ExportReference="eFMI_TestCases.S002_LinearEquationSystem.Tests.SystemScalarInterface_ExplEuler");
end SystemScalarInterface_ExplEuler;
