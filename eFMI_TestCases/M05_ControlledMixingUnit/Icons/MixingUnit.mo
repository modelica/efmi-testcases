within eFMI_TestCases.M05_ControlledMixingUnit.Icons;
partial class MixingUnit
  annotation (
    Icon(
      graphics={
        Rectangle(
          extent = {{-100,40},{100,-100}},
          lineColor = {255,255,255},
          fillColor = {0,255,255},
          fillPattern = FillPattern.Solid),
        Line(
          points = {{-100,100},{-100,-100},{100,-100},{100,100}},
          color = {0,0,0}),
        Line(
          points = {{0,-50},{0,-100}}),
        Ellipse(
          extent = {{-42,-38},{0,-66}},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid),
        Ellipse(
          extent = {{0,-38},{42,-66}},
          fillColor = {255,255,255},
          fillPattern = FillPattern.Solid),
        Line(
          points = {{-10,80},{-10,16}}),
        Line(
          points = {{10,80},{10,16}}),
        Line(
          points = {{-86,-72},{-86,-114}}),
        Line(
          points = {{-66,-72},{-66,-114}})}));
end MixingUnit;
