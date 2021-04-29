within eFMI_TestCases.M01_SimplePI.PlantModels;
model IdealMotorAndLoad "Ideal model of a motor+load"
  extends .Modelica.Blocks.Icons.Block;
  extends Icons.Motor;

  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-25,-10},{-5,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia load(
    phi(fixed=true, start=0),
    w(fixed=true, start=0),
    J=J)
    annotation (Placement(transformation(extent={{2,-10},{22,10}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speed       annotation (
     Placement(transformation(
        extent={{-10,-10},{6,6}},
        rotation=-90,
        origin={32,-25})));
  Modelica.Blocks.Interfaces.RealInput tau "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput w "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Modelica.SIunits.Inertia J=10 "Moment of inertia";
equation
  connect(torque.flange, load.flange_a)
    annotation (Line(points={{-5,0},{-1.5,0},{2,0}}, color={0,0,0}));
  connect(load.flange_b, speed.flange)
    annotation (Line(points={{22,0},{30,0},{30,-15}}, color={0,0,0}));
  connect(tau, torque.tau)
    annotation (Line(points={{-120,0},{-27,0},{-27,0}}, color={0,0,127}));
  connect(speed.w, w) annotation (Line(points={{30,-31.8},{30,-31.8},{30,-46},{
          30,-48},{80,-48},{80,0},{110,0}},
                                         color={0,0,127}));
end IdealMotorAndLoad;
