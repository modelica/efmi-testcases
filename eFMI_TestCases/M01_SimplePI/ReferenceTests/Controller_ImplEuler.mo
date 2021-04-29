within eFMI_TestCases.M01_SimplePI.ReferenceTests;
model Controller_ImplEuler
  extends Tests.Controller_ImplEuler;

  annotation (
    experiment(
      StopTime=4.0,
      Interval=0.1),
    __fmi_InterfaceVariable={MapName(from="y.y",to="y"),MapName(from="r.y",to="r"),MapName(from="controller.u",to="u",isOutput=true)},
    __fmi_modelExportName = "M01_B",
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M01_SimplePI.Tests.Controller_ImplEuler",
    __Dymola_experimentFlags(Hidden(InitializeClockedDiscretizedStates = true)));
end Controller_ImplEuler;
