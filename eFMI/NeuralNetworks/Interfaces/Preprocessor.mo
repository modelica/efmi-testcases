within eFMI.NeuralNetworks.Interfaces;
partial model Preprocessor
  extends Icons.NeuralLayer;
  extends TensorFlowOperation;

  annotation (
    Icon(
      graphics={
        Rectangle(
          extent={{-60,80},{60,-80}},
          lineColor={129,129,129},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=0.5)}));
end Preprocessor;
