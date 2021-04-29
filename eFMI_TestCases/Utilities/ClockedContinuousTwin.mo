within eFMI_TestCases.Utilities;
model ClockedContinuousTwin
  parameter Boolean is_clocked = false
    "Configures whether the ontroller is embedded as clocked partition or not.";
  annotation (Diagram(graphics={
        Rectangle(
          extent={{-100,100},{-20,80}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=0.5),
        Text(
          extent={{-98,98},{-22,82}},
          lineColor={28,108,200},
          textString="Clocked: %is_clocked%",
          textStyle={TextStyle.Bold})}));
end ClockedContinuousTwin;
