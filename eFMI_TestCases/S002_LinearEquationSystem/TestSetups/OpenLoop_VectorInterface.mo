within eFMI_TestCases.S002_LinearEquationSystem.TestSetups;
model OpenLoop_VectorInterface
  extends BaseSetup;

  replaceable Controllers.LinearSystemOfEquations controller
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));

  Modelica.Blocks.Routing.Multiplex4 multiplex4_1
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));

  Modelica_Synchronous.RealSignals.Sampler.SampleVectorizedAndClocked u_sample(n=4)
    annotation (Placement(transformation(extent={{4,6},{16,-6}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold hold_y[4]
    annotation (Placement(transformation(extent={{64,-6},{76,6}})));

equation
  connect(expSine.y,multiplex4_1. u1[1])
    annotation (Line(
      points={{-59,70},{-40,70},{-40,9},{-32,9}},
      color = {0,0,127}));
  connect(exponentials.y,multiplex4_1. u4[1])
    annotation (Line(
      points={{-59,-70},{-40,-70},{-40,-9},{-32,-9}},
      color = {0,0,127}));
  connect(sawTooth.y,multiplex4_1. u2[1])
    annotation (Line(
      points={{-59,30},{-44,30},{-44,3},{-32,3}},
      color = {0,0,127}));
  connect(ramp.y,multiplex4_1. u3[1])
    annotation (Line(
      points={{-59,-20},{-44,-20},{-44,-2},{-32,-2},{-32,-3}},
      color = {0,0,127}));
  connect(clock.y,u_sample. clock)
    annotation (Line(
      points={{-11.2,70},{10,70},{10,7.2}},
      color = {175,175,175},
      pattern = LinePattern.Dot,
      thickness = 0.5));
  connect(multiplex4_1.y,u_sample. u)
    annotation (Line(
      points={{-9,0},{2.8,0}},
      color = {0,0,127}));
  connect(u_sample.y,controller. u)
    annotation (Line(
      points={{16.6,0},{28,0}},
      color = {0,0,127}));
  connect(controller.y,hold_y. u)
    annotation (Line(
      points={{51,0},{62.8,0}},
      color = {0,0,127}));

  annotation (
    experiment(
      StopTime = 10.0));
end OpenLoop_VectorInterface;
