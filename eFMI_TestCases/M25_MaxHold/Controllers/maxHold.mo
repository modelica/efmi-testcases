within eFMI_TestCases.M25_MaxHold.Controllers;
model maxHold
  extends maxHold_interface;

  Real x(start = xMin);
  Real t(start = holdDuration+1);

protected
  parameter Real xMin=
    if uMin>1 then 0.5*uMin
    elseif uMin<-1 then 1.5*uMin
    else -2;

equation
  when der(u) < 0 then
    reinit(t,0);
    reinit(x,u);
  end when;

  der(t) = if t<holdDuration+1 then 1 else 0;
  der(x) = if t>=holdDuration and x>xMin then fallingRate else 0;

  y = max(x,u);
end maxHold;
