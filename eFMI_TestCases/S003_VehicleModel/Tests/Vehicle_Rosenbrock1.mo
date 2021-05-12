within eFMI_TestCases.S003_VehicleModel.Tests;
model Vehicle_Rosenbrock1
  "Instable for sampling periods > 2.3, e.g., 'clock(period = 3)'."
  extends TestSetups.OpenLoop_VectorInterface(
    final clock(
      period = 0.01,
      useSolver = true,
      solverMethod = "Rosenbrock1"));

  annotation (
    experiment(
      StopTime = 40,
      Interval = 0.01),
    __iti_namesAtInterface={
      MapName(from="vehiclePlant.u",to="u"),
      MapName(from="vehiclePlant.x",to="x")},
    __fmi_modelExportName = "S003_A",
  __fmi_sourceModel = "eFMI_TestCases.S003_VehicleModel.Controllers.VehiclePlant");
end Vehicle_Rosenbrock1;
