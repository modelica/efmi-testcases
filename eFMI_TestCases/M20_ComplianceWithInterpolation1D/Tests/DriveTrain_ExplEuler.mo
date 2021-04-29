within eFMI_TestCases.M20_ComplianceWithInterpolation1D.Tests;
model DriveTrain_ExplEuler
  extends TestSetups.OpenLoop(
    final is_clocked = true,
    final clock(
      factor = 250,
      resolution = Modelica_Synchronous.Types.Resolution.us,
      solverMethod = "ExplicitEuler"));

   annotation (
     experiment(
       StopTime = 0.8,
       Interval = 0.00025),
       __iti_namesAtInterface={MapName(from="driveTrain.w_ref",to="w_ref"),
                             MapName(from="driveTrain.w",to="w"),
                             MapName(from="driveTrain.w_diff",to="w_diff"),
                             MapName(from="driveTrain.torque",to="torque")},
       __fmi_modelExportName = "M20_C",
       __fmi_sourceModel = "eFMI_TestCases.M20_ComplianceWithInterpolation1D.Controllers.DriveTrain");
end DriveTrain_ExplEuler;
