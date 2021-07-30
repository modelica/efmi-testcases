within eFMI_TestCases.M04_DrivetrainTorqueControl.Controllers;
partial block ControllerInterface "Common interface of torque controllers."
  extends PlantModels.PlantParameterInterface(
    final for_inversion = true);
  extends .Modelica.Blocks.Icons.Block;
  extends eFMI_TestCases.Icons.Controller;

  constant Integer f_order = 2
    "Order of filter";
  parameter Real k_PI = -73
    "Gain of controller";
  parameter Real Ti_PI = 1.25
    "Time constant of Integrator block";
  parameter Real Ni_PI = 1.34
    "Ni*Ti is time constant of anti-windup compensation";
  parameter Real f_cut = 33
    "Cut-off frequency";
  parameter Real k_antiW = 7.03083333333333370000000000000000e+01
    "Gain value multiplied with input signal";
  parameter Real tauM_max = 1230
    "Max motor torque";

  .Modelica.Blocks.Interfaces.RealOutput M_motor(
    min = -1e6,
    max = 1e6)
    annotation (Placement(transformation(extent = {{100,-10},{120.5,10}})));
  .Modelica.Blocks.Interfaces.RealInput M_desired(
    min = -1e6,
    max = 1e6)
    annotation (Placement(transformation(extent = {{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealInput wRel(
    min = -1e4,
    max = 1e4)
    annotation (Placement(transformation(
      rotation = 270,
      extent = {{20,-20},{-20,20}},
      origin = {0,-120})));
end ControllerInterface;
