within eFMI_TestCases.M15_AirSystem.Controllers;
model AirSystem
  extends Modelica.Blocks.Icons.Block;
  extends Icons.AirSystem;

  PlantModels.Manifold_Pressure manifold_Pressure
    annotation (Placement(transformation(extent={{-50,10},{-30,30}})));
  PlantModels.Manifold_Temperature manifold_Temperature
    annotation (Placement(transformation(extent={{20,30},{40,50}})));
  PlantModels.Fuel_Injection fuel_Injection
    annotation (Placement(transformation(extent={{-50,-36},{-30,-16}})));
  PlantModels.Engine_Speed engine_Speed
    annotation (Placement(transformation(extent={{20,-50},{40,-30}})));
  PlantModels.Air_Fuel_Ratio air_Fuel_Ratio
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Interfaces.RealInput m_dot_f_i(unit="kg/s", displayUnit="g/s", min=0, max=1000, start=0.0005) annotation (Placement(
        transformation(rotation=0, extent={{-120,-50},{-100,-30}})));
  Modelica.Blocks.Interfaces.RealInput v(unit="deg", displayUnit="deg", min=-1000, max=1000) annotation (Placement(
        transformation(rotation=0, extent={{-120,30},{-100,50}})));
  Modelica.Blocks.Interfaces.RealOutput AFR "Air/fuel ration"
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Interfaces.RealOutput p_i(unit="Pa",displayUnit="bar") "Manifold pressure"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Interfaces.RealOutput T_i(unit="K", displayUnit="K") "Intake manifold temperature"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput n(unit="rad/s", displayUnit="rpm") "Crank shaft speed"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
equation
  connect(manifold_Temperature.T_i,manifold_Pressure. T_i) annotation (Line(
        points={{41,40},{60,40},{60,60},{-70,60},{-70,26},{-52,26}}, color={0,0,
          127}));
  connect(manifold_Pressure.m_dot_ap,manifold_Temperature. m_dot_ap)
    annotation (Line(points={{-29,14},{-10,14},{-10,40},{18,40}}, color={0,0,127}));
  connect(manifold_Pressure.m_dot_at,manifold_Temperature. m_dot_at)
    annotation (Line(points={{-29,26},{-18,26},{-18,46},{18,46}},
                                                color={0,0,127}));
  connect(fuel_Injection.p_i,manifold_Temperature. p_i) annotation (Line(points={{-52,-32},
          {-60,-32},{-60,-48},{-4,-48},{-4,34},{18,34}},             color={0,0,
          127}));
  connect(engine_Speed.n,fuel_Injection. n) annotation (Line(points={{41,-40},{
          60,-40},{60,-60},{-70,-60},{-70,-26},{-52,-26}},
                                                        color={0,0,127}));
  connect(air_Fuel_Ratio.m_dot_f,fuel_Injection. m_dot_f) annotation (Line(points={{18,-4},
          {-10,-4},{-10,-26},{-29,-26}},   color={0,0,127}));
  connect(engine_Speed.m_dot_f,fuel_Injection. m_dot_f) annotation (Line(points={{18,-44},
          {-10,-44},{-10,-26},{-29,-26}},    color={0,0,127}));
  connect(engine_Speed.p_i,manifold_Temperature. p_i) annotation (Line(points={{18,-36},
          {-4,-36},{-4,34},{18,34}},          color={0,0,127}));
  connect(air_Fuel_Ratio.m_dot_ap,manifold_Temperature. m_dot_ap) annotation (
      Line(points={{18,4},{-10,4},{-10,40},{18,40}}, color={0,0,127}));
  connect(manifold_Pressure.p_i,manifold_Temperature. p_i) annotation (Line(
        points={{-29,20},{-4,20},{-4,34},{18,34}}, color={0,0,127}));
  connect(manifold_Pressure.n,fuel_Injection. n) annotation (Line(points={{-52,14},
          {-70,14},{-70,-26},{-52,-26}}, color={0,0,127}));
  connect(m_dot_f_i, fuel_Injection.m_dot_f_i) annotation (Line(points={{-110,
          -40},{-80,-40},{-80,-20},{-52,-20}},
                                          color={0,0,127}));
  connect(v, manifold_Pressure.v) annotation (Line(points={{-110,40},{-80,40},{
          -80,20},{-52,20}}, color={0,0,127}));
  connect(air_Fuel_Ratio.AFR, AFR) annotation (Line(points={{41,0},{60,0},{60,
          -20},{110,-20}},
                       color={0,0,127}));
  connect(manifold_Pressure.p_i, p_i) annotation (Line(points={{-29,20},{110,20}},
                             color={0,0,127}));
  connect(manifold_Temperature.T_i, T_i)
    annotation (Line(points={{41,40},{80,40},{80,60},{110,60}},
                                                color={0,0,127}));
  connect(engine_Speed.n, n)
    annotation (Line(points={{41,-40},{80,-40},{80,-60},{110,-60}},
                                                  color={0,0,127}));
end AirSystem;
