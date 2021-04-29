within eFMI_TestCases.M09_MixingUnit_FBL.Controllers;
model Controller
  extends Controller_interface;

  parameter Modelica.SIunits.Frequency freq = 1/300
    "Critical frequency of filter";

  final parameter Real K0 = (2*Modelica.Constants.pi*freq)^2;
  final parameter Real K1 = 2*(2*Modelica.Constants.pi*freq);

  M05_ControlledMixingUnit.PlantModels.MixingUnit invMixingUnit(
    for_inversion=true,
    deactivateStateSelect=true,
    pro=1.1) annotation (Placement(transformation(extent={{30,-64},{10,-44}},
          rotation=0)));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
    annotation (Placement(transformation(extent={{-12,-74},{52,-34}})));
  Modelica.Blocks.Continuous.CriticalDamping filter(
    f = freq,
    initType=Modelica.Blocks.Types.Init.InitialState,
    n = 1,
    normalized = false,
    x_start={invMixingUnit.c_start})
    annotation (Placement(transformation(
      extent = {{-68,52},{-52,68}},
      rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1
    annotation (Placement(transformation(
      extent = {{-40,50},{-20,70}},
      rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(
    initType = Modelica.Blocks.Types.Init.NoInit)
    annotation (Placement(transformation(extent = {{36,52},{51.5,68}})));
  Modelica.Blocks.Continuous.Integrator integrator2(
    initType = Modelica.Blocks.Types.Init.NoInit)
    annotation (Placement(transformation(extent = {{68,52},{84,68}})));
  Modelica.Blocks.Math.Gain gain1(k = K0)
    annotation (Placement(transformation(extent = {{-12,52},{4,68}})));
  Modelica.Blocks.Math.Gain gain2(k = K1)
    annotation (Placement(transformation(extent = {{48,12},{32,28}})));
  Modelica.Blocks.Math.Feedback feedback2
    annotation (Placement(transformation(
      extent = {{10,50},{30,70}},
      rotation = 0)));
  Utilities.InputToState inputToState
    annotation (Placement(transformation(extent = {{-60,-70},{-40,-50}})));
  Utilities.InputToState inputToState1
    annotation (Placement(transformation(
      extent = {{-10,-10},{10,10}},
      rotation = -90,
      origin = {0,10})));

equation
  connect(inverseBlockConstraints.y2, invMixingUnit.T_c)
    annotation (Line(
      points = {{47.2,-54},{32,-54}},
      color = {0,0,127},
      smooth = Smooth.None));
  connect(invMixingUnit.c, inverseBlockConstraints.u2)
    annotation (Line(
      points = {{8,-48},{4,-48},{4,-54},{-5.6,-54}},
      color = {0,0,127},
      smooth = Smooth.None));
  connect(inverseBlockConstraints.u1, integrator2.y)
    annotation (Line(
      points = {{-15.2,-54},{-26,-54},{-26,-20},{90,-20},{90,60},{84.8,60}},
      color = {0,0,127}));
  connect(feedback1.y, gain1.u)
    annotation (Line(
      points = {{-21,60},{-13.6,60}},
      color = {0,0,127}));
  connect(gain1.y, feedback2.u1)
    annotation (Line(
      points = {{4.8,60},{12,60}},
      color = {0,0,127}));
  connect(feedback2.y, integrator1.u)
    annotation (Line(
      points = {{29,60},{34.45,60}},
      color = {0,0,127}));
  connect(gain2.y, feedback2.u2)
    annotation (Line(
      points = {{31.2,20},{20,20},{20,52}},
      color = {0,0,127}));
  connect(feedback1.u1, filter.y)
    annotation (Line(
      points = {{-38,60},{-51.2,60}},
      color = {0,0,127}));
  connect(integrator1.y, gain2.u)
    annotation (Line(
      points = {{52.275,60},{60,60},{60,20},{49.6,20}},
      color = {0,0,127}));
  connect(invMixingUnit.T, inputToState.x)
    annotation (Line(
      points = {{8,-60},{-38,-60}},
      color = {0,0,127}));
  connect(inputToState1.xs, feedback1.u2)
    annotation (Line(
      points = {{2.22045e-15,22},{0,22},{0,40},{-30,40},{-30,52}},
      color = {0,0,127}));
  connect(inputToState1.x, inverseBlockConstraints.u2)
    annotation (Line(
      points = {{-2.22045e-15,-2},{0,-2},{0,-54},{-5.6,-54}},
      color = {0,0,127}));
  connect(integrator1.y, integrator2.u)
    annotation (Line(
      points = {{52.275,60},{66.4,60}},
      color = {0,0,127}));
  connect(ref, filter.u)
    annotation (Line(
      points = {{-120,60},{-69.6,60}},
      color = {0,0,127}));
  connect(c, feedback1.u2)
    annotation (Line(
      points = {{-120,0},{-60,0},{-60,40},{-30,40},{-30,52}},
      color = {0,0,127}));
  connect(T, inputToState.xs)
    annotation (Line(
      points = {{-120,-60},{-62,-60}},
      color = {0,0,127}));
  connect(inverseBlockConstraints.y1, T_c)
    annotation (Line(
      points = {{53.6,-54},{80,-54},{80,-60},{110,-60}},
      color = {0,0,127}));

  annotation (preferredView = "diagram");
end Controller;
