within eFMI.NeuralNetworks.ActivationFunctions;
model Softplus
  extends Interfaces.ActivationFunction;
  extends Icons.ReLU;

  parameter Real beta = 1.0
    "Default value according to PyTorch.";
  parameter Real threshold = 20.0
    "Default value according to PyTorch.";

equation
  for i in 1:size(x, 1) loop
    y[i] = (if x[i] * beta > threshold
      then max(0.0, x[i])
      else (1.0 / beta) * .log(1.0 + .exp(beta * x[i])));
  end for annotation(__Dymola_Expand = false);

  annotation (
    Documentation(info="<html>
<p>Softplus is a smooth approximation to the ReLU function and can be used to constrain the output of a machine to always be positive.</p>
<p>The implementation follows PyTorch: <i>&quot;For numerical stability the implementation reverts to the linear function when input&times;&beta; &gt; threshold&quot;</i>.</p>
</html>"));
end Softplus;
