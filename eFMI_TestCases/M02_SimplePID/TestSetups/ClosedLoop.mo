within eFMI_TestCases.M02_SimplePID.TestSetups;
model ClosedLoop
  extends BaseSetup;

  PlantModels.SimpleDrivetrain plant
    annotation (Placement(transformation(extent={{70,-60},{50,-40}})));

equation
  if is_clocked then
    connect(y.y, plant.tau)
      annotation (Line(
        points={{66.6,0},{90,0},{90,-50},{72,-50}},
        color={0,0,127}));
    connect(plant.w, u_m.u)
      annotation (Line(
        points={{49,-50},{30,-50},{30,-37.2}},
        color={0,0,127}));
  else
    connect(controller.y, plant.tau);
    connect(plant.w, controller.u_m);
  end if;

  annotation (
    experiment(
      StopTime = 4));
end ClosedLoop;
