within eFMI_TestCases.M06_SkyhookGroundhook.PlantModels.Components;
model DamperControllable
  "Linear 1D translational damper with controllable damping coefficient"
  extends
    .Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  extends
    .Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;

  parameter Real dMax = 200
    "Upper limits of controllable damper coefficient";
  parameter Real dMin = 100
    "Lower limits of controllable damper coefficient";

  .Modelica.Blocks.Interfaces.RealInput d
    "Control signal of damper (variable damping coefficient)"
    annotation (Placement(
      transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-110}),
      iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  .Modelica.Blocks.Nonlinear.Limiter limiter(
    uMax = dMax,
    uMin = dMin)
    annotation (Placement(transformation(
      extent={{-8,-8},{8,8}},
      rotation=90,
      origin={0,-68})));

equation
  f = limiter.y*v_rel;
  lossPower = f*v_rel;

  connect(limiter.u, d)
    annotation (Line(
      points={{-5.55112e-016,-77.6},{-5.55112e-016,-87.8},{0,-87.8},{0,-110}},
      color={0,0,127}));

  annotation (
    Icon(
      graphics={
        Line(
          points={{-90,0},{-60,0}}, color={0,0,0}),
          Line(points={{-60,-30},{-60,30}}),
          Line(points={{-60,-30},{60,-30}}),
          Line(points={{-60,30},{60,30}}),
          Rectangle(
            extent={{-60,30},{30,-30}},
            lineColor={0,0,0},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{30,0},{90,0}}),
          Polygon(
            points={{50,-90},{20,-80},{20,-100},{50,-90}},
            lineColor={128,128,128},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Line(points={{-60,-90},{20,-90}}),
          Text(
            extent={{-150,90},{150,50}},
            textString="%name",
            lineColor={0,0,255}),
          Text(
            extent={{-150,-45},{150,-75}},
            lineColor={0,0,0},
            textString="d=%d"),
          Line(
            visible=useHeatPort,
            points={{-100,-100},{-100,-20},{-14,-20}},
            color={191,0,0},
            pattern=LinePattern.Dot)}),
    Diagram(
      graphics={
        Line(points={{-90,0},{-60,0}}, color={0,0,0}),
        Line(points={{-60,-30},{-60,30}}),
        Line(points={{-60,-30},{60,-30}}),
        Line(points={{-60,30},{60,30}}),
        Rectangle(
          extent={{-60,30},{30,-30}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{30,0},{90,0}}),
        Line(points={{-50,60},{50,60}}, color={128,128,128}),
        Polygon(
          points={{50,63},{60,60},{50,57},{50,63}},
          lineColor={128,128,128},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-58,68},{42,78}},
          lineColor={128,128,128},
          textString="der(s_rel)")}),
    Documentation(info="<html>
<p>
<i>Linear, velocity dependent damper</i> element. It can be either connected
between a sliding mass and the housing (model Fixed), or
between two sliding masses.
</p>

</html>"));
end DamperControllable;
