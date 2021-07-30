within eFMI_TestCases.M06_SkyhookGroundhook.PlantModels;
model QuarterVehiclePlant
  "Quarter-vehicle plant model with linear spring and damping control input"
  extends .Modelica.Blocks.Icons.Block;
  extends Icons.QuarterVehicle;

  parameter .Modelica.Units.SI.Mass m_b = 250
    "Quarter-vehicle body mass";
  parameter .Modelica.Units.SI.Mass m_w = 30
    "Wheel unit mass";
  parameter .Modelica.Units.SI.TranslationalSpringConstant c_b = 20000
    "Body spring stiffness";
  parameter .Modelica.Units.SI.TranslationalSpringConstant c_w = 2.5e+5
    "Tire spring stiffness";
  parameter .Modelica.Units.SI.TranslationalDampingConstant d_w = 500
    "Tire damping constant";

  .Modelica.Mechanics.Translational.Components.SpringDamper tireSpringDamper(
    c = c_w,
    d = d_w,
    s_rel(fixed = false),
    v_rel(fixed = false))
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=270,
      origin={-20,-22})));
  .Modelica.Mechanics.Translational.Components.Mass mass_wheel(
    L = 0,
    stateSelect = StateSelect.always,
    m = m_w,
    s(fixed = true),
    a(fixed = false),
    v(fixed = true))
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=270,
      origin={-20,6})));
  .Modelica.Mechanics.Translational.Components.Mass mass_body(
    stateSelect = StateSelect.always,
    L = 0,
    m = m_b,
    v(fixed = true, start = 0),
    s(fixed = true, start = 0))
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=270,
      origin={-20,66})));
  .Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={-20,-54})));
  .Modelica.Mechanics.Translational.Sources.Position position(
    a(fixed = false),
    f_crit = 250,
    v(fixed = true))
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={-20,-78})));
  .Modelica.Mechanics.Translational.Components.Spring spring(
    c = c_b)
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=270,
      origin={0,36})));
  Components.DamperControllable damperControllable(
    dMin = 200,
    dMax = 1000)
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=270,
      origin={-40,36})));
  .Modelica.Blocks.Interfaces.RealInput z_r
    "Road profile input"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  .Modelica.Blocks.Interfaces.RealInput u_d
    "Control signal of damper"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  .Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensorBody
    annotation (Placement(transformation(extent={{30,70},{50,90}})));
  .Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensorWheel
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  .Modelica.Mechanics.Translational.Sensors.RelSpeedSensor relSpeedSensor
    annotation (Placement(transformation(
      extent={{10,10},{-10,-10}},
      rotation=270,
      origin={40,36})));
  .Modelica.Blocks.Interfaces.RealOutput v_wheel
    "Velocity of wheel"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  .Modelica.Blocks.Interfaces.RealOutput v_damper
    "Damper velocity"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
  .Modelica.Blocks.Interfaces.RealOutput v_body
    "Velocity of vehicle body"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));

equation
  connect(mass_wheel.flange_b, tireSpringDamper.flange_a)
    annotation (Line(
      points={{-20,-4},{-20,-12}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(forceSensor.flange_b, tireSpringDamper.flange_b)
    annotation (Line(
      points={{-20,-44},{-20,-32}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(position.flange, forceSensor.flange_a)
    annotation (Line(
      points={{-20,-68},{-20,-64}},
      color={0,127,0}));
  connect(spring.flange_b, mass_wheel.flange_a)
    annotation (Line(
      points={{0,26},{0,16},{-20,16}},
      color={0,127,0}));
  connect(spring.flange_a, mass_body.flange_b)
    annotation (Line(
      points={{0,46},{0,56},{-20,56}},
      color={0,127,0}));
  connect(damperControllable.flange_b, mass_wheel.flange_a)
    annotation (Line(
      points={{-40,26},{-40,16},{-20,16}},
      color={0,127,0}));
  connect(damperControllable.flange_a, mass_body.flange_b)
    annotation (Line(
      points={{-40,46},{-40,56},{-20,56}},
      color={0,127,0}));
  connect(z_r, position.s_ref)
    annotation (Line(
      points={{-120,-60},{-36,-60},{-36,-96},{-20,-96},{-20,-90}},
      color={0,0,127}));
  connect(u_d, damperControllable.d)
    annotation (Line(
      points={{-120,60},{-56,60},{-56,36},{-52,36}},
      color={0,0,127}));
  connect(speedSensorBody.flange, mass_body.flange_a)
    annotation (Line(
      points={{30,80},{-20,80},{-20,76}},
      color={0,127,0}));
  connect(speedSensorWheel.flange, mass_wheel.flange_a)
    annotation (Line(
      points={{30,0},{0,0},{0,16},{-20,16}},
      color={0,127,0}));
  connect(relSpeedSensor.v_rel, v_damper)
    annotation (Line(
      points={{51,36},{72,36},{72,-60},{110,-60}},
      color={0,0,127}));
  connect(speedSensorBody.v, v_body)
    annotation (Line(
      points={{51,80},{80,80},{80,60},{110,60}},
      color={0,0,127}));
  connect(speedSensorWheel.v, v_wheel)
    annotation (Line(
      points={{51,0},{110,0}},
      color={0,0,127}));
  connect(relSpeedSensor.flange_b, spring.flange_a)
    annotation (Line(
      points={{40,46},{0,46}},
      color={0,127,0}));
  connect(relSpeedSensor.flange_a, spring.flange_b)
    annotation (Line(
      points={{40,26},{0,26}},
      color={0,127,0}));

  annotation (
    experiment(
      StopTime=20,
      Interval=0.001),
    Documentation(
      info="<html>
<p>See Savaresi et al. &quot;Semi-Active Suspension Control Design for Vehicles&quot;, 2010 page 41 ff for details on the quarter-vehicle implementation.</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
            100,100}})),
    __Dymola_experimentSetupOutput(events=false));
end QuarterVehiclePlant;
