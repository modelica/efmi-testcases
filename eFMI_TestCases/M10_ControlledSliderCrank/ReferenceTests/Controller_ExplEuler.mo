within eFMI_TestCases.M10_ControlledSliderCrank.ReferenceTests;
model Controller_ExplEuler
  extends Tests.Controller_ExplEuler;

  annotation (
    experiment(
      StopTime = 10.0,
      Interval = 0.0001,
      Tolerance = 1e-06),
    __Dymola_experimentFlags(
      Hidden(InitializeClockedDiscretizedStates = true),
      Advanced(
        GenerateVariableDependencies = false,
        OutputModelicaCode = false)),
    __fmi_InterfaceVariable={MapName(from="controller.s_ref",to="s_ref"),MapName(from="controller.phi",to="phi"),MapName(from="controller.tau",to="tau",isOutput=true, ToleranceSet={ToleranceSetType(absTol32=0.03)})},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.M10_ControlledSliderCrank.Tests.Controller_ExplEuler");
end Controller_ExplEuler;
