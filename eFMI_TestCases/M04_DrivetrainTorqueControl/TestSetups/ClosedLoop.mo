within eFMI_TestCases.M04_DrivetrainTorqueControl.TestSetups;
model ClosedLoop
  extends BaseSetup;

  PlantModels.PlantForSimulation plant(
    driveline(
      inertiaDrivelineIn(
        phi(fixed = true),
        w(fixed = true,
          start = 10)),
        Gear(
          w_rel(fixed = true))))
    annotation (Placement(transformation(extent = {{50,-10},{70,10}})));

equation
  if is_clocked then
    // Clocked configuration:
    connect(M_motor.y, plant.tauRef)
      annotation (Line(
        points = {{38.6,0},{48,0}},
        color = {0,0,127}));
    connect(plant.wRel, wRel.u)
      annotation (Line(
        points = {{60,-11},{60,-30},{37.2,-30}},
        color = {0,0,127}));
  else
    // Continuous configuration:
    connect(controller.M_motor, plant.tauRef);
    connect(plant.wRel, controller.wRel);
  end if;

  annotation (
    experiment(
      StopTime = 20.0000001));
end ClosedLoop;
