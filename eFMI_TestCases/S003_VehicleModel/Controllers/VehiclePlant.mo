within eFMI_TestCases.S003_VehicleModel.Controllers;
model VehiclePlant
  "Using vector in- and outputs"
  extends VehicleEquations;

  .Modelica.Blocks.Interfaces.RealInput u[2](
    each min = -1.0e7,
    each max = 1.0e7)
    annotation (Placement(transformation(extent = {{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealOutput x[8]
    annotation (Placement(transformation(extent = {{100,-10},{120,10}})));

equation
  // Relate inputs:
  delta = u[1];
  FyD = u[2];

  // Relate outputs:
  x = {sx,sy,psi,phi, vx,vy,r,phidot};
end VehiclePlant;
