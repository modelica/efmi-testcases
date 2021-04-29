within eFMI_TestCases.M09_MixingUnit_FBL.TestSetups;
model ClosedLoop
  extends BaseSetup;

  M05_ControlledMixingUnit.PlantModels.MixingUnit mixingUnit(
    pro = 1.1)
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));

equation
  if is_clocked then
    connect(T_c.y, mixingUnit.T_c)
      annotation (Line(
        points={{36.6,0},{48,0}},
        color={0,0,127}));
    connect(mixingUnit.c, c.u)
      annotation (Line(
        points={{72,6},{90,6},{90,-50},{7.2,-50}},
        color={0,0,127}));
    connect(mixingUnit.T, T.u)
      annotation (Line(
        points={{72,-6},{80,-6},{80,-30},{7.2,-30}},
        color={0,0,127}));
  else
    connect(controller.T_c, mixingUnit.T_c);
    connect(mixingUnit.c, controller.c);
    connect(mixingUnit.T, controller.T);
  end if;

  annotation (
    experiment(StopTime = 300));
end ClosedLoop;
