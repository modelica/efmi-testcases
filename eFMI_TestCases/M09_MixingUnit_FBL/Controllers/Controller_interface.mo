within eFMI_TestCases.M09_MixingUnit_FBL.Controllers;
partial model Controller_interface
  extends .Modelica.Blocks.Icons.Block;
  extends Icons.Controller;

  .Modelica.Blocks.Interfaces.RealInput ref(
    min = 0,
    max = 1000)
    annotation (Placement(transformation(extent = {{-140,40},{-100,80}})));
  .Modelica.Blocks.Interfaces.RealInput T(
    min = 0,
    max = 1000)
    annotation (Placement(transformation(extent = {{-140,-80},{-100,-40}})));
  .Modelica.Blocks.Interfaces.RealInput c(
    min = 0,
    max = 1000)
    annotation (Placement(transformation(extent = {{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealOutput T_c(
    min = 0,
    max = 1000)
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));

  annotation (preferredView = "info");
end Controller_interface;
