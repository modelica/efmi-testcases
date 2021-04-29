within eFMI_TestCases.M05_ControlledMixingUnit.TestSetups;
model ClosedLoop
  extends BaseSetup;

  PlantModels.MixingUnit mixingUnit
    annotation (Placement(transformation(extent = {{50,-10},{70,10}})));

equation
  if is_clocked then
    // Clocked configuration:
    connect(T_c.y, mixingUnit.T_c)
      annotation (Line(
        points = {{36.6,0},{48,0}},
        color = {0,0,127}));
    connect(mixingUnit.T, T.u)
      annotation (Line(
        points = {{72,-6},{80,-6},{80,-30},{37.2,-30}},
        color = {0,0,127}));
  else
    // Continuous configuration:
    connect(controller.y, mixingUnit.T_c);
    connect(mixingUnit.T, controller.u2);
  end if;

  annotation (
    experiment(
      StopTime = 300.1));
end ClosedLoop;
