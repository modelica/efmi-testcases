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

  eFMI.NeuralNetworks.NeuralLayers.DenseLayer denseLayer1(
    redeclare eFMI.NeuralNetworks.ActivationFunctions.Tanh activationFunction,
    weights={{-0.7039596170222842},{-0.8750912730224503}},
    biases={1.169784394444224,-1.344723440170712})
    annotation (Placement(transformation(extent={{-10,-52},{30,-12}})));
  eFMI.NeuralNetworks.NeuralLayers.DenseLayer denseLayer2(
    weights={{-4.513856227908402,2.4932885356708683}},
    biases={3.897109323824147})
    annotation (Placement(transformation(extent={{50,-52},{90,-12}})));

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
  connect(denseLayer1.y, denseLayer2.x)
    annotation (Line(
      points={{30,-32},{50,-32}},
      color={129,129,129},
      thickness=1));
  connect(sine.y, denseLayer1.x[1])
    annotation (Line(
      points={{-38,0},{-30,0},{-30,-32},{-10,-32}},
      color={0,0,127}));
end SimpleTest;
