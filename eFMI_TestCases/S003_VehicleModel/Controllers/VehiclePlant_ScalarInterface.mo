within eFMI_TestCases.S003_VehicleModel.Controllers;
model VehiclePlant_ScalarInterface
  "Using scalar in- and outputs"
  extends VehicleEquations;

  .Modelica.Blocks.Interfaces.RealInput u1(
    min = -1.0e7,
    max = 1.0e7)
    annotation (Placement(transformation(extent = {{-140,40},{-100,80}})));
  .Modelica.Blocks.Interfaces.RealInput u2(
    min = -1.0e7,
    max = 1.0e7)
    annotation (Placement(transformation(extent = {{-140,-80},{-100,-40}})));
  .Modelica.Blocks.Interfaces.RealOutput x1
    annotation (Placement(transformation(extent = {{100,70},{120,90}})));
  .Modelica.Blocks.Interfaces.RealOutput x2
    annotation (Placement(transformation(extent = {{100,50},{120,70}})));
  .Modelica.Blocks.Interfaces.RealOutput x3
    annotation (Placement(transformation(extent = {{100,30},{120,50}})));
  .Modelica.Blocks.Interfaces.RealOutput x4
    annotation (Placement(transformation(extent = {{100,10},{120,30}})));
  .Modelica.Blocks.Interfaces.RealOutput x5
    annotation (Placement(transformation(extent = {{100,-30},{120,-10}})));
  .Modelica.Blocks.Interfaces.RealOutput x6
    annotation (Placement(transformation(extent = {{100,-50},{120,-30}})));
  .Modelica.Blocks.Interfaces.RealOutput x7
    annotation (Placement(transformation(extent = {{100,-70},{120,-50}})));
  .Modelica.Blocks.Interfaces.RealOutput x8
    annotation (Placement(transformation(extent = {{100,-90},{120,-70}})));

equation
  // Relate inputs:
  delta = u1;
  FyD = u2;

  // Relate outputs:
  {x1,x2,x3,x4,x5,x6,x7,x8} = {sx,sy,psi,phi,vx,vy,r,phidot};
end VehiclePlant_ScalarInterface;
