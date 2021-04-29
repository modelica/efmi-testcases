within eFMI_TestCases.M25_MaxHold.Controllers;
model maxHold_WithFilter
  extends maxHold_interface;

  parameter Integer n=3 "Order of filter";
  parameter Modelica.SIunits.Frequency f=4 "Cut-off frequency";

  maxHold maxhold(
    holdDuration=holdDuration,
    fallingRate=fallingRate,
    uMin=uMin) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Continuous.CriticalDamping criticalDamping(
    n=n,
    f=f,
    initType=Modelica.Blocks.Types.Init.NoInit)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));

equation
  connect(maxhold.y, y)
    annotation (Line(points={{41,0},{110,0}}, color={0,0,127}));
  connect(u, criticalDamping.u)
    annotation (Line(points={{-120,0},{-42,0}}, color={0,0,127}));
  connect(criticalDamping.y, maxhold.u)
    annotation (Line(points={{-19,0},{18,0}}, color={0,0,127}));
end maxHold_WithFilter;
