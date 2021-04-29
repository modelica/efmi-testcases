within eFMI_TestCases.M04_DrivetrainTorqueControl.Utilities;
model DesiredTorque

   parameter Real tauM_max=1230 "Max motor torque";
   parameter Real tauRate_max=2000 "Max motor torque rate";

  Modelica.Blocks.Sources.Pulse pulse(
    startTime=0.1,
    width=30,
    period=2,
    amplitude=0.2*tauM_max)
    annotation (Placement(transformation(extent={{-61,20},{-41,40}})));
  Modelica.Blocks.Sources.Ramp ramp(
    duration=20,
    startTime=5,
    height=0.8*tauM_max)
    annotation (Placement(transformation(extent={{-61,-40},{-41,-20}})));
  Modelica.Blocks.Math.Add add(k1=+1, k2=+1)
    annotation (Placement(transformation(extent={{41,-10},{61,10}})));
   Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(
        transformation(rotation=0, extent={{100,-10},{119.5,10}})));
  Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter(Rising=tauRate_max)
    annotation (Placement(transformation(extent={{72,-10},{92,10}})));
equation
  connect(ramp.y, add.u2) annotation (Line(points={{-40,-30},{0,-30},{0,-6},{39,
          -6}}, color={0,0,127}));
  connect(pulse.y, add.u1) annotation (Line(points={{-40,30},{-20,30},{0,30},{0,
          6},{39,6}}, color={0,0,127}));
  connect(y, slewRateLimiter.y) annotation (Line(
      points={{109.75,0},{93,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(slewRateLimiter.u, add.y) annotation (Line(
      points={{70,0},{62,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false), graphics),                         Icon(
        coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=
            false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          radius=20),
        Line(
          points={{-82,-72},{-54,-66},{-54,20},{-26,28},{-26,-62},{4,-54},{4,34},
              {34,42},{34,-48},{64,-38},{64,48},{90,56}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-150,110},{150,140}},
          lineColor={0,0,255},
          textString="%name")}));
end DesiredTorque;
