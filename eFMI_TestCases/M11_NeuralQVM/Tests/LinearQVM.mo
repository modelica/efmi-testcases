within eFMI_TestCases.M11_NeuralQVM.Tests;
model LinearQVM
  extends .Modelica.Icons.Example;

  replaceable Controllers.LinearQVM prediction_model
    annotation (Placement(transformation(extent={{20,-20},{60,20}})));

  .Modelica.Blocks.Sources.Ramp ramp(
    height = 15,
    duration = 60,
    offset = 1)
    annotation(Placement(transformation(extent={{-100,-10},{-80,10}})));
  .Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sine(
    useConstantAmplitude = true,
    constantAmplitude = 0.15,
    phi(
      start = 1.5707963267949,
      fixed = true))
    annotation(Placement(transformation(extent={{-70,-10},{-50,10}})));
  .Modelica.Blocks.Continuous.Integrator integrator
    annotation(Placement(transformation(extent={{-40,-10},{-20,10}})));

equation
  connect(ramp.y,sine. f)
    annotation(Line(
      points={{-79,0},{-74,0},{-74,-6},{-72,-6}},
      color={0,0,127}));
  connect(sine.y,integrator. u)
    annotation(Line(
      points={{-49,0},{-42,0}},
      color={0,0,127}));
  connect(integrator.y, prediction_model.z_road)
    annotation (Line(
      points={{-19,0},{16,0}},
      color={0,0,127}));

  annotation (
    preferredView = "diagram",
    experiment(
      StopTime = 60,
      Interval = 1.0e-3,
      Tolerance = 1.0e-05,
      __Dymola_Algorithm = "Dassl"));
end LinearQVM;
