within eFMI_TestCases.M06_SkyhookGroundhook.TestSetups;
model SkyhookGroundhook "Skyhookgroundhook control of a semi-active damper"
  extends TestSetups.BaseSetup;

  PlantModels.QuarterVehiclePlant quarterCar_activeDampers
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));

  PlantModels.Components.CosineBump cosineBump(
    length=0.5,
    velocity=10,
    distance=10,
    height=0.2)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  PlantModels.QuarterVehiclePlant quarterCar_passiveDampers
    annotation (Placement(transformation(extent={{60,40},{80,60}})));
  Modelica.Blocks.Sources.Constant uDmin(k=0)
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
equation
  connect(cosineBump.y, quarterCar_activeDampers.z_r) annotation (Line(points={{41,30},
          {50,30},{50,-6},{58,-6}},       color={0,0,127}));
  connect(cosineBump.y, quarterCar_passiveDampers.z_r) annotation (Line(points={{41,30},
          {50,30},{50,44},{58,44}},               color={0,0,127}));
  connect(uDmin.y, quarterCar_passiveDampers.u_d) annotation (Line(points={{41,70},
          {50,70},{50,56},{58,56}},     color={0,0,127}));
  connect(u_damper.y, quarterCar_activeDampers.u_d) annotation (Line(points={{
          36.6,0},{44,0},{44,6},{58,6}}, color={0,0,127}));
  connect(quarterCar_activeDampers.v_damper, v_damper.u) annotation (Line(
        points={{81,-6},{86,-6},{86,-30},{-50,-30},{-50,-20},{-37.2,-20}},
        color={0,0,127}));
  connect(quarterCar_activeDampers.v_wheel, v_wheel.u) annotation (Line(
        points={{81,0},{88,0},{88,-40},{-60,-40},{-60,0},{-37.2,0}}, color={0,
          0,127}));
  connect(quarterCar_activeDampers.v_body, v_body.u) annotation (Line(points={
          {81,6},{96,6},{96,-50},{-70,-50},{-70,20},{-37.2,20}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-90,-60},{90,-100}},
          lineColor={28,108,200},
          textString="Source: \"Semi-Active Suspension Control Design for Vehicles\"
by Savaresi et al., 2010")}),
    experiment(StopTime=10));
end SkyhookGroundhook;
