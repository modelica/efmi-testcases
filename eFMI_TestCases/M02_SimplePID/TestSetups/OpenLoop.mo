within eFMI_TestCases.M02_SimplePID.TestSetups;
model OpenLoop
  extends BaseSetup;

  Modelica.Blocks.Sources.KinematicPTP kinematicPTP1(
    startTime=0.5,
    deltaq={1.5},
    qd_max={0.95},
    qdd_max={1.1})
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Continuous.Integrator integrator1(
    initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));

equation
  connect(kinematicPTP1.y[1], integrator1.u)
    annotation (Line(points={{-59,-50},{-42,-50}}, color={0,0,127}));

  if is_clocked then
    connect(integrator1.y, u_m.u)
      annotation (Line(points={{-19,-50},{30,-50},{30,-37.2}}, color={0,0,127}));
  else
    connect(integrator1.y, controller.u_m);
  end if;

  annotation (
    experiment(
      StopTime = 4));
end OpenLoop;
