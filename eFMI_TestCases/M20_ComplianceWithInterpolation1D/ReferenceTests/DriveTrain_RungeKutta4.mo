within eFMI_TestCases.M20_ComplianceWithInterpolation1D.ReferenceTests;
model DriveTrain_RungeKutta4
   extends Tests.DriveTrain_RungeKutta4;

   annotation (
     experiment(StopTime = 0.8, Interval = 0.002),
     __fmi_InterfaceVariable={MapName(from="driveTrain.w_ref",to="w_ref"),
                             MapName(from="driveTrain.w",to="w", isOutput=true),
                             MapName(from="driveTrain.w_diff",to="w_diff", isOutput=true),
                             MapName(from="driveTrain.torque",to="torque", isOutput=true, ToleranceSet={ToleranceSetType(absTol32=1.5)})},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M20_ComplianceWithInterpolation1D.Tests.DriveTrain_RungeKutta4");
end DriveTrain_RungeKutta4;
