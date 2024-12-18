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
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FV16KM202
MP_LINKER_FILE_OPTION=,--script=p24FV16KM202.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/controller.o: src/controller.c  .generated_files/flags/default/837fc162cf274e59a8419f127cddf8d183b0deb5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/controller.o.d 
	@${RM} ${OBJECTDIR}/src/controller.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/controller.c  -o ${OBJECTDIR}/src/controller.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/controller.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/hal.o: src/hal.c  .generated_files/flags/default/e9c08ff75ffdfa30ec2ddeac1a3b0e7452325a88 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/hal.o.d 
	@${RM} ${OBJECTDIR}/src/hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/hal.c  -o ${OBJECTDIR}/src/hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/hal.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/default/f84680b210ee9f93fc1b5db466e72ed10237dedc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/main.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/ui.o: src/ui.c  .generated_files/flags/default/4618a40f7bce2b32a7fb0443b80e6a4ac60476ff .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ui.o.d 
	@${RM} ${OBJECTDIR}/src/ui.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/ui.c  -o ${OBJECTDIR}/src/ui.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/ui.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/font.o: ../../ARM_CLION/common_lib/display/font.c  .generated_files/flags/default/3f081f7fbfd4954cade8899e0f4fe9552163d3c2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/font.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/font.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/font.c  -o ${OBJECTDIR}/_ext/1979377065/font.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/font.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/lcd.o: ../../ARM_CLION/common_lib/display/lcd.c  .generated_files/flags/default/632dfa6dcd2e5d5b58fe38a1cd3b505f0b0a21b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/lcd.c  -o ${OBJECTDIR}/_ext/1979377065/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/lcd.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o: ../../ARM_CLION/common_lib/display/lcd_ssd1306.c  .generated_files/flags/default/92bb58e6449c8b31fcfb5217117fbecb303f6f1c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/lcd_ssd1306.c  -o ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/460521396/font5.o: ../../ARM_CLION/common_lib/display/fonts/font5.c  .generated_files/flags/default/74584820e56c345877cb1cafec774a3b87123277 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/460521396" 
	@${RM} ${OBJECTDIR}/_ext/460521396/font5.o.d 
	@${RM} ${OBJECTDIR}/_ext/460521396/font5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/fonts/font5.c  -o ${OBJECTDIR}/_ext/460521396/font5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/460521396/font5.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/src/controller.o: src/controller.c  .generated_files/flags/default/c22bb357833ab571ae841133e66efca6a11ffc66 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/controller.o.d 
	@${RM} ${OBJECTDIR}/src/controller.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/controller.c  -o ${OBJECTDIR}/src/controller.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/controller.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/hal.o: src/hal.c  .generated_files/flags/default/7bee269953f1424223ef0ae699cdb743bc2796ac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/hal.o.d 
	@${RM} ${OBJECTDIR}/src/hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/hal.c  -o ${OBJECTDIR}/src/hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/hal.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/default/2ebcd1c3f6a0da959c6f93dfed1dd8b10360c008 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/ui.o: src/ui.c  .generated_files/flags/default/477ce997d9ffb7cdcf504d3e45daee42e142a127 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ui.o.d 
	@${RM} ${OBJECTDIR}/src/ui.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/ui.c  -o ${OBJECTDIR}/src/ui.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/ui.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/font.o: ../../ARM_CLION/common_lib/display/font.c  .generated_files/flags/default/e8d1a3905db9329b68e60d328562cd43c44dd780 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/font.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/font.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/font.c  -o ${OBJECTDIR}/_ext/1979377065/font.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/font.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/lcd.o: ../../ARM_CLION/common_lib/display/lcd.c  .generated_files/flags/default/114065066420f2aac9c7354ecc07f35651e864dd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/lcd.c  -o ${OBJECTDIR}/_ext/1979377065/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/lcd.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o: ../../ARM_CLION/common_lib/display/lcd_ssd1306.c  .generated_files/flags/default/d1832f4ad240469340981f76163d8eb8435aeca3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1979377065" 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d 
	@${RM} ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/lcd_ssd1306.c  -o ${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1979377065/lcd_ssd1306.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/460521396/font5.o: ../../ARM_CLION/common_lib/display/fonts/font5.c  .generated_files/flags/default/e9fbb3b7cd40ec6381f92579d14f73d7167f1d9a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/460521396" 
	@${RM} ${OBJECTDIR}/_ext/460521396/font5.o.d 
	@${RM} ${OBJECTDIR}/_ext/460521396/font5.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../ARM_CLION/common_lib/display/fonts/font5.c  -o ${OBJECTDIR}/_ext/460521396/font5.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/460521396/font5.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -ffunction-sections -fdata-sections -O2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display"  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"src" -I"../../ARM_CLION/common_lib/display" -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}/xc16-bin2hex ${DISTDIR}/Charger_PIC24FV16KM202.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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
