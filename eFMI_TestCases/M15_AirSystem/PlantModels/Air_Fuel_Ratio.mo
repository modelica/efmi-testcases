within eFMI_TestCases.M15_AirSystem.PlantModels;
model Air_Fuel_Ratio "Air–fuel ratio measurement"
  extends .Modelica.Blocks.Icons.Block;

  .Modelica.Blocks.Interfaces.RealInput m_dot_f(
    unit = "kg/s",
    displayUnit = "g/s")
    "Engine port fuel mass flow"
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
  .Modelica.Blocks.Interfaces.RealInput m_dot_ap(
    unit = "kg/s",
    displayUnit = "g/s")
    "Air mass flow into intake port"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  .Modelica.Blocks.Interfaces.RealOutput AFR(
    unit = "1")
    "Air/fuel ration"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation
  AFR = m_dot_ap/m_dot_f;

  annotation (
    Icon(
      graphics={
        Text(
          extent={{-100,8},{100,78}},
          lineColor={28,108,200},
          fillPattern=FillPattern.Sphere,
          fillColor={184,184,184},
          textString="Air"),
        Text(
          extent={{-100,-76},{100,-6}},
          lineColor={238,46,47},
          fillPattern=FillPattern.Sphere,
          fillColor={184,184,184},
          textString="Fuel"),
        Line(
          points={{-82,0},{82,0}},
          color={0,0,0},
          thickness=0.5)}));
end Air_Fuel_Ratio;
