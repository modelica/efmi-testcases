within eFMI_TestCases.M04_DrivetrainTorqueControl.TestSetups;
model OpenLoop
  extends BaseSetup;

  Modelica.Blocks.Sources.Sine sine(
    amplitude = 0.4,
    freqHz = 3,
    phase = 2.7925268031909,
    offset = 0.05)
    annotation (Placement(transformation(extent = {{80,-40},{60,-20}})));

equation
  if is_clocked then
    // Clocked configuration:
    connect(sine.y, wRel.u)
      annotation (Line(
        points = {{59,-30},{37.2,-30}},
        color = {0,0,127}));
  else
    // Continuous configuration:
    connect(sine.y, controller.wRel);
  end if;

  annotation (
    experiment(
      StopTime = 20.0000001));
end OpenLoop;
