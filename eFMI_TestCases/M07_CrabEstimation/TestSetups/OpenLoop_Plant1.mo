within eFMI_TestCases.M07_CrabEstimation.TestSetups;
model OpenLoop_Plant1
  extends Modelica.Icons.Example;

  replaceable Controllers.Plant1 crab
    constrainedby Controllers.PartialPlantInterface
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  Modelica.Blocks.Sources.Sine sine(
    freqHz=0.5,
    startTime=1,
    amplitude=50,
    offset=0)   "Force on grap"
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

  Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock clock(
    period=0.01,
    useSolver=true,
    solverMethod="ExplicitEuler")
    annotation (Placement(transformation(extent={{-78,-58},{-62,-42}})));
  Modelica_Synchronous.RealSignals.Sampler.SampleClocked force
    annotation (Placement(transformation(extent={{-46,-6},{-34,6}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold y1
    annotation (Placement(transformation(extent={{34,24},{46,36}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold y2
    annotation (Placement(transformation(extent={{34,-36},{46,-24}})));

equation
  connect(sine.y,force. u)
    annotation (Line(
      points={{-59,0},{-47.2,0}},
      color = {0,0,127}));
  connect(force.y,crab. force)
    annotation (Line(
      points={{-33.4,0},{-12,0}},
      color = {0,0,127}));
  connect(clock.y,force. clock)
    annotation (Line(
      points={{-61.2,-50},{-40,-50},{-40,-7.2}},
      color = {175,175,175},
      pattern = LinePattern.Dot,
      thickness = 0.5));
  connect(crab.y1,y1. u)
    annotation (Line(
      points={{11,6},{20,6},{20,30},{32.8,30}},
      color = {0,0,127}));
  connect(crab.y2,y2. u)
    annotation (Line(
      points={{11,-6},{20,-6},{20,-30},{32.8,-30}},
      color = {0,0,127}));
end OpenLoop_Plant1;
