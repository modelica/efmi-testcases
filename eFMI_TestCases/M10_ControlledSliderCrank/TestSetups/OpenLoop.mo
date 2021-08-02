within eFMI_TestCases.M10_ControlledSliderCrank.TestSetups;
partial model OpenLoop
  extends BaseSetup;

  .Modelica.Blocks.Sources.Sine sine1(
    amplitude = 0.75,
    f = 0.39,
    phase = 0,
    offset = 0.3)
    annotation (Placement(transformation(extent={{80,-50},{60,-30}})));

equation
  if is_clocked then
    connect(sine1.y, phi.u)
      annotation (Line(
        points={{59,-40},{37.2,-40}},
        color={0,0,127}));
  else
    connect(sine1.y, controller.phi);
  end if;
end OpenLoop;
