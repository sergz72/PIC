// Configuration bits: selected in the GUI

// FBS
#pragma config BWRP = OFF    //Boot Segment Write Protect->Disabled
#pragma config BSS = OFF    //Boot segment Protect->No boot program flash segment

// FGS
#pragma config GWRP = OFF    //General Segment Write Protect->General segment may be written
#pragma config GCP = OFF    //General Segment Code Protect->No Protection

// FOSCSEL
#pragma config FNOSC = FRC    //Oscillator Select->8 MHz Fast RC Oscillator (FRC)
#pragma config SOSCSRC = DIG    //SOSC Source Type->Digital Mode
#pragma config LPRCSEL = HP    //LPRC Oscillator Power and Accuracy->High Power, High Accuracy Mode
#pragma config IESO = OFF    //Internal External Switch Over bit->Internal External Switchover mode disabled (Two-speed Start-up disabled)

// FOSC
#pragma config POSCMOD = NONE    //Primary Oscillator Configuration bits->Primary oscillator disabled
#pragma config OSCIOFNC = IO    //CLKO Enable Configuration bit->Port I/O enabled (CLKO disabled)
#pragma config POSCFREQ = HS    //Primary Oscillator Frequency Range Configuration bits->Primary oscillator/external clock input frequency greater than 8MHz
#pragma config SOSCSEL = SOSCHP    //SOSC Power Selection Configuration bits->Secondary Oscillator configured for high-power operation
#pragma config FCKSM = CSDCMD    //Clock Switching and Monitor Selection->Both Clock Switching and Fail-safe Clock Monitor are disabled

// FWDT
#pragma config WDTPS = PS32768    //Watchdog Timer Postscale Select bits->1:32768
#pragma config FWPSA = PR128    //WDT Prescaler bit->WDT prescaler ratio of 1:128
#pragma config FWDTEN = OFF    //Watchdog Timer Enable bits->WDT disabled in hardware; SWDTEN bit disabled
#pragma config WINDIS = OFF    //Windowed Watchdog Timer Disable bit->Standard WDT selected(windowed WDT disabled)

// FPOR
#pragma config BOREN = BOR3    //Brown-out Reset Enable bits->Brown-out Reset enabled in hardware, SBOREN bit disabled
#pragma config RETCFG = OFF    //->Retention regulator is not available
#pragma config PWRTEN = ON    //Power-up Timer Enable bit->PWRT enabled
#pragma config I2C1SEL = PRI    //Alternate I2C1 Pin Mapping bit->Use Alternate location for SCL1/SDA1 pins
#pragma config BORV = V27    //Brown-out Reset Voltage bits->Brown-out Reset set 2.7v
#pragma config MCLRE = ON    //MCLR Pin Enable bit->RA5 input pin disabled, MCLR pin enabled

// FICD
#pragma config ICS = PGx1    //ICD Pin Placement Select bits->EMUC/EMUD share PGC1/PGD1
