within eFMI_TestCases.Utilities.Internal;
function exportListOfControllerModels "Exports a sorted list of all Emphysis test cases with their controller models into a text file (everything in subpackes \"Tests\" with correct annotation __iti_namesAtInterface)"
  input String fileName = "ListOfControllerModels.txt" "Name of text file that contains the list of test case controller models after the function call";
  input String outputDir = "FMUs" "Name of directory where the list is saved";

  input ModelInformation info[:] "Complete data structure of model information for all test cases (is generated automatically)";

  import Modelica.Utilities.Streams.print;

protected
  String s;
  Integer n;
  String shortName[:], longName[:];
  Integer index[:];
  String nameToSort[:];
  String fullName;

algorithm

  n := size(info,1);
  shortName := fill("", n);
  longName := fill("", n);
  shortName := info[:].FMUName;
  longName := info[:].sourceName;


  // Check, if model classes exist
  for i in 1:n loop
    if not ModelManagement.Structure.AST.ClassExists(longName[i]) then
      print("Warning: Model class " + longName[i] + " does not exist, but the name of the class is exported for test case " + shortName[i] + ".");
    end if;
  end for;

  // sort names
  nameToSort := fill("",n);
  for i in 1:n loop
    nameToSort[i] := shortName[i] + longName[i];
  end for;
  (, index) := Internal.sortStrings(nameToSort);

  // generate list to export
  s := "";
  for i in 1:n-1 loop
    s := s + shortName[index[i]] + "\t" + longName[index[i]];
    s := s + "\n";
  end for;
  if n > 0 then
    s := s + shortName[index[n]] + "\t" + longName[index[n]];
  end if;

  // Create output directory, if not present
  if not Modelica.Utilities.Files.exist(outputDir) then
    Modelica.Utilities.Files.createDirectory(outputDir);
  end if;

  fullName := outputDir + "\\" + fileName;
  Modelica.Utilities.Files.removeFile(fullName);
  print(s, fullName);
  Modelica.Utilities.Streams.close(fullName);
  print("File " + fullName + " generated.");

end exportListOfControllerModels;
