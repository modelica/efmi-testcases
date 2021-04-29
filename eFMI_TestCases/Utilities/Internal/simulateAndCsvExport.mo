within eFMI_TestCases.Utilities.Internal;
function simulateAndCsvExport
  input String modelName = "" "Name of model, e.g. Modelica.Mechanics.Rotational.Components.Clutch";
  input String resultName = "";
  input MapName interfaceVariables[:];
  input String ReferenceDir = "ReferenceResults";
  input Boolean doAlso32BitExport = false;

  output Boolean result[if doAlso32BitExport then 2 else 1] "true if successful";

  import Modelica.Utilities.Strings.*;

protected
  Integer n, k;
  Real traj[:,:];
  String csvFile;
  String resultFile = "resFile";
  String resultFile_ext = resultFile + ".mat";
  Boolean ok;
  String varName2_From[:];
  String varName2_To[:];

  Real StartTime, StopTime, OutputInterval, Tolerance, FixedStepSize;
  Integer NumberOfIntervals;
  String Algorithm;
  Integer i;
  Boolean ok_plot;
  String traj_names[:];
  Boolean found;
  Integer nOutputs;
  Real traj2[:,:];
  Real d[:];
  Integer numberOfRows;
  Real delta;
  Boolean reTry;

algorithm

  ok := translateModel(modelName);
  (StartTime, StopTime, NumberOfIntervals, OutputInterval, Algorithm, Tolerance, FixedStepSize) := getExperiment();
  ok := ok and DymolaCommands.SimulatorAPI.experimentSetupOutput(doublePrecision=true, events=false);

  numberOfRows := integer(0.5 + (StopTime-StartTime)/OutputInterval) + 1;
  delta := OutputInterval*numberOfRows;
  reTry := false;

  for jj in 1:2 loop

    ok := ok and simulateModel(modelName,startTime=StartTime,stopTime=StartTime+delta, numberOfIntervals=NumberOfIntervals, outputInterval=OutputInterval, method=Algorithm, resultFile=resultFile);

    if ok then

      for tt in 1:(if doAlso32BitExport then 2 else 1) loop // 64 Bit export and maybe a 32 Bit export

        varName2_From := fill("",0);
        varName2_To := fill("",0);

        // Scalarize all multdimensional variables
        for j in 1:size(interfaceVariables,1) loop
          if size(interfaceVariables[j].dimensions,1) > 0 then
            if size(interfaceVariables[j].dimensions,1) > 1 then
              assert(false, "Multidimensional interface variables (#dim > 1) are not yet supported.");
            end if;

            // Scalarize first dimension (vector components)
            for m in 1:interfaceVariables[j].dimensions[1] loop
              varName2_From := cat(1, varName2_From, {interfaceVariables[j].from + "[" + String(m) + "]"});
              varName2_To := cat(1, varName2_To, {interfaceVariables[j].to + "[" + String(m) + "]"});
            end for;
          else // scalar variable
            varName2_From := cat(1, varName2_From, {interfaceVariables[j].from});
            varName2_To := cat(1, varName2_To, {interfaceVariables[j].to});
          end if;
        end for;

        // Check, if all the from-variables are contained in result file
        traj_names := readTrajectoryNames(resultFile_ext);
        for j in 1:size(varName2_From,1) loop
          found := false;
          for i in 1:size(traj_names,1) loop
            if isEqual(traj_names[i], varName2_From[j]) then
                found := true;
                break;
            end if;
          end for;
          if not found then
            Modelica.Utilities.Streams.print("Variable " + varName2_From[j] + " not found in result file " + resultFile_ext);
            result := fill(false, size(result,1));
          end if;
        end for;

  /*
        // Add lower and upper bounds variables for all outputs
        nOutputs := 0;
        for j in 1:size(interfaceVariables,1) loop
          if interfaceVariables[j].isOutput then
            if size(interfaceVariables[j].dimensions,1) > 0 then
              // Scalarize first dimension (vector components)
              for m in 1:interfaceVariables[j].dimensions[1] loop
                varName2_To := cat(1, varName2_To, {interfaceVariables[j].to + "_lower[" + String(m) + "]", interfaceVariables[j].to + "_upper[" + String(m) + "]"});
              end for;
              nOutputs := nOutputs + interfaceVariables[j].dimensions[1];
            else // scalar variable
              varName2_To := cat(1, varName2_To, {interfaceVariables[j].to + "_lower", interfaceVariables[j].to + "_upper"});
              nOutputs := nOutputs + 1;
            end if;
          end if;
        end for;
  */

        varName2_From := cat(1,{"Time"}, varName2_From);
        varName2_To :=cat(1, {"Time"}, varName2_To);

        n := readTrajectorySize(resultFile_ext);

        if n-1 <> numberOfRows then
          Modelica.Utilities.Streams.print("Reference results for model " + modelName + ": Number of rows is not correct. " + String(n-1) + " / " + String(numberOfRows) + "  StopTime = " + String(StartTime+delta, format="12.16f") + " Will retry simulation with extended stop time.");
          delta := OutputInterval*(numberOfRows+1);
          reTry := true;
          break;
        end if;

        traj := readTrajectory(resultFile_ext, varName2_From, n);

        //Modelica.Utilities.Streams.print("Size of traj: " + String(size(traj,1)) + ", " + String(size(traj,2)) + "   " + String(tt));

        traj2 := fill(0.0, n, size(varName2_To,1));
        traj2[:,1:size(varName2_From,1)] := transpose(traj);

  /*      
        
        // Compute lower and upper bounds for all outputs
        i := size(varName2_From,1);
        k := 1;
        for j in 1:size(interfaceVariables,1) loop
          if size(interfaceVariables[j].dimensions,1) > 0 then
              // Scalarize first dimension (vector components)
            if interfaceVariables[j].isOutput then
              for m in 1:interfaceVariables[j].dimensions[1] loop
                // Compute lower and upper bounds
                i := i + 1;
                k := k + 1;
                d := abs(traj2[:,k])*relTol + fill(absTol,n);
                traj2[:,i] := traj2[:,k] - d;
                i := i + 1;
                traj2[:,i] := traj2[:,k] + d;
              end for;
            else
              k := k + interfaceVariables[j].dimensions[1];
            end if;
          else // scalar variable
            k := k + 1;
            if interfaceVariables[j].isOutput then
              // Compute lower and upper bounds
              i := i + 1;
              d := abs(traj2[:,k])*relTol + fill(absTol,n);
              traj2[:,i] := traj2[:,k] - d;
              i := i + 1;
              traj2[:,i] := traj2[:,k] + d;
            end if;
          end if;
        end for;
  
  */
        csvFile := ReferenceDir + "/" + resultName + (if (tt==2) then "_32" else "") + ".csv";
        result[tt] := Internal.writeCSVFile(csvFile, varName2_To, traj2, separator=",", deleteLastRow=true, do32Bit=(tt==2));

       end for;

    else
       result := fill(false, size(result,1));
    end if;

    if not reTry then
      break;
    end if;

  end for;

  annotation (__Dymola_interactive=true);
end simulateAndCsvExport;
