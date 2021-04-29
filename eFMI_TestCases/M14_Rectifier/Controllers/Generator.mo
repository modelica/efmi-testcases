within eFMI_TestCases.M14_Rectifier.Controllers;
model Generator "Generator circuit"
 extends Generator_interface(
   U_Ideal(min = -51.0, max = 51.0),
   U_Bat(min = 0.0, max = 15.2),
   I(min = -1e3, max = 1e3));

 Rectifiers.IdealRectifier rectifier
   annotation (Placement(transformation(extent={{10,-10},{30,10}})),
     __Dymola_choicesAllMatching=true);
 Modelica.Electrical.Analog.Basic.Resistor resistor(
   R=0.57,
   T_ref(displayUnit="K"),
   T(displayUnit="K"))
   annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
 Modelica.Electrical.Analog.Basic.Inductor inductor(L=0.0164,
   i(start = 0, fixed = true))
   annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
 Modelica.Electrical.Analog.Sources.SignalVoltage u1 annotation (
     Placement(transformation(
       extent={{10,-10},{-10,10}},
       rotation=90,
       origin={-70,-60})));
 Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
     Placement(transformation(
       extent={{-10,-10},{10,10}},
       rotation=0,
       origin={0,-80})));
 Modelica.Electrical.Analog.Basic.Ground ground
   annotation (Placement(transformation(extent={{40,-30},{60,-10}})));
 Modelica.Electrical.Analog.Sources.SignalVoltage u2 annotation (Placement(
       transformation(
       extent={{10,10},{-10,-10}},
       rotation=90,
       origin={70,0})));
equation

 connect(resistor.n, rectifier.p1) annotation (Line(points={{0,-30},{10,-30},{
          10,0}},          color={0,0,255}));
 connect(inductor.n, resistor.p)
   annotation (Line(points={{-40,-30},{-20,-30}}, color={0,0,255}));
 connect(inductor.p, u1.p) annotation (Line(points={{-60,-30},{-70,-30},{-70,
          -50}},          color={0,0,255}));
 connect(rectifier.n1, currentSensor.n)
   annotation (Line(points={{30,0},{30,-80},{10,-80}},  color={0,0,255}));
 connect(currentSensor.p, u1.n) annotation (Line(points={{-10,-80},{-70,-80},{-70,
          -70}},          color={0,0,255}));
 connect(rectifier.n2, ground.p) annotation (Line(points={{20,-10},{50,-10}},
                            color={0,0,255}));
 connect(rectifier.p2, u2.p) annotation (Line(points={{20,10},{70,10}},
                               color={0,0,255}));
 connect(ground.p, u2.n) annotation (Line(points={{50,-10},{70,-10}},
                    color={0,0,255}));
 connect(currentSensor.i, I) annotation (Line(points={{0,-91},{0,-110},{0,-110}},
                 color={0,0,127}));
 connect(U_Ideal, u1.v)
   annotation (Line(points={{-120,0},{-90,0},{-90,-60},{-82,-60}},
                                                   color={0,0,127}));
 connect(U_Bat, u2.v)
   annotation (Line(points={{120,0},{82,0}}, color={0,0,127}));
 annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
       coordinateSystem(preserveAspectRatio=false)));
end Generator;
