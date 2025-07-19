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
ifeq "$(wildcard nbproject/Makefile-local-202_Debug.mk)" "nbproject/Makefile-local-202_Debug.mk"
include nbproject/Makefile-local-202_Debug.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=202_Debug
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
SOURCEFILES_QUOTED_IF_SPACED=src/main.c src/hal.c src/fuses.c ../../ARM_CLION/logic_probe_core/counters_commands.c ../../ARM_CLION/logic_probe_core/dac_commands.c ../../ARM_CLION/logic_probe_core/main.c ../../ARM_CLION/logic_probe_core/pwm_commands.c ../../ARM_CLION/logic_probe_core/ui_common.c ../../ARM_CLION/common_lib/shell/shell.c ../../ARM_CLION/common_lib/getstring.c ../../ARM_CLION/common_lib/common_printf.c ../../ARM_CLION/common_lib/ws2812_spi.c ../../ARM_CLION/common_lib/myprintf.c ../../ARM_CLION/common_lib/itoa.c ../../ARM_CLION/common_lib/ultoa.c ../../ARM_CLION/logic_probe_core/ui_128x32_with_rs.c ../../ARM_CLION/common_lib/fixed_queue.c ../../ARM_CLION/logic_probe_core/led_commands.c ../../ARM_CLION/common_lib/read_hex_string.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/hal.o ${OBJECTDIR}/src/fuses.o ${OBJECTDIR}/_ext/760846718/counters_commands.o ${OBJECTDIR}/_ext/760846718/dac_commands.o ${OBJECTDIR}/_ext/760846718/main.o ${OBJECTDIR}/_ext/760846718/pwm_commands.o ${OBJECTDIR}/_ext/760846718/ui_common.o ${OBJECTDIR}/_ext/2102214395/shell.o ${OBJECTDIR}/_ext/1738954588/getstring.o ${OBJECTDIR}/_ext/1738954588/common_printf.o ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o ${OBJECTDIR}/_ext/1738954588/myprintf.o ${OBJECTDIR}/_ext/1738954588/itoa.o ${OBJECTDIR}/_ext/1738954588/ultoa.o ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o ${OBJECTDIR}/_ext/1738954588/fixed_queue.o ${OBJECTDIR}/_ext/760846718/led_commands.o ${OBJECTDIR}/_ext/1738954588/read_hex_string.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/hal.o.d ${OBJECTDIR}/src/fuses.o.d ${OBJECTDIR}/_ext/760846718/counters_commands.o.d ${OBJECTDIR}/_ext/760846718/dac_commands.o.d ${OBJECTDIR}/_ext/760846718/main.o.d ${OBJECTDIR}/_ext/760846718/pwm_commands.o.d ${OBJECTDIR}/_ext/760846718/ui_common.o.d ${OBJECTDIR}/_ext/2102214395/shell.o.d ${OBJECTDIR}/_ext/1738954588/getstring.o.d ${OBJECTDIR}/_ext/1738954588/common_printf.o.d ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o.d ${OBJECTDIR}/_ext/1738954588/myprintf.o.d ${OBJECTDIR}/_ext/1738954588/itoa.o.d ${OBJECTDIR}/_ext/1738954588/ultoa.o.d ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o.d ${OBJECTDIR}/_ext/1738954588/fixed_queue.o.d ${OBJECTDIR}/_ext/760846718/led_commands.o.d ${OBJECTDIR}/_ext/1738954588/read_hex_string.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/hal.o ${OBJECTDIR}/src/fuses.o ${OBJECTDIR}/_ext/760846718/counters_commands.o ${OBJECTDIR}/_ext/760846718/dac_commands.o ${OBJECTDIR}/_ext/760846718/main.o ${OBJECTDIR}/_ext/760846718/pwm_commands.o ${OBJECTDIR}/_ext/760846718/ui_common.o ${OBJECTDIR}/_ext/2102214395/shell.o ${OBJECTDIR}/_ext/1738954588/getstring.o ${OBJECTDIR}/_ext/1738954588/common_printf.o ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o ${OBJECTDIR}/_ext/1738954588/myprintf.o ${OBJECTDIR}/_ext/1738954588/itoa.o ${OBJECTDIR}/_ext/1738954588/ultoa.o ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o ${OBJECTDIR}/_ext/1738954588/fixed_queue.o ${OBJECTDIR}/_ext/760846718/led_commands.o ${OBJECTDIR}/_ext/1738954588/read_hex_string.o

# Source Files
SOURCEFILES=src/main.c src/hal.c src/fuses.c ../../ARM_CLION/logic_probe_core/counters_commands.c ../../ARM_CLION/logic_probe_core/dac_commands.c ../../ARM_CLION/logic_probe_core/main.c ../../ARM_CLION/logic_probe_core/pwm_commands.c ../../ARM_CLION/logic_probe_core/ui_common.c ../../ARM_CLION/common_lib/shell/shell.c ../../ARM_CLION/common_lib/getstring.c ../../ARM_CLION/common_lib/common_printf.c ../../ARM_CLION/common_lib/ws2812_spi.c ../../ARM_CLION/common_lib/myprintf.c ../../ARM_CLION/common_lib/itoa.c ../../ARM_CLION/common_lib/ultoa.c ../../ARM_CLION/logic_probe_core/ui_128x32_with_rs.c ../../ARM_CLION/common_lib/fixed_queue.c ../../ARM_CLION/logic_probe_core/led_commands.c ../../ARM_CLION/common_lib/read_hex_string.c



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
	${MAKE}  -f nbproject/Makefile-202_Debug.mk ${DISTDIR}/LogicProbe_DSPIC33CK.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33CK256MP202
MP_LINKER_FILE_OPTION=,--script=p33CK256MP202.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/202_Debug/d8598e565a12f0231fa4ee6a2982edcf51171a1b .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/hal.o: src/hal.c  .generated_files/flags/202_Debug/d9174597fe3c1d26edd3e9e229a739425a6b6df4 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/hal.o.d 
	@${RM} ${OBJECTDIR}/src/hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/hal.c  -o ${OBJECTDIR}/src/hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/hal.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/fuses.o: src/fuses.c  .generated_files/flags/202_Debug/b14e15ea3e04b7c7e7836fa7eff6afc443a2da64 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/fuses.o.d 
	@${RM} ${OBJECTDIR}/src/fuses.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/fuses.c  -o ${OBJECTDIR}/src/fuses.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/fuses.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/counters_commands.o: ../../ARM_CLION/logic_probe_core/counters_commands.c  .generated_files/flags/202_Debug/4e826b180ca61308c5737dc7c3b8f4811e2ace67 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/counters_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/counters_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/counters_commands.c  -o ${OBJECTDIR}/_ext/760846718/counters_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/counters_commands.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/dac_commands.o: ../../ARM_CLION/logic_probe_core/dac_commands.c  .generated_files/flags/202_Debug/860ab643776cccd2edccef273fe6b2d9e24f5bce .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/dac_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/dac_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/dac_commands.c  -o ${OBJECTDIR}/_ext/760846718/dac_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/dac_commands.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/main.o: ../../ARM_CLION/logic_probe_core/main.c  .generated_files/flags/202_Debug/1582b894a31e659117d1b2287197a6773fb53a00 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/main.c  -o ${OBJECTDIR}/_ext/760846718/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/pwm_commands.o: ../../ARM_CLION/logic_probe_core/pwm_commands.c  .generated_files/flags/202_Debug/1aebcdde26badaf9507135dcb6e504eb5413a098 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/pwm_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/pwm_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/pwm_commands.c  -o ${OBJECTDIR}/_ext/760846718/pwm_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/pwm_commands.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/ui_common.o: ../../ARM_CLION/logic_probe_core/ui_common.c  .generated_files/flags/202_Debug/b7fdcde67ff434290a34524193193edb8c83c809 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/ui_common.c  -o ${OBJECTDIR}/_ext/760846718/ui_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/ui_common.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2102214395/shell.o: ../../ARM_CLION/common_lib/shell/shell.c  .generated_files/flags/202_Debug/9d355b327a63ff94a913dc9ce0c8e793e7c61d0d .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2102214395" 
	@${RM} ${OBJECTDIR}/_ext/2102214395/shell.o.d 
	@${RM} ${OBJECTDIR}/_ext/2102214395/shell.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/shell/shell.c  -o ${OBJECTDIR}/_ext/2102214395/shell.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2102214395/shell.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/getstring.o: ../../ARM_CLION/common_lib/getstring.c  .generated_files/flags/202_Debug/f092383bf97eff9eb053e64f5a6b02abdde4577a .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/getstring.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/getstring.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/getstring.c  -o ${OBJECTDIR}/_ext/1738954588/getstring.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/getstring.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/common_printf.o: ../../ARM_CLION/common_lib/common_printf.c  .generated_files/flags/202_Debug/d2227244218ba112d008ce96025f6c827f87a511 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/common_printf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/common_printf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/common_printf.c  -o ${OBJECTDIR}/_ext/1738954588/common_printf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/common_printf.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/ws2812_spi.o: ../../ARM_CLION/common_lib/ws2812_spi.c  .generated_files/flags/202_Debug/2db73686945d93bc242f60c5bf20b62e84c90aca .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/ws2812_spi.c  -o ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/ws2812_spi.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/myprintf.o: ../../ARM_CLION/common_lib/myprintf.c  .generated_files/flags/202_Debug/62db94f0d572f455f985a224d507f470c925a52d .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/myprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/myprintf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/myprintf.c  -o ${OBJECTDIR}/_ext/1738954588/myprintf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/myprintf.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/itoa.o: ../../ARM_CLION/common_lib/itoa.c  .generated_files/flags/202_Debug/5f2796fde826c6f0c51f4c39b14378e575604471 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/itoa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/itoa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/itoa.c  -o ${OBJECTDIR}/_ext/1738954588/itoa.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/itoa.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/ultoa.o: ../../ARM_CLION/common_lib/ultoa.c  .generated_files/flags/202_Debug/8a27906d1d129c0cdfbf607f951ef290afae2cf0 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ultoa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ultoa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/ultoa.c  -o ${OBJECTDIR}/_ext/1738954588/ultoa.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/ultoa.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o: ../../ARM_CLION/logic_probe_core/ui_128x32_with_rs.c  .generated_files/flags/202_Debug/2e3a1f0c1ac5eb98acb04fde0cdf202069b37dfb .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/ui_128x32_with_rs.c  -o ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/fixed_queue.o: ../../ARM_CLION/common_lib/fixed_queue.c  .generated_files/flags/202_Debug/ba7b03d244c6833f80479f1e6aae52882503c2d4 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/fixed_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/fixed_queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/fixed_queue.c  -o ${OBJECTDIR}/_ext/1738954588/fixed_queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/fixed_queue.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/led_commands.o: ../../ARM_CLION/logic_probe_core/led_commands.c  .generated_files/flags/202_Debug/63d589ce343efde73cd64587d39b9a6e70221eb7 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/led_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/led_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/led_commands.c  -o ${OBJECTDIR}/_ext/760846718/led_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/led_commands.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/read_hex_string.o: ../../ARM_CLION/common_lib/read_hex_string.c  .generated_files/flags/202_Debug/e1d1aecf813ec8aa9121976d615c1861210d13fe .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/read_hex_string.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/read_hex_string.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/read_hex_string.c  -o ${OBJECTDIR}/_ext/1738954588/read_hex_string.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/read_hex_string.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/202_Debug/145a492d0be7763ef062dfc9abb29a4b87ee8928 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/hal.o: src/hal.c  .generated_files/flags/202_Debug/c88f96458b7c0c78a5b811f32bc7cf74365af310 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/hal.o.d 
	@${RM} ${OBJECTDIR}/src/hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/hal.c  -o ${OBJECTDIR}/src/hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/hal.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/fuses.o: src/fuses.c  .generated_files/flags/202_Debug/d8a2ff2e012b9d6c7a5ebbc14a6a2d064d13432c .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/fuses.o.d 
	@${RM} ${OBJECTDIR}/src/fuses.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/fuses.c  -o ${OBJECTDIR}/src/fuses.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/fuses.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/counters_commands.o: ../../ARM_CLION/logic_probe_core/counters_commands.c  .generated_files/flags/202_Debug/43d5a637d3f98f437e558b31bc71c04e75713415 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/counters_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/counters_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/counters_commands.c  -o ${OBJECTDIR}/_ext/760846718/counters_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/counters_commands.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/dac_commands.o: ../../ARM_CLION/logic_probe_core/dac_commands.c  .generated_files/flags/202_Debug/979926477271f6c75038bf2e94e40f2749c34bf8 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/dac_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/dac_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/dac_commands.c  -o ${OBJECTDIR}/_ext/760846718/dac_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/dac_commands.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/main.o: ../../ARM_CLION/logic_probe_core/main.c  .generated_files/flags/202_Debug/d7b68303b8ec9b3d73c8fdacc2561cfd81618b31 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/main.c  -o ${OBJECTDIR}/_ext/760846718/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/pwm_commands.o: ../../ARM_CLION/logic_probe_core/pwm_commands.c  .generated_files/flags/202_Debug/c2233d1f007bfc88a078d172f465a96d50d42351 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/pwm_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/pwm_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/pwm_commands.c  -o ${OBJECTDIR}/_ext/760846718/pwm_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/pwm_commands.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/ui_common.o: ../../ARM_CLION/logic_probe_core/ui_common.c  .generated_files/flags/202_Debug/8087864bdeede88f7cf2b3bfd5e4bc8d435e0077 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/ui_common.c  -o ${OBJECTDIR}/_ext/760846718/ui_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/ui_common.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2102214395/shell.o: ../../ARM_CLION/common_lib/shell/shell.c  .generated_files/flags/202_Debug/1659d7d1c342ec3c090a0e461b49c0ccd0f5233c .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2102214395" 
	@${RM} ${OBJECTDIR}/_ext/2102214395/shell.o.d 
	@${RM} ${OBJECTDIR}/_ext/2102214395/shell.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/shell/shell.c  -o ${OBJECTDIR}/_ext/2102214395/shell.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2102214395/shell.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/getstring.o: ../../ARM_CLION/common_lib/getstring.c  .generated_files/flags/202_Debug/ef0bdfd7eb06ffc9410258fa57c56b322a9e651a .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/getstring.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/getstring.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/getstring.c  -o ${OBJECTDIR}/_ext/1738954588/getstring.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/getstring.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/common_printf.o: ../../ARM_CLION/common_lib/common_printf.c  .generated_files/flags/202_Debug/dbc4fb12cb66d8a15992947af70842c14e061395 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/common_printf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/common_printf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/common_printf.c  -o ${OBJECTDIR}/_ext/1738954588/common_printf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/common_printf.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/ws2812_spi.o: ../../ARM_CLION/common_lib/ws2812_spi.c  .generated_files/flags/202_Debug/8851cbb8838c83029aa248028bb48dd50fd7c488 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/ws2812_spi.c  -o ${OBJECTDIR}/_ext/1738954588/ws2812_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/ws2812_spi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/myprintf.o: ../../ARM_CLION/common_lib/myprintf.c  .generated_files/flags/202_Debug/6bbad994d9fc8f8cb9a793be1d7c24089dd7c114 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/myprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/myprintf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/myprintf.c  -o ${OBJECTDIR}/_ext/1738954588/myprintf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/myprintf.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/itoa.o: ../../ARM_CLION/common_lib/itoa.c  .generated_files/flags/202_Debug/1691444a873f88494a0b32a8f94df3b470b0d9fc .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/itoa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/itoa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/itoa.c  -o ${OBJECTDIR}/_ext/1738954588/itoa.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/itoa.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/ultoa.o: ../../ARM_CLION/common_lib/ultoa.c  .generated_files/flags/202_Debug/75b5367b44555e08e7b9fa168297db4588f61e5e .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ultoa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/ultoa.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/ultoa.c  -o ${OBJECTDIR}/_ext/1738954588/ultoa.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/ultoa.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o: ../../ARM_CLION/logic_probe_core/ui_128x32_with_rs.c  .generated_files/flags/202_Debug/a3ba671aa0323886214c10f55f6232d49f6d2396 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/ui_128x32_with_rs.c  -o ${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/ui_128x32_with_rs.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/fixed_queue.o: ../../ARM_CLION/common_lib/fixed_queue.c  .generated_files/flags/202_Debug/1fe2402589f68ce5e276bdc62abf6c1992682cf6 .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/fixed_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/fixed_queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/fixed_queue.c  -o ${OBJECTDIR}/_ext/1738954588/fixed_queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/fixed_queue.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/760846718/led_commands.o: ../../ARM_CLION/logic_probe_core/led_commands.c  .generated_files/flags/202_Debug/158739da68520743cfb6c43696031f5cd7b2e54f .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/760846718" 
	@${RM} ${OBJECTDIR}/_ext/760846718/led_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/760846718/led_commands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/logic_probe_core/led_commands.c  -o ${OBJECTDIR}/_ext/760846718/led_commands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/760846718/led_commands.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1738954588/read_hex_string.o: ../../ARM_CLION/common_lib/read_hex_string.c  .generated_files/flags/202_Debug/12f4bcde5dedb5c6573eb11676a512d9862972ae .generated_files/flags/202_Debug/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1738954588" 
	@${RM} ${OBJECTDIR}/_ext/1738954588/read_hex_string.o.d 
	@${RM} ${OBJECTDIR}/_ext/1738954588/read_hex_string.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/read_hex_string.c  -o ${OBJECTDIR}/_ext/1738954588/read_hex_string.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1738954588/read_hex_string.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -msmall-code -msmall-data -O0 -I"../../ARM_CLION/logic_probe_core" -I"src" -I"../../ARM_CLION/common_lib" -I"../../ARM_CLION/common_lib/shell" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/LogicProbe_DSPIC33CK.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/LogicProbe_DSPIC33CK.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/LogicProbe_DSPIC33CK.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_202_Debug=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
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
