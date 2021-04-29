within eFMI_TestCases.M04_DrivetrainTorqueControl.TestSetups;
model Uncontrolled_ClosedLoop
  extends TestSetups.ClosedLoop(
    final is_clocked = false,
    redeclare Controllers.SimpleNoFeedbackOnlyGainController controller);

  annotation (
    experiment(
      StopTime = 20));
end Uncontrolled_ClosedLoop;
