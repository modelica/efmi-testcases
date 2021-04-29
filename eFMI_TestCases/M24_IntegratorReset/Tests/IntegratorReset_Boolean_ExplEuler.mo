within eFMI_TestCases.M24_IntegratorReset.Tests;
model IntegratorReset_Boolean_ExplEuler
  extends TestSetups.OpenLoop_Boolean;

  annotation (experiment(StopTime=8, Interval= 0.01),
     __iti_namesAtInterface={MapName(from="integratorWithReset.u",to="u"),
                             MapName(from="integratorWithReset.reset",to="reset"),
                             MapName(from="integratorWithReset.y",to="y")},
     __fmi_modelExportName = "M24_B",
  __fmi_sourceModel = "eFMI_TestCases.M24_IntegratorReset.Controllers.IntegratorWithReset_Boolean",
    Diagram(graphics={Text(
          extent={{-30,90},{90,50}},
          lineColor={28,108,200},
          textString="Simulation with Solver \"Explicit Euler\"
not possible in Dymola, therefore
\"MultiRate_ExplicitEuler\" is used.")}));
end IntegratorReset_Boolean_ExplEuler;
