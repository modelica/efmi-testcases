within eFMI_TestCases.M01_SimplePI.TestSetups;
model ClosedLoop
  extends BaseSetup;

  PlantModels.IdealMotorAndLoad plant
    annotation (Placement(transformation(extent={{40,-60},{20,-40}})));

equation
  if is_clocked then
    connect(u.y, plant.tau)
      annotation (Line(
        points={{36.6,0},{60,0},{60,-50},{42,-50}},
        color={0,0,127}));
    connect(plant.w, y.u)
      annotation (Line(
        points={{19,-50},{-4.44089e-16,-50},{-4.44089e-16,-37.2}},
        color={0,0,127}));
  else
    connect(controller.u, plant.tau);
    connect(plant.w, controller.y);
  end if;

  annotation (
    experiment(
      StopTime = 4));
end ClosedLoop;
