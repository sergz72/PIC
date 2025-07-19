//ICD Pin Placement Select bits
#ifdef __dsPIC33CK256MP508__
#pragma config ICS = PGD3
#else
#ifdef __dsPIC33CK256MP202__
#error Not ready yet
#else
#error Unknown processor type  
#endif
#endif

// Select FRC on POR
#pragma config FNOSC = FRC // Oscillator Source Selection (Internal Fast RC (FRC))
#pragma config IESO = OFF
// Enable Clock Switching
#pragma config FCKSM = CSECMD

#pragma config ALTI2C1 = ON    //Alternate I2C1 Pin bit->I2C1 mapped to ASDA1/ASCL1 pins