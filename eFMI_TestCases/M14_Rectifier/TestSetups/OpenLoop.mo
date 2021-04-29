within eFMI_TestCases.M14_Rectifier.TestSetups;
partial model OpenLoop
  extends .eFMI_TestCases.Utilities.ClockedContinuousTwin;
  extends Modelica.Icons.Example;

  replaceable Controllers.Generator_interface generator constrainedby
    Controllers.Generator_interface
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  Modelica.Blocks.Sources.Sine sine(
    amplitude = 50,
    freqHz = 12)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude = 15,
    period = 1,
    offset = 0.1)
    annotation (Placement(transformation(extent={{80,-10},{60,10}})));

  Modelica_Synchronous.RealSignals.Sampler.SampleClocked U_Ideal if is_clocked
    annotation (Placement(transformation(extent={{-36,6},{-24,-6}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold I if is_clocked annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={0,-30})));
  Modelica_Synchronous.RealSignals.Sampler.Sample U_Bat if is_clocked
    annotation (Placement(transformation(extent={{36,-6},{24,6}})));
  Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock clock if is_clocked
    annotation (Placement(transformation(extent={{-78,42},{-62,58}})));

equation
  if is_clocked then
    connect(clock.y, U_Ideal.clock)
      annotation (Line(
        points={{-61.2,50},{-30,50},{-30,7.2}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5));
    connect(sine.y, U_Ideal.u)
      annotation (Line(
        points={{-59,0},{-37.2,0}},
        color={0,0,127}));
    connect(U_Ideal.y, generator.U_Ideal)
      annotation (Line(
        points={{-23.4,0},{-12,0}},
        color={0,0,127}));
    connect(pulse.y, U_Bat.u)
      annotation (Line(
        points={{59,0},{37.2,0}},
        color={0,0,127}));
    connect(U_Bat.y, generator.U_Bat)
      annotation (Line(
        points={{23.4,0},{12,0}},
        color={0,0,127}));
    connect(generator.I, I.u)
      annotation (Line(
        points={{0,-11},{0,-22.8}},
        color={0,0,127}));
  else
    connect(sine.y, generator.U_Ideal);
    connect(pulse.y, generator.U_Bat);
  end if;
  annotation (Diagram(graphics={
        Rectangle(
          extent={{0,100},{100,80}},
          lineColor = {238,46,47},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid,
          lineThickness = 1),
        Text(
          extent={{2,82},{96,98}},
          lineColor={238,46,47},
          textString="Partial: 'generator' must be redeclared.")}));
end OpenLoop;
