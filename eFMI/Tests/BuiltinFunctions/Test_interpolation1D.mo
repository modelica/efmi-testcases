within eFMI.Tests.BuiltinFunctions;
function Test_interpolation1D "Test function interpolation1D"
  extends .Modelica.Icons.Function;

  import  Modelica.Utilities.Streams;
  import eFMI.BuiltinFunctions;

  output Boolean ok;

protected
  Real u_data[:]={-2,-1,0,1,2};
  Real y_data[:]={-4,-1.5,0,1.5,4};
  Real u;
  Real y;
algorithm
  ok:=true;
  Streams.print("... Test of eFMI.BuiltinFunctions.interpolation1D");

  u := 1.0;
  y := eFMI.BuiltinFunctions.interpolation1D(
    u,
    u_data,
    size(u_data, 1),
    y_data,
    2,
    2);
  Streams.print("... u = " + String(u) + ", y = " + String(y));

  // assert(abs(eFMI.BuiltinFunctions.interpolation1D(1.0,u_data,size(u_data,1),y_data,2,2) - 1.5) <= 1e-15,  "interpolation1D is wrong");

  // Streams.print("... Test was successful.");
end Test_interpolation1D;
