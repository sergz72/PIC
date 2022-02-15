    PROCESSOR 16F1824
    
    #include <xc.inc>
    
skipnz MACRO
    btfsc   STATUS, STATUS_Z_POSITION
ENDM

skipgt MACRO
    btfsc   STATUS, STATUS_C_POSITION
ENDM

skiple MACRO
    btfss   STATUS, STATUS_C_POSITION
ENDM

;    #define DEBUG
    
    ;
    ; Set the configuration word
    ;
#ifdef DEBUG    
    config WDTE     = OFF	    ; Watchdog Timer (WDT disabled)
#else
    config WDTE     = ON	    ; Watchdog Timer (WDT enabled)
#endif
    config CP       = OFF	    ; Code Protect (Code protection off)
    config CPD      = OFF	    ; Data Code Protection
    config MCLRE    = ON	    ; Master Clear Enable (GP3/MCLR pin function  is MCLR)
    config FCMEN    = OFF	    ; Fail-Safe Clock Monitor is disabled
    config IESO     = OFF	    ; Internal/External Switchover mode is disabled
    config CLKOUTEN = OFF	    ; CLKOUT function is disabled
    config BOREN    = OFF	    ; BOR disabled
    config PWRTE    = OFF	    ; PWRT enabled
    config FOSC     = INTOSC	    ; INTOSC oscillator
    config LVP      = OFF	    ; Low-voltage programming enabled
    config STVREN   = ON	    ; Stack Overflow or Underflow will cause a Reset
    config PLLEN    = OFF	    ; 4xPLL disabled
    config WRT      = OFF	    ; Write protection off

#ifdef DEBUG    
    DELAY	    equ 2           ; 4 sec
#else
    DELAY	    equ 900         ; 30 min
#endif

; Values for 1.8v VCC
;    ADC_LOW	    equ 224
;    ADC_HIGH	    equ 230

; Values for 2.048v FVR
    ADC_LOW	    equ 194
    ADC_HIGH	    equ 200

    BUTTON1	    equ 2	    ; Button 1 on pin 2 of port A
    BUTTON2	    equ 5	    ; Button 2 on pin 5 of port A
	    
    VOLATGE_DIVIDER equ 3	    ; Voltage divider on pin 3 of port C 
    VENT	    equ 2	    ; VENT on pin 2 of port C
    CHARGE_DISABLE  equ 4	    ; Charge disable on pin 4 of port C
    V15EN	    equ 5	    ; 15V EN on pin 5 of port C
    V15ON	    equ 4	    ; 15V ON on pin 4 of port A

    PSECT   Por_Vec,class=CODE,delta=2
resetVec:
    goto    Start

    ; Interrupt vector and handler
    PSECT   Isr_Vec,class=CODE,delta=2
    global CheckVBAT, FVR_ON, FVR_OFF
    
    clrwdt
    btfsc   INTCON,INTCON_IOCIF_POSITION
    goto    IOC_Interrupt
    bcf     INTCON,INTCON_TMR0IF_POSITION
    call    FVR_ON
    call    CheckVBAT
    call    FVR_OFF
    call    Enable_IOC
    banksel PORTC
    decfsz  V15ENDelayLO
    goto    Dec_Vent
    decfsz  V15ENDelayHI
    goto    Dec_Vent
    bcf     PORTA, V15ON
    bcf     PORTC, V15EN
Dec_Vent:
    decfsz  VentDelayLO
    retfie
    decfsz  VentDelayHI
    retfie
    bcf     PORTC, VENT
    retfie
IOC_Interrupt:
; Checking that IOC is enabled
    banksel EnableIOC
    clrw
    xorwf   EnableIOC, W
    skipnz
    goto    IOC_Disabled
    call    Disable_IOC
    banksel IOCAF
    btfsc   IOCAF, BUTTON1
    goto    Button1_Pressed
; Button 2 pressed
    clrf    IOCAF
    banksel PORTC
    btfsc   PORTC, V15EN
    goto    V15EN_OFF
; Charge disable - current overload protection
    bsf     PORTC, CHARGE_DISABLE
; Turn ON 15V enable
    bsf     PORTC, V15EN
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    bsf     PORTA, V15ON
    banksel V15ENDelayLO
    movlw   low(DELAY)+1
    movwf   V15ENDelayLO
    movlw   high(DELAY)+1
    movwf   V15ENDelayHI
    retfie
V15EN_OFF:
    bcf     PORTA, V15ON
    bcf     PORTC, V15EN
    retfie
Button1_Pressed:
    clrf    IOCAF
    banksel PORTC
    btfsc   PORTC, VENT
    goto    VENT_OFF
; Turn VENT ON
    bsf     PORTC, VENT
    banksel VentDelayLO
    movlw   low(DELAY)+1
    movwf   VentDelayLO
    movlw   high(DELAY)+1
    movwf   VentDelayHI
    retfie
VENT_OFF:
    bcf     PORTC, VENT
    retfie
IOC_Disabled:
    banksel IOCAF
    clrf    IOCAF
    retfie

FVR_ON:
    banksel FVRCON
; Fixed Voltage Reference is enabled
; Temperature Indicator is disabled
; Comparator and DAC Fixed Voltage Reference Peripheral output is off.
; ADC Fixed Voltage Reference Peripheral output is 2x (2.048V)    
    movlw   0b10000010
    movwf   FVRCON
FVRLoop:
    btfss   FVRCON, FVRCON_FVRRDY_POSITION
    goto    FVRLoop
    return
    
FVR_OFF:
    banksel FVRCON
    clrf    FVRCON
    return

CheckVBAT:
    banksel ADCON0
    bsf     ADCON0, ADCON0_ADON_POSITION
    nop
    bsf     ADCON0, ADCON0_ADGO_POSITION
ADCLoop:
    btfsc   ADCON0, ADCON0_ADGO_POSITION
    goto    ADCLoop
    banksel PORTC
    btfsc   PORTC, CHARGE_DISABLE
    goto    ChargeDisabled
    banksel ADRESH
    movlw   ADC_HIGH
    subwf   ADRESH, W
    skiple ; W <= ADRESH
    goto    ADCDone
    banksel PORTC
    bsf     PORTC, CHARGE_DISABLE ; charge disable
ADCDone:
    bcf     ADCON0, ADCON0_ADON_POSITION
    return
ChargeDisabled:
    banksel ADRESH
    movlw   ADC_LOW
    subwf   ADRESH, W
    skipgt ; W > ADRESH
    goto    ADCDone
    banksel PORTC
    bcf     PORTC, CHARGE_DISABLE ; charge enable
    bcf     ADCON0, ADCON0_ADON_POSITION
    return
    
    ; Power-On-Reset entry point
    PSECT   StartCode,class=CODE,delta=2
#ifndef DEBUG
    global Init_WDT
#endif
    global Init_Osc, Init_Ports, Init_Timer, Init_Intr, Init_ADC
    global Enable_IOC, Disable_IOC
    ;, Toggle_LED

Start:
    call    Enable_IOC
    call    Init_Osc		    ; Initialize the Internal Oscillator
    call    Init_Ports		    ; Initialize the ports of the chip
    call    Init_ADC		    ; ADC init
    call    Init_Timer		    ; Initialize one of the onboard timers
    call    Init_Intr		    ; Initialize interrupts
#ifndef DEBUG
    call    Init_WDT		    ; WDT init
#endif

Main:
    goto    Main		    ; loop forever

Enable_IOC:
    banksel EnableIOC
    movlw   1
    movwf   EnableIOC
    return

Disable_IOC:
    banksel EnableIOC
    clrf    EnableIOC
    return

Init_Osc:
    banksel OSCCON		    ; Go into bank 1
    clrf    OSCCON		    ; 31 kHz RC
    return

Init_Ports:
    banksel PORTA
    clrf    PORTA
    movlw   0b00010000              ; RC4 -> 1
    movwf   PORTC
    banksel ANSELA
    movlw   0b00000011		    ; RA0,RA1 -> Analog
    movwf   ANSELA
    movlw   0b00001000		    ; RC3 -> Analog
    movwf   ANSELC
    banksel TRISA
    movlw   0b00101111		    ; RA4 -> Output
    movwf   TRISA
    movlw   0b00001011		    ; RC2, RC4, RC5 -> output
    movwf   TRISC
    banksel WPUA
    movlw   0b11011011		    ; RA2, RA5 -> No pull up
    movwf   WPUA
    movlw   0b11110111		    ; RC3 -> No pull up
    movwf   WPUC
    return

Init_Timer:
; Timer0 Registers: 
; Prescaler=1:64;
; Internal instruction cycle clock (FOSC/4)
; Period=2.1 s
; Weak pull-ups are enabled by individual WPUx latch values
    banksel OPTION_REG
    movlw   0b01010101
    movwf   OPTION_REG
    return

Init_ADC:
    banksel ADCON0
; AN7 channel
    movlw   0b00011100
    movwf   ADCON0
; Left justified.
; A/D Conversion Clock - FRC
; VREF- is connected to VSS
; VREF+ is connected to VDD
;    movlw   0b01110000
; Left justified.
; A/D Conversion Clock - FRC
; VREF- is connected to VSS
; VREF+ is connected to internal Fixed Voltage Reference (FVR) module
    movlw   0b01110011
    movwf   ADCON1
    return
    
Init_Intr:
    banksel IOCAN
; Interrupt-on-Change enabled on the RA2, RA5 for a positive going edge
    movlw   0b00100100
    movwf   IOCAP
; Enables all active interrupts
; Enables all active peripheral interrupts
; Enables the Timer0 interrupt
; Enables the interrupt-on-change
    movlw   0b11101000
    movwf   INTCON
    return

#ifndef DEBUG
Init_WDT:
    banksel WDTCON
; 1:131072 (217) (Interval 4s typ)
    movlw   0b00011001
    movwf   WDTCON
    return
#endif

;
; Application data
;
    PSECT   MainData,global,class=RAM,space=1,delta=1,noexec
;
    GLOBAL  V15ENDelayLO, V15ENDelayHI, VentDelayLO, VentDelayHI, EnableIOC
;
V15ENDelayLO:   DS  1
V15ENDelayHI:   DS  1
VentDelayLO:    DS  1
VentDelayHI:    DS  1
EnableIOC:      DS  1
    
    end resetVec
    