within eFMI.Tests.BuiltinFunctions;
model Test2_interpolation2D
  extends .Modelica.Icons.Example;

  Real y;

protected
  function Test_interpolation2D "Test function interpolation2D"
    extends .Modelica.Icons.Function;

    import Modelica.Utilities.Streams;
    import eFMI.BuiltinFunctions;

    output Real y;

  protected
    Real u1_data[:]={-2,-1,0,1,2};
    Real u2_data[:]={-3,0,3};
    Real y_data[:,:]=[u1_data]*transpose([u2_data]);
    Real u1, u2;

  algorithm
    Streams.print("... Test of eFMI.BuiltinFunctions.interpolation2D");

    u1 := 1.0;
    u2 := 3.0;
    y := eFMI.BuiltinFunctions.interpolation2D(
      u1,
      u2,
      u1_data,
      size(u1_data,1),
      u2_data,
      size(u2_data,1),
      y_data,
      2,
      2);

    Streams.print(
      "... u1 = "
      + String(u1)
      + ", u2 = "
      + String(u2)
      + ", y = "
      + String(y));
  end Test_interpolation2D;
equation
  y = Test_interpolation2D();
end Test2_interpolation2D;
