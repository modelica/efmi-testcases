within eFMI_TestCases.M09_MixingUnit_FBL.TestSetups;
model OpenLoop
  extends BaseSetup;

  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.14,
    freqHz=0.002,
    phase=1.5707963267949,
    offset=0.35)
    annotation (Placement(transformation(extent={{60,-70},{40,-50}})));
  Modelica.Blocks.Sources.Sine sine1(
    amplitude=15,
    freqHz=0.0009,
    offset=311)
    annotation (Placement(transformation(extent={{60,-40},{40,-20}})));

equation
  if is_clocked then
    connect(c.y, controller.c)
      annotation (Line(
        points={{-6.6,-50},{-30,-50},{-30,0},{-12,0}},
        color={0,0,127}));
    connect(T.y, controller.T)
      annotation (Line(
        points={{-6.6,-30},{-20,-30},{-20,-6},{-12,-6}},
        color={0,0,127}));
    connect(sine1.y, T.u)
      annotation (Line(
        points={{39,-30},{7.2,-30}},
        color={0,0,127}));
    connect(sine.y, c.u)
      annotation (Line(
        points={{39,-60},{20,-60},{20,-50},{7.2,-50}},
        color={0,0,127}));
  else
    connect(sine.y, controller.c);
    connect(sine1.y, controller.T);
  end if;

  annotation (
    experiment(StopTime = 300));
end OpenLoop;
