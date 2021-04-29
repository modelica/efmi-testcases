within eFMI_TestCases.M03_DCMotorSpeedControl.TestSetups;
partial model ClosedLoop
  extends BaseSetup;

  PlantModels.PlantForSimulation plant
    annotation (Placement(transformation(extent = {{50,-10},{70,10}})));

equation
  if is_clocked then
    connect(vMotor.y, plant.vRef)
      annotation (Line(
        points = {{38.6,0},{48,0}},
        color = {0,0,127}));
    connect(plant.wMotor, wMotor.u)
      annotation (Line(
        points = {{60,-11},{60,-50},{0,-50},{0,-37.2}},
        color = {0,0,127}));
  else
    connect(speedController.vMotor, plant.vRef);
    connect(plant.wMotor, speedController.wMotor);
  end if;
end ClosedLoop;
