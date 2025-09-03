within eFMI_TestCases.M11_NeuralQVM.Icons;
partial class Damper
  annotation (
    preferredView = "icon",
    Icon(
      graphics={
        Line(
          points={{-100,0},{100,0}},
          color={0,127,0}),
        Rectangle(
          lineColor={0,127,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          extent={{-60,30},{30,-30}}),
        Line(
          points={{60,-30},{-60,-30},{-60,30},{60,30}},
          color={0,127,0}),
        Rectangle(
          extent={{-110,-12},{-90,8}},
          lineColor={0,127,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{90,-10},{110,10}},
          lineColor={0,127,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
end Damper;
