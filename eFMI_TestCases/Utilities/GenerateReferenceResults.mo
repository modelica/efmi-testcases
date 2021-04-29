within eFMI_TestCases.Utilities;
function GenerateReferenceResults "Generates reference result files for all test case models into the given directory"
  import Modelica.Utilities.Streams.print;

  input String ReferenceDir = "ReferenceResults" "Directory, where the results will be written. It will be deleted before newly generated.";
  input Boolean include32BitFiles = false "Additionaly export result files with 32 Bit precision";
  output Boolean ok;

algorithm

  ok := Internal.runFunctionWithModelInformation("\teFMI_TestCases.Utilities.Internal.generateReferenceResults(\""+ReferenceDir+"\", " + String(include32BitFiles) + ", info);\n");

  annotation(__Dymola_interactive=true);
end GenerateReferenceResults;
