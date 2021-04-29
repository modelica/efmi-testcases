within eFMI_TestCases.M04_DrivetrainTorqueControl.PlantModels;
partial block PlantParameterInterface

  parameter Boolean for_inversion = false
    "Configure interface for either, full plant model or inverse";

  // Common parameters:
  parameter Real gearRatio = 10
    "Gear ratio";
  parameter SI.Inertia J_M = 0.01
    "Moment of inertia";

  // Full plant parameters:
  parameter SI.Time T_M = 3.22e-4 "Time Constant" annotation(Dialog(enable = not for_inversion));
  parameter SI.RotationalSpringConstant c = 4000 "Spring constant" annotation(Dialog(enable = not for_inversion));
  parameter SI.RotationalDampingConstant d = 1 "Damping constant" annotation(Dialog(enable = not for_inversion));
  parameter SI.Inertia J_L = 0.02 "Shaft inertia " annotation(Dialog(enable = not for_inversion));
  parameter SI.Inertia J_w = 1.3 "Wheel inertia" annotation(Dialog(enable = not for_inversion));
  parameter SI.Mass m_quarterCar = 350 "Mass of the sliding mass" annotation(Dialog(enable = not for_inversion));
  parameter SI.Length wheelRadius = 0.3 "Wheel radius" annotation(Dialog(enable = not for_inversion));
  parameter SI.Time T_cf = 1*1e-2 "Time Constant" annotation(Dialog(enable = not for_inversion));

  // Inversive plant parameters:
  parameter SI.RotationalDampingConstant d_res = 1.57 "Damping constant" annotation(Dialog(enable = for_inversion));
  parameter Real k_accCor = -0.0101615216387814 "Gain value multiplied with input signal" annotation(Dialog(enable = for_inversion));
  parameter Real c_res = 4710 "Resulting stiffnes for road and powertrain ~1/((1/c_mu)+1/c)" annotation(Dialog(enable = for_inversion));

  annotation (Icon(graphics={
    Text(
      extent = {{-150,150},{150,110}},
      textString = "%name",
      lineColor = {0,0,255}),
    Rectangle(
      extent = {{-100,100},{100,-100}},
      lineColor = {0,0,0},
      radius = 20)}));
end PlantParameterInterface;
