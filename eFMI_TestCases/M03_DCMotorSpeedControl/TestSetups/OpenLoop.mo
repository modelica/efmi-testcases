within eFMI_TestCases.M03_DCMotorSpeedControl.TestSetups;
partial model OpenLoop
  extends BaseSetup;

  Modelica.Blocks.Sources.Ramp plant(
    height = 305,
    duration = 0.95,
    offset = 10,
    startTime = 0.05)
    annotation (Placement(transformation(extent={{-70,-70},{-50,-50}})));

equation
  if is_clocked then
    connect(plant.y, wMotor.u)
      annotation (Line(
        points={{-49,-60},{0,-60},{0,-37.2}},
        color = {0,0,127}));
  else
    connect(plant.y, speedController.wMotor);
  end if;
end OpenLoop;
