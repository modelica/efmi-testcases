within eFMI_TestCases.S003_VehicleModel.TestSetups;
model OpenLoop_ScalarInterface
  extends BaseSetup;

  replaceable Controllers.VehiclePlant_ScalarInterface vehiclePlant
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  Modelica_Synchronous.RealSignals.Sampler.SampleClocked sample_u1
    annotation (Placement(transformation(extent={{-36,12},{-24,0}})));
  Modelica_Synchronous.RealSignals.Sampler.Sample sample_u2
    annotation (Placement(transformation(extent={{-36,0},{-24,-12}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold hold_x6
    annotation (Placement(transformation(extent={{64,-36},{76,-24}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold hold_x7
    annotation (Placement(transformation(extent={{64,-56},{76,-44}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold hold_x8
    annotation (Placement(transformation(extent={{64,-76},{76,-64}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold hold_x5
    annotation (Placement(transformation(extent={{64,-16},{76,-4}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold hold_x4
    annotation (Placement(transformation(extent={{64,4},{76,16}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold hold_x3
    annotation (Placement(transformation(extent={{64,24},{76,36}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold hold_x2
    annotation (Placement(transformation(extent={{64,44},{76,56}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold hold_x1
    annotation (Placement(transformation(extent={{64,64},{76,76}})));

equation
  connect(vehiclePlant.x1,hold_x1. u)
    annotation (Line(
      points={{11,8},{20,8},{20,70},{62.8,70}},
      color = {0,0,127}));
  connect(vehiclePlant.x2,hold_x2. u)
    annotation (Line(
      points={{11,6},{30,6},{30,50},{62.8,50}},
      color = {0,0,127}));
  connect(vehiclePlant.x3,hold_x3. u)
    annotation (Line(
      points={{11,4},{40,4},{40,30},{62.8,30}},
      color = {0,0,127}));
  connect(vehiclePlant.x4,hold_x4. u)
    annotation (Line(
      points={{11,2},{50,2},{50,10},{62.8,10}},
      color = {0,0,127}));
  connect(vehiclePlant.x5,hold_x5. u)
    annotation (Line(
      points={{11,-2},{50,-2},{50,-10},{62.8,-10}},
      color = {0,0,127}));
  connect(vehiclePlant.x6,hold_x6. u)
    annotation (Line(
      points={{11,-4},{40,-4},{40,-30},{62.8,-30}},
      color = {0,0,127}));
  connect(vehiclePlant.x7,hold_x7. u)
    annotation (Line(
      points={{11,-6},{30,-6},{30,-50},{62.8,-50}},
      color = {0,0,127}));
  connect(vehiclePlant.x8,hold_x8. u)
    annotation (Line(
      points={{11,-8},{20,-8},{20,-70},{62.8,-70}},
      color = {0,0,127}));
  connect(clock.y, sample_u1.clock)
    annotation (Line(
      points={{-61.2,50},{-30,50},{-30,13.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(inputExpressions[1].y, sample_u1.u)
    annotation (Line(
      points={{-59,0},{-50,0},{-50,6},{-37.2,6}},
      color={0,0,127}));
  connect(sample_u1.y,vehiclePlant. u1)
    annotation (Line(
      points={{-23.4,6},{-12,6}},
      color = {0,0,127}));
  connect(inputExpressions[2].y, sample_u2.u)
    annotation (Line(
      points={{-59,0},{-50,0},{-50,-6},{-37.2,-6}},
      color={0,0,127}));
  connect(sample_u2.y,vehiclePlant. u2)
    annotation (Line(
      points={{-23.4,-6},{-12,-6}},
      color = {0,0,127}));

  annotation (
    experiment(
      StopTime = 40.0));
end OpenLoop_ScalarInterface;
