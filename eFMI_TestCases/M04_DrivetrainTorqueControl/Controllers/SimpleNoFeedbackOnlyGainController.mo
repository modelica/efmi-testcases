within eFMI_TestCases.M04_DrivetrainTorqueControl.Controllers;
model SimpleNoFeedbackOnlyGainController
  extends Controllers.ControllerInterface;

  .Modelica.Blocks.Math.Gain gain(
    k = 1/gearRatio)
    annotation (Placement(transformation(extent = {{-8,-10},{12,10}})));

equation
  connect(M_desired, gain.u)
    annotation (Line(
      points = {{-120,0},{-10,0}},
      color = {0,0,127}));
  connect(gain.y, M_motor)
    annotation (Line(
      points = {{13,0},{110.25,0}},
      color = {0,0,127}));
end SimpleNoFeedbackOnlyGainController;
