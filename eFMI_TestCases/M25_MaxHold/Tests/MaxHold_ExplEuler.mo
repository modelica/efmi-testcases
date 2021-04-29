within eFMI_TestCases.M25_MaxHold.Tests;
model MaxHold_ExplEuler
  extends TestSetups.OpenLoop;

   annotation (experiment(StopTime=6, Interval= 0.001),
     __iti_namesAtInterface={MapName(from="maxHold_WithFilter.u",to="u"),
                             MapName(from="maxHold_WithFilter.y",to="y")},
     __fmi_modelExportName = "M25_A",
  __fmi_sourceModel = "eFMI_TestCases.M25_MaxHold.Controllers.maxHold_WithFilter",
    Diagram(graphics={Text(
          extent={{-10,90},{90,50}},
          lineColor={28,108,200},
          textString="Simulation with Solver \"Explicit Euler\"
not possible in Dymola, therefore
\"MultiRate_ExplicitEuler\" is used.")}));
end MaxHold_ExplEuler;
