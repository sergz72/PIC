    PROCESSOR 16F18124
    
    #include <xc.inc>
    
skipnz MACRO
    btfsc   STATUS, STATUS_Z_POSITION
ENDM

    ; config word 1
    config FCMEN    = OFF	     ; Fail-Safe Clock Monitor is disabled
    config VDDAR    = HI             ; Internal analog systems are calibrated for operation between VDD = 2.3V - 5.5V
    config CSWEN    = OFF            ; Clock Switch Enable bit
    config CLKOUTEN = OFF	     ; CLKOUT function is disabled
    config RSTOSC   = HFINTOSC_32MHz ; HFINTOSC with FRQ= 32 MHz and CDIV = 1:1
    config FEXTOSC  = OFF            ; External Oscillator is disabled. RA7 is available as a general purpose I/O.
    
    ; config word 2
    config STVREN   = ON	    ; Stack Overflow or Underflow will cause a Reset
    config PPS1WAY  = ON            ; The PPSLOCKED bit can be cleared and set only once; PPS registers remain locked after one clear/set cycle
    config ZCD      = OFF           ; ZCD disabled.
    config BORV     = HI            ; Brown-out Reset voltage set to higher trip point level
    config DACAUTOEN = ON           ; DAC Buffer reference range is automatically determined by module hardware
    config BOREN    = ON	    ; BOR enabled
    config LPBOREN  = OFF           ; LPBOR disabled
    config PWRTS    = PWRT_OFF	    ; PWRT disabled
    config MCLRE    = EXTMCLR       ; MCLR enable bit
    
    ; config word 3
#ifdef __DEBUG    
    config WDTE     = OFF           ; Watchdog Timer (WDT disabled)
#else
    config WDTE     = ON            ; Watchdog Timer (WDT enabled)
    config WDTCPS   = WDTCPS_9      ; 1:16384 (Interval 0.5s typ)
#endif
    
    ; config word 4
    config LVP      = ON	    ; Low-voltage programming disabled

    ; config word 5
    config CP       = OFF	    ; Code Protect (Code protection off)
    config CPD      = OFF	    ; Data Code Protection

    PULSE   equ 2
   
    PSECT   Por_Vec,class=CODE,delta=2
resetVec:
    goto    Start

    ; Interrupt vector and handler
    PSECT   Isr_Vec,class=CODE,delta=2
    clrwdt
    banksel PIR5
    btfsc   PIR5, PIR5_CM1IF_POSITION
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
; Set RA2
    banksel PORTA
    bsf     PORTA, PULSE
    retfie

C1_Interrupt:
    bcf     PIR5, PIR5_CM1IF_POSITION
    movlw   12 ; 100 ms
    banksel Delay
    movwf   Delay
;Clr RA2  
    banksel PORTA
    bcf     PORTA, PULSE
    retfie
    
Start:
    call    Init_FVR
    call    Init_Ports		    ; Initialize the ports of the chip

    // pull up resistors are about 30k, RC delay with C = 100pf ~5us
    banksel Delay
    clrf    Delay
Loop:    
    decfsz  Delay
    goto    Loop
    
    call    Init_DAC1
    call    Init_DAC2
    call    Init_Comparator1
    call    Init_Comparator2
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

Init_FVR:
; FVR Buffer 2 Gain is 2x, (2.048V)
    banksel FVRCON
    movlw   0b10001000
    movwf   FVRCON
    return
    
; RC4 - switch
Init_DAC1:
; DAC1 is enabled
; Automatic ranging enabled; the REFRNG bit is ignored
; DAC1OUTx is disabled
; Positive source = FVR Buffer 2
; Negative source = VSS
    banksel DAC1CON
    movlw   0b10001000
    movwf   DAC1CON
    banksel PORTC
    btfsc   PORTC, 4
    goto Set_2_0
; ~1.6V
    banksel DAC1DATL
    movlw   200
    movwf   DAC1DATL
    return
Set_2_0:
; ~2.0V
    banksel DAC1DATL
    movlw   255
    movwf   DAC1DATL
    return

; RC5 - switch
Init_DAC2:
; DAC2 is enabled
; Automatic ranging enabled; the REFRNG bit is ignored
; DAC1OUTx is disabled
; Positive source = FVR Buffer 2
; Negative source = VSS
    banksel DAC2CON
    movlw   0b10001000
    movwf   DAC2CON
    banksel PORTC
    btfsc   PORTC, 5
    goto Set_0_4
; ~0.2V
    banksel DAC2DATL
    movlw   25
    movwf   DAC2DATL
    return
Set_0_4:
; ~0.4V
    banksel DAC2DATL
    movlw   50
    movwf   DAC2DATL
    return
    
Init_Comparator1:
; Comparator is enabled
; Comparator output is not inverted
; Comparator hysteresis disabled
; Comparator output to Timer1 and I/O pin is asynchronous
    banksel CM1CON0
    movlw   0b10000000
    movwf   CM1CON0
; The CxIF interrupt flag will be set upon a negative-going edge of the CxOUT bit
    banksel CM1CON1
    movlw   0b00000001
    movwf   CM1CON1
; CxVN connects to CxIN3- pin
    banksel CM1NCH
    movlw   0b00000011
    movwf   CM1NCH
; CxVP connects to DAC1 output
    banksel CM1PCH
    movlw   0b00000100
    movwf   CM1PCH

Init_Comparator2:
; Comparator is enabled
; Comparator output is inverted
; Comparator hysteresis disabled
; Comparator output to Timer1 and I/O pin is asynchronous
    banksel CM2CON0
    movlw   0b10010000
    movwf   CM2CON0
; CxVN connects to CxIN3- pin
    banksel CM2NCH
    movlw   0b00000011
    movwf   CM2NCH
; CxVP connects to DAC2 output
    banksel CM2PCH
    movlw   0b00000101
    movwf   CM2PCH
    
    return

Init_CLC1:
; CLC1 output is inverted
    banksel CLCnPOL
    movlw   0b10000000
    movwf   CLCnPOL
; Data0 = Comparator 1 output
    banksel CLCnSEL0
    movlw   0b00011111
    movwf   CLCnSEL0
; Data1 = Comparator 2 output
    banksel CLCnSEL1
    movlw   0b00100000
    movwf   CLCnSEL1
; Data2 = Comparator 1 output
    banksel CLCnSEL2
    movlw   0b00011111
    movwf   CLCnSEL2
; Data3 = Comparator 2 output
    banksel CLCnSEL3
    movlw   0b00100000
    movwf   CLCnSEL3
; Data1 (true) is gated into CLCx Gate 0
    banksel CLCnGLS0
    movlw   0b00000010
    movwf   CLCnGLS0
; Data2 (true) is gated into CLCx Gate 1
    banksel CLCnGLS1
    movlw   0b00001000
    movwf   CLCnGLS1
; Data3 (true) is gated into CLCx Gate 2
    banksel CLCnGLS2
    movlw   0b00100000
    movwf   CLCnGLS2
; Data4 (true) is gated into CLCx Gate 3
    banksel CLCnGLS3
    movlw   0b10000000
    movwf   CLCnGLS3
; CLC1 is enabled
; Mode = 4 input AND
    banksel CLCnCON
    movlw   0b10000010
    movwf   CLCnCON
    return

; RA2 - blue (pulse)
; RC0 - green (1)
; RC1 - yellow (HI-Z)
; RC2 - red (0)
; RC3 - C1IN3-,C2IN3-
; RC4,RC5 - switches
Init_Ports:
; Weak pull-up is disabled for RA2
    banksel WPUA
    movlw   0b11111011
    movwf   WPUA
; Weak pull-ups are disabled for RC0-3
    banksel WPUC
    movlw   0b11110000
    movwf   WPUC
; TTL input level for RC4, RC5
    banksel INLVLC
    movlw   0b11001111
    movwf   INLVLC
; RC4,5 -> digital
    banksel ANSELC
    movlw   0b11001111
    movwf   ANSELC
; RC0-2 -> output    
    banksel TRISC
    movlw   0b11111000
    movwf   TRISC
; RA2 -> output
    banksel PORTA
    bsf     PORTA, PULSE
    banksel TRISA
    movlw   0b11111011
    movwf   TRISA
; RC0 -> C1OUT    
    banksel RC0PPS
    movlw   0x19
    movwf   RC0PPS
; RC2 -> C2OUT    
    banksel RC2PPS
    movlw   0x1A
    movwf   RC2PPS
; RC1 -> CLC1OUT    
    banksel RC1PPS
    movlw   0x01
    movwf   RC1PPS
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
    banksel PIE5
    movlw   0b01000000
    movwf   PIE5
    
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
