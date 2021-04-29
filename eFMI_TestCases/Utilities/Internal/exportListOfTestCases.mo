within eFMI_TestCases.Utilities.Internal;
function exportListOfTestCases "Exports a sorted list of all test cases into a text file (everything in subpackes \"Tests\" with correct annotation __iti_namesAtInterface, additional test cases can be added, see inputs)"
  input Boolean addLongName = true "Generated list shall contain the long names of the test cases";
  input Boolean addShortName = true "Generated list shall contain the short names of the test cases";
  input Boolean exportWithBrackets = false "Generated list shall contain the long names in brackets";

  input String additionalTestcases[:] = {"M17_ACLoop", "M18_VehicleDynamicsSuMo_1"} "List of additional test cases that cannot automatically be detected from the Modelica test case library";
  input String additionalTestcasesShortNames[:] = {"M17_A", "M18_A"} "Corresponding list of short names for the additional test cases";

  input String fileName = "ListOfTestCases.txt" "Name of text file that contains the list of test case models after the function call";
  input String outputDir = "FMUs" "Name of directory where the list of test cases is saved";

  input ModelInformation info[:] "Complete data structure of model information for all test cases (is generated automatically)";

  import Modelica.Utilities.Streams.print;

protected
  String s;
  Integer n;
  String shortName[:], longName[:];
  Integer index[:];
  String nameToSort[:];
  String fullName;

  function oneLine
    input Boolean addLongName, addShortName,exportWithBrackets;
    input String longName, shortName;

    output String s;

  protected
    String space;
  algorithm
    s := "";
    if addLongName then
      s := s + longName;
    end if;
    if addShortName then
      if addLongName then
        if exportWithBrackets then
          space := "  (";
        else
          space := "\t";
        end if;
      else
        space := "";
      end if;
      s := s + space + shortName + (if addShortName and addLongName and exportWithBrackets then ")" else "");
    end if;
  end oneLine;

algorithm

  n := size(info,1) + size(additionalTestcases,1);
  shortName := fill("", n);
  longName := fill("", n);
  shortName[1:size(info,1)] := info[:].FMUName;
  shortName[size(info,1)+1:n] := additionalTestcasesShortNames;
  longName[1:size(info,1)] := info[:].testCaseName;
  longName[size(info,1)+1:n] := additionalTestcases;

  // sort names
  nameToSort := fill("",n);
  for i in 1:n loop
    nameToSort[i] := (if addShortName then shortName[i] else "") + (if addLongName then longName[i] else "");
  end for;
  (, index) := Internal.sortStrings(nameToSort);

  // generate list to export
  s := "";
  for i in 1:n-1 loop
    s := s + oneLine(addShortName, addLongName, exportWithBrackets, shortName[index[i]], longName[index[i]]);
    s := s + "\n";
  end for;
  if n > 0 then
    s := s + oneLine(addShortName, addLongName, exportWithBrackets, shortName[index[n]], longName[index[n]]);
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

end exportListOfTestCases;
