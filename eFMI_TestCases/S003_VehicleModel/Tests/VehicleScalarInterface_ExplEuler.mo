within eFMI_TestCases.S003_VehicleModel.Tests;
model VehicleScalarInterface_ExplEuler
  "Instable for sampling periods > 0.1, e.g., 'clock(period = 0.15)'."
  extends TestSetups.OpenLoop_ScalarInterface(
    final clock(
      period = 0.01,
      useSolver = true,
      solverMethod = "ExplicitEuler"));

  annotation (
    experiment(
      StopTime = 40,
      Interval = 0.01),
    __iti_namesAtInterface={
      MapName(from="vehiclePlant.u1",to="u1"),
      MapName(from="vehiclePlant.u2",to="u2"),
      MapName(from="vehiclePlant.x1",to="x1"),
      MapName(from="vehiclePlant.x2",to="x2"),
      MapName(from="vehiclePlant.x3",to="x3"),
      MapName(from="vehiclePlant.x4",to="x4"),
      MapName(from="vehiclePlant.x5",to="x5"),
      MapName(from="vehiclePlant.x6",to="x6"),
      MapName(from="vehiclePlant.x7",to="x7"),
      MapName(from="vehiclePlant.x8",to="x8")},
    __fmi_modelExportName = "S003_D",
  __fmi_sourceModel = "eFMI_TestCases.S003_VehicleModel.Controllers.VehiclePlant_ScalarInterface");
end VehicleScalarInterface_ExplEuler;
