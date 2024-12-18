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
ifeq "$(wildcard nbproject/Makefile-local-minsize.mk)" "nbproject/Makefile-local-minsize.mk"
include nbproject/Makefile-local-minsize.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=minsize
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=src/controller.c src/hal.c src/main.c src/ui.c ../../ARM_CLION/common_lib/display/font.c ../../ARM_CLION/common_lib/display/lcd.c ../../ARM_CLION/common_lib/display/lcd_ssd1306.c ../../ARM_CLION/common_lib/display/fonts/font5.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/controller.o ${OBJECTDIR}/src/hal.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/ui.o ${OBJECTDIR}/_ext/1979377065/font.o ${OBJECTDIR}/_ext/1979377065/lcd.o ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o ${OBJECTDIR}/_ext/460521396/font5.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/controller.o.d ${OBJECTDIR}/src/hal.o.d ${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/ui.o.d ${OBJECTDIR}/_ext/1979377065/font.o.d ${OBJECTDIR}/_ext/1979377065/lcd.o.d ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d ${OBJECTDIR}/_ext/460521396/font5.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/controller.o ${OBJECTDIR}/src/hal.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/ui.o ${OBJECTDIR}/_ext/1979377065/font.o ${OBJECTDIR}/_ext/1979377065/lcd.o ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o ${OBJECTDIR}/_ext/460521396/font5.o

# Source Files
SOURCEFILES=src/controller.c src/hal.c src/main.c src/ui.c ../../ARM_CLION/common_lib/display/font.c ../../ARM_CLION/common_lib/display/lcd.c ../../ARM_CLION/common_lib/display/lcd_ssd1306.c ../../ARM_CLION/common_lib/display/fonts/font5.c



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
	${MAKE}  -f nbproject/Makefile-minsize.mk ${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FV16KM202
MP_LINKER_FILE_OPTION=,--script=p24FV16KM202.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/controller.o: src/controller.c  .generated_files/flags/minsize/4f59aacc9d92adaad1b3dd935f9e204dc4422ecb .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/controller.o.d 
	@${RM} ${OBJECTDIR}/src/controller.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/controller.c  -o ${OBJECTDIR}/src/controller.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/controller.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/hal.o: src/hal.c  .generated_files/flags/minsize/40d75997b7f4e30cdc2685d9e7b97ccb4764b1f6 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/hal.o.d 
	@${RM} ${OBJECTDIR}/src/hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/hal.c  -o ${OBJECTDIR}/src/hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/hal.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/minsize/6b60857fc65a86b5d1e56fdfdac6de61e00c8a4f .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/main.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/ui.o: src/ui.c  .generated_files/flags/minsize/2a999496a963a0e195431c77e54509f92a6b8142 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ui.o.d 
	@${RM} ${OBJECTDIR}/src/ui.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/ui.c  -o ${OBJECTDIR}/src/ui.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/ui.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/font.o: ../../ARM_CLION/common_lib/display/font.c  .generated_files/flags/minsize/48f6cffead0f0f52f499a0aa1384ef7e0d8f39f5 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/font.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/font.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/font.c  -o ${OBJECTDIR}/_ext/1979377065/font.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/font.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/lcd.o: ../../ARM_CLION/common_lib/display/lcd.c  .generated_files/flags/minsize/b424b61ead08d0efd7c7a28d6cecf6b24bafd6b3 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/lcd.c  -o ${OBJECTDIR}/_ext/1979377065/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/lcd.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o: ../../ARM_CLION/common_lib/display/lcd_ssd1306.c  .generated_files/flags/minsize/57cd001248cc18f35fcf5e79270b6d8bc1c4b6c5 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/lcd_ssd1306.c  -o ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/460521396/font5.o: ../../ARM_CLION/common_lib/display/fonts/font5.c  .generated_files/flags/minsize/b4b8a93b324be1490e4408e40c304df510751d88 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/460521396" 
	@${RM} ${OBJECTDIR}/_ext/460521396/font5.o.d 
	@${RM} ${OBJECTDIR}/_ext/460521396/font5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/fonts/font5.c  -o ${OBJECTDIR}/_ext/460521396/font5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/460521396/font5.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/src/controller.o: src/controller.c  .generated_files/flags/minsize/7dfef61c4e3d88f9312d1a4d844441b5de8fb5a0 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/controller.o.d 
	@${RM} ${OBJECTDIR}/src/controller.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/controller.c  -o ${OBJECTDIR}/src/controller.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/controller.o.d"        -g -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/hal.o: src/hal.c  .generated_files/flags/minsize/c48c21866ae2905d5fa03dd521f9bb9bc6d45df5 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/hal.o.d 
	@${RM} ${OBJECTDIR}/src/hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/hal.c  -o ${OBJECTDIR}/src/hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/hal.o.d"        -g -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/minsize/1219bab9e95a1e2c584b9fafd1567518915aa873 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/main.o.d"        -g -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/ui.o: src/ui.c  .generated_files/flags/minsize/acb8a966765c3e687c9320b7bd09173d9f14a6be .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ui.o.d 
	@${RM} ${OBJECTDIR}/src/ui.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/ui.c  -o ${OBJECTDIR}/src/ui.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/ui.o.d"        -g -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/font.o: ../../ARM_CLION/common_lib/display/font.c  .generated_files/flags/minsize/611486136dab04dd240a4b81e040f72ceabcb163 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/font.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/font.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/font.c  -o ${OBJECTDIR}/_ext/1979377065/font.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/font.o.d"        -g -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/lcd.o: ../../ARM_CLION/common_lib/display/lcd.c  .generated_files/flags/minsize/26aeaf1cce45a0bd3619e7d968b73b1fab659911 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/lcd.c  -o ${OBJECTDIR}/_ext/1979377065/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/lcd.o.d"        -g -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o: ../../ARM_CLION/common_lib/display/lcd_ssd1306.c  .generated_files/flags/minsize/5dca768697cc2fe304d9fb8f93e886f5e8833206 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/lcd_ssd1306.c  -o ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d"        -g -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/460521396/font5.o: ../../ARM_CLION/common_lib/display/fonts/font5.c  .generated_files/flags/minsize/fe6b0310f87b33ead86ad66f6cf7801cf8858df5 .generated_files/flags/minsize/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/460521396" 
	@${RM} ${OBJECTDIR}/_ext/460521396/font5.o.d 
	@${RM} ${OBJECTDIR}/_ext/460521396/font5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/fonts/font5.c  -o ${OBJECTDIR}/_ext/460521396/font5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/460521396/font5.o.d"        -g -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
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
${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display"     -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_minsize=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}/xc-dsc-bin2hex ${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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
