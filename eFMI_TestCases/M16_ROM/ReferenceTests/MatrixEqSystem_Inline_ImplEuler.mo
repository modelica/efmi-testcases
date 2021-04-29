within eFMI_TestCases.M16_ROM.ReferenceTests;
model MatrixEqSystem_Inline_ImplEuler "Implicit Euler fixed step reference solution"
  extends TestSetups.BaseSetup(
    matrixEqSystem(scalingFactor2D(efmi = false)));

  annotation (
    experiment(
      StopTime=160.0,
      Interval=0.1,
      __Dymola_fixedstepsize=0.1,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=2,
        InlineFixedStep=0.1)),
    __fmi_InterfaceVariable={
  MapName(from="matrixEqSystem.n",to="n"),
  MapName(from="matrixEqSystem.tau",to="tau"),
  MapName(from="matrixEqSystem.y",to="y",isOutput=true,dimensions={12},ToleranceSet={ToleranceSetType(absTol32=0.02),
                                                                                     ToleranceSetType(absTol32=0.1),
                                                                                     ToleranceSetType(absTol32=0.1),
                                                                                     ToleranceSetType(absTol32=0.2),
                                                                                     ToleranceSetType(absTol32=0.2),
                                                                                     ToleranceSetType(absTol32=0.1),
                                                                                     ToleranceSetType(absTol32=0.1),
                                                                                     ToleranceSetType(absTol32=0.03),
                                                                                     ToleranceSetType(absTol32=0.2),
                                                                                     ToleranceSetType(absTol32=0.3),
                                                                                     ToleranceSetType(absTol32=0.1),
                                                                                     ToleranceSetType(absTol32=0.07)})},
  __fmi_OriginalModel_ExportReference="eFMI_TestCases.M16_ROM.Tests.MatrixEqSystem_ImplEuler");
end MatrixEqSystem_Inline_ImplEuler;
