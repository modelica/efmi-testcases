within eFMI_TestCases.S001_PIDController.Utilities;
block Derivative "Approximated derivative block"
  extends .Modelica.Blocks.Interfaces.SISO;

  parameter Real k(
    unit = "1") = 1
    "Gains";
  parameter .Modelica.Units.SI.Time T(
    min = .Modelica.Constants.small) = 0.01
    "Time constants (T>0 required; T=0 is ideal derivative block)";
  parameter Real x_start = 0
    "Initial or guess value of state"
    annotation (Dialog(group="Initialization"));

  output Real x(
    start = x_start,
    min = -1e9,
    max = 1e9)
    "State of block";

initial equation
  x = x_start;

equation
  der(x) = (u - x)/T;
  y = (k/T)*(u - x);

  annotation (
    Icon(
      graphics={
        Line(points={{-80.0,78.0},{-80.0,-90.0}},color={192,192,192}),
        Polygon(lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
        Line(
          points={{-90.0,-80.0},{82.0,-80.0}},
          color={192,192,192}),
        Polygon(lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          points={{90.0,-80.0},{68.0,-72.0},{68.0,-88.0},{90.0,-80.0}}),
        Line(origin = {-24.667,-27.333},
          points = {{-55.333,87.333},{-19.333,-40.667},{86.667,-52.667}},
          color = {0,0,127},
          smooth = Smooth.Bezier),
        Text(lineColor={192,192,192},
          extent={{-30.0,14.0},{86.0,60.0}},
          textString="DT1"),
        Text(
          extent={{-150.0,-150.0},{150.0,-110.0}},
          textString="k=%k")}),
    Diagram(
      graphics={
        Text(
          extent={{-54,52},{50,10}},
          textString="k s"),
        Text(
          extent={{-54,-6},{52,-52}},
          textString="T s + 1"),
        Line(points={{-50,0},{50,0}}),
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{-100,0},{-60,0}}, color={0,0,255}),
        Line(points={{60,0},{100,0}}, color={0,0,255})}),
    Documentation(info="<html>
<p>
This blocks defines the transfer function between the
input u and the output y
as <em>approximated derivative</em>:
</p>
<pre>
             k * s
     y = ------------ * u
            T * s + 1
</pre>
</html>"));
end Derivative;
