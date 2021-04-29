within eFMI_TestCases.M01_SimplePI.ReferenceTests;
model Controller_ExplEuler
  extends Tests.Controller_ExplEuler;

  annotation (
    experiment(
      StopTime=4.0,
      Interval=0.01),
    __fmi_InterfaceVariable={MapName(from="y.y",to="y"),MapName(from="r.y",to="r"),MapName(from="controller.u",to="u",isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M01_SimplePI.Tests.Controller_ExplEuler");
end Controller_ExplEuler;
