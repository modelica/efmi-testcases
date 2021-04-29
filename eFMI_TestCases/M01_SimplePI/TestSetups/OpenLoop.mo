within eFMI_TestCases.M01_SimplePI.TestSetups;
model OpenLoop
  extends BaseSetup;

  Modelica.Blocks.Sources.Ramp ramp(
    height=1.02,
    duration=2,
    offset=0,
    startTime=0.15)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));

equation
  if is_clocked then
    connect(ramp.y, y.u)
      annotation (Line(
        points={{-59,-50},{-4.44089e-16,-50},{-4.44089e-16,-37.2}},
        color={0,0,127}));
  else
    connect(ramp.y, controller.y);
  end if;

  annotation (
    experiment(
      StopTime = 4));
end OpenLoop;
