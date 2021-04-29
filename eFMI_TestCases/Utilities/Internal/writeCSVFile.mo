within eFMI_TestCases.Utilities.Internal;
function writeCSVFile
  input String fileName "File containing the data";
  input String headers[:] "Headers to write";
  input Real data[:, size(headers, 1)] "Data to write";
  input String separator=";" "Separator used";
  input Boolean deleteLastRow=false  "= true, if last row of data shall not be written";
  input Boolean do32Bit=false;
  output Boolean ok;

  import Modelica.Utilities.Streams.*;

protected
  String s;
  Integer i;
  Integer n = size(data,1);
  Integer m = size(data,2);

algorithm

  Modelica.Utilities.Files.removeFile(fileName);

  s := "";
  for i in 1:size(headers,1)-1 loop
    s := s + headers[i] + separator;
  end for;
  s := s + headers[end];
  print(s, fileName);
  close(fileName);

  ok := exportCSVData(data[1:(n-(if deleteLastRow then 1 else 0)), 1:m], separator, fileName, do32Bit);

end writeCSVFile;
