within eFMI_TestCases.M06_SkyhookGroundhook.PlantModels.Components;
model CosineBump "Bump excitation"

  parameter Modelica.SIunits.Length height = 0.05 "Height of bump";
  parameter Modelica.SIunits.Length length = 0.5 "Length of bump";
  parameter Modelica.SIunits.Velocity velocity = 14 "Velocity [m/s]";
  parameter Modelica.SIunits.Distance distance = 210 "Distance to bump";

  Modelica.SIunits.Distance s_travel = velocity*time;

  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
        iconTransformation(extent={{100,-10},{120,10}})));
equation
  if s_travel < distance or s_travel > (distance+length) then
    y = 0;
  else
    y = 0.5*height*(1 - cos((2*Modelica.Constants.pi/length)*(s_travel-distance)));
  end if;

  annotation (Icon(graphics={   Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
    Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
    Polygon(
      points={{-80,90},{-88,68},{-72,68},{-80,90}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-90,-40},{68,-40}},
                                  color={192,192,192}),
    Polygon(
      points={{90,-40},{68,-32},{68,-48},{90,-40}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-62,-40},{-50.7,-5.8},{-43.5,13.1},{-37.1,26.4},{-31.4,
              34.6},{-25.8,39.1},{-20.2,39.8},{-14.6,36.6},{-8.9,29.7},{
              -3.3,19.4},{3.1,4.1},{11.17,-18.8},{18,-40},{74,-40}},
                                                        color={0,0,0}),
        Line(
          points={{-80,-40},{-62,-40}},
          color={0,0,0},
          smooth=Smooth.None),          Text(
        extent={{-140,144},{160,104}},
        textString="%name",
        lineColor={0,0,255})}));
end CosineBump;
