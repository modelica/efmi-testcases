within eFMI_TestCases.M04_DrivetrainTorqueControl.Utilities;
model LoadMirror

  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
  "Left flange of shaft"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
  "Right flange of shaft"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-50,-40},{-70,-20}})));
  Modelica.Blocks.Math.Gain gain(k=-1)
    annotation (Placement(transformation(extent={{-20,-40},{-40,-20}})));
equation
  connect(torqueSensor.flange_a, flange_a) annotation (Line(
      points={{-10,0},{-100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torqueSensor.flange_b, flange_b) annotation (Line(
      points={{10,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torque.flange, flange_a) annotation (Line(
      points={{-70,-30},{-100,-30},{-100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torque.tau, gain.y) annotation (Line(
      points={{-48,-30},{-41,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.u, torqueSensor.tau) annotation (Line(
      points={{-18,-30},{-8,-30},{-8,-11}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          radius=20,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-40,20},{34,-20}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="2x "),
        Polygon(
          points={{60,54},{60,-54},{-64,0},{60,54}},
          lineColor={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-100,0},{-64,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{60,0},{100,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Text(
          extent={{-4,38},{64,-20}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="t",
          fontName="Symbol")}));
end LoadMirror;
