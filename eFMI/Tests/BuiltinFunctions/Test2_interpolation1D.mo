within eFMI.Tests.BuiltinFunctions;
model Test2_interpolation1D
  extends .Modelica.Icons.Example;

  Boolean ok;

equation
  ok = Test_interpolation1D();
end Test2_interpolation1D;
