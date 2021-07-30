within eFMI_TestCases.M20_ComplianceWithInterpolation1D.Tests;
model DriveTrain_Rosenbrock1
  extends TestSetups.OpenLoop(
    final is_clocked = true,
    final clock(
      factor = 1,
      resolution = .Modelica.Clocked.Types.Resolution.ms,
      useSolver = true,
      solverMethod = "Rosenbrock1"));

  annotation (
    experiment(
      StopTime = 0.8,
      Interval = 0.001),
    __Dymola_experimentFlags(
      Advanced(
        PrintFailureToDifferentiate = true,
        AutomaticDifferentiation = true,
        AllowNumericDifferentiation = true)),
    __iti_namesAtInterface={
      MapName(from="driveTrain.w_ref",to="w_ref"),
      MapName(from="driveTrain.w",to="w"),
      MapName(from="driveTrain.w_diff",to="w_diff"),
      MapName(from="driveTrain.torque",to="torque")},
    __fmi_modelExportName = "M20_A",
  __fmi_sourceModel = "eFMI_TestCases.M20_ComplianceWithInterpolation1D.Controllers.DriveTrain");
end DriveTrain_Rosenbrock1;
