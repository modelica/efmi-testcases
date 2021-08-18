double generator_voltageSlope(double R, double L, double U_Ideal, double U_Bat, double U_R) {
	double dU_R;
	if( U_R>=0.0 ){
		dU_R = R/L*(U_Ideal - U_Bat - U_R);
	} else{
		dU_R = R/L*(U_Ideal + U_Bat - U_R);
	}
	return dU_R;
}