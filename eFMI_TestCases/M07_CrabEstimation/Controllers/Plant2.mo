within eFMI_TestCases.M07_CrabEstimation.Controllers;
model Plant2
  extends PartialPlantInterface;
parameter Real m=2.17 "Load mass";
parameter Real J=1.232 "Load inertia";
parameter Real l=2.15 "Crab length";
parameter Real g=9.81 "Gravity acceleration";
parameter Real mCrab=8.42 "Crab mass";

parameter Real angle_init = 1.0;
parameter Real w_init = -1;
parameter Real s_init = 0;
parameter Real v_init = 0;

final parameter Integer nx=4;
final parameter Integer nu=1;
final parameter Integer ny=2;

Real x[nx](start={angle_init,w_init,s_init,v_init}, each fixed = true) "States";
Real u[nu] "Inputs";
Real y[ny];

initial equation
x[1] = angle_init;
x[2] = w_init;
x[3] = s_init;
x[4] = v_init;

protected
Real dx4aux;

equation
u = {force};

dx4aux =(u[1] + m*m*g*l*l*cos(x[1])*sin(x[1])/(J + m*l*l) + m*l*sin(x[1])*x[2]
  *x[2])/(mCrab + m - m*m*l*l*cos(x[1])*cos(x[1])/(J + m*l*l));
der(x) = {x[2],(-m*g*l*sin(x[1]) - m*l*cos(x[1])*dx4aux)/(J + m*l*l),x[4],
  dx4aux};

  y = {x[3] + l*sin(x[1]),x[3]};
  y = {y1,y2};

  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
          {100,100}})),     Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-100,-100},{100,100}})));
end Plant2;
