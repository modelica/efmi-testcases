within eFMI_TestCases.M04_DrivetrainTorqueControl.PlantModels;
model PlantForInversion
  "Driveline setup for use as inverted model form in the controller"
  extends Icons.Drivetrain;
  extends PlantParameterInterface(
      final for_inversion = true);

  .Modelica.Blocks.Interfaces.RealOutput M_l
    "Input signal 2 (u1 = u2)"
    annotation (Placement(transformation(extent={{100,-20},{140,20}}),
        iconTransformation(extent={{100,-20},{140,20}})));
  .Modelica.Blocks.Interfaces.RealInput  M_m
    "Output signal 1 (y1 = y2)"
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  .Modelica.Blocks.Interfaces.RealOutput w_rel
    "Absolute angular velocity of flange as output signal"
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=-90,
      origin={0,-110})));
  .Modelica.Mechanics.Rotational.Sources.Torque torqueDrive
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=0,
      origin={-70,0})));
  .Modelica.Mechanics.Rotational.Sensors.TorqueSensor loadTorque
    annotation (Placement(transformation(extent={{50,10},{70,-10}})));
  .Modelica.Mechanics.Rotational.Components.Fixed fixed
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={76,0})));
  .Modelica.Mechanics.Rotational.Sources.Torque torqueDist
    annotation (Placement(transformation(extent={{0,40},{-20,60}})));
  .Modelica.Blocks.Math.Gain gainAcc(
    k = k_accCor)
    annotation (Placement(transformation(
      extent={{10,-10},{-10,10}},
      rotation=0,
      origin={20,50})));
  Driveline driveline(
    J_M = J_M/(gearRatio*gearRatio),
    gearRatio = gearRatio,
    c = c_res,
    d = d_res)
    annotation (Placement(transformation(extent={{-40,-20},{0,20}})));

equation
  connect(loadTorque.flange_b, fixed.flange)
    annotation (Line(
      points={{70,0},{76,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torqueDist.tau, gainAcc.y)
    annotation (Line(
      points={{2,50},{9,50}},
      color={0,0,127}));
  connect(gainAcc.u,loadTorque. tau)
    annotation (Line(
      points={{32,50},{52,50},{52,11}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(M_l, gainAcc.u)
    annotation (Line(
      points={{120,0},{90,0},{90,50},{32,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(M_m, torqueDrive.tau)
    annotation (Line(
      points={{-110,0},{-82,0}},
      color={0,0,127}));
  connect(torqueDrive.flange, driveline.flange_a)
    annotation (Line(
      points={{-60,0},{-40,0}},
      color={0,0,0}));
  connect(driveline.flange_b, loadTorque.flange_a)
    annotation (Line(
      points={{0,0},{50,0}},
      color={0,0,0}));
  connect(driveline.w_rel, w_rel)
    annotation (Line(
      points={{-20,-22},{-20,-94},{0,-94},{0,-110}},
      color={0,0,127}));
  connect(torqueDist.flange, driveline.flange_b)
    annotation (Line(
      points={{-20,50},{-28,50},{-28,32},{20,32},{20,0},{0,0}},
      color={0,0,0}));

  annotation (
    Diagram(
      graphics={
        Text(
          extent={{-88,92},{82,72}},
          lineColor={28,108,200},
          textString="Invertible model representing a drivetrain with one motor and two wheels connected to the
 motor via a gearbox. The damping and stiffness of the drivetrain has been fitted to the step
 response of the plant model")}),
    Icon(
      graphics={
        Line(
          points={{100,0},{60,80},{60,80}},
          color={0,0,255},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),
        Text(
          extent={{-30,-60},{30,-100}},
          lineColor={0,0,0},
          textString="w_rel"),
        Text(
          extent={{68,14},{98,-16}},
          lineColor={0,0,0},
          textString="M")}));
end PlantForInversion;
