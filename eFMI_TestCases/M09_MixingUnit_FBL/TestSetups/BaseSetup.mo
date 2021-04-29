within eFMI_TestCases.M09_MixingUnit_FBL.TestSetups;
partial model BaseSetup
  extends .eFMI_TestCases.Utilities.ClockedContinuousTwin;
  extends Modelica.Icons.Example;

  replaceable Controllers.Controller controller
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  Modelica.Blocks.Sources.Step step(
    height=-0.848*0.3,
    offset=0.848*(1 - 0.42),
    startTime=0.1)
    annotation (Placement(transformation(
      extent={{-80,-4},{-60,16}},
      rotation = 0)));

  Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock clock if is_clocked
    annotation (Placement(transformation(extent={{-78,-38},{-62,-22}})));
  Modelica_Synchronous.RealSignals.Sampler.SampleClocked ref if is_clocked
    annotation (Placement(transformation(extent={{-46,0},{-34,12}})));
  Modelica_Synchronous.RealSignals.Sampler.Sample c if is_clocked
    annotation (Placement(transformation(extent={{6,-56},{-6,-44}})));
  Modelica_Synchronous.RealSignals.Sampler.Sample T if is_clocked
    annotation (Placement(transformation(extent={{6,-36},{-6,-24}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold T_c if is_clocked
    annotation (Placement(transformation(extent={{24,-6},{36,6}})));

equation
  if is_clocked then
    connect(step.y, ref.u)
      annotation (Line(
        points={{-59,6},{-47.2,6}},
        color={0,0,127}));
    connect(ref.y, controller.ref)
      annotation (Line(
        points={{-33.4,6},{-12,6}},
        color={0,0,127}));
    connect(c.y, controller.c)
      annotation (Line(
        points={{-6.6,-50},{-30,-50},{-30,0},{-12,0}},
        color={0,0,127}));
    connect(T.y, controller.T)
      annotation (Line(
        points={{-6.6,-30},{-20,-30},{-20,-6},{-12,-6}},
        color={0,0,127}));
    connect(controller.T_c, T_c.u)
      annotation (Line(
        points={{11,-6},{16,-6},{16,0},{22.8,0}},
        color={0,0,127}));
    connect(clock.y, ref.clock)
      annotation (Line(
        points={{-61.2,-30},{-40,-30},{-40,-1.2}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5));
  else
    connect(step.y, controller.ref);
  end if;
end BaseSetup;
