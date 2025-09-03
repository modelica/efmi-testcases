within eFMI_TestCases.M11_NeuralQVM.Controllers;
model NeuralQVM
  extends LinearQVM(
    tire_spring(
      s_rel(
        start = 0)),
    suspension_damper(
      stateSelect = StateSelect.never,
      s_rel(
        start = 0,
        fixed = false),
      v_rel(
        start = 0,
        fixed = false)),
    suspension_spring(
      s_rel(
        start = 0)));

  Components.NeuralSpring.Spring neuralSpring
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={-30,34})));
  Components.NeuralDamper.Damper neuralDamper
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={26,34})));

equation
  connect(neuralSpring.flange_b, body_mass.flange_a)
    annotation (Line(
      points={{-30,44},{-30,54},{0,54},{0,62}},
      color={0,127,0}));
  connect(neuralSpring.flange_a, wheel_mass.flange_b)
    annotation (Line(
      points={{-30,24},{-30,10},{0,10},{0,4}},
      color={0,127,0}));
  connect(neuralDamper.flange_b, body_mass.flange_a)
    annotation (Line(
      points={{26,44},{26,54},{0,54},{0,62}},
      color={0,127,0}));
  connect(neuralDamper.flange_a, wheel_mass.flange_b)
    annotation (Line(
      points={{26,24},{26,10},{0,10},{0,4}},
      color={0,127,0}));

  annotation (
    preferredView = "diagram",
    Icon(
      graphics={
        Rectangle(
          extent={{-10,30},{10,6}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          lineThickness=1),
        Line(
          points={{0,30},{0,34}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{0,6},{0,0}},
          color={0,0,0},
          thickness=1)}));
end NeuralQVM;
