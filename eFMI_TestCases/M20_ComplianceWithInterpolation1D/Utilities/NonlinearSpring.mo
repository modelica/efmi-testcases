within eFMI_TestCases.M20_ComplianceWithInterpolation1D.Utilities;
model NonlinearSpring
  "Nonlinear 1D rotational spring (= gear characteristic defined by table)"
  import SI = Modelica.SIunits;

  parameter Real d "Damping factor";

  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (Placement(
        transformation(extent={{90,-10},{110,10}}, rotation=0)));
  eFMI.Tables.CombiTable1Ds table(
    table = [0.0,0.0; 0.0,0.0])
    "Spring characteristic (first column: relativeAngle; second column: torque)"
    annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
  Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relAngleSensor
    annotation (Placement(transformation(extent={{-70,-30},{-50,-10}})));
  Modelica.Mechanics.Rotational.Sources.Torque2 torque
    annotation (Placement(transformation(extent={{56,10},{36,-10}})));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor
    annotation (Placement(transformation(extent={{-70,-70},{-50,-50}})));
  Modelica.Blocks.Math.Gain damping(k=d)
    annotation (Placement(transformation(extent={{-40,-90},{-20,-70}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{19,-50},{39,-30}})));
equation

  connect(torque.flange_a, flange_b)
    annotation (Line(points={{56,0},{100,0}}, color={0,0,0}));
  connect(torque.flange_b, flange_a)
    annotation (Line(points={{36,0},{-100,0}},  color={0,0,0}));
  connect(relSpeedSensor.w_rel, damping.u)
    annotation (Line(points={{-60,-71},{-60,-80},{-42,-80}}, color={0,0,127}));
  connect(damping.y, add.u2) annotation (Line(points={{-19,-80},{0,-80},{0,-46},
          {17,-46}},color={0,0,127}));
  connect(add.y, torque.tau)
    annotation (Line(points={{40,-40},{46,-40},{46,-4}}, color={0,0,127}));
  connect(table.y[1], add.u1) annotation (Line(points={{-19,-40},{-10,-40},{-10,
          -34},{17,-34}},color={0,0,127}));
  connect(flange_a, relAngleSensor.flange_a) annotation (Line(points={{-100,0},
          {-80,0},{-80,-20},{-70,-20}}, color={0,0,0}));
  connect(relAngleSensor.flange_b, flange_b) annotation (Line(points={{-50,-20},
          {86,-20},{86,0},{100,0}}, color={0,0,0}));
  connect(flange_a, relSpeedSensor.flange_a) annotation (Line(points={{-100,0},
          {-80,0},{-80,-60},{-70,-60}}, color={0,0,0}));
  connect(relSpeedSensor.flange_b, flange_b) annotation (Line(points={{-50,-60},
          {86,-60},{86,0},{100,0}}, color={0,0,0}));
  connect(relAngleSensor.phi_rel, table.u)
    annotation (Line(points={{-60,-31},{-60,-40},{-42,-40}}, color={0,0,127}));
  annotation (
    Documentation(info="
<HTML>
<p>
A <b>non-linear 1D rotational spring</b> with a characteristic
which is typical for the elasticity of a gearbox. The elasticity
is described by a function springTorque = f(relativeAngle) and
this function is provided by a table on file (first column = relativeAngle,
second column = springTorque).
</p>
</HTML>
"), Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          lineColor={0,0,255}),
        Line(
          points={{-100,0},{-58,0},{-43,-30},{-13,30},{17,-30},{47,30},{62,0},
              {100,0}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          thickness=0.25,
          arrow={Arrow.None,Arrow.None}),
        Line(points={{-80,-60},{-60,-20},{60,20},{80,60}}, color={255,0,0}),
        Text(
          extent={{-89,-70},{93,-92}},
          lineColor={135,135,135},
          fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          textString="efmi 1D")}));
end NonlinearSpring;
