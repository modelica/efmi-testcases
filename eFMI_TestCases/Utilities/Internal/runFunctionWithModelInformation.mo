within eFMI_TestCases.Utilities.Internal;
function runFunctionWithModelInformation
  input String call;
  output Boolean ok;

protected
  String text;
  Integer magicNumber = integer(internal_twister_uniform()*2147483647);
  String tmpMosFile = "Tmp72724.mos";
  String tmpFuncName = "run23523" + String(magicNumber);

algorithm

  text := "function " + tmpFuncName;
  text := text + Internal.testCaseInput();
  text := text + "algorithm\n";
  text := text + call;
  text := text + "end " + tmpFuncName + ";";

  //Modelica.Utilities.Files.removeFile(tmpFuncName+".mo");
  //Modelica.Utilities.Streams.print(text,tmpFuncName+".mo");

  ok := DymolaCommands.SimulatorAPI.setClassText("", text);
  if not ok then
    Modelica.Utilities.Streams.print("Cannot generate Modelica function to be called.");
    return;
  end if;
  Modelica.Utilities.Files.remove(tmpMosFile);
  Modelica.Utilities.Streams.print(tmpFuncName + "();", tmpMosFile);

  ok := DymolaCommands.SimulatorAPI.RunScript(tmpMosFile, silent=true);
  if not ok then
    Modelica.Utilities.Streams.print("Cannot run Modelica function to be called.");
    return;
  end if;
  () := DymolaCommands.System.eraseClasses({tmpFuncName});

annotation(__Dymola_interactive=true);
end runFunctionWithModelInformation;
