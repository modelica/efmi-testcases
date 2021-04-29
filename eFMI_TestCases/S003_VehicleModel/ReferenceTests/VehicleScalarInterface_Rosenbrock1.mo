within eFMI_TestCases.S003_VehicleModel.ReferenceTests;
model VehicleScalarInterface_Rosenbrock1
  extends Tests.VehicleScalarInterface_Rosenbrock1;

  annotation (
    experiment(
      StopTime = 40,
      Interval = 0.01),
    __fmi_InterfaceVariable={
      MapName(from="vehiclePlant.u1",to="u1"),
      MapName(from="vehiclePlant.u2",to="u2"),
      MapName(from="vehiclePlant.x1",to="x1",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=1e-5,relTol64=1e-6)}),
      MapName(from="vehiclePlant.x2",to="x2",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=1e-5,relTol64=1e-6)}),
      MapName(from="vehiclePlant.x3",to="x3",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=1e-5,relTol64=1e-6)}),
      MapName(from="vehiclePlant.x4",to="x4",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=1e-5,relTol64=1e-6)}),
      MapName(from="vehiclePlant.x5",to="x5",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=1e-5,relTol64=1e-6)}),
      MapName(from="vehiclePlant.x6",to="x6",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=1e-5,relTol64=1e-6)}),
      MapName(from="vehiclePlant.x7",to="x7",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=1e-5,relTol64=1e-6)}),
      MapName(from="vehiclePlant.x8",to="x8",isOutput=true, ToleranceSet={ToleranceSetType(absTol64=1e-5,relTol64=1e-6)})},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.S003_VehicleModel.Tests.VehicleScalarInterface_Rosenbrock1");
end VehicleScalarInterface_Rosenbrock1;
