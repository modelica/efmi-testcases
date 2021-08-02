within eFMI_TestCases.M04_DrivetrainTorqueControl.PlantModels;
model PlantForSimulation
  "Vehicle plant with drivetrain, motor dynamics approximated as PT1 and 1D longitudinal vehicle dynamics"
  extends Icons.Drivetrain;
  extends PlantParameterInterface(
    final for_inversion = false);

  .Modelica.Blocks.Interfaces.RealInput tauRef
    "Demanded motor torque"
    annotation (Placement(
      transformation(extent={{-260,-20},{-220,20}}),
      iconTransformation(extent={{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealOutput loadTorque
    annotation (Placement(
      transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={110,0}),
      iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,0})));

  eFMI_TestCases.M04_DrivetrainTorqueControl.Utilities.SimpleWheelRconst tire(
    wheelRadius = wheelRadius,
    J = J_w)
    annotation (Placement(transformation(extent={{60,-10},{80,10}}, rotation=0)));

  .Modelica.Mechanics.Translational.Components.Mass massHalfCar(
    v(start = 1.5),
    m = 2*m_quarterCar,
    s(start = 0,
      fixed = false))
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=-90,
      origin={70,-30})));
  .Modelica.Mechanics.Rotational.Sources.Torque torqueDrive
    annotation (Placement(transformation(extent={{-168,-10},{-148,10}})));
  .Modelica.Mechanics.Rotational.Sensors.TorqueSensor M_l_i
    annotation (Placement(transformation(extent={{36,10},{56,-10}})));

  Real c1 "Road parameter";
  Real c2 "Road parameter";
  Real c3 "Road parameter";

  .Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{60,-60},{40,-40}})));
  eFMI_TestCases.M04_DrivetrainTorqueControl.Utilities.AirResistance airResistanceHalfCar(
    area = 0.5*2.19)
    annotation (Placement(transformation(extent={{60,-90},{40,-70}})));
  .Modelica.Blocks.Sources.Constant v_wind(
    k = 0)
    "v_wind<0 entspr. Gegenwind"
    annotation (Placement(transformation(extent={{100,-100},{80,-80}})));

  .Modelica.Blocks.Continuous.FirstOrder motorPT1(
    T = T_M,
    initType = .Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-200,-10},{-180,10}})));

  .Modelica.Mechanics.Rotational.Sensors.AccSensor acc_wl
    annotation (Placement(transformation(
      extent={{10,-10},{-10,10}},
      rotation=270,
      origin={56,30})));

  eFMI_TestCases.M04_DrivetrainTorqueControl.Utilities.LoadMirror wheelLoadMirror
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  .Modelica.Blocks.Math.Gain twoWheelTorque(
    k = 2)
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=0,
      origin={64,60})));
  .Modelica.Blocks.Interfaces.RealOutput wRel
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=-90,
      origin={-60,-110}), iconTransformation(
      extent={{-10,-10},{10,10}},
      rotation=-90,
      origin={0,-110})));
  Driveline driveline(
    J_M = J_M,
    gearRatio = gearRatio,
    c = c,
    d = d)
    annotation (Placement(transformation(extent={{-80,-20},{-40,20}})));
  .Modelica.Mechanics.Rotational.Components.Inertia inertiaDrivelineOut(
    J = J_L)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));

equation
  //Data is based on Automotive Control Systems, page 322 table 8.3

  //AsphaltDry
  c1 = 1.2801;
  c2 = 23.99;
  c3 = 0.52;

  connect(tire.roadFlange, massHalfCar.flange_a)
    annotation (Line(
      points={{70,-10},{70,-10},{70,-20}},
      color={0,127,0}));
  connect(M_l_i.flange_b, tire.hubFlange)
    annotation (Line(
      points={{56,0},{60,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speedSensor.flange, massHalfCar.flange_b)
    annotation (Line(
      points={{60,-50},{70,-50},{70,-40}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(speedSensor.flange, airResistanceHalfCar.flange_a)
    annotation (Line(
      points={{60,-50},{70,-50},{70,-80},{60,-80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(v_wind.y, airResistanceHalfCar.v_wind)
    annotation (Line(
      points={{79,-90},{70,-90},{70,-86},{62,-86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(M_l_i.flange_b, acc_wl.flange)
    annotation (Line(
      points={{56,0},{56,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(motorPT1.y, torqueDrive.tau)
    annotation (Line(
      points={{-179,0},{-179,0},{-170,0}},
      color={0,0,127}));
  connect(tauRef, motorPT1.u)
    annotation (Line(
      points={{-240,0},{-202,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(torqueDrive.flange, wheelLoadMirror.flange_a)
    annotation (Line(
      points={{-148,0},{-120,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(M_l_i.tau, twoWheelTorque.u)
    annotation (Line(
      points={{38,11},{38,60},{52,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(twoWheelTorque.y, loadTorque)
    annotation (Line(
      points={{75,60},{90,60},{90,0},{110,0}},
      color={0,0,127}));
  connect(wheelLoadMirror.flange_b, driveline.flange_a)
    annotation (Line(
      points={{-100,0},{-80,0}},
      color={0,0,0}));
  connect(wRel, driveline.w_rel)
    annotation (Line(
      points={{-60,-110},{-60,-22}},
      color={0,0,127}));
  connect(driveline.flange_b, inertiaDrivelineOut.flange_a)
    annotation (Line(
      points={{-40,0},{0,0}},
      color={0,0,0}));
  connect(M_l_i.flange_a, inertiaDrivelineOut.flange_b)
    annotation (Line(
      points={{36,0},{20,0}},
      color={0,0,0}));

  annotation (
    Diagram(
      coordinateSystem(preserveAspectRatio=false,
      extent={{-220,-100},{100,100}})),
    Icon(
      coordinateSystem(extent={{-100,-100},{100,100}},
      preserveAspectRatio=false),
      graphics={
        Line(
          points={{-10,-70},{-20,-60},{-20,-20},{-40,0}},
          color={0,0,255},
          pattern=LinePattern.Dash),
        Line(
          points={{10,-70},{20,-60},{20,20},{60,80}},
          color={0,0,255},
          pattern=LinePattern.Dash),
        Line(
          points={{100,0},{92,0},{60,80}},
          color={0,0,255},
          pattern=LinePattern.Dash),
        Line(
          points={{100,0},{92,0},{60,-80}},
          color={0,0,255},
          pattern=LinePattern.Dash),
        Text(
          extent={{0,-74},{40,-94}},
          lineColor={0,0,0},
          textString="rel"),
        Text(
          extent={{-30,-50},{30,-90}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          fontName="Symbol",
          textString="w"),
        Text(
          extent={{50,60},{110,0}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          fontName="Symbol",
          textString="t")}));
end PlantForSimulation;
