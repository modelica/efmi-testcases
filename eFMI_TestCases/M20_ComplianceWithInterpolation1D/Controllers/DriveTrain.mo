within eFMI_TestCases.M20_ComplianceWithInterpolation1D.Controllers;
block DriveTrain
  extends Modelica.Blocks.Icons.Block;
  extends Icons.Controller;

  Modelica.Mechanics.Rotational.Components.Inertia inertia(
    J=5,
    a(fixed=false),
    w(fixed=true, start=0),
    phi(
      fixed=true,
      displayUnit="rad",
      start=0))                          annotation (Placement(transformation(
          extent={{28,-10},{48,10}}, rotation=0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed(exact=true)
    annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
  Utilities.NonlinearSpring nonlinearSpring(
    table(
      table = [-0.002,-500; -0.001,-200; 0,0; 0.001,200; 0.002,500]),
    d = 200)
    annotation (Placement(transformation(extent={{-26,-10},{-6,10}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{54,-10},{74,10}})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor
    annotation (Placement(transformation(extent={{2,-10},{22,10}})));
  Modelica.Blocks.Interfaces.RealInput w_ref(min=-50,max=50)
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput w(min=-50,max=50)
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput torque
    "Torque in flange flange_a and flange_b (tau = flange_a.tau = -flange_b.tau) as output signal"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
  Modelica.Blocks.Interfaces.RealOutput w_diff(min=-100, max=100) annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Math.Feedback diff annotation (Placement(transformation(extent={{70,50},{90,70}})));
  Modelica.Blocks.Continuous.CriticalDamping criticalDamping(
    n=1,
    f=50,
    normalized=false,
    initType=Modelica.Blocks.Types.Init.InitialState)
                                                     annotation (Placement(transformation(extent={{-80,-8},
            {-64,8}})));
equation
  connect(speed.flange,nonlinearSpring. flange_a)
    annotation (Line(points={{-34,0},{-26,0}}, color={0,0,0}));
  connect(inertia.flange_b,speedSensor. flange)
    annotation (Line(points={{48,0},{54,0}}, color={0,0,0}));
  connect(torqueSensor.flange_a,nonlinearSpring. flange_b)
    annotation (Line(points={{2,0},{-6,0}}, color={0,0,0}));
  connect(torqueSensor.flange_b,inertia. flange_a)
    annotation (Line(points={{22,0},{28,0}}, color={0,0,0}));
  connect(speedSensor.w, w)
    annotation (Line(points={{75,0},{110,0}}, color={0,0,127}));
  connect(torqueSensor.tau, torque)
    annotation (Line(points={{4,-11},{4,-60},{110,-60}},   color={0,0,127}));
  connect(diff.y, w_diff) annotation (Line(points={{89,60},{110,60}}, color={0,0,127}));
  connect(speedSensor.w, diff.u2) annotation (Line(points={{75,0},{80,0},{80,52}}, color={0,0,127}));
  connect(w_ref, diff.u1) annotation (Line(points={{-120,0},{-90,0},{-90,60},{
          72,60}},                                                                     color={0,0,127}));
  connect(criticalDamping.y, speed.w_ref) annotation (Line(points={{-63.2,0},{
          -56,0}},                                                                     color={0,0,127}));
  connect(w_ref, criticalDamping.u) annotation (Line(points={{-120,0},{-81.6,0}}, color={0,0,127}));
end DriveTrain;
