within eFMI_TestCases.M07_CrabEstimation.TestSetups;
model TestPlantModels_DASSL
 extends Modelica.Icons.Example;

 parameter Real angle_init = 1.0;
 parameter Real w_init = -1;
 parameter Real s_init = 0;
 parameter Real v_init = 0;

  Controllers.Plant1 crab1(
    angle_init=angle_init,
    w_init=w_init,
    s_init=s_init,
    v_init=v_init)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
Modelica.Blocks.Sources.Sine sine(
  freqHz=0.5,
  startTime=1,
  amplitude=50,
  offset=0)       "Force on grap"
  annotation (Placement(transformation(extent={{-52,-10},{-32,10}})));
  Controllers.Plant2 crab2(
    angle_init=angle_init,
    w_init=w_init,
    s_init=s_init,
    v_init=v_init)
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
equation

  connect(sine.y, crab1.force)
    annotation (Line(points={{-31,0},{-10,0},{-10,30},{18,30}},
                                                 color={0,0,127}));

  connect(sine.y, crab2.force) annotation (Line(points={{-31,0},{-10,0},{-10,-30},
          {18,-30}}, color={0,0,127}));

annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
      coordinateSystem(preserveAspectRatio=false)),
  experiment(StopTime=5));
end TestPlantModels_DASSL;
