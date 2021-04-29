within eFMI_TestCases.S001_PIDController.Utilities;
block PID "PID-controller in additive description form"
  extends Modelica.Blocks.Interfaces.SISO;

  parameter Real k(unit="1")=1 "Gain";
  parameter Modelica.SIunits.Time Ti(min=Modelica.Constants.small, start=0.5)
    "Time Constant of Integrator";
  parameter Modelica.SIunits.Time Td(min=Modelica.Constants.small, start=0.1)
    "Time Constant of Derivative block";
  parameter Real kd(unit="1")=1 "Gain for derivative block";

  Integrator        I(k=1/Ti)
    "Integral part of PID controller"
    annotation (Placement(transformation(extent={{-60,-20},{-20,20}})));
  Derivative        D(
    k=kd,
    T=Td,
    x_start=0.0)
          "Derivative part of PID controller"
    annotation (Placement(transformation(extent={{-60,-80},{-20,-40}})));
  Modelica.Blocks.Math.Gain Gain(k=k) "Gain of PID controller"
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));

  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Math.Gain
                   P(k=1) "Proportional part of PID controller"
    annotation (Placement(transformation(extent={{-60,40},{-20,80}})));
equation
  connect(u, I.u)
    annotation (Line(points={{-120,0},{-64,0}}, color={0,0,127}));
  connect(u, D.u) annotation (Line(points={{-120,0},{-80,0},{-80,-60},{-64,-60}},
                 color={0,0,127}));
  connect(Gain.y, y)
    annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
  connect(add3_1.y, Gain.u)
    annotation (Line(points={{41,0},{58,0}}, color={0,0,127}));
  connect(u, P.u) annotation (Line(points={{-120,0},{-80,0},{-80,60},{-64,60}},
        color={0,0,127}));
  connect(D.y, add3_1.u3) annotation (Line(points={{-18,-60},{0,-60},{0,-8},{18,
          -8}}, color={0,0,127}));
  connect(I.y, add3_1.u2)
    annotation (Line(points={{-18,0},{18,0}}, color={0,0,127}));
  connect(P.y, add3_1.u1)
    annotation (Line(points={{-18,60},{0,60},{0,8},{18,8}}, color={0,0,127}));
  annotation (defaultComponentName="PID",
    Icon(
        coordinateSystem(preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}}),
            graphics={
        Line(points={{-80.0,78.0},{-80.0,-90.0}},
            color={192,192,192}),
      Polygon(lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
      Line(points={{-90.0,-80.0},{82.0,-80.0}},
          color={192,192,192}),
      Polygon(lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          points={{90.0,-80.0},{68.0,-72.0},{68.0,-88.0},{90.0,-80.0}}),
      Line(points = {{-80,-80},{-80,-20},{60,80}}, color = {0,0,127}),
      Text(lineColor={192,192,192},
          extent={{-20.0,-60.0},{80.0,-20.0}},
          textString="PID"),
      Text(extent={{-150.0,-150.0},{150.0,-110.0}},
          textString="Ti=%Ti")}),
    Documentation(info="<html>
<p>This is a modified (simplified) version of the model Modelica.Blocks.Continuous.PID.</p>
</html>"));
end PID;
