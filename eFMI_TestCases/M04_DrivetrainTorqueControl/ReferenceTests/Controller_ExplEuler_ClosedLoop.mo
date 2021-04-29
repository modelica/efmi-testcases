within eFMI_TestCases.M04_DrivetrainTorqueControl.ReferenceTests;
model Controller_ExplEuler_ClosedLoop
  extends TestSetups.Controller_ExplEuler_ClosedLoop;

  annotation (
    experiment(StopTime = 30, Interval = 5e-4),
    __fmi_InterfaceVariable={MapName(from="controller.M_desired",to="M_desired"),
                            MapName(from="controller.wRel",to="wRel"),
                            MapName(from="controller.M_motor",to="M_motor",isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M04_DrivetrainTorqueControl.Tests.Controller_ExplEuler");
end Controller_ExplEuler_ClosedLoop;
