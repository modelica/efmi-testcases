within eFMI_TestCases.S003_VehicleModel.TestSetups;
model OpenLoop_VectorInterface
  extends BaseSetup;

  replaceable Controllers.VehiclePlant vehiclePlant
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  .Modelica.Clocked.RealSignals.Sampler.SampleVectorizedAndClocked u_sample(
    n = 2)
    annotation (Placement(transformation(extent={{-36,6},{-24,-6}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold hold_x[8]
    annotation (Placement(transformation(extent={{26,-6},{38,6}})));

equation
  connect(inputExpressions.y, u_sample.u)
    annotation (Line(
      points={{-59,0},{-37.2,0}},
      color={0,0,127}));
  connect(clock.y, u_sample.clock)
    annotation (Line(
      points={{-61.2,50},{-30,50},{-30,7.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(u_sample.y,vehiclePlant. u)
    annotation (Line(
      points={{-23.4,0},{-12,0}},
      color = {0,0,127}));
  connect(vehiclePlant.x,hold_x. u)
    annotation (Line(
      points={{11,0},{24.8,0}},
      color = {0,0,127}));

  annotation (
    experiment(
      StopTime = 40.0));
end OpenLoop_VectorInterface;
