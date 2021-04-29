within eFMI.Tests.BuiltinFunctions;
model Test2_interpolation2D
  extends Modelica.Icons.Example;
  Boolean ok;

equation
  ok = Test_interpolation2D();
end Test2_interpolation2D;
