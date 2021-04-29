within eFMI_TestCases.M20_ComplianceWithInterpolation1D.ReferenceTests;
model DriveTrain_DASSL
  "Simulation of a gearbox with table-based elastic characteristic"
  extends TestSetups.OpenLoop(
    driveTrain(nonlinearSpring(table(efmi = false))));

  annotation (
    experiment(
      __Dymola_NumberOfIntervals = 5000));
end DriveTrain_DASSL;
