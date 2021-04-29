within eFMI_TestCases.M21_Interpolation2D.ReferenceTests;
model SineDrivenTable2D_2
  extends TestSetups.SineDrivenTable2D_2(
    controller(
      table1(efmi = false),
      table2(efmi = false)));

  annotation (
    experiment(
      StopTime = 1.2,
      Interval = 0.01),
    __fmi_InterfaceVariable={
      MapName(from="controller.u",to="u", dimensions={2}),
      MapName(from="controller.y",to="y", dimensions={2}, isOutput=true)},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M21_Interpolation2D.Tests.SineDrivenTable2D_2");
end SineDrivenTable2D_2;
