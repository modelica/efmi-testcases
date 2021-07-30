within eFMI_TestCases.S002_LinearEquationSystem.TestSetups;
model OpenLoop_ScalarInterface
  extends BaseSetup;

  replaceable Controllers.LinearSystemOfEquations_ScalarInterface controller
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));

  .Modelica.Clocked.RealSignals.Sampler.Hold hold_y1
    annotation (Placement(transformation(extent={{74,44},{86,56}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold hold_y2
    annotation (Placement(transformation(extent={{74,14},{86,26}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold hold_y3
    annotation (Placement(transformation(extent={{74,-26},{86,-14}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold hold_y4
    annotation (Placement(transformation(extent={{74,-56},{86,-44}})));
  .Modelica.Clocked.RealSignals.Sampler.SampleClocked sample_u1
    annotation (Placement(transformation(extent={{-6,36},{6,24}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample sample_u2
    annotation (Placement(transformation(extent={{-6,16},{6,4}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample sample_u3
    annotation (Placement(transformation(extent={{-6,-4},{6,-16}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample sample_u4
    annotation (Placement(transformation(extent={{-6,-24},{6,-36}})));

equation
  connect(controller.y1,hold_y1. u)
    annotation (Line(
      points={{51,6},{60,6},{60,50},{72.8,50}},
      color = {0,0,127}));
  connect(controller.y2,hold_y2. u)
    annotation (Line(
      points={{51,2},{66,2},{66,20},{72.8,20}},
      color = {0,0,127}));
  connect(controller.y3,hold_y3. u)
    annotation (Line(
      points={{51,-2},{66,-2},{66,-20},{72.8,-20}},
      color = {0,0,127}));
  connect(controller.y4,hold_y4. u)
    annotation (Line(
      points={{51,-6},{60,-6},{60,-50},{72.8,-50}},
      color = {0,0,127}));
  connect(sample_u1.y,controller. u1)
    annotation (Line(
      points={{6.6,30},{20,30},{20,6},{28,6}},
      color = {0,0,127}));
  connect(sample_u2.y,controller. u2)
    annotation (Line(
      points={{6.6,10},{14,10},{14,2},{28,2}},
      color = {0,0,127}));
  connect(sample_u3.y,controller. u3)
    annotation (Line(
      points={{6.6,-10},{14,-10},{14,-2.2},{28,-2.2}},
      color = {0,0,127}));
  connect(sample_u4.y,controller. u4)
    annotation (Line(
      points={{6.6,-30},{20,-30},{20,-6},{28,-6}},
      color = {0,0,127}));
  connect(expSine.y,sample_u1. u)
    annotation (Line(
      points={{-59,70},{-40,70},{-40,30},{-7.2,30}},
      color = {0,0,127}));
  connect(sawTooth.y,sample_u2. u)
    annotation (Line(
      points={{-59,30},{-50,30},{-50,10},{-7.2,10}},
      color = {0,0,127}));
  connect(ramp.y,sample_u3. u)
    annotation (Line(
      points={{-59,-20},{-50,-20},{-50,-10},{-7.2,-10}},
      color = {0,0,127}));
  connect(exponentials.y,sample_u4. u)
    annotation (Line(
      points={{-59,-70},{-40,-70},{-40,-30},{-7.2,-30}},
      color = {0,0,127}));
  connect(clock.y,sample_u1. clock)
    annotation (Line(
      points={{-11.2,70},{0,70},{0,37.2}},
      color = {175,175,175},
      pattern = LinePattern.Dot,
      thickness = 0.5));

  annotation (
    experiment(
      StopTime = 10.0));
end OpenLoop_ScalarInterface;
