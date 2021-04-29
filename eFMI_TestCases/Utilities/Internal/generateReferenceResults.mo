within eFMI_TestCases.Utilities.Internal;
function generateReferenceResults "Generates reference result files for all test case models into the given directory"
  import Modelica.Utilities.Streams.print;

  input String ReferenceDir = "ReferenceResults" "Directory, where the results will be written. It will be deleted before newly generated.";
  input Boolean include32BitFiles = true "Additionaly export result files with 32 Bit precision";

  input ModelInformation info[:] "Complete data structure of model information for all test cases (is generated automatically)";

protected
  Boolean ok[if include32BitFiles then 2 else 1];
  Integer nOK, nNotOK, n;

algorithm

  n := size(info,1);

  Modelica.Utilities.Files.remove(ReferenceDir);
  Modelica.Utilities.Files.createDirectory(ReferenceDir);

  nOK := 0;
  nNotOK := 0;
  for i in 1:n loop
    for j in 1:size(info[i].Reference,1) loop
      ok := Internal.simulateAndCsvExport("eFMI_TestCases."+info[i].Reference[j].modelName, info[i].Reference[j].modelName, info[i].Reference[j].InterfaceVariables, ReferenceDir, include32BitFiles);
      if not ok[1] then
        print("Simulation or csv export failed (64 Bit variant) for model " + info[i].Reference[j].modelName);
        nNotOK := nNotOK + 1;
      else
        nOK := nOK + 1;
      end if;
      if include32BitFiles then
        if not ok[2] then
          print("Simulation or csv export failed (32 Bit variant) for model " + info[i].Reference[j].modelName);
          nNotOK := nNotOK + 1;
        else
          nOK := nOK + 1;
        end if;
      end if;
    end for;
  end for;

  print(String(nOK) + " of " + String(nOK+nNotOK) + " reference file(s) for " + String(n) + " test cases generated in directory \"" + ReferenceDir + "\".");
  if nNotOK > 0 then
    print(String(nNotOK) + " file(s) could not be generated.");
  end if;

  annotation(__Dymola_interactive=true);
end generateReferenceResults;
