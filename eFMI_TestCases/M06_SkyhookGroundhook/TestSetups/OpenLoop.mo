within eFMI_TestCases.M06_SkyhookGroundhook.TestSetups;
model OpenLoop
  extends BaseSetup;

  .Modelica.Blocks.Sources.ExpSine expSine1(
    amplitude = 0.5,
    f = 3,
    damping = 2,
    startTime = 1)
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  .Modelica.Blocks.Sources.ExpSine expSine2(
    amplitude = 15,
    f = 8,
    damping = 3,
    startTime = 1)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  .Modelica.Blocks.Sources.ExpSine expSine3(
    amplitude = 18,
    f = 7,
    phase = 3.1415926535898,
    damping = 6,
    startTime = 1)
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));

equation
  connect(expSine3.y, v_damper.u)
    annotation (Line(
      points={{-59,-40},{-50,-40},{-50,-20},{-37.2,-20}},
      color={0,0,127}));
  connect(expSine2.y, v_wheel.u)
    annotation (Line(
      points={{-59,0},{-37.2,0}},
      color={0,0,127}));
  connect(expSine1.y, v_body.u)
    annotation (Line(
      points={{-59,40},{-50,40},{-50,20},{-37.2,20}},
      color={0,0,127}));
end OpenLoop;
