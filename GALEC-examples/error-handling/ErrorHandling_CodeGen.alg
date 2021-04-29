block ErrorHandling
	input Real inputValue;

	output Real outputValue1;
    output Real outputValue2;
    output Real outputValue3;
    output Real outputValue4;
    output Real outputValue5;

	parameter Real parameterValue;

protected
    constant Real stepSize;

    parameter Real dependentParameterValue;

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
        
        
        /* - Set signals -
         *
         * TODO: Signal propagation / closures */
         */

        signal OVERFLOW;
        
        signal NO_SOLUTION_FOUND, NAN;


        /* TODO: Calls of user functions (= with formal parameters)
         * with exposed signals.
         */

	end DoStep;
end ErrorHandling;
