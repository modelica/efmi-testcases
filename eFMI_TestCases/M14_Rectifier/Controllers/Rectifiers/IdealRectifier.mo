within eFMI_TestCases.M14_Rectifier.Controllers.Rectifiers;
model IdealRectifier
  extends Icons.Rectifier;

  parameter Real threshold = 1;

  .Modelica.Electrical.Analog.Interfaces.PositivePin p1
    "Positive pin of the left port (potential p1.v > n1.v for positive voltage drop v1)"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  .Modelica.Electrical.Analog.Interfaces.NegativePin n1
    "Negative pin of the left port"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  .Modelica.Electrical.Analog.Interfaces.PositivePin p2
    "Positive pin of the right port (potential p2.v > n2.v for positive voltage drop v2)"
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  .Modelica.Electrical.Analog.Interfaces.NegativePin n2
    "Negative pin of the right port"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));

  Boolean i1_rising "edge detection";

equation
  //introduce some hystereses to avoid jittering at i=0
  i1_rising = p1.i > threshold or pre(i1_rising) and p1.i >= -threshold;
  //ideal switching behavior
  if i1_rising then
     p2.i = p1.i;
     n2.i = n1.i;
     p2.v = p1.v;
     n2.v = n1.v;
  else
     p2.i = n1.i;
     n2.i = p1.i;
     p2.v = n1.v;
     n2.v = p1.v;
  end if;
end IdealRectifier;
