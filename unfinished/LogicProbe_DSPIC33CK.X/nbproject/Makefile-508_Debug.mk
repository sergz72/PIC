#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-508_Debug.mk)" "nbproject/Makefile-local-508_Debug.mk"
include nbproject/Makefile-local-508_Debug.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=508_Debug
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/LogicProbe_DSPIC33CK.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/LogicProbe_DSPIC33CK.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=src/main.c src/hal.c src/fuses.c ../../ARM_CLION/logic_probe_core/counters_commands.c ../../ARM_CLION/logic_probe_core/dac_commands.c ../../ARM_CLION/logic_probe_core/main.c ../../ARM_CLION/logic_probe_core/pwm_commands.c ../../ARM_CLION/logic_probe_core/ui_common.c ../../ARM_CLION/common_lib/shell/shell.c ../../ARM_CLION/common_lib/getstring.c ../../ARM_CLION/common_lib/common_printf.c ../../ARM_CLION/common_lib/ws2812_spi.c ../../ARM_CLION/common_lib/myprintf.c ../../ARM_CLION/common_lib/itoa.c ../../ARM_CLION/common_lib/ultoa.c ../../ARM_CLION/logic_probe_core/ui_128x32_with_rs.c ../../ARM_CLION/common_lib/fixed_queue.c ../../ARM_CLION/logic_probe_core/led_commands.c ../../ARM_CLION/common_lib/read_hex_string.c ../../ARM_CLION/common_lib/display/lcd_ssd1306.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/hal.o ${OBJECTDIR}/src/fuses.o ${OBJECTDIR}/_ext/760846718/counters_commands.o ${OBJECTDIR}/_ext/760846718/dac_commands.o ${OBJECTDIR}/_ext/760846718/main.o ${OBJECTDIR}/_ext/760846718/pwm_commands.o ${OBJECTDIR}/_ext/760846718/ui_common.o ${OBJECTDIR}/_ext/2102214395/shell.o ${OBJECTDIR}/_ext/1738954588/getstring.o ${OBJECTDIR}/_ext/1738954588/common_printf.o ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o ${OBJECTDIR}/_ext/1738954588/myprintf.o ${OBJECTDIR}/_ext/1738954588/itoa.o ${OBJECTDIR}/_ext/1738954588/ultoa.o ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o ${OBJECTDIR}/_ext/1738954588/fixed_queue.o ${OBJECTDIR}/_ext/760846718/led_commands.o ${OBJECTDIR}/_ext/1738954588/read_hex_string.o ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/hal.o.d ${OBJECTDIR}/src/fuses.o.d ${OBJECTDIR}/_ext/760846718/counters_commands.o.d ${OBJECTDIR}/_ext/760846718/dac_commands.o.d ${OBJECTDIR}/_ext/760846718/main.o.d ${OBJECTDIR}/_ext/760846718/pwm_commands.o.d ${OBJECTDIR}/_ext/760846718/ui_common.o.d ${OBJECTDIR}/_ext/2102214395/shell.o.d ${OBJECTDIR}/_ext/1738954588/getstring.o.d ${OBJECTDIR}/_ext/1738954588/common_printf.o.d ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o.d ${OBJECTDIR}/_ext/1738954588/myprintf.o.d ${OBJECTDIR}/_ext/1738954588/itoa.o.d ${OBJECTDIR}/_ext/1738954588/ultoa.o.d ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o.d ${OBJECTDIR}/_ext/1738954588/fixed_queue.o.d ${OBJECTDIR}/_ext/760846718/led_commands.o.d ${OBJECTDIR}/_ext/1738954588/read_hex_string.o.d ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/hal.o ${OBJECTDIR}/src/fuses.o ${OBJECTDIR}/_ext/760846718/counters_commands.o ${OBJECTDIR}/_ext/760846718/dac_commands.o ${OBJECTDIR}/_ext/760846718/main.o ${OBJECTDIR}/_ext/760846718/pwm_commands.o ${OBJECTDIR}/_ext/760846718/ui_common.o ${OBJECTDIR}/_ext/2102214395/shell.o ${OBJECTDIR}/_ext/1738954588/getstring.o ${OBJECTDIR}/_ext/1738954588/common_printf.o ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o ${OBJECTDIR}/_ext/1738954588/myprintf.o ${OBJECTDIR}/_ext/1738954588/itoa.o ${OBJECTDIR}/_ext/1738954588/ultoa.o ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o ${OBJECTDIR}/_ext/1738954588/fixed_queue.o ${OBJECTDIR}/_ext/760846718/led_commands.o ${OBJECTDIR}/_ext/1738954588/read_hex_string.o ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o

# Source Files
SOURCEFILES=src/main.c src/hal.c src/fuses.c ../../ARM_CLION/logic_probe_core/counters_commands.c ../../ARM_CLION/logic_probe_core/dac_commands.c ../../ARM_CLION/logic_probe_core/main.c ../../ARM_CLION/logic_probe_core/pwm_commands.c ../../ARM_CLION/logic_probe_core/ui_common.c ../../ARM_CLION/common_lib/shell/shell.c ../../ARM_CLION/common_lib/getstring.c ../../ARM_CLION/common_lib/common_printf.c ../../ARM_CLION/common_lib/ws2812_spi.c ../../ARM_CLION/common_lib/myprintf.c ../../ARM_CLION/common_lib/itoa.c ../../ARM_CLION/common_lib/ultoa.c ../../ARM_CLION/logic_probe_core/ui_128x32_with_rs.c ../../ARM_CLION/common_lib/fixed_queue.c ../../ARM_CLION/logic_probe_core/led_commands.c ../../ARM_CLION/common_lib/read_hex_string.c ../../ARM_CLION/common_lib/display/lcd_ssd1306.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-508_Debug.mk ${DISTDIR}/LogicProbe_DSPIC33CK.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33CK256MP508
MP_LINKER_FILE_OPTION=,--script=p33CK256MP508.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/508_Debug/4cd6a1a8196151371c0d8eab91e778789c761902 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/hal.o: src/hal.c  .generated_files/flags/508_Debug/92fbe93d8644dd2084da08aadc4d18836cead9f9 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/hal.o.d 
	@${RM} ${OBJECTDIR}/src/hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/hal.c  -o ${OBJECTDIR}/src/hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/hal.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/fuses.o: src/fuses.c  .generated_files/flags/508_Debug/670087d8d1358497b128f1e175d50142b33615ae .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/fuses.o.d 
	@${RM} ${OBJECTDIR}/src/fuses.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/fuses.c  -o ${OBJECTDIR}/src/fuses.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/fuses.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/counters_commands.o: ../../ARM_CLION/logic_probe_core/counters_commands.c  .generated_files/flags/508_Debug/b19f2ca6f0904e4e68e8239cb346b94a593f0376 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/counters_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/counters_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/counters_commands.c  -o ${OBJECTDIR}/_ext/760846718/counters_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/counters_commands.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/dac_commands.o: ../../ARM_CLION/logic_probe_core/dac_commands.c  .generated_files/flags/508_Debug/9c099f2254854cc6d1283528ac744105f8a77419 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/dac_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/dac_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/dac_commands.c  -o ${OBJECTDIR}/_ext/760846718/dac_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/dac_commands.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/main.o: ../../ARM_CLION/logic_probe_core/main.c  .generated_files/flags/508_Debug/8deb667321a288599f04689e9fc6d99301bc9288 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/main.c  -o ${OBJECTDIR}/_ext/760846718/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/pwm_commands.o: ../../ARM_CLION/logic_probe_core/pwm_commands.c  .generated_files/flags/508_Debug/b867e4a06bd5159f54a335e18565d17af1254f73 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/pwm_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/pwm_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/pwm_commands.c  -o ${OBJECTDIR}/_ext/760846718/pwm_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/pwm_commands.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/ui_common.o: ../../ARM_CLION/logic_probe_core/ui_common.c  .generated_files/flags/508_Debug/be012cfa915f0f0a363f7bf67afe95d9b33e8163 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/ui_common.c  -o ${OBJECTDIR}/_ext/760846718/ui_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/ui_common.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2102214395/shell.o: ../../ARM_CLION/common_lib/shell/shell.c  .generated_files/flags/508_Debug/1f3cb57046e7fcf08d85d48b18e87705acdd4ec4 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2102214395" 
	@${RM} ${OBJECTDIR}/_ext/2102214395/shell.o.d 
	@${RM} ${OBJECTDIR}/_ext/2102214395/shell.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/shell/shell.c  -o ${OBJECTDIR}/_ext/2102214395/shell.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2102214395/shell.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/getstring.o: ../../ARM_CLION/common_lib/getstring.c  .generated_files/flags/508_Debug/643179b72a38345ec3e948ff26590d611117ede7 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/getstring.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/getstring.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/getstring.c  -o ${OBJECTDIR}/_ext/1738954588/getstring.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/getstring.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/common_printf.o: ../../ARM_CLION/common_lib/common_printf.c  .generated_files/flags/508_Debug/df46f8b97034b147e0830cadc51d030be17661ad .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/common_printf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/common_printf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/common_printf.c  -o ${OBJECTDIR}/_ext/1738954588/common_printf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/common_printf.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/ws2812_spi.o: ../../ARM_CLION/common_lib/ws2812_spi.c  .generated_files/flags/508_Debug/793778bc33c630707aeaf578944f0076c4257439 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/ws2812_spi.c  -o ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/ws2812_spi.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/myprintf.o: ../../ARM_CLION/common_lib/myprintf.c  .generated_files/flags/508_Debug/420b00b3a58c57c0c0f66a0470387231216d27b7 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/myprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/myprintf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/myprintf.c  -o ${OBJECTDIR}/_ext/1738954588/myprintf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/myprintf.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/itoa.o: ../../ARM_CLION/common_lib/itoa.c  .generated_files/flags/508_Debug/a12e621ae34ba3a73f8c4f89988ac9a474f0572d .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/itoa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/itoa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/itoa.c  -o ${OBJECTDIR}/_ext/1738954588/itoa.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/itoa.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/ultoa.o: ../../ARM_CLION/common_lib/ultoa.c  .generated_files/flags/508_Debug/58db07ef7a1eefc8d3b5b2ba5cad2200f7ce7257 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ultoa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ultoa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/ultoa.c  -o ${OBJECTDIR}/_ext/1738954588/ultoa.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/ultoa.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o: ../../ARM_CLION/logic_probe_core/ui_128x32_with_rs.c  .generated_files/flags/508_Debug/c70b7be984246726115dffc548e0f79af4c17f62 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/ui_128x32_with_rs.c  -o ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/fixed_queue.o: ../../ARM_CLION/common_lib/fixed_queue.c  .generated_files/flags/508_Debug/5a17d978c6a76c67ff0742b524a7ed53e9df2bc9 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/fixed_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/fixed_queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/fixed_queue.c  -o ${OBJECTDIR}/_ext/1738954588/fixed_queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/fixed_queue.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/led_commands.o: ../../ARM_CLION/logic_probe_core/led_commands.c  .generated_files/flags/508_Debug/183ab15b0702ddf38544430a57c9c4e133e8607e .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/led_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/led_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/led_commands.c  -o ${OBJECTDIR}/_ext/760846718/led_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/led_commands.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/read_hex_string.o: ../../ARM_CLION/common_lib/read_hex_string.c  .generated_files/flags/508_Debug/c308fa590f1585aa5d3b7bbe28772dac94179113 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/read_hex_string.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/read_hex_string.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/read_hex_string.c  -o ${OBJECTDIR}/_ext/1738954588/read_hex_string.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/read_hex_string.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o: ../../ARM_CLION/common_lib/display/lcd_ssd1306.c  .generated_files/flags/508_Debug/d4a2cf658933414ee74c96ab941c54e93bb35f56 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/lcd_ssd1306.c  -o ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/508_Debug/8cecf23fe5a2d422b12808255ce6f767f891ecd .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/hal.o: src/hal.c  .generated_files/flags/508_Debug/502f2fd3f3aab97467972b8cd360f3b24f249074 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/hal.o.d 
	@${RM} ${OBJECTDIR}/src/hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/hal.c  -o ${OBJECTDIR}/src/hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/hal.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/fuses.o: src/fuses.c  .generated_files/flags/508_Debug/a769bc86950d93997704cec640aaf4a4ff27689b .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/fuses.o.d 
	@${RM} ${OBJECTDIR}/src/fuses.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/fuses.c  -o ${OBJECTDIR}/src/fuses.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/fuses.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/counters_commands.o: ../../ARM_CLION/logic_probe_core/counters_commands.c  .generated_files/flags/508_Debug/b088e763c2e8fa5c8bb3e95b467e3e39ea5cdbf1 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/counters_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/counters_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/counters_commands.c  -o ${OBJECTDIR}/_ext/760846718/counters_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/counters_commands.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/dac_commands.o: ../../ARM_CLION/logic_probe_core/dac_commands.c  .generated_files/flags/508_Debug/4328d8faccc0fd760ae9f843e5abe0cfa54f7328 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/dac_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/dac_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/dac_commands.c  -o ${OBJECTDIR}/_ext/760846718/dac_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/dac_commands.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/main.o: ../../ARM_CLION/logic_probe_core/main.c  .generated_files/flags/508_Debug/67caaa912a6566de8d811cc812f86a2b243a58d3 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/main.c  -o ${OBJECTDIR}/_ext/760846718/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/pwm_commands.o: ../../ARM_CLION/logic_probe_core/pwm_commands.c  .generated_files/flags/508_Debug/bc4068563a49f86fdf3c396b027f193d49b385da .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/pwm_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/pwm_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/pwm_commands.c  -o ${OBJECTDIR}/_ext/760846718/pwm_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/pwm_commands.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/ui_common.o: ../../ARM_CLION/logic_probe_core/ui_common.c  .generated_files/flags/508_Debug/a4daec2a91a044b0d66bcd6037f3ac91357628ec .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/ui_common.c  -o ${OBJECTDIR}/_ext/760846718/ui_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/ui_common.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2102214395/shell.o: ../../ARM_CLION/common_lib/shell/shell.c  .generated_files/flags/508_Debug/cf18fd8c8489bc56ad83d380691e5ddc0d6f206f .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2102214395" 
	@${RM} ${OBJECTDIR}/_ext/2102214395/shell.o.d 
	@${RM} ${OBJECTDIR}/_ext/2102214395/shell.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/shell/shell.c  -o ${OBJECTDIR}/_ext/2102214395/shell.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2102214395/shell.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/getstring.o: ../../ARM_CLION/common_lib/getstring.c  .generated_files/flags/508_Debug/f659c4a6a1a97bd33d6ef89ee9b724b021539e79 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/getstring.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/getstring.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/getstring.c  -o ${OBJECTDIR}/_ext/1738954588/getstring.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/getstring.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/common_printf.o: ../../ARM_CLION/common_lib/common_printf.c  .generated_files/flags/508_Debug/bdeaa04258334cbb00577ca4469c1779374b898b .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/common_printf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/common_printf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/common_printf.c  -o ${OBJECTDIR}/_ext/1738954588/common_printf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/common_printf.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/ws2812_spi.o: ../../ARM_CLION/common_lib/ws2812_spi.c  .generated_files/flags/508_Debug/2f3fdb20641e161f5c7dc634bdaf06841180aa71 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/ws2812_spi.c  -o ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/ws2812_spi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/myprintf.o: ../../ARM_CLION/common_lib/myprintf.c  .generated_files/flags/508_Debug/9d697e2010b087c07ab59a7e6a078d72cdb151bd .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/myprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/myprintf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/myprintf.c  -o ${OBJECTDIR}/_ext/1738954588/myprintf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/myprintf.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/itoa.o: ../../ARM_CLION/common_lib/itoa.c  .generated_files/flags/508_Debug/ca2e7c535bef94e81b621a767f2cafb09dfb2a15 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/itoa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/itoa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/itoa.c  -o ${OBJECTDIR}/_ext/1738954588/itoa.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/itoa.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/ultoa.o: ../../ARM_CLION/common_lib/ultoa.c  .generated_files/flags/508_Debug/9c4a6c6e8504b29d127c1aaa19703ebbbc0f8a53 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ultoa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ultoa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/ultoa.c  -o ${OBJECTDIR}/_ext/1738954588/ultoa.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/ultoa.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o: ../../ARM_CLION/logic_probe_core/ui_128x32_with_rs.c  .generated_files/flags/508_Debug/87bc0b63b8356ff5ca881a0f1b145d51c229bdcf .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/ui_128x32_with_rs.c  -o ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/fixed_queue.o: ../../ARM_CLION/common_lib/fixed_queue.c  .generated_files/flags/508_Debug/399c817394bd2f0e55dcd8621319e1b873570f0b .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/fixed_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/fixed_queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/fixed_queue.c  -o ${OBJECTDIR}/_ext/1738954588/fixed_queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/fixed_queue.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/led_commands.o: ../../ARM_CLION/logic_probe_core/led_commands.c  .generated_files/flags/508_Debug/6636db41911e4eac5af11b23fdfe6b374f823afa .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/led_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/led_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/led_commands.c  -o ${OBJECTDIR}/_ext/760846718/led_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/led_commands.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/read_hex_string.o: ../../ARM_CLION/common_lib/read_hex_string.c  .generated_files/flags/508_Debug/be0aa18e6ade74ccb031d8e3cf9edabf940b3cb9 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/read_hex_string.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/read_hex_string.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/read_hex_string.c  -o ${OBJECTDIR}/_ext/1738954588/read_hex_string.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/read_hex_string.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o: ../../ARM_CLION/common_lib/display/lcd_ssd1306.c  .generated_files/flags/508_Debug/7b1dcbec9f9ede3c22e5b53911009e0119cebbb3 .generated_files/flags/508_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/lcd_ssd1306.c  -o ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -ffunction-sections -msmall-code -mlarge-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -I"../../ARM_CLION/common_lib/display" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/LogicProbe_DSPIC33CK.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/LogicProbe_DSPIC33CK.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=512,--check-sections,--data-init,--pack-data,--handles,--isr,--gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/LogicProbe_DSPIC33CK.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/LogicProbe_DSPIC33CK.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_508_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=512,--check-sections,--data-init,--pack-data,--handles,--isr,--gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}/xc-dsc-bin2hex ${DISTDIR}/LogicProbe_DSPIC33CK.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
