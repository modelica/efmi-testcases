within eFMI_TestCases.M04_DrivetrainTorqueControl.Utilities;
block LimPI_withFeedForward
  "'Modelica.Blocks.Continuous.LimPID' variant fixed to use a PI controller and
   feed-forward."
  extends Modelica.Blocks.Continuous.LimPID(
    final controllerType = .Modelica.Blocks.Types.SimpleController.PI,
    final withFeedForward = true);
end LimPI_withFeedForward;
