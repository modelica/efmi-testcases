within eFMI_TestCases.M10_ControlledSliderCrank.TestSetups;
partial model BaseSetup
  extends .eFMI_TestCases.Utilities.ClockedContinuousTwin;
  extends .Modelica.Icons.Example;

  replaceable Controllers.Controller_interface controller
    constrainedby Controllers.Controller_interface
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  .Modelica.Blocks.Sources.Sine sine(
    amplitude = 0.07,
    offset = 0.6,
    f = 0.4)
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));

  .Modelica.Clocked.RealSignals.Sampler.SampleClocked s_ref if is_clocked
    annotation (Placement(transformation(extent={{-46,16},{-34,4}})));
  .Modelica.Clocked.RealSignals.Sampler.Sample phi if is_clocked
    annotation (Placement(transformation(extent={{36,-34},{24,-46}})));
  .Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock clock if is_clocked
    annotation (Placement(transformation(extent={{-78,42},{-62,58}})));
  .Modelica.Clocked.RealSignals.Sampler.Hold tau if is_clocked
    annotation (Placement(transformation(extent={{24,-6},{36,6}})));

equation
  if is_clocked then
    connect(s_ref.y, controller.s_ref)
      annotation (Line(
        points={{-33.4,10},{-20,10},{-20,7},{-12,7}},
        color={0,0,127}));
    connect(phi.y, controller.phi)
      annotation (Line(
        points={{23.4,-40},{-20,-40},{-20,-7},{-12,-7}},
        color={0,0,127}));
    connect(clock.y, s_ref.clock)
      annotation (Line(
        points={{-61.2,50},{-40,50},{-40,17.2}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5));
    connect(controller.tau, tau.u)
      annotation (Line(
        points={{11,0},{22.8,0}},
        color={0,0,127}));
    connect(sine.y, s_ref.u)
      annotation (Line(
        points={{-59,10},{-47.2,10}},
        color={0,0,127}));
  else
    connect(sine.y, controller.s_ref);
  end if;

  annotation (
    Diagram(
      graphics={
        Rectangle(
          extent={{0,100},{100,80}},
          lineColor = {238,46,47},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid,
          lineThickness = 1),
        Text(
          extent={{2,82},{98,98}},
          lineColor={238,46,47},
          textString="Partial: 'controller' must be redeclared.")}));
end BaseSetup;
