within eFMI_TestCases.M19_Interpolation1D.ReferenceTests;
model SineDrivenTable1D
  extends TestSetups.SineDrivenTable1D(
    controller(table(final efmi = false)));

  annotation (
    experiment(
      StopTime = 1.2,
      Interval = 0.01),
    __fmi_InterfaceVariable={
      MapName(from="controller.u",to="u"),
      MapName(from="controller.y",to="y",isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M19_Interpolation1D.Tests.SineDrivenTable1D");
end SineDrivenTable1D;
