within eFMI_TestCases.M10_ControlledSliderCrank.PlantModels;
partial model SliderCrank_interface
  extends Modelica.Blocks.Icons.Block;
  extends .eFMI_TestCases.M10_ControlledSliderCrank.Icons.SliderCrank;

  Modelica.Blocks.Interfaces.RealInput tau
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput s
    "Absolute position of flange as output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput phi
    "Absolute angle of flange as output signal"
    annotation (Placement(transformation(extent={{100,-80},{120,-60}})));
end SliderCrank_interface;
