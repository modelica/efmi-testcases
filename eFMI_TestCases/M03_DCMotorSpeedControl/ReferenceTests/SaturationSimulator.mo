within eFMI_TestCases.M03_DCMotorSpeedControl.ReferenceTests;
model SaturationSimulator
  extends Controllers.ControllerInterface;

  // BEWARE: Must be the same as min and max of in- and outputs of
  //  saturatedController.
  final parameter Real wLoadRef_min = 0.125;
  final parameter Real wLoadRef_max = 2.7;
  final parameter Real wMotor_min = 0;
  final parameter Real wMotor_max = 250;
  final parameter Real vMotor_min = 80;
  final parameter Real vMotor_max = 350;

  final Controllers.PID.SpeedControllerSaturated saturatedController
    annotation (Placement(transformation(extent = {{-10,-10},{10,10}})));

  final Modelica.Blocks.Nonlinear.Limiter limiter_wLoadRef(
    uMax = wLoadRef_max,
    uMin = wLoadRef_min)
    annotation (Placement(transformation(extent = {{-80,-10},{-60,10}})));
  final Modelica.Blocks.Nonlinear.Limiter limiter_wMotor(
    uMax = wMotor_max,
    uMin = wMotor_min)
    annotation (Placement(transformation(
      extent = {{-10,-10},{10,10}},
      rotation = 90,
      origin = {0,-70})));
  final Modelica.Blocks.Nonlinear.Limiter limiter_vMotor(
    uMax = vMotor_max,
    uMin = vMotor_min)
    annotation (Placement(transformation(extent = {{60,-10},{80,10}})));

equation
  connect(wMotor, limiter_wMotor.u)
    annotation (Line(
      points = {{0,-120},{0,-82}},
      color = {0,0,127}));
  connect(wLoadRef, limiter_wLoadRef.u)
    annotation (Line(
      points = {{-120,0},{-82,0}},
      color = {0,0,127}));
  connect(limiter_wLoadRef.y, saturatedController.wLoadRef)
    annotation (Line(
      points = {{-59,0},{-12,0}},
      color = {0,0,127}));
  connect(saturatedController.vMotor, limiter_vMotor.u)
    annotation (Line(
      points = {{11,0},{58,0}},
      color = {0,0,127}));
  connect(limiter_vMotor.y, vMotor)
    annotation (Line(
      points = {{81,0},{110,0}},
      color = {0,0,127}));
  connect(limiter_wMotor.y, saturatedController.wMotor)
    annotation (Line(
      points = {{0,-59},{0,-12}},
      color = {0,0,127}));
end SaturationSimulator;
