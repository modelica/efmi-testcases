within eFMI.Icons;
class Table
  annotation (Icon(graphics={
        Line(
          points={{-60,40},{-60,-40},{60,-40},{60,40},{30,40},{30,-40},{-30,-40},
              {-30,40},{-60,40},{-60,20},{60,20},{60,0},{-60,0},{-60,-20},{60,
              -20},{60,-40},{-60,-40},{-60,40},{60,40},{60,-40}}),
        Line(
          points={{0,40},{0,-40}}),
        Line(
          points={{-60,40},{-30,20}}),
        Line(
          points={{-30,40},{-60,20}}),
        Rectangle(
          origin={2.3077,0},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent = {{-62.3077,0.0},{-32.3077,20.0}}),
        Rectangle(
          origin={2.3077,0},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent = {{-62.3077,-20.0},{-32.3077,0.0}}),
        Rectangle(
          origin={2.3077,0},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent = {{-62.3077,-40.0},{-32.3077,-20.0}}),
        Rectangle(
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent={{-30,20},{0,40}}),
        Rectangle(
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent={{0,20},{30,40}}),
        Rectangle(
          origin={-2.3077,0},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent = {{32.3077,20.0},{62.3077,40.0}})}));
end Table;
