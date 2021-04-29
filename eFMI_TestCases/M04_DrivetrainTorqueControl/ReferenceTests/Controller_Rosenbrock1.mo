within eFMI_TestCases.M04_DrivetrainTorqueControl.ReferenceTests;
model Controller_Rosenbrock1
  extends Tests.Controller_Rosenbrock1;

  annotation (
    experiment(StopTime = 20, Interval = 0.01),
    __fmi_InterfaceVariable={MapName(from="controller.M_desired",to="M_desired"),
                            MapName(from="controller.wRel",to="wRel"),
                            MapName(from="controller.M_motor",to="M_motor",isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M04_DrivetrainTorqueControl.Tests.Controller_Rosenbrock1");
end Controller_Rosenbrock1;
