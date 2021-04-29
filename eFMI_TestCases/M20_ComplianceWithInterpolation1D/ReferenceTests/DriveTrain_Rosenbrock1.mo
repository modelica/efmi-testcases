within eFMI_TestCases.M20_ComplianceWithInterpolation1D.ReferenceTests;
model DriveTrain_Rosenbrock1
   extends Tests.DriveTrain_Rosenbrock1;

   annotation (
     experiment(StopTime = 0.8, Interval = 0.001),
     __fmi_InterfaceVariable={MapName(from="driveTrain.w_ref",to="w_ref"),
                             MapName(from="driveTrain.w",to="w", isOutput=true),
                             MapName(from="driveTrain.w_diff",to="w_diff", isOutput=true),
                             MapName(from="driveTrain.torque",to="torque", isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M20_ComplianceWithInterpolation1D.Tests.DriveTrain_Rosenbrock1");
end DriveTrain_Rosenbrock1;
