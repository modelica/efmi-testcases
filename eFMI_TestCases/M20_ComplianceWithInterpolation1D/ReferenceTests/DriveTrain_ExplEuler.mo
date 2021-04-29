within eFMI_TestCases.M20_ComplianceWithInterpolation1D.ReferenceTests;
model DriveTrain_ExplEuler
   extends Tests.DriveTrain_ExplEuler;

   annotation (
     experiment(StopTime = 0.8, Interval = 0.00025),
     __fmi_InterfaceVariable={MapName(from="driveTrain.w_ref",to="w_ref"),
                             MapName(from="driveTrain.w",to="w", isOutput=true),
                             MapName(from="driveTrain.w_diff",to="w_diff", isOutput=true, ToleranceSet={ToleranceSetType(absTol32=5e-3)}),
                             MapName(from="driveTrain.torque",to="torque", isOutput=true, ToleranceSet={ToleranceSetType(absTol32=4.0)})},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M20_ComplianceWithInterpolation1D.Tests.DriveTrain_ExplEuler");
end DriveTrain_ExplEuler;
