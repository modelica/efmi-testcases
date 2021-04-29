block ErrorHandling
	input Real inputValue;

    output Real outputValue1;
    output Real outputValue2;
    output Real outputValue3;
    output Real outputValue4;
    output Real outputValue5;
    output Real outputValue6a;
    output Real outputValue6b;
    output Real outputValue7;
    output Real outputValue8;

protected

    Real stateValue;

public
	method Startup
	algorithm
	end Startup;

	method Recalibrate
	algorithm
	end Recalibrate;

	method DoStep
    protected
        Real r1;
        Real r2;
        Real r3;
        Real r4;
	algorithm
    
        /* - Test if signals are set - */

        /* Simple test if signal is set (signal-satisfied) */
        self.outputValue1 := r1 / r2;
        if signal in OVERFLOW then
            self.outputValue1 := 0.0;
        end if;

        /* Simple test if signal is NOT set (signal-satisfied) */
        self.outputValue2 := r1 / r2;
        if signal not in OVERFLOW then
            self.outputValue2 := self.outputValue2 * 3.14;
        end if;

        /* ... (conditional-satisfied) */
        self.outputValue3 := r1 / r2;
        if signal in OVERFLOW or r1 == 0.0 then
            self.outputValue3 := 0.0;
        end if;

        /* Two different signals tested separately */
        self.outputValue4 := r1 / r2;
        if signal in OVERFLOW then
            self.outputValue4 := 0.0;
        elseif signal in NAN then
            self.outputValue4 := -1.0;
        end if;

        /* Two different signals tested separately */
        self.outputValue5 := r1 / r2;
        if signal in OVERFLOW, NAN then
            self.outputValue5 := 0.0;
        end if;
        
        
        /* - Signal propagation / closures - */
        
        if signal s then
            signal s;
        end if;

        if signal s2 in OVERFLOW then
            signal s2;
        end if;

        if signal s3 not in OVERFLOW then
            signal s3;
        end if;

        if signal s4 or r3 == 0.0 then
            signal s4;
        end if;


        /* - Calls of user functions with exposed signals - */

        /* Function call */
        self.outputValue6a := r1 / r2;
        self.outputValue6b := func1(self.outputValue6a);


        /* Function call returning signals */
        self.outputValue7 := func2(r1, r2);
        if signal in OVERFLOW then
            self.outputValue7 := 0.0;
        end if;


        /* Function call returning signals */
        self.outputValue8 := func3(r1, r2);
        if signal in OVERFLOW then
            self.outputValue8 := 0.0;
        end if;
	end DoStep;


    function func1
        input Real param;
        output Real result;
    algorithm
        result := param * 2.0;
    end func1


    function func2
        signals OVERFLOW;

        input Real param1;
        input Real param2;
        output Real result;
    algorithm
        if param2 == 0.0 then
            signal OVERFLOW;
        else
            result := param1 / param2;
        end if;
    end func2


    function func3
        signals OVERFLOW, NAN, NO_SOLUTION_FOUND;

        input Real param1;
        input Real param2;
        output Real result;
    algorithm
        if param2 == 0.0 then
            signal OVERFLOW;
        elseif param2 == -1.0 then
            signal NO_SOLUTION_FOUND, NAN;
        else
            result := param1 / param2;
        end if;
    end func3

end ErrorHandling;
