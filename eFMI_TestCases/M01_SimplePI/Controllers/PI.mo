within eFMI_TestCases.M01_SimplePI.Controllers;
model PI "Time continuous Proportional+Integral control"
  extends Modelica.Blocks.Icons.Block;
  extends eFMI_TestCases.Icons.Controller;

  parameter Real k=110 "Proportional Gain";
  parameter Modelica.SIunits.Time T=0.1 "Time Constant (T>0 required)";

  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Continuous.PI PI(
    initType=Modelica.Blocks.Types.Init.InitialState,
    x(min=-100.0, max=100.0),
    x_start=0,
    y_start=0,
    k=k,
    T=T)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Interfaces.RealInput
            r(min=-1e4, max=1e4) "Connector of Real input signal" annotation (Placement(
        transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput y(min=-1e4, max=1e4) "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));

  Modelica.Blocks.Interfaces.RealOutput u(min=-1e7, max=1e7) "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation
  connect(feedback.y, PI.u)
    annotation (Line(points={{9,0},{38,0}},          color={0,0,127}));
  connect(r, feedback.u1)
    annotation (Line(points={{-120,0},{-8,0}},  color={0,0,127}));
  connect(y, feedback.u2)
    annotation (Line(points={{0,-120},{0,-8}},             color={0,0,127}));
  connect(u, PI.y) annotation (Line(points={{110,0},{61,0}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-50,66},{50,12}},
          pattern=LinePattern.None,
          textString="P+I",
          lineColor={238,46,47})}));
end PI;
