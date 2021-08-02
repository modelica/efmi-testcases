within eFMI_TestCases.Utilities;
function ExportListOfControllerModels "Exports a sorted list of all test cases with their controller models into a text file (everything in subpackes \"Tests\" with correct annotation __iti_namesAtInterface)"
  input String fileName=
    "ListOfControllerModels.txt" "Name of text file that contains the list of test case controller models after the function call";
  input String outputDir=
    "eFMUs" "Name of directory where the list is saved";

  output Boolean ok;

algorithm
  ok := Internal.runFunctionWithModelInformation(
    "\teFMI_TestCases.Utilities.Internal.exportListOfControllerModels(\""
    + fileName
    + "\", \""
    + outputDir
    + "\", info);\n");

  annotation(__Dymola_interactive=true);
end ExportListOfControllerModels;
