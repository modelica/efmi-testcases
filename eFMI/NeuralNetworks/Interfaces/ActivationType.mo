within eFMI.NeuralNetworks.Interfaces;
partial model ActivationType
  extends Icons.NeuralLayer;
  extends TensorFlowOperation;

  annotation (
    Icon(
      graphics={
        Polygon(
          points={{-40,60},{40,60},{40,50},{-30,50},{12,0},{-30,-50},{40,-50},
            {40,-60},{-40,-60},{-40,-48},{2,0},{-40,50},{-40,60}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid)}));
end ActivationType;
