    PROCESSOR 16F18855
    
    #include <xc.inc>
    
skipnz MACRO
    btfsc   STATUS, STATUS_Z_POSITION
ENDM

    ; config word 1
    config CLKOUTEN = OFF	    ; CLKOUT function is disabled
    config CSWEN    = OFF           ; Clock Switch Enable bit
    config FCMEN    = OFF	    ; Fail-Safe Clock Monitor is disabled
    config RSTOSC   = HFINT32       ; HFINTOSC with OSCFRQ= 32 MHz and CDIV = 1:1
    config FEXTOSC  = OFF           ; xternal Oscillator is disabled. RA7 is available as a general purpose I/O.
    
    ; config word 2
    config STVREN   = ON	    ; Stack Overflow or Underflow will cause a Reset
    config PPS1WAY  = ON            ; The PPSLOCKED bit can be cleared and set only once; PPS registers remain locked after one clear/set cycle
    config ZCD      = OFF           ; ZCD disabled.
    config BORV     = HI            ; Brown-out Reset voltage set to higher trip point level 
    config BOREN    = ON	    ; BOR enabled
    config LPBOREN  = OFF           ; LPBOR disabled
    config PWRTE    = OFF	    ; PWRT disabled
    config MCLRE    = ON            ; MCLR enable bit
    
    ; config word 3
#ifdef __DEBUG    
    config WDTE     = OFF           ; Watchdog Timer (WDT disabled)
#else
    config WDTE     = ON            ; Watchdog Timer (WDT enabled)
    config WDTCPS   = WDTCPS_9      ; 1:16384 (Interval 0.5s typ)
#endif
    
    ; config word 4
    config WRT      = OFF	    ; Write protection off
    config SCANE    = available     ; Scanner module is available for use
    config LVP      = ON	    ; Low-voltage programming disabled

    ; config word 5
    config CP       = OFF	    ; Code Protect (Code protection off)
    config CPD      = OFF	    ; Data Code Protection

    PULSE   equ 4
   
    PSECT   Por_Vec,class=CODE,delta=2
    ;ORG 0
resetVec:
    goto    Start

    ; Interrupt vector and handler
    PSECT   Isr_Vec,class=CODE,delta=2
    ;ORG 4
    clrwdt
    banksel PIR2
    btfsc   PIR2, PIR2_C1IF_POSITION
    goto    C1_Interrupt
    banksel PIR0
    bcf     PIR0, PIR0_TMR0IF_POSITION
    clrw
    banksel Delay
    xorwf   Delay, W
    skipnz
    retfie
    decfsz  Delay
    retfie
; Set RC4
    banksel PORTC
    bsf     PORTC, PULSE
    retfie

C1_Interrupt:
    bcf     PIR2, PIR2_C1IF_POSITION
    movlw   12 ; 100 ms
    banksel Delay
    movwf   Delay
;Clr RC4    
    banksel PORTC
    bcf     PORTC, PULSE
    retfie
    
Start:
    banksel Delay
    clrf    Delay
    call    Init_Ports		    ; Initialize the ports of the chip
    call    Init_DAC
    call    Init_Comparators
    call    Init_CLC1
    call    Init_Timer		    ; Initialize one of the onboard timers
    call    Init_Intr		    ; Initialize interrupts
; IDLE enable    
    banksel CPUDOZE
    movlw   0b10000000
    movwf   CPUDOZE
Main:
    sleep
    goto    Main		    ; loop forever

Init_DAC:
; DAC is enabled
; Positive source = VDD
; Negative source = VSS
    banksel DAC1CON0
    movlw   0b10000000
    movwf   DAC1CON0
; ~2.03V
    banksel DAC1CON1
    movlw   13
    movwf   DAC1CON1
    return
    
Init_Comparators:
; Comparator is enabled
; Comparator output is not inverted
    banksel CM1CON0
    movlw   0b10000000
    movwf   CM1CON0
; The CxIF interrupt flag will be set upon a negative-going edge of the CxOUT bit
    banksel CM1CON1
    movlw   0b00000001
    movwf   CM1CON1
; CxVN connects to CxIN1- pin
    banksel CM1NSEL
    movlw   0b00000001
    movwf   CM1NSEL
; CxVP connects to DAC output
    banksel CM1PSEL
    movlw   0b00000101
    movwf   CM1PSEL

; Comparator is enabled
; Comparator output is inverted
    banksel CM2CON0
    movlw   0b10010000
    movwf   CM2CON0
; CxVN connects to CxIN1- pin
    banksel CM2NSEL
    movlw   0b00000001
    movwf   CM2NSEL
; CxVP connects to CxIN0+ pin
    banksel CM2PSEL
    movlw   0b00000000
    movwf   CM2PSEL
    
    return

Init_CLC1:
; CLC1 output is inverted
    banksel CLC1POL
    movlw   0b10000000
    movwf   CLC1POL
; Data0 = Comparator 1 output
    banksel CLC1SEL0
    movlw   0b00011011
    movwf   CLC1SEL0
; Data1 = Comparator 2 output
    banksel CLC1SEL1
    movlw   0b00011100
    movwf   CLC1SEL1
; Data2 = Comparator 1 output
    banksel CLC1SEL2
    movlw   0b00011011
    movwf   CLC1SEL2
; Data3 = Comparator 2 output
    banksel CLC1SEL3
    movlw   0b00011100
    movwf   CLC1SEL3
; CLCIN0 (true) is gated into CLCx Gate 0
    banksel CLC1GLS0
    movlw   0b00000010
    movwf   CLC1GLS0
; CLCIN1 (true) is gated into CLCx Gate 1
    banksel CLC1GLS1
    movlw   0b00001000
    movwf   CLC1GLS1
; CLCIN2 (true) is gated into CLCx Gate 2
    banksel CLC1GLS2
    movlw   0b00100000
    movwf   CLC1GLS2
; CLCIN3 (true) is gated into CLCx Gate 3
    banksel CLC1GLS3
    movlw   0b10000000
    movwf   CLC1GLS3
; CLC1 is enabled
; Mode = 4 input AND
    banksel CLC1CON
    movlw   0b10000010
    movwf   CLC1CON
    return
    
Init_Ports:
; Weak pull-ups are disabled for RA1, RA2
    banksel WPUA
    movlw   0b11111001
    movwf   WPUA
    banksel WPUB
    movlw   0b11111111
    movwf   WPUB
; Weak pull-ups are disabled for RC4-7
    banksel WPUC
    movlw   0b00001111
    movwf   WPUC
    
; RC4-7 -> output    
    banksel TRISC
    movlw   0b00001111
    movwf   TRISC

; RC7 -> C1OUT    
    banksel RC7PPS
    movlw   0x12
    movwf   RC7PPS
; RC6 -> C2OUT    
    banksel RC6PPS
    movlw   0x13
    movwf   RC6PPS
; RC5 -> CLC1OUT    
    banksel RC5PPS
    movlw   0x01
    movwf   RC5PPS
    
    return

Init_Timer:
; Timer0 control register 1:
; Clock source = LFINTOSC (31 kHZ)
; Prescaler 1:1
; The input to the TMR0 counter is not synchronized to system clocks    
    banksel T0CON1
    movlw   0b10010000
    movwf   T0CON1
; Timer0 control register 0: 
; Postscaler=1:1
; TMR0 is a 8 bit timer
; TMR0 is enabled
    banksel T0CON0
    movlw   0b10000000
    movwf   T0CON0
    return
    
Init_Intr:
; TMR0 Overflow Interrupt Enable bit
    banksel PIE0
    movlw   0b00100000
    movwf   PIE0

; Comparator C1 interrupt enable
    banksel PIE2
    movlw   0b00000001
    movwf   PIE2
    
; Enables all active interrupts
; Enables all active peripheral interrupts
    banksel INTCON
    movlw   0b11000000
    movwf   INTCON
    return
    
;
; Application data
;
    PSECT   MainData,global,class=RAM,space=1,delta=1,noexec
;
    GLOBAL  Delay
;
Delay:		DS  1
    
    end resetVec
