within eFMI_TestCases.M10_ControlledSliderCrank.Controllers;
partial block Controller_interface
  extends Modelica.Blocks.Icons.Block;
  extends .eFMI_TestCases.Icons.Controller;

  Modelica.Blocks.Interfaces.RealInput s_ref(min=-100, max=100)
    annotation (Placement(transformation(extent={{-140,50},{-100,90}})));
  Modelica.Blocks.Interfaces.RealOutput tau(min=-1e5, max=1e5)
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput phi(min=-1000, max=1000)
    annotation (Placement(transformation(extent={{-140,-90},{-100,-50}})));

  annotation (preferredView = "info");
end Controller_interface;
