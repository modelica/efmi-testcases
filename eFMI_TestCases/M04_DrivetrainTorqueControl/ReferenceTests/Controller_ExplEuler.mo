within eFMI_TestCases.M04_DrivetrainTorqueControl.ReferenceTests;
model Controller_ExplEuler
  extends Tests.Controller_ExplEuler;

  annotation (
    experiment(StopTime = 20, Interval = 5e-4),
    __fmi_InterfaceVariable={MapName(from="controller.M_desired",to="M_desired"),
                            MapName(from="controller.wRel",to="wRel"),
                            MapName(from="controller.M_motor",to="M_motor", isOutput=true, ToleranceSet={ToleranceSetType(absTol64=1e-6,relTol64=1e-8,absTol32=1e-3,relTol32=1e-4)})},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M04_DrivetrainTorqueControl.Tests.Controller_ExplEuler");
end Controller_ExplEuler;
