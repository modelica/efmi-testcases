within eFMI_TestCases.M04_DrivetrainTorqueControl.TestSetups;
model Controller_Rosenbrock1_ClosedLoop
  extends TestSetups.ClosedLoop(
    final is_clocked = true,
    clock(
      useSolver = true,
      period = 0.01,
      solverMethod = "Rosenbrock1"));

  annotation (
    experiment(StopTime = 20, Interval = 0.01));
end Controller_Rosenbrock1_ClosedLoop;
