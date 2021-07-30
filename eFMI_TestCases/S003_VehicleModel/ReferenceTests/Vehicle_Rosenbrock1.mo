within eFMI_TestCases.S003_VehicleModel.ReferenceTests;
model Vehicle_Rosenbrock1
  extends Tests.Vehicle_Rosenbrock1;

  .Modelica.Blocks.Continuous.Der der_u[2]
    annotation (Placement(transformation(extent = {{-36,-36},{-24,-24}})));
  .Modelica.Blocks.Routing.Multiplex2 mux_der_u
    annotation (Placement(transformation(extent = {{-6,-36},{6,-24}})));

equation
  connect(der_u[1].y, mux_der_u.u1[1])
    annotation (Line(
      points = {{-23.4,-30},{-14,-30},{-14,-26.4},{-7.2,-26.4}},
      color = {0,0,127}));
  connect(der_u[2].y, mux_der_u.u2[1])
    annotation (Line(
      points = {{-23.4,-30},{-14,-30},{-14,-33.6},{-7.2,-33.6}},
      color = {0,0,127}));
  connect(inputExpressions.y, der_u.u)
    annotation (Line(
      points = {{-59,0},{-50,0},{-50,-30},{-37.2,-30}},
      color = {0,0,127}));

  annotation (
    experiment(
      StopTime = 40,
      Interval = 0.01),
    __fmi_InterfaceVariable={
      MapName(from="vehiclePlant.u",to="u", dimensions={2}),
      MapName(from="mux_der_u.y",to="'derivative(u)'", dimensions={2}),
      MapName(from="vehiclePlant.x",to="x", dimensions={8}, isOutput=true,
                                           ToleranceSet={ToleranceSetType(absTol64=1e-5,relTol64=1e-6)})},
    __fmi_OriginalModel_ExportReference="eFMI_TestCases.S003_VehicleModel.Tests.Vehicle_Rosenbrock1");
end Vehicle_Rosenbrock1;
