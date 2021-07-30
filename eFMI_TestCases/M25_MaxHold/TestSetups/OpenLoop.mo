within eFMI_TestCases.M25_MaxHold.TestSetups;
model OpenLoop
  extends .Modelica.Icons.Example;

  parameter Real a = 7;
  parameter Real b = 0.3;

  .Modelica.Blocks.Sources.RealExpression realExpression(
    y = exp(b*time)*cos(a*time + 0.2) + 2)
    annotation (Placement(transformation(extent={{-90,10},{-70,30}})));
  .Modelica.Blocks.Noise.UniformNoise uniformNoise(
    samplePeriod = 0.001,
    y_min = -1,
    y_max = 1)
    annotation (Placement(transformation(extent={{-90,-30},{-70,-10}})));
  .Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock(
    period = 0.001,
    useSolver = true,
    solverMethod="MultiRate_ExplicitEuler")
    annotation (Placement(transformation(extent={{-58,62},{-42,78}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked u
    annotation (Placement(transformation(extent={{-16,6},{-4,-6}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold y
    annotation (Placement(transformation(extent={{64,-6},{76,6}})));
  Controllers.maxHold_WithFilter maxHold_WithFilter
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));

equation
  connect(uniformNoise.y,add. u2)
    annotation (Line(
      points={{-69,-20},{-60,-20},{-60,-6},{-52,-6}},
      color={0,0,127}));
  connect(realExpression.y,add. u1)
    annotation (Line(
      points={{-69,20},{-60,20},{-60,6},{-52,6}},
      color={0,0,127}));
  connect(add.y,u. u)
    annotation (Line(
      points={{-29,0},{-17.2,0}},
      color={0,0,127}));
  connect(clock.y,u. clock)
    annotation (Line(
      points={{-41.2,70},{-10,70},{-10,7.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(u.y,maxHold_WithFilter. u)
    annotation (Line(
      points={{-3.4,0},{18,0}},
      color={0,0,127}));
  connect(maxHold_WithFilter.y,y. u)
    annotation (Line(
      points={{41,0},{62.8,0}},
      color={0,0,127}));

  annotation (
    experiment(StopTime = 6.0),
    Diagram(
      graphics={
        Text(
          extent={{-10,90},{90,50}},
          lineColor={28,108,200},
          textString="Simulation with Solver \"Explicit Euler\"
not possible in Dymola, therefore
\"MultiRate_ExplicitEuler\" is used.")}));
end OpenLoop;
