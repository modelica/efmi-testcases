within eFMI_TestCases.M05_ControlledMixingUnit.TestSetups;
model OpenLoop
  extends BaseSetup;

  .Modelica.Blocks.Sources.Sine sine(
    amplitude = 15,
    f = 0.001,
    offset = 311)
    annotation (Placement(transformation(extent={{80,-40},{60,-20}})));

equation
  if is_clocked then
    // Clocked configuration:
    connect(sine.y, T.u)
      annotation (Line(
        points = {{59,-30},{37.2,-30}},
        color = {0,0,127}));
  else
    // Continuous configuration:
    connect(sine.y, controller.u2);
  end if;

  annotation (
    experiment(
      StopTime = 300.1));
end OpenLoop;
