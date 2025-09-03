within eFMI_TestCases.M11_NeuralQVM.Controllers;
model LinearQVM
  extends Icons.QVMController;

  .Modelica.Mechanics.Translational.Components.Mass body_mass(
    m = 350,
    s(start = 0,
      fixed = true),
    L = 0,
    stateSelect = StateSelect.prefer,
    v(start = 0,
      fixed = true),
    a(start = 0))
    annotation(Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={0,72})));
  .Modelica.Mechanics.Translational.Components.Spring suspension_spring(
    s_rel(
      start = 0),
    c = 10000,
    s_rel0 = 0)
    annotation(Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={-60,38})));
  .Modelica.Mechanics.Translational.Components.Damper suspension_damper(
    s_rel(
      start = 0),
    v_rel(
      start = 0),
    d = 800)
    annotation(Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={0,34})));
  .Modelica.Mechanics.Translational.Components.Mass wheel_mass(
    m = 90,
    stateSelect = StateSelect.prefer,
    s(start = 0,
      fixed = true),
    L = 0,
    v(start = 0,
      fixed = true),
    a(start = 0))
    annotation(Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={0,-6})));
  .Modelica.Mechanics.Translational.Components.Spring tire_spring(
    s_rel(
      start = 0),
    c = 300000,
    s_rel0 = 0)
    annotation(Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={0,-34})));
  .Modelica.Mechanics.Translational.Sources.Position road_height(
    s(start = 0),
    v(start = 0,
      fixed = true),
    a(start = 0))
    annotation(Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={0,-62})));
  .Modelica.Mechanics.Translational.Sensors.PositionSensor z_b_sensor
    annotation (Placement(transformation(extent={{40,72},{60,92}})));
  .Modelica.Mechanics.Translational.Sensors.PositionSensor z_w_sensor
    annotation (Placement(transformation(extent={{44,0},{64,20}})));
  .Modelica.Blocks.Interfaces.RealInput z_road
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealOutput z_b
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  .Modelica.Blocks.Interfaces.RealOutput z_w
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));

equation
  connect(body_mass.flange_a, suspension_spring.flange_b)
    annotation(Line(
      points={{0,62},{0,54},{-60,54},{-60,48}},
      color={0,127,0}));
  connect(body_mass.flange_a, suspension_damper.flange_b)
    annotation(Line(
      points={{0,62},{0,44}},
      color={0,127,0}));
  connect(suspension_spring.flange_a, wheel_mass.flange_b)
    annotation(Line(
      points={{-60,28},{-60,10},{0,10},{0,4}},
      color={0,127,0}));
  connect(wheel_mass.flange_b, suspension_damper.flange_a)
    annotation(Line(
      points={{0,4},{0,24}},
      color={0,127,0}));
  connect(wheel_mass.flange_a, tire_spring.flange_b)
    annotation(Line(
      points={{0,-16},{0,-24}},
      color={0,127,0}));
  connect(tire_spring.flange_a, road_height.flange)
    annotation(Line(
      points={{0,-44},{0,-52}},
      color={0,127,0}));
  connect(body_mass.flange_b, z_b_sensor.flange)
    annotation (Line(
      points={{0,82},{40,82}},
      color={0,127,0}));
  connect(wheel_mass.flange_b, z_w_sensor.flange)
    annotation (Line(
      points={{0,4},{0,10},{44,10}},
      color={0,127,0}));
  connect(z_road, road_height.s_ref)
    annotation (Line(
      points={{-120,0},{-80,0},{-80,-90},{0,-90},{0,-74}},
      color={0,0,127}));
  connect(z_b_sensor.s, z_b)
    annotation (Line(
      points={{61,82},{80,82},{80,40},{110,40}},
      color={0,0,127}));
  connect(z_w_sensor.s, z_w)
    annotation (Line(
      points={{65,10},{80,10},{80,-40},{110,-40}},
      color={0,0,127}));

  annotation (
    preferredView = "diagram");
end LinearQVM;
