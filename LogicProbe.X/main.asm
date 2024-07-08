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
    config WDTE     = OFF	    ; Watchdog Timer (WDT disabled)
    
    ; config word 4
    config WRT      = OFF	    ; Write protection off
    config SCANE    = available     ; Scanner module is available for use
    config LVP      = ON	    ; Low-voltage programming disabled

    ; config word 5
    config CP       = OFF	    ; Code Protect (Code protection off)
    config CPD      = OFF	    ; Data Code Protection

    PULSE   equ 4
   
    PSECT   Por_Vec,class=CODE,delta=2
resetVec:
    goto    Start

    ; Interrupt vector and handler
    PSECT   Isr_Vec,class=CODE,delta=2
    clrwdt
    btfsc   PIR2, PIR2_C1IF_POSITION
    goto    C1_Interrupt
    bcf     INTCON,INTCON_TMR0IF_POSITION
    clrw
    xorwf   Delay, W
    skipnz
    retfie
    decfsz  Delay
    retfie
; Set RC4
    
    retfie

C1_Interrupt:
    bcf    PIR2, PIR2_C1IF_POSITION
    movlw   12
    movwf   Delay
    bcf     PORTC, PULSE
    retfie
    
Start:
    banksel Delay
    clrf    Dealy
    call    Init_Ports		    ; Initialize the ports of the chip
    call    Init_Timer		    ; Initialize one of the onboard timers
    call    Init_Intr		    ; Initialize interrupts
Main:
    sleep
    goto    Main		    ; loop forever

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
    return

Init_Timer:
; Timer0 control register 1:
; Clock source = LFINTOSC (31 kHZ)
; Prescaler 1:1
    banksel T0CON1
    movlw   0b10000000
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
    banksel PIE0
; TMR0 Overflow Interrupt Enable bit
    movlw   0b00100000
    movwf   PIE0

    banksel PIE2
; Comparator C1 interrupt enable
    movlw   0b00000001
    movwf   PIE2
    
; Enables all active interrupts
; Enables all active peripheral interrupts
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
