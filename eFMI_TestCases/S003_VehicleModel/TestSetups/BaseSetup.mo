within eFMI_TestCases.S003_VehicleModel.TestSetups;
partial model BaseSetup
  extends .Modelica.Icons.Example;

  Modelica.Blocks.Sources.RealExpression inputExpressions[2](
    y={0.01*sin(time), 500*cos(0.4*time)})
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock clock(
    period = 0.01,
    useSolver = true,
    solverMethod = "ExplicitEuler")
    annotation (Placement(transformation(extent={{-78,42},{-62,58}})));
end BaseSetup;
