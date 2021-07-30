within eFMI_TestCases.M25_MaxHold.Controllers;
partial model maxHold_interface
  extends .Modelica.Blocks.Icons.Block;

  parameter Real holdDuration = 0.2
    "Time to hold signal";
  parameter Real fallingRate = -10.0
    "Falling rate";
  parameter Real uMin = -1000
    "Minimum value of input that can occur";

  .Modelica.Blocks.Interfaces.RealInput u(
    min = -1.0e7,
    max = 1.0e7)
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  .Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  annotation (
    Icon(
      graphics={
        Line(points={{-80,-100},{-80,70}},color={192,192,192}),
        Text(
          extent={{-71,92},{-44,72}},
          lineColor={0,0,0},
          textString="y /"),
        Polygon(
            points={{-80,86},{-86,70},{-74,70},{-80,86}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
        Line(points={{-100,-60},{84,-60}},color={192,192,192}),
        Polygon(
          points={{100,-60},{84,-54},{84,-66},{100,-60}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{72,-66},{96,-86}},
          lineColor={160,160,164},
          textString="time"),
        Line(
          points={{-22,50},{-22,-100}},
          color={135,135,135},
          pattern=LinePattern.Dot,
          thickness=0.5),
        Line(
          points={{28,50},{28,-100}},
          color={135,135,135},
          pattern=LinePattern.Dot,
          thickness=0.5),
        Line(
          points={{-22,-80},{28,-80}},
          color={175,175,175},
          thickness=0.5),
        Text(
          extent={{-18,-71},{26,-104}},
          lineColor={175,175,175},
          textString="holdDuration"),
        Text(
          extent={{44,-9},{80,-36}},
          lineColor={175,175,175},
          textString="fallingRate"),
        Text(
          extent={{-57,92},{-30,72}},
          lineColor={28,108,200},
          textString="u"),
        Line(
          points={{-80,-60},{-66,-60},{-42,-10},{-30,-2},{-18,-2},{-14,-4},{-6,-16},
              {6,-38},{16,-50},{28,-42},{38,-48},{48,-58},{54,-58},{78,-48},{84,
              -48}},
          color={28,108,200},
          thickness=0.5,
          smooth=Smooth.Bezier),
        Polygon(
          points={{28,-80},{22,-78},{22,-82},{28,-80}},
          lineColor={192,192,192},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-22,-80},{-16,-78},{-16,-82},{-22,-80}},
          lineColor={192,192,192},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-22,-2},{28,-2},{42,-52}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-80,-60},{-66,-60},{-40,-4},{-22,-2}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.Bezier),
        Line(
          points={{42,-52},{52,-60},{74,-50},{84,-48}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.Bezier)}));
end maxHold_interface;
