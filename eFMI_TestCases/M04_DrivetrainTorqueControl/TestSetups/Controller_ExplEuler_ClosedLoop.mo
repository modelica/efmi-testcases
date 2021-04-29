within eFMI_TestCases.M04_DrivetrainTorqueControl.TestSetups;
model Controller_ExplEuler_ClosedLoop
  extends TestSetups.ClosedLoop(
    final is_clocked = true,
    clock(
      useSolver = true,
      period = 5e-4,
      solverMethod = "ExplicitEuler"));

  annotation (
    experiment(StopTime = 30, Interval = 5e-4));
end Controller_ExplEuler_ClosedLoop;
