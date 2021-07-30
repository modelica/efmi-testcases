within eFMI_TestCases.M04_DrivetrainTorqueControl.PlantModels;
model Driveline "Physical parts of the driveline between motor and wheel axis"
  parameter .Modelica.Units.SI.Inertia J_M
    "Moment of inertia";
  parameter Real gearRatio
    "Transmission ratio (flange_a.phi/flange_b.phi)";
  parameter .Modelica.Units.SI.RotationalSpringConstant c
    "Spring constant";
  parameter .Modelica.Units.SI.RotationalDampingConstant d
    "Damping constant";

  .Modelica.Mechanics.Rotational.Components.Inertia inertiaDrivelineIn(
    phi(start = 0),
    w(start = 0),
    J = J_M)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  .Modelica.Mechanics.Rotational.Components.SpringDamper Gear(
    phi_rel0(displayUnit = "rad"),
    phi_rel(fixed = true),
    c = c,
    d = d)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  .Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=gearRatio)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  .Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=0,
      origin={20,-40})));
  .Modelica.Blocks.Interfaces.RealOutput w_rel
    "Absolute angular velocity of flange as output signal"
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=-90,
      origin={0,-110})));
  .Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  .Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

equation
  connect(inertiaDrivelineIn.flange_b,idealGear. flange_a)
    annotation (Line(
      points={{-30,0},{-20,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear.flange_b,Gear. flange_a)
    annotation (Line(
      points={{0,0},{10,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(relSpeedSensor.flange_a, idealGear.flange_b)
    annotation (Line(
      points={{10,-40},{0,-40},{0,0}},
      color={0,0,0}));
  connect(relSpeedSensor.w_rel, w_rel)
    annotation (Line(
      points={{20,-51},{20,-60},{0,-60},{0,-110}},
      color={0,0,127}));
  connect(Gear.flange_b, relSpeedSensor.flange_b)
    annotation (Line(
      points={{30,0},{40,0},{40,-40},{30,-40}},
      color={0,0,0}));
  connect(inertiaDrivelineIn.flange_a,flange_a)
    annotation (Line(
      points={{-50,0},{-100,0}},
      color={0,0,0}));
  connect(Gear.flange_b,flange_b)
    annotation (Line(
      points={{30,0},{100,0}},
      color={0,0,0}));

  annotation (
    Icon(
      graphics={
        Line(
          points={{-60,0},{0,-50},{60,0}},
          color={28,108,200},
          pattern=LinePattern.Dash),
        Line(
          points={{0,-50},{0,-100}},
          color={28,108,200},
          pattern=LinePattern.Dash),
        Ellipse(
          extent={{-10,-40},{10,-60}},
          lineColor={28,108,200},
          pattern=LinePattern.Dash,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,20},{-40,-20}},
          lineColor = {0,0,0},
          fillColor = {255,85,85},
          fillPattern = FillPattern.HorizontalCylinder),
        Rectangle(
          extent = {{-6,-45},{6,45}},
          lineColor = {95,95,95},
          fillColor = {215,215,215},
          fillPattern = FillPattern.VerticalCylinder,
          origin={5,0},
          rotation = 90),
        Rectangle(
          extent={{50,10},{70,-10}},
          lineColor = {0,0,0},
          fillColor = {95,95,95},
          fillPattern = FillPattern.Solid),
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor = {0,0,0},
          radius = 20),
        Line(
          points={{-4,-50},{4,-50}},
          color={28,108,200},
          thickness=1),
        Text(
          extent={{-30,-60},{30,-100}},
          lineColor={0,0,0},
          textString="w_rel"),
        Text(
          extent={{-160,140},{160,100}},
          lineColor={28,108,200},
          textString="%name")}));
end Driveline;
