within eFMI_TestCases.Utilities.Internal;
function testCaseInput

  output String text;

  import ModelManagement.Structure.AST.ClassesInPackage;
  import Modelica.Utilities.Streams.print;

protected
  String Package1[:];
  String Package2[:];
  String Package3[:];
  String Package4[:];
  String pack1, pack2, pack3, pack4;
  String nameResults[:];
  Boolean foundTest;
  String name, name4;
  Boolean ok;
  String annot, fmuName;
  Integer len;
  String  text0;
  Boolean first;
  String ReferenceModel[:], UseCaseModel[:];
  Boolean useOriginalUseCase;
  String sourceName;

algorithm

 text := "
\timport eFMI_TestCases.Utilities.Internal.ModelInformation;
\timport eFMI_TestCases.Utilities.Internal.ReferenceType;
\timport eFMI_TestCases.Utilities.Internal.MapName;
\timport eFMI_TestCases.Utilities.Internal.ToleranceSetType;
\timport eFMI_TestCases.Utilities.Internal.ToleranceType;
\tinput ModelInformation info[:] = \n\t\t{";

  first := true;

  Package1 := ClassesInPackage("eFMI_TestCases");
  for pack1 in Package1 loop
    if Modelica.Utilities.Strings.substring(pack1,1,1) == "M" or Modelica.Utilities.Strings.substring(pack1,1,1) == "S" then

      UseCaseModel := fill("",0);
      ReferenceModel := fill("",0);
      if ModelManagement.Structure.AST.ClassExists("eFMI_TestCases." + pack1 + ".ReferenceTests") then
          Package4 := ClassesInPackage("eFMI_TestCases." + pack1 + ".ReferenceTests");
          for pack4 in Package4 loop
              name4 := pack1 + ".ReferenceTests." + pack4;
              annot := ModelManagement.Structure.AST.GetAnnotation("eFMI_TestCases." + name4, "__fmi_OriginalModel_ExportReference");
              if Modelica.Utilities.Strings.length(annot) == 0 then
                // no annotation specified, ignore it
              elseif Modelica.Utilities.Strings.length(annot) < 4 then
                print("Cannot find a proper content for annotation __fmi_OriginalModel_ExportReference in model " + name4);
              else
                len := Modelica.Utilities.Strings.length(annot);
                UseCaseModel := cat(1, {Modelica.Utilities.Strings.substring(annot,3,len-1)}, UseCaseModel);
                ReferenceModel := cat(1, {name4}, ReferenceModel);
              end if;
          end for;
      end if;

      Package2 := ClassesInPackage("eFMI_TestCases." + pack1);
      foundTest := false;
      for pack2 in Package2 loop
        if Modelica.Utilities.Strings.isEqual(pack2,"Tests") then
          foundTest := true;
        end if;
      end for;
      if foundTest then
        Package3 := ClassesInPackage("eFMI_TestCases." + pack1 + ".Tests");
        for pack3 in Package3 loop
            name := pack1 + ".Tests." + pack3;
            // Check, if model is the source of a test case
            (, ok) := Internal.getNameAtInterfaceAnnotation("eFMI_TestCases." + name);
            if not ok then
                print("Cannot find variable names for test case " + name + ", will ignore model.");
            else

                // Check for FMU name in annotation
                annot := ModelManagement.Structure.AST.GetAnnotation("eFMI_TestCases." + name, "__fmi_modelExportName");
                if Modelica.Utilities.Strings.length(annot) < 8 then
                  print("Cannot find a proper name for the FMU to be exported (will use full name) for test case " + name);
                  fmuName := name;
                else
                  len := Modelica.Utilities.Strings.length(annot);
                  fmuName := Modelica.Utilities.Strings.substring(annot,3,len-1);
                end if;

                annot := ModelManagement.Structure.AST.GetAnnotation("eFMI_TestCases." + name, "__fmi_sourceModel");
                len := Modelica.Utilities.Strings.length(annot);
                if len > 3 then
                  sourceName := Modelica.Utilities.Strings.substring(annot,3,len-1);
                else
                  sourceName := "";
                end if;

                if first then
                  text0 := "";
                  first := false;
                else
                  text0 := ",";
                end if;

                // Check for models in package "ReferenceTests" to generate (several) reference results
                nameResults := fill("",0);
                if size(UseCaseModel, 1) > 0 then
                  for i in 1:size(UseCaseModel, 1) loop
                      // Search for reference models to current use case
                      if Modelica.Utilities.Strings.isEqual(UseCaseModel[i], "eFMI_TestCases." + name) then
                        nameResults := cat(1, {ReferenceModel[i]}, nameResults);
                      end if;
                  end for;
                end if;
                useOriginalUseCase := false;
                if size(nameResults,1) == 0 then
                  // Default, if no reference models exist, use the original model
                  nameResults := {name};
                  useOriginalUseCase := true;
                end if;

                text := text + text0 + "\n\t\t\tModelInformation(testCaseName=\""+name+"\", FMUName=\""+fmuName+"\", sourceName=\""+sourceName+"\", Reference={";
                for i in 1:size(nameResults,1) loop
                  if useOriginalUseCase then
                    (annot, ok) := Internal.getNameAtInterfaceAnnotation("eFMI_TestCases." + nameResults[i]);
                  else
                    (annot, ok) := Internal.getInterfaceVariableAnnotation("eFMI_TestCases." + nameResults[i]);
                  end if;
                  if not ok then
                     print("Cannot find proper annotations for the reference model " + nameResults[i]);
                     text := "";
                     return;
                  end if;
                  text := text + "ReferenceType(modelName=\"" + nameResults[i] + "\", InterfaceVariables" + annot + ")";
                  if i<size(nameResults,1) then
                    text := text + ", ";
                  end if;
                end for;
                text := text + "})";
            end if;
        end for;
      else
        print("Cannot find subpackage Tests for package " + pack1);
      end if;
    end if;
  end for;

  text := text + "\n\t\t};\n";

end testCaseInput;
