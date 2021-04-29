within eFMI_TestCases.S003_VehicleModel.Tests;
model Vehicle_ExplEuler
  "Instable for sampling periods > 0.1, e.g., 'clock(period = 0.15)'."
  extends TestSetups.OpenLoop_VectorInterface(
    final clock(
      period = 0.01,
      useSolver = true,
      solverMethod = "ExplicitEuler"));

  annotation (
    experiment(
      StopTime = 40,
      Interval = 0.01),
    __iti_namesAtInterface={
      MapName(from="vehiclePlant.u",to="u"),
      MapName(from="vehiclePlant.x",to="x")},
    __fmi_modelExportName = "S003_B",
  __fmi_sourceModel = "eFMI_TestCases.S003_VehicleModel.PlantModels.VehiclePlant");
end Vehicle_ExplEuler;
