within eFMI.Tests.NeuralNetworks;
model SimpleTest
  extends .Modelica.Icons.Example;

  Modelica.Blocks.Sources.Sine sine(
    f = 1)
    annotation(Placement(transformation(
      origin={-60,0},
      extent = {{-20, -20}, {20, 20}})));

  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{-20,30},{0,50}})));
  Modelica.Blocks.Math.Product product2
    annotation (Placement(transformation(extent={{10,60},{30,80}})));
  Modelica.Blocks.Sources.Constant const(k=0.5)
    annotation (Placement(transformation(extent={{-20,80},{-8,92}})));
  Modelica.Blocks.Sources.Constant const1(k=2)
    annotation (Placement(transformation(extent={{8,20},{20,32}})));
  Modelica.Blocks.Math.Add3 add3(k3=-1)
    annotation (Placement(transformation(extent={{40,30},{60,50}})));

  SimpleNN simpleNN
    annotation (Placement(transformation(extent={{0,-40},{40,0}})));

  model SimpleNN
    extends eFMI.NeuralNetworks.Interfaces.NeuralNetwork(
      final preprocessor(
        final nin = denseLayer1.nin),
      final postprocessor(
        final nin = denseLayer2.nout));

    eFMI.NeuralNetworks.NeuralLayers.DenseLayer denseLayer1(
      redeclare eFMI.NeuralNetworks.ActivationFunctions.Tanh activationFunction,
      parameters(
        weights = {{-0.7039596170222842},{-0.8750912730224503}},
        biases = {1.169784394444224,-1.344723440170712}))
      annotation (Placement(transformation(extent={{-20,20},{20,60}})));
    eFMI.NeuralNetworks.NeuralLayers.DenseLayer denseLayer2(
      parameters(
        weights = {{-4.513856227908402,2.4932885356708683}},
        biases = {3.897109323824147}))
      annotation (Placement(transformation(extent={{-20,-60},{20,-20}})));

  equation
    connect(preprocessor.y, denseLayer1.x)
      annotation (Line(
        points={{-50,0},{-34,0},{-34,40},{-20,40}},
        color={129,129,129},
        thickness=1));
    connect(denseLayer1.y, denseLayer2.x)
      annotation (Line(
        points={{20,40},{26,40},{26,0},{-26,0},{-26,-40},{-20,-40}},
        color={129,129,129},
        thickness=1));
    connect(denseLayer2.y, postprocessor.x)
      annotation (Line(
        points={{20,-40},{34,-40},{34,0},{50,0}},
        color={129,129,129},
        thickness=1));
  end SimpleNN;

equation
  connect(sine.y, product1.u1)
    annotation (Line(
      points={{-38,0},{-30,0},{-30,46},{-22,46}},
      color={0,0,127}));
  connect(sine.y, product1.u2)
    annotation (Line(
      points={{-38,0},{-30,0},{-30,34},{-22,34}},
      color={0,0,127}));
  connect(const.y, product2.u1)
    annotation (
      Line(points={{-7.4,86},{0,86},{0,76},{8,76}},
        color={0,0,127}));
  connect(sine.y, product2.u2)
    annotation (
      Line(points={{-38,0},{-30,0},{-30,64},{8,64}},
        color={0,0,127}));
  connect(product1.y, add3.u2)
    annotation (Line(
      points={{1,40},{38,40}},
      color={0,0,127}));
  connect(product2.y, add3.u1)
    annotation (Line(
      points={{31,70},{40,70},{40,56},{30,56},{30,48},{38,48}},
      color={0,0,127}));
  connect(const1.y, add3.u3)
    annotation (Line(
      points={{20.6,26},{30,26},{30,32},{38,32}},
      color={0,0,127}));
  connect(sine.y, simpleNN.x[1])
    annotation (Line(
      points={{-38,0},{-30,0},{-30,-20},{0,-20}},
      color={0,0,127}));
end SimpleTest;
