
/**
  DAC2 Generated Driver File 

  @Company
    Microchip Technology Inc.

  @File Name
    dac2.h

  @Summary
    This is the generated header file for the DAC2 driver using PIC24 / dsPIC33 / PIC32MM MCUs

  @Description
    This header file provides implementations for driver APIs for DAC2. 
    Generation Information : 
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.171.5
        Device            :  PIC24FV16KM202
    The generated drivers are tested against the following:
        Compiler          :  XC16 v2.10
        MPLAB             :  MPLAB X v6.05
*/

/*
    (c) 2020 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
*/

/**
  Section: Included Files
*/

#include <xc.h>
#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus  // Provide C++ Compatibility

    extern "C" {

#endif

/**
  Section: Interface Routines
*/

/**
  @Summary
    This function initializes DAC instance : 2

  @Description
    This routine initializes the DAC driver for instance : 2
    index, making it ready for clients to open and use it. It also initializes any
    internal data structures.

  @Param
    None.

  @Returns 
    None
 
  @Comment
 
  @Example
    <code>
        int inputNumeber = 128;
        DAC2_Initializer();
        DAC2_OutputSet(inputNumber);
        // Check converted output value at DACOUT pin
    </code>
  
*/
void DAC2_Initialize(void);

/**
  @Summary
    This function inputs the digital data for conversion

  @Description
    This routine writes the input value into the DAC register to begin DAC 
    conversion.
  
  @Param
    inputData - Input value to be written to the DAC register 

  @Returns 
    None
 
  @Example
    Refer to DAC2_Initializer();
 
*/
void DAC2_OutputSet(uint16_t inputData);

/**
  @Summary
    Callback for DAC2.

  @Description
    This routine is callback for DAC2

  @Param
    None.

  @Returns
    None
 
  @Example 
	Refer to DAC2_Initialize(); for an example
*/
void DAC2_CallBack(void);

/**
  @Summary
    Polled implementation

  @Description
    This routine is used to implement the tasks for polled implementations.
  
  @Preconditions
    DAC2_Initialize() function should have been 
    called before calling this function.
 
  @Returns 
    None
 
  @Param
    None
 
  @Example
    Refer to DAC2_Initialize(); for an example
    
*/
void DAC2_Tasks(void);

#ifdef __cplusplus  // Provide C++ Compatibility

    }

#endif

/*
  End of File
*/ 
