within eFMI_TestCases;
package RequiringInputDependentInitialization "Examples that require input-dependent initialization"
  extends .Modelica.Icons.VariantsPackage;

 annotation (preferredView="info", Documentation(info="<html>
 <p>In this package for some test cases variants are contained that require an input-dependent initialization. It means some of the initial values of states depend on the inputs at start time. These test cases should be efficiently handled using future versions of the eFMI standard. Currently, most Modelica tools do not support such models for the eFMI export.</p>
</html>"));
end RequiringInputDependentInitialization;
