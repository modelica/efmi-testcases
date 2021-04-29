within eFMI_TestCases.Utilities.Internal;
function StringVectorS
  input String s[:];
  output String y;
algorithm
  y := "";
  if size(s,1) == 0 then
    y := "fill(\"\",0)";
  end if;

  for i in 1:size(s,1) loop
    if i == 1 then
      y := y + "{\"" + s[i] + "\"";
    else
      y := y + ",\"" + s[i] + "\"";
    end if;
  end for;

  if size(s,1)>0 then
    y := y + "}";
  end if;

end StringVectorS;
