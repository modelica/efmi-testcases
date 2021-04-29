within eFMI_TestCases.S003_VehicleModel.ReferenceTests;
model Vehicle_ExplEuler
  extends Tests.Vehicle_ExplEuler;

  annotation (
    experiment(
      StopTime = 40,
      Interval = 0.01),
    __fmi_InterfaceVariable={
      MapName(from="vehiclePlant.u",to="u",dimensions={2}),
      MapName(from="vehiclePlant.x",to="x",dimensions={8},isOutput=true, ToleranceSet={ToleranceSetType(absTol64=1e-6,relTol64=1e-8, absTol32=1e-3,relTol32=1e-4)})},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.S003_VehicleModel.Tests.Vehicle_ExplEuler");
end Vehicle_ExplEuler;
