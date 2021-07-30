within eFMI_TestCases.M24_IntegratorReset.TestSetups;
model OpenLoop_Boolean
  extends .Modelica.Icons.Example;

  replaceable Controllers.IntegratorWithReset_Boolean integratorWithReset
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));

  .Modelica.Blocks.Sources.Sine sine1(
    amplitude = 3,
    f = 2)
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock(
    period = 0.01,
    useSolver = true,
    solverMethod = "MultiRate_ExplicitEuler")
    annotation (Placement(transformation(extent={{-78,62},{-62,78}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked sample1
    annotation (Placement(transformation(extent={{-36,26},{-24,14}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold hold1
    annotation (Placement(transformation(extent={{64,-6},{76,6}})));
  .Modelica.Blocks.Sources.Sine sine2(
    amplitude = 1,
    f = 0.6,
    phase = 0.17453292519943)
    annotation (Placement(transformation(extent={{-20,-90},{-40,-70}})));
  .Modelica.Clocked.BooleanSignals.Sampler.Sample sample2
    annotation (Placement(transformation(extent={{-36,-14},{-24,-26}})));
  .Modelica.Blocks.Logical.GreaterEqual greaterEqual
    annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));
  .Modelica.Blocks.Sources.Constant const(
    k = 0.5)
    annotation (Placement(transformation(extent={{-20,-60},{-40,-40}})));

equation
  connect(clock.y,sample1. clock)
    annotation (Line(
      points={{-61.2,70},{-30,70},{-30,27.2}},
      color = {175,175,175},
      pattern = LinePattern.Dot,
      thickness = 0.5));
  connect(sine1.y,sample1. u)
    annotation (Line(
      points={{-59,20},{-37.2,20}},
      color = {0,0,127}));
  connect(sample1.y,integratorWithReset. u)
    annotation (Line(
      points={{-23.4,20},{0,20},{0,0},{18,0}},
      color={0,0,127}));
  connect(integratorWithReset.y,hold1. u)
    annotation (Line(
      points={{41,0},{62.8,0}},
      color={0,0,127}));
  connect(sample2.y,integratorWithReset. reset)
    annotation (Line(
      points={{-23.4,-20},{0,-20},{0,-8},{18,-8}},
      color={255,0,255}));
  connect(greaterEqual.y,sample2. u)
    annotation (
      Line(points={{-59,-20},{-37.2,-20}},
      color={255,0,255}));
  connect(sine2.y,greaterEqual. u1)
    annotation (Line(
      points={{-41,-80},{-92,-80},{-92,-20},{-82,-20}},
      color={0,0,127}));
  connect(const.y,greaterEqual. u2)
    annotation (Line(
      points={{-41,-50},{-88,-50},{-88,-28},{-82,-28}},
      color={0,0,127}));

  annotation (
    experiment(StopTime = 8.0),
    Diagram(
      graphics={
        Text(
          extent={{-30,90},{90,50}},
          lineColor={28,108,200},
          textString="Simulation with Solver \"Explicit Euler\"
not possible in Dymola, therefore
\"MultiRate_ExplicitEuler\" is used.")}));
end OpenLoop_Boolean;
