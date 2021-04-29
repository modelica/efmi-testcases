within eFMI_TestCases.M16_ROM.ReferenceTests;
model MatrixEqSystem_Dassl "Dassl quasi-continuous time reference solution"
  extends TestSetups.BaseSetup(
    matrixEqSystem(scalingFactor2D(efmi = false)));

  annotation (
    experiment(
      StopTime=160.0,
      Interval=0.1,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"),
      __fmi_InterfaceVariable={
  MapName(from="matrixEqSystem.n",to="n"),
  MapName(from="matrixEqSystem.tau",to="tau"),
  MapName(from="matrixEqSystem.y",to="y",isOutput=true,dimensions={12},ToleranceSet={ToleranceSetType(absTol64=5e-3, relTol64=5e-4, absTol32=5e-2, relTol32=2e-2),
                                                                                     ToleranceSetType(absTol64=5e-3, relTol64=5e-4, absTol32=5e-2, relTol32=2e-2),
                                                                                     ToleranceSetType(absTol64=5e-3, relTol64=5e-4, absTol32=5e-2, relTol32=2e-2),
                                                                                     ToleranceSetType(absTol64=5e-3, relTol64=5e-4, absTol32=5e-2, relTol32=2e-2),
                                                                                     ToleranceSetType(absTol64=5e-3, relTol64=5e-4, absTol32=5e-2, relTol32=2e-2),
                                                                                     ToleranceSetType(absTol64=5e-3, relTol64=5e-4, absTol32=5e-2, relTol32=2e-2),
                                                                                     ToleranceSetType(absTol64=5e-3, relTol64=5e-4, absTol32=5e-2, relTol32=2e-2),
                                                                                     ToleranceSetType(absTol64=5e-3, relTol64=5e-4, absTol32=5e-2, relTol32=2e-2),
                                                                                     ToleranceSetType(absTol64=5e-3, relTol64=5e-4, absTol32=5e-2, relTol32=2e-2),
                                                                                     ToleranceSetType(absTol64=5e-3, relTol64=5e-4, absTol32=5e-2, relTol32=2e-2),
                                                                                     ToleranceSetType(absTol64=1e-2, relTol64=5e-3, absTol32=1e-1, relTol32=5e-2),
                                                                                     ToleranceSetType(absTol64=1e-2, relTol64=1e-3, absTol32=1e-1, relTol32=5e-2)})},
      __fmi_OriginalModel_ExportReference="eFMI_TestCases.M16_ROM.Tests.MatrixEqSystem_ImplEuler");

end MatrixEqSystem_Dassl;
