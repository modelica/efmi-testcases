within eFMI_TestCases.M21_Interpolation2D.ReferenceTests;
model SineDrivenTable2D
  extends TestSetups.SineDrivenTable2D(
    controller(
      table(efmi = false)));

  annotation (
    experiment(
      StopTime = 1.2,
      Interval = 0.01),
    __fmi_InterfaceVariable={
      MapName(from="controller.u1",to="u1"),
      MapName(from="controller.u2",to="u2"),
      MapName(from="controller.y",to="y",isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M21_Interpolation2D.Tests.SineDrivenTable2D");
end SineDrivenTable2D;
