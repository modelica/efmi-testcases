within eFMI_TestCases.Utilities;
function ExportListOfTestCases "Exports a sorted list of all test cases into a text file (everything in subpackes \"Tests\" with correct annotation __iti_namesAtInterface, additional test cases can be added, see inputs)"
  input Boolean addLongName = true "Generated list shall contain the long names of the test cases";
  input Boolean addShortName = true "Generated list shall contain the short names of the test cases";
  input Boolean exportWithBrackets = false "Generated list shall contain the long names in brackets";

  input String additionalTestcases[:] = {"M23_ErrorHandlingFunction", "M27_UnsolvableLinearSystem"} "List of additional test cases that cannot automatically be detected from the Modelica test case library";
  input String additionalTestcasesShortNames[:] = {"M23_A", "M27_A"} "Corresponding list of short names for the additional test cases";

  input String fileName = "ListOfTestCases.txt" "Name of text file that contains the list of test case models after the function call";
  input String outputDir = "eFMUs" "Name of directory where the list of test cases is saved";

  output Boolean ok;

algorithm

  ok := Internal.runFunctionWithModelInformation("\teFMI_TestCases.Utilities.Internal.exportListOfTestCases("+String(addLongName)+", "+String(addShortName)+", " + String(exportWithBrackets)+", "
                      +Internal.StringVectorS(additionalTestcases) + ", "+Internal.StringVectorS(additionalTestcasesShortNames)+",\""+fileName+"\", \""+outputDir+"\", info);\n");

  annotation(__Dymola_interactive=true);
end ExportListOfTestCases;
