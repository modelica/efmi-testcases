within eFMI_TestCases.Utilities.Internal;
function sortStrings "Sort elements of a vector of strings in ascending or descending order"
 extends Modelica.Icons.Function;
  input String v[:] "String vector to be sorted";
  input Boolean ascending=true
    "= true if ascending order, otherwise descending order";
  input Boolean caseSensitive=true "= false, if case of letters is ignored";
  output String sorted_v[size(v, 1)]=v "Sorted vector";
  output Integer indices[size(v, 1)]=1:size(v, 1) "sorted_v = v[indices]";

  /* shellsort algorithm; */
protected
  Integer gap;
  Integer i;
  Integer j;
  String wv;
  Integer wi;
  Integer nv=size(v, 1);
  Boolean swap;
algorithm
  gap := div(nv, 2);

  while gap > 0 loop
    i := gap;
    while i < nv loop
      j := i - gap;
      if j >= 0 then
        if ascending then
          //swap := sorted_v[j + 1] > sorted_v[j + gap + 1];
          swap := Modelica.Utilities.Strings.compare(sorted_v[j + 1], sorted_v[j + gap + 1], caseSensitive) == Modelica.Utilities.Types.Compare.Greater;
        else
          //swap := sorted_v[j + 1] < sorted_v[j + gap + 1];
          swap := Modelica.Utilities.Strings.compare(sorted_v[j + 1], sorted_v[j + gap + 1], caseSensitive) == Modelica.Utilities.Types.Compare.Less;
        end if;
      else
        swap := false;
      end if;

      while swap loop
        wv := sorted_v[j + 1];
        wi := indices[j + 1];
        sorted_v[j + 1] := sorted_v[j + gap + 1];
        sorted_v[j + gap + 1] := wv;
        indices[j + 1] := indices[j + gap + 1];
        indices[j + gap + 1] := wi;
        j := j - gap;
        if j >= 0 then
          if ascending then
            //swap := sorted_v[j + 1] > sorted_v[j + gap + 1];
            swap := Modelica.Utilities.Strings.compare(sorted_v[j + 1], sorted_v[j + gap + 1], caseSensitive) == Modelica.Utilities.Types.Compare.Greater;
          else
            //swap := sorted_v[j + 1] < sorted_v[j + gap + 1];
            swap := Modelica.Utilities.Strings.compare(sorted_v[j + 1], sorted_v[j + gap + 1], caseSensitive) == Modelica.Utilities.Types.Compare.Less;
          end if;
        else
          swap := false;
        end if;
      end while;
      i := i + 1;
    end while;
    gap := div(gap, 2);
  end while;

  annotation (Documentation(info="<html>
  <h4>Syntax</h4>
<blockquote><pre>
           sorted_v = Vectors.<strong>sort</strong>(v);
(sorted_v, indices) = Vectors.<strong>sort</strong>(v, ascending=true, caseSensitive=false);
</pre></blockquote>
<h4>Description</h4>
<p>
Function <strong>sort</strong>(..) sorts a String vector v
in ascending order and returns the result in sorted_v.
If the optional argument \"ascending\" is <strong>false</strong>, the vector
is sorted in descending order. The optional argument \"caseSensitive\" controls the comparison of strings.
In the optional second
output argument the indices of the sorted vector with respect
to the original vector are given, such that sorted_v = v[indices].
</p>
<h4>Example</h4>
<blockquote><pre>
  (v2, i2) := Vectors.sort({\"house\", \"room\", \"car\", \"garden\", \"wood\"});
       -> v2 = {\"car\", \"garden\", \"house\", \"room\", \"wood\"}}
          i2 = {3, 4, 1, 2, 5}
</pre></blockquote>
<h4>Source</h4>          
<p>The implementation of this sort algorithm for strings is mainly based on the implementation of the function
<strong>Modelica.Math.Vectors.sort</strong>.</p>
<p><br>It follows the copyright of the original function Modelica.Math.Vectors.sort in the Modelica standard library:</p>
<p><br>Copyright &copy; 1998-2019 Modelica Association,</p>
<p><br>All rights reserved.</p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:</p>
<p>1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.</p>
<p>2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.</p>
<p>3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.</p>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>

</html>"));
end sortStrings;
