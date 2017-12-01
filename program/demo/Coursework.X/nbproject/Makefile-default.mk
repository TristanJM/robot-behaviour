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
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../main_c.c ../runaccelerometer.c ../runlocatesound.c ../runwallfollow.c ../utility.c ../../../library/codec/e_sound.c ../../../library/motor_led/e_init_port.c ../../../library/uart/e_init_uart1.s ../../../library/uart/e_uart1_rx_char.s ../../../library/uart/e_uart1_tx_char.s ../../../library/codec/e_sub_dci_kickoff.s ../../../library/codec/e_const_sound.s ../../../library/codec/e_init_codec_slave.s ../../../library/codec/e_init_dci_master.s ../../../library/codec/e_isr_dci.s ../../../library/I2C/e_I2C_protocol.c ../../../library/I2C/e_I2C_master_module.c ../rungrounddirection.c ../../../library/a_d/advance_ad_scan/e_acc.c ../../../library/a_d/advance_ad_scan/e_ad_conv.c ../../../library/a_d/advance_ad_scan/e_prox.c ../../../library/a_d/advance_ad_scan/e_micro.c ../../../library/motor_led/advance_one_timer/e_agenda.c ../../../library/motor_led/advance_one_timer/e_motors.c ../../../library/motor_led/advance_one_timer/e_led.c ../runbreitenberg_adv.c ../runfollowball.c ../search_ball.c ../../../library/camera/fast_2_timer/e_timers.c ../../../library/camera/fast_2_timer/e_interrupt.s ../runfftlistener.c ../../../library/fft/e_twiddle_factors.c ../../../library/fft/e_input_signal.c ../../../library/fft/e_fft.c ../../../library/fft/e_subtract_mean.s ../../../library/fft/e_fast_copy.s ../../../library/camera/fast_2_timer/e_calc_po3030k.c ../../../library/camera/fast_2_timer/e_calc_po6030k.c ../../../library/camera/fast_2_timer/e_common.c ../../../library/camera/fast_2_timer/e_po3030k_registers.c ../../../library/camera/fast_2_timer/e_po6030k_registers.c ../cwk_aggressive.c ../cwk_curious.c ../cwk_custom_behaviour.c ../cwk_fear.c ../cwk_goal_seek.c ../cwk_love.c ../findRed.c ../followGreen.c ../imageCapture.c ../../../library/camera/fast_2_timer/e_calc_po8030d.c ../../../library/camera/fast_2_timer/e_po8030d_registers.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1472/main_c.o ${OBJECTDIR}/_ext/1472/runaccelerometer.o ${OBJECTDIR}/_ext/1472/runlocatesound.o ${OBJECTDIR}/_ext/1472/runwallfollow.o ${OBJECTDIR}/_ext/1472/utility.o ${OBJECTDIR}/_ext/2015481517/e_sound.o ${OBJECTDIR}/_ext/1259340286/e_init_port.o ${OBJECTDIR}/_ext/64492303/e_init_uart1.o ${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o ${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o ${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o ${OBJECTDIR}/_ext/2015481517/e_const_sound.o ${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o ${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o ${OBJECTDIR}/_ext/2015481517/e_isr_dci.o ${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o ${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o ${OBJECTDIR}/_ext/1472/rungrounddirection.o ${OBJECTDIR}/_ext/1362274096/e_acc.o ${OBJECTDIR}/_ext/1362274096/e_ad_conv.o ${OBJECTDIR}/_ext/1362274096/e_prox.o ${OBJECTDIR}/_ext/1362274096/e_micro.o ${OBJECTDIR}/_ext/1949949662/e_agenda.o ${OBJECTDIR}/_ext/1949949662/e_motors.o ${OBJECTDIR}/_ext/1949949662/e_led.o ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o ${OBJECTDIR}/_ext/1472/runfollowball.o ${OBJECTDIR}/_ext/1472/search_ball.o ${OBJECTDIR}/_ext/930121020/e_timers.o ${OBJECTDIR}/_ext/930121020/e_interrupt.o ${OBJECTDIR}/_ext/1472/runfftlistener.o ${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o ${OBJECTDIR}/_ext/417736655/e_input_signal.o ${OBJECTDIR}/_ext/417736655/e_fft.o ${OBJECTDIR}/_ext/417736655/e_subtract_mean.o ${OBJECTDIR}/_ext/417736655/e_fast_copy.o ${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o ${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o ${OBJECTDIR}/_ext/930121020/e_common.o ${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o ${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o ${OBJECTDIR}/_ext/1472/cwk_aggressive.o ${OBJECTDIR}/_ext/1472/cwk_curious.o ${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o ${OBJECTDIR}/_ext/1472/cwk_fear.o ${OBJECTDIR}/_ext/1472/cwk_goal_seek.o ${OBJECTDIR}/_ext/1472/cwk_love.o ${OBJECTDIR}/_ext/1472/findRed.o ${OBJECTDIR}/_ext/1472/followGreen.o ${OBJECTDIR}/_ext/1472/imageCapture.o ${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o ${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1472/main_c.o.d ${OBJECTDIR}/_ext/1472/runaccelerometer.o.d ${OBJECTDIR}/_ext/1472/runlocatesound.o.d ${OBJECTDIR}/_ext/1472/runwallfollow.o.d ${OBJECTDIR}/_ext/1472/utility.o.d ${OBJECTDIR}/_ext/2015481517/e_sound.o.d ${OBJECTDIR}/_ext/1259340286/e_init_port.o.d ${OBJECTDIR}/_ext/64492303/e_init_uart1.o.d ${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o.d ${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o.d ${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o.d ${OBJECTDIR}/_ext/2015481517/e_const_sound.o.d ${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o.d ${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o.d ${OBJECTDIR}/_ext/2015481517/e_isr_dci.o.d ${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o.d ${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o.d ${OBJECTDIR}/_ext/1472/rungrounddirection.o.d ${OBJECTDIR}/_ext/1362274096/e_acc.o.d ${OBJECTDIR}/_ext/1362274096/e_ad_conv.o.d ${OBJECTDIR}/_ext/1362274096/e_prox.o.d ${OBJECTDIR}/_ext/1362274096/e_micro.o.d ${OBJECTDIR}/_ext/1949949662/e_agenda.o.d ${OBJECTDIR}/_ext/1949949662/e_motors.o.d ${OBJECTDIR}/_ext/1949949662/e_led.o.d ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d ${OBJECTDIR}/_ext/1472/runfollowball.o.d ${OBJECTDIR}/_ext/1472/search_ball.o.d ${OBJECTDIR}/_ext/930121020/e_timers.o.d ${OBJECTDIR}/_ext/930121020/e_interrupt.o.d ${OBJECTDIR}/_ext/1472/runfftlistener.o.d ${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o.d ${OBJECTDIR}/_ext/417736655/e_input_signal.o.d ${OBJECTDIR}/_ext/417736655/e_fft.o.d ${OBJECTDIR}/_ext/417736655/e_subtract_mean.o.d ${OBJECTDIR}/_ext/417736655/e_fast_copy.o.d ${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o.d ${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o.d ${OBJECTDIR}/_ext/930121020/e_common.o.d ${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o.d ${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o.d ${OBJECTDIR}/_ext/1472/cwk_aggressive.o.d ${OBJECTDIR}/_ext/1472/cwk_curious.o.d ${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o.d ${OBJECTDIR}/_ext/1472/cwk_fear.o.d ${OBJECTDIR}/_ext/1472/cwk_goal_seek.o.d ${OBJECTDIR}/_ext/1472/cwk_love.o.d ${OBJECTDIR}/_ext/1472/findRed.o.d ${OBJECTDIR}/_ext/1472/followGreen.o.d ${OBJECTDIR}/_ext/1472/imageCapture.o.d ${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o.d ${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1472/main_c.o ${OBJECTDIR}/_ext/1472/runaccelerometer.o ${OBJECTDIR}/_ext/1472/runlocatesound.o ${OBJECTDIR}/_ext/1472/runwallfollow.o ${OBJECTDIR}/_ext/1472/utility.o ${OBJECTDIR}/_ext/2015481517/e_sound.o ${OBJECTDIR}/_ext/1259340286/e_init_port.o ${OBJECTDIR}/_ext/64492303/e_init_uart1.o ${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o ${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o ${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o ${OBJECTDIR}/_ext/2015481517/e_const_sound.o ${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o ${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o ${OBJECTDIR}/_ext/2015481517/e_isr_dci.o ${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o ${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o ${OBJECTDIR}/_ext/1472/rungrounddirection.o ${OBJECTDIR}/_ext/1362274096/e_acc.o ${OBJECTDIR}/_ext/1362274096/e_ad_conv.o ${OBJECTDIR}/_ext/1362274096/e_prox.o ${OBJECTDIR}/_ext/1362274096/e_micro.o ${OBJECTDIR}/_ext/1949949662/e_agenda.o ${OBJECTDIR}/_ext/1949949662/e_motors.o ${OBJECTDIR}/_ext/1949949662/e_led.o ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o ${OBJECTDIR}/_ext/1472/runfollowball.o ${OBJECTDIR}/_ext/1472/search_ball.o ${OBJECTDIR}/_ext/930121020/e_timers.o ${OBJECTDIR}/_ext/930121020/e_interrupt.o ${OBJECTDIR}/_ext/1472/runfftlistener.o ${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o ${OBJECTDIR}/_ext/417736655/e_input_signal.o ${OBJECTDIR}/_ext/417736655/e_fft.o ${OBJECTDIR}/_ext/417736655/e_subtract_mean.o ${OBJECTDIR}/_ext/417736655/e_fast_copy.o ${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o ${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o ${OBJECTDIR}/_ext/930121020/e_common.o ${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o ${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o ${OBJECTDIR}/_ext/1472/cwk_aggressive.o ${OBJECTDIR}/_ext/1472/cwk_curious.o ${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o ${OBJECTDIR}/_ext/1472/cwk_fear.o ${OBJECTDIR}/_ext/1472/cwk_goal_seek.o ${OBJECTDIR}/_ext/1472/cwk_love.o ${OBJECTDIR}/_ext/1472/findRed.o ${OBJECTDIR}/_ext/1472/followGreen.o ${OBJECTDIR}/_ext/1472/imageCapture.o ${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o ${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o

# Source Files
SOURCEFILES=../main_c.c ../runaccelerometer.c ../runlocatesound.c ../runwallfollow.c ../utility.c ../../../library/codec/e_sound.c ../../../library/motor_led/e_init_port.c ../../../library/uart/e_init_uart1.s ../../../library/uart/e_uart1_rx_char.s ../../../library/uart/e_uart1_tx_char.s ../../../library/codec/e_sub_dci_kickoff.s ../../../library/codec/e_const_sound.s ../../../library/codec/e_init_codec_slave.s ../../../library/codec/e_init_dci_master.s ../../../library/codec/e_isr_dci.s ../../../library/I2C/e_I2C_protocol.c ../../../library/I2C/e_I2C_master_module.c ../rungrounddirection.c ../../../library/a_d/advance_ad_scan/e_acc.c ../../../library/a_d/advance_ad_scan/e_ad_conv.c ../../../library/a_d/advance_ad_scan/e_prox.c ../../../library/a_d/advance_ad_scan/e_micro.c ../../../library/motor_led/advance_one_timer/e_agenda.c ../../../library/motor_led/advance_one_timer/e_motors.c ../../../library/motor_led/advance_one_timer/e_led.c ../runbreitenberg_adv.c ../runfollowball.c ../search_ball.c ../../../library/camera/fast_2_timer/e_timers.c ../../../library/camera/fast_2_timer/e_interrupt.s ../runfftlistener.c ../../../library/fft/e_twiddle_factors.c ../../../library/fft/e_input_signal.c ../../../library/fft/e_fft.c ../../../library/fft/e_subtract_mean.s ../../../library/fft/e_fast_copy.s ../../../library/camera/fast_2_timer/e_calc_po3030k.c ../../../library/camera/fast_2_timer/e_calc_po6030k.c ../../../library/camera/fast_2_timer/e_common.c ../../../library/camera/fast_2_timer/e_po3030k_registers.c ../../../library/camera/fast_2_timer/e_po6030k_registers.c ../cwk_aggressive.c ../cwk_curious.c ../cwk_custom_behaviour.c ../cwk_fear.c ../cwk_goal_seek.c ../cwk_love.c ../findRed.c ../followGreen.c ../imageCapture.c ../../../library/camera/fast_2_timer/e_calc_po8030d.c ../../../library/camera/fast_2_timer/e_po8030d_registers.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=30F6014A
MP_LINKER_FILE_OPTION=,--script=p30F6014A.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1472/main_c.o: ../main_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main_c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main_c.c  -o ${OBJECTDIR}/_ext/1472/main_c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main_c.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main_c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runaccelerometer.o: ../runaccelerometer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/runaccelerometer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runaccelerometer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runaccelerometer.c  -o ${OBJECTDIR}/_ext/1472/runaccelerometer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runaccelerometer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runaccelerometer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runlocatesound.o: ../runlocatesound.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/runlocatesound.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runlocatesound.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runlocatesound.c  -o ${OBJECTDIR}/_ext/1472/runlocatesound.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runlocatesound.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runlocatesound.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runwallfollow.o: ../runwallfollow.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/runwallfollow.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runwallfollow.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runwallfollow.c  -o ${OBJECTDIR}/_ext/1472/runwallfollow.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runwallfollow.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runwallfollow.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/utility.o: ../utility.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/utility.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../utility.c  -o ${OBJECTDIR}/_ext/1472/utility.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/utility.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/utility.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2015481517/e_sound.o: ../../../library/codec/e_sound.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2015481517" 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_sound.o.d 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_sound.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/codec/e_sound.c  -o ${OBJECTDIR}/_ext/2015481517/e_sound.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2015481517/e_sound.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/2015481517/e_sound.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1259340286/e_init_port.o: ../../../library/motor_led/e_init_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1259340286" 
	@${RM} ${OBJECTDIR}/_ext/1259340286/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1259340286/e_init_port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/motor_led/e_init_port.c  -o ${OBJECTDIR}/_ext/1259340286/e_init_port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1259340286/e_init_port.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1259340286/e_init_port.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o: ../../../library/I2C/e_I2C_protocol.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417766185" 
	@${RM} ${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o.d 
	@${RM} ${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/I2C/e_I2C_protocol.c  -o ${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o: ../../../library/I2C/e_I2C_master_module.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417766185" 
	@${RM} ${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o.d 
	@${RM} ${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/I2C/e_I2C_master_module.c  -o ${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/rungrounddirection.o: ../rungrounddirection.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/rungrounddirection.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/rungrounddirection.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../rungrounddirection.c  -o ${OBJECTDIR}/_ext/1472/rungrounddirection.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/rungrounddirection.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/rungrounddirection.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1362274096/e_acc.o: ../../../library/a_d/advance_ad_scan/e_acc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1362274096" 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_acc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_acc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/a_d/advance_ad_scan/e_acc.c  -o ${OBJECTDIR}/_ext/1362274096/e_acc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1362274096/e_acc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1362274096/e_acc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1362274096/e_ad_conv.o: ../../../library/a_d/advance_ad_scan/e_ad_conv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1362274096" 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_ad_conv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/a_d/advance_ad_scan/e_ad_conv.c  -o ${OBJECTDIR}/_ext/1362274096/e_ad_conv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1362274096/e_ad_conv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1362274096/e_ad_conv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1362274096/e_prox.o: ../../../library/a_d/advance_ad_scan/e_prox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1362274096" 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_prox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_prox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/a_d/advance_ad_scan/e_prox.c  -o ${OBJECTDIR}/_ext/1362274096/e_prox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1362274096/e_prox.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1362274096/e_prox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1362274096/e_micro.o: ../../../library/a_d/advance_ad_scan/e_micro.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1362274096" 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_micro.o.d 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_micro.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/a_d/advance_ad_scan/e_micro.c  -o ${OBJECTDIR}/_ext/1362274096/e_micro.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1362274096/e_micro.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1362274096/e_micro.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1949949662/e_agenda.o: ../../../library/motor_led/advance_one_timer/e_agenda.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1949949662" 
	@${RM} ${OBJECTDIR}/_ext/1949949662/e_agenda.o.d 
	@${RM} ${OBJECTDIR}/_ext/1949949662/e_agenda.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/motor_led/advance_one_timer/e_agenda.c  -o ${OBJECTDIR}/_ext/1949949662/e_agenda.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1949949662/e_agenda.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1949949662/e_agenda.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1949949662/e_motors.o: ../../../library/motor_led/advance_one_timer/e_motors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1949949662" 
	@${RM} ${OBJECTDIR}/_ext/1949949662/e_motors.o.d 
	@${RM} ${OBJECTDIR}/_ext/1949949662/e_motors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/motor_led/advance_one_timer/e_motors.c  -o ${OBJECTDIR}/_ext/1949949662/e_motors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1949949662/e_motors.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1949949662/e_motors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1949949662/e_led.o: ../../../library/motor_led/advance_one_timer/e_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1949949662" 
	@${RM} ${OBJECTDIR}/_ext/1949949662/e_led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1949949662/e_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/motor_led/advance_one_timer/e_led.c  -o ${OBJECTDIR}/_ext/1949949662/e_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1949949662/e_led.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1949949662/e_led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o: ../runbreitenberg_adv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runbreitenberg_adv.c  -o ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runfollowball.o: ../runfollowball.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/runfollowball.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runfollowball.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runfollowball.c  -o ${OBJECTDIR}/_ext/1472/runfollowball.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runfollowball.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runfollowball.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/search_ball.o: ../search_ball.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/search_ball.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/search_ball.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../search_ball.c  -o ${OBJECTDIR}/_ext/1472/search_ball.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/search_ball.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/search_ball.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_timers.o: ../../../library/camera/fast_2_timer/e_timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_timers.c  -o ${OBJECTDIR}/_ext/930121020/e_timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_timers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_timers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runfftlistener.o: ../runfftlistener.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/runfftlistener.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runfftlistener.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runfftlistener.c  -o ${OBJECTDIR}/_ext/1472/runfftlistener.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runfftlistener.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runfftlistener.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o: ../../../library/fft/e_twiddle_factors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417736655" 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o.d 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/fft/e_twiddle_factors.c  -o ${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/417736655/e_input_signal.o: ../../../library/fft/e_input_signal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417736655" 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_input_signal.o.d 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_input_signal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/fft/e_input_signal.c  -o ${OBJECTDIR}/_ext/417736655/e_input_signal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/417736655/e_input_signal.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/417736655/e_input_signal.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/417736655/e_fft.o: ../../../library/fft/e_fft.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417736655" 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_fft.o.d 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_fft.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/fft/e_fft.c  -o ${OBJECTDIR}/_ext/417736655/e_fft.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/417736655/e_fft.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/417736655/e_fft.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o: ../../../library/camera/fast_2_timer/e_calc_po3030k.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_calc_po3030k.c  -o ${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o: ../../../library/camera/fast_2_timer/e_calc_po6030k.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_calc_po6030k.c  -o ${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_common.o: ../../../library/camera/fast_2_timer/e_common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_common.c  -o ${OBJECTDIR}/_ext/930121020/e_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_common.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_common.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o: ../../../library/camera/fast_2_timer/e_po3030k_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_po3030k_registers.c  -o ${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o: ../../../library/camera/fast_2_timer/e_po6030k_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_po6030k_registers.c  -o ${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/cwk_aggressive.o: ../cwk_aggressive.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_aggressive.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_aggressive.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../cwk_aggressive.c  -o ${OBJECTDIR}/_ext/1472/cwk_aggressive.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/cwk_aggressive.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/cwk_aggressive.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/cwk_curious.o: ../cwk_curious.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_curious.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_curious.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../cwk_curious.c  -o ${OBJECTDIR}/_ext/1472/cwk_curious.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/cwk_curious.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/cwk_curious.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o: ../cwk_custom_behaviour.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../cwk_custom_behaviour.c  -o ${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/cwk_fear.o: ../cwk_fear.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_fear.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_fear.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../cwk_fear.c  -o ${OBJECTDIR}/_ext/1472/cwk_fear.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/cwk_fear.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/cwk_fear.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/cwk_goal_seek.o: ../cwk_goal_seek.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_goal_seek.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_goal_seek.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../cwk_goal_seek.c  -o ${OBJECTDIR}/_ext/1472/cwk_goal_seek.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/cwk_goal_seek.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/cwk_goal_seek.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/cwk_love.o: ../cwk_love.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_love.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_love.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../cwk_love.c  -o ${OBJECTDIR}/_ext/1472/cwk_love.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/cwk_love.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/cwk_love.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/findRed.o: ../findRed.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/findRed.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/findRed.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../findRed.c  -o ${OBJECTDIR}/_ext/1472/findRed.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/findRed.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/findRed.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/followGreen.o: ../followGreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/followGreen.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/followGreen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../followGreen.c  -o ${OBJECTDIR}/_ext/1472/followGreen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/followGreen.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/followGreen.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/imageCapture.o: ../imageCapture.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/imageCapture.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/imageCapture.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../imageCapture.c  -o ${OBJECTDIR}/_ext/1472/imageCapture.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/imageCapture.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/imageCapture.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o: ../../../library/camera/fast_2_timer/e_calc_po8030d.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_calc_po8030d.c  -o ${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o: ../../../library/camera/fast_2_timer/e_po8030d_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_po8030d_registers.c  -o ${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1472/main_c.o: ../main_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main_c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main_c.c  -o ${OBJECTDIR}/_ext/1472/main_c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main_c.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main_c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runaccelerometer.o: ../runaccelerometer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/runaccelerometer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runaccelerometer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runaccelerometer.c  -o ${OBJECTDIR}/_ext/1472/runaccelerometer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runaccelerometer.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runaccelerometer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runlocatesound.o: ../runlocatesound.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/runlocatesound.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runlocatesound.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runlocatesound.c  -o ${OBJECTDIR}/_ext/1472/runlocatesound.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runlocatesound.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runlocatesound.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runwallfollow.o: ../runwallfollow.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/runwallfollow.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runwallfollow.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runwallfollow.c  -o ${OBJECTDIR}/_ext/1472/runwallfollow.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runwallfollow.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runwallfollow.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/utility.o: ../utility.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/utility.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../utility.c  -o ${OBJECTDIR}/_ext/1472/utility.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/utility.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/utility.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2015481517/e_sound.o: ../../../library/codec/e_sound.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2015481517" 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_sound.o.d 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_sound.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/codec/e_sound.c  -o ${OBJECTDIR}/_ext/2015481517/e_sound.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2015481517/e_sound.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/2015481517/e_sound.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1259340286/e_init_port.o: ../../../library/motor_led/e_init_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1259340286" 
	@${RM} ${OBJECTDIR}/_ext/1259340286/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1259340286/e_init_port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/motor_led/e_init_port.c  -o ${OBJECTDIR}/_ext/1259340286/e_init_port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1259340286/e_init_port.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1259340286/e_init_port.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o: ../../../library/I2C/e_I2C_protocol.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417766185" 
	@${RM} ${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o.d 
	@${RM} ${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/I2C/e_I2C_protocol.c  -o ${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/417766185/e_I2C_protocol.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o: ../../../library/I2C/e_I2C_master_module.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417766185" 
	@${RM} ${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o.d 
	@${RM} ${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/I2C/e_I2C_master_module.c  -o ${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/417766185/e_I2C_master_module.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/rungrounddirection.o: ../rungrounddirection.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/rungrounddirection.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/rungrounddirection.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../rungrounddirection.c  -o ${OBJECTDIR}/_ext/1472/rungrounddirection.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/rungrounddirection.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/rungrounddirection.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1362274096/e_acc.o: ../../../library/a_d/advance_ad_scan/e_acc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1362274096" 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_acc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_acc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/a_d/advance_ad_scan/e_acc.c  -o ${OBJECTDIR}/_ext/1362274096/e_acc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1362274096/e_acc.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1362274096/e_acc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1362274096/e_ad_conv.o: ../../../library/a_d/advance_ad_scan/e_ad_conv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1362274096" 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_ad_conv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/a_d/advance_ad_scan/e_ad_conv.c  -o ${OBJECTDIR}/_ext/1362274096/e_ad_conv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1362274096/e_ad_conv.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1362274096/e_ad_conv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1362274096/e_prox.o: ../../../library/a_d/advance_ad_scan/e_prox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1362274096" 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_prox.o.d 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_prox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/a_d/advance_ad_scan/e_prox.c  -o ${OBJECTDIR}/_ext/1362274096/e_prox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1362274096/e_prox.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1362274096/e_prox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1362274096/e_micro.o: ../../../library/a_d/advance_ad_scan/e_micro.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1362274096" 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_micro.o.d 
	@${RM} ${OBJECTDIR}/_ext/1362274096/e_micro.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/a_d/advance_ad_scan/e_micro.c  -o ${OBJECTDIR}/_ext/1362274096/e_micro.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1362274096/e_micro.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1362274096/e_micro.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1949949662/e_agenda.o: ../../../library/motor_led/advance_one_timer/e_agenda.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1949949662" 
	@${RM} ${OBJECTDIR}/_ext/1949949662/e_agenda.o.d 
	@${RM} ${OBJECTDIR}/_ext/1949949662/e_agenda.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/motor_led/advance_one_timer/e_agenda.c  -o ${OBJECTDIR}/_ext/1949949662/e_agenda.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1949949662/e_agenda.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1949949662/e_agenda.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1949949662/e_motors.o: ../../../library/motor_led/advance_one_timer/e_motors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1949949662" 
	@${RM} ${OBJECTDIR}/_ext/1949949662/e_motors.o.d 
	@${RM} ${OBJECTDIR}/_ext/1949949662/e_motors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/motor_led/advance_one_timer/e_motors.c  -o ${OBJECTDIR}/_ext/1949949662/e_motors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1949949662/e_motors.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1949949662/e_motors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1949949662/e_led.o: ../../../library/motor_led/advance_one_timer/e_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1949949662" 
	@${RM} ${OBJECTDIR}/_ext/1949949662/e_led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1949949662/e_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/motor_led/advance_one_timer/e_led.c  -o ${OBJECTDIR}/_ext/1949949662/e_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1949949662/e_led.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1949949662/e_led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o: ../runbreitenberg_adv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runbreitenberg_adv.c  -o ${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runbreitenberg_adv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runfollowball.o: ../runfollowball.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/runfollowball.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runfollowball.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runfollowball.c  -o ${OBJECTDIR}/_ext/1472/runfollowball.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runfollowball.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runfollowball.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/search_ball.o: ../search_ball.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/search_ball.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/search_ball.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../search_ball.c  -o ${OBJECTDIR}/_ext/1472/search_ball.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/search_ball.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/search_ball.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_timers.o: ../../../library/camera/fast_2_timer/e_timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_timers.c  -o ${OBJECTDIR}/_ext/930121020/e_timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_timers.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_timers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/runfftlistener.o: ../runfftlistener.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/runfftlistener.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/runfftlistener.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../runfftlistener.c  -o ${OBJECTDIR}/_ext/1472/runfftlistener.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/runfftlistener.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/runfftlistener.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o: ../../../library/fft/e_twiddle_factors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417736655" 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o.d 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/fft/e_twiddle_factors.c  -o ${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/417736655/e_twiddle_factors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/417736655/e_input_signal.o: ../../../library/fft/e_input_signal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417736655" 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_input_signal.o.d 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_input_signal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/fft/e_input_signal.c  -o ${OBJECTDIR}/_ext/417736655/e_input_signal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/417736655/e_input_signal.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/417736655/e_input_signal.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/417736655/e_fft.o: ../../../library/fft/e_fft.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417736655" 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_fft.o.d 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_fft.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/fft/e_fft.c  -o ${OBJECTDIR}/_ext/417736655/e_fft.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/417736655/e_fft.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/417736655/e_fft.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o: ../../../library/camera/fast_2_timer/e_calc_po3030k.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_calc_po3030k.c  -o ${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_calc_po3030k.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o: ../../../library/camera/fast_2_timer/e_calc_po6030k.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_calc_po6030k.c  -o ${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_calc_po6030k.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_common.o: ../../../library/camera/fast_2_timer/e_common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_common.c  -o ${OBJECTDIR}/_ext/930121020/e_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_common.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_common.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o: ../../../library/camera/fast_2_timer/e_po3030k_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_po3030k_registers.c  -o ${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_po3030k_registers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o: ../../../library/camera/fast_2_timer/e_po6030k_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_po6030k_registers.c  -o ${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_po6030k_registers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/cwk_aggressive.o: ../cwk_aggressive.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_aggressive.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_aggressive.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../cwk_aggressive.c  -o ${OBJECTDIR}/_ext/1472/cwk_aggressive.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/cwk_aggressive.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/cwk_aggressive.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/cwk_curious.o: ../cwk_curious.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_curious.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_curious.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../cwk_curious.c  -o ${OBJECTDIR}/_ext/1472/cwk_curious.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/cwk_curious.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/cwk_curious.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o: ../cwk_custom_behaviour.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../cwk_custom_behaviour.c  -o ${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/cwk_custom_behaviour.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/cwk_fear.o: ../cwk_fear.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_fear.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_fear.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../cwk_fear.c  -o ${OBJECTDIR}/_ext/1472/cwk_fear.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/cwk_fear.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/cwk_fear.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/cwk_goal_seek.o: ../cwk_goal_seek.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_goal_seek.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_goal_seek.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../cwk_goal_seek.c  -o ${OBJECTDIR}/_ext/1472/cwk_goal_seek.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/cwk_goal_seek.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/cwk_goal_seek.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/cwk_love.o: ../cwk_love.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_love.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/cwk_love.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../cwk_love.c  -o ${OBJECTDIR}/_ext/1472/cwk_love.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/cwk_love.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/cwk_love.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/findRed.o: ../findRed.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/findRed.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/findRed.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../findRed.c  -o ${OBJECTDIR}/_ext/1472/findRed.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/findRed.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/findRed.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/followGreen.o: ../followGreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/followGreen.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/followGreen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../followGreen.c  -o ${OBJECTDIR}/_ext/1472/followGreen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/followGreen.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/followGreen.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/imageCapture.o: ../imageCapture.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/imageCapture.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/imageCapture.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../imageCapture.c  -o ${OBJECTDIR}/_ext/1472/imageCapture.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/imageCapture.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/imageCapture.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o: ../../../library/camera/fast_2_timer/e_calc_po8030d.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_calc_po8030d.c  -o ${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_calc_po8030d.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o: ../../../library/camera/fast_2_timer/e_po8030d_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../library/camera/fast_2_timer/e_po8030d_registers.c  -o ${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o.d"        -g -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../../library" -I"../../../library/I2C" -I"../../../library/a_d/advance_ad_scan" -I"../../../library/camera/fast_2_timer" -I"../../../library/codec" -I"../../../library/fft" -I"../../../library/motor_led" -I"../../../library/motor_led/advance_one_timer" -I"../../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_po8030d_registers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/64492303/e_init_uart1.o: ../../../library/uart/e_init_uart1.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/64492303" 
	@${RM} ${OBJECTDIR}/_ext/64492303/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/64492303/e_init_uart1.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/uart/e_init_uart1.s  -o ${OBJECTDIR}/_ext/64492303/e_init_uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/64492303/e_init_uart1.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/64492303/e_init_uart1.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o: ../../../library/uart/e_uart1_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/64492303" 
	@${RM} ${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/uart/e_uart1_rx_char.s  -o ${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o: ../../../library/uart/e_uart1_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/64492303" 
	@${RM} ${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/uart/e_uart1_tx_char.s  -o ${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o: ../../../library/codec/e_sub_dci_kickoff.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2015481517" 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o.d 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/codec/e_sub_dci_kickoff.s  -o ${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2015481517/e_const_sound.o: ../../../library/codec/e_const_sound.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2015481517" 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_const_sound.o.d 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_const_sound.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/codec/e_const_sound.s  -o ${OBJECTDIR}/_ext/2015481517/e_const_sound.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/2015481517/e_const_sound.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/2015481517/e_const_sound.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o: ../../../library/codec/e_init_codec_slave.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2015481517" 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o.d 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/codec/e_init_codec_slave.s  -o ${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o: ../../../library/codec/e_init_dci_master.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2015481517" 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/codec/e_init_dci_master.s  -o ${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2015481517/e_isr_dci.o: ../../../library/codec/e_isr_dci.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2015481517" 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_isr_dci.o.d 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_isr_dci.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/codec/e_isr_dci.s  -o ${OBJECTDIR}/_ext/2015481517/e_isr_dci.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/2015481517/e_isr_dci.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/2015481517/e_isr_dci.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/930121020/e_interrupt.o: ../../../library/camera/fast_2_timer/e_interrupt.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_interrupt.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/camera/fast_2_timer/e_interrupt.s  -o ${OBJECTDIR}/_ext/930121020/e_interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/930121020/e_interrupt.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_interrupt.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/417736655/e_subtract_mean.o: ../../../library/fft/e_subtract_mean.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417736655" 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_subtract_mean.o.d 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_subtract_mean.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/fft/e_subtract_mean.s  -o ${OBJECTDIR}/_ext/417736655/e_subtract_mean.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/417736655/e_subtract_mean.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/417736655/e_subtract_mean.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/417736655/e_fast_copy.o: ../../../library/fft/e_fast_copy.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417736655" 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_fast_copy.o.d 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_fast_copy.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/fft/e_fast_copy.s  -o ${OBJECTDIR}/_ext/417736655/e_fast_copy.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/417736655/e_fast_copy.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/417736655/e_fast_copy.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/64492303/e_init_uart1.o: ../../../library/uart/e_init_uart1.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/64492303" 
	@${RM} ${OBJECTDIR}/_ext/64492303/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/64492303/e_init_uart1.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/uart/e_init_uart1.s  -o ${OBJECTDIR}/_ext/64492303/e_init_uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/64492303/e_init_uart1.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/64492303/e_init_uart1.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o: ../../../library/uart/e_uart1_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/64492303" 
	@${RM} ${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/uart/e_uart1_rx_char.s  -o ${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/64492303/e_uart1_rx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o: ../../../library/uart/e_uart1_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/64492303" 
	@${RM} ${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/uart/e_uart1_tx_char.s  -o ${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/64492303/e_uart1_tx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o: ../../../library/codec/e_sub_dci_kickoff.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2015481517" 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o.d 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/codec/e_sub_dci_kickoff.s  -o ${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/2015481517/e_sub_dci_kickoff.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2015481517/e_const_sound.o: ../../../library/codec/e_const_sound.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2015481517" 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_const_sound.o.d 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_const_sound.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/codec/e_const_sound.s  -o ${OBJECTDIR}/_ext/2015481517/e_const_sound.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/2015481517/e_const_sound.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/2015481517/e_const_sound.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o: ../../../library/codec/e_init_codec_slave.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2015481517" 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o.d 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/codec/e_init_codec_slave.s  -o ${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/2015481517/e_init_codec_slave.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o: ../../../library/codec/e_init_dci_master.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2015481517" 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/codec/e_init_dci_master.s  -o ${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/2015481517/e_init_dci_master.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2015481517/e_isr_dci.o: ../../../library/codec/e_isr_dci.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2015481517" 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_isr_dci.o.d 
	@${RM} ${OBJECTDIR}/_ext/2015481517/e_isr_dci.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/codec/e_isr_dci.s  -o ${OBJECTDIR}/_ext/2015481517/e_isr_dci.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/2015481517/e_isr_dci.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/2015481517/e_isr_dci.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/930121020/e_interrupt.o: ../../../library/camera/fast_2_timer/e_interrupt.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/930121020" 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/930121020/e_interrupt.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/camera/fast_2_timer/e_interrupt.s  -o ${OBJECTDIR}/_ext/930121020/e_interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/930121020/e_interrupt.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/930121020/e_interrupt.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/417736655/e_subtract_mean.o: ../../../library/fft/e_subtract_mean.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417736655" 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_subtract_mean.o.d 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_subtract_mean.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/fft/e_subtract_mean.s  -o ${OBJECTDIR}/_ext/417736655/e_subtract_mean.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/417736655/e_subtract_mean.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/417736655/e_subtract_mean.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/417736655/e_fast_copy.o: ../../../library/fft/e_fast_copy.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/417736655" 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_fast_copy.o.d 
	@${RM} ${OBJECTDIR}/_ext/417736655/e_fast_copy.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../library/fft/e_fast_copy.s  -o ${OBJECTDIR}/_ext/417736655/e_fast_copy.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../../library/codec" -I"../../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/417736655/e_fast_copy.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/417736655/e_fast_copy.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../library/fft/libdsp-coff.a ../../../library/fft/libdsp-elf.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    ../../../library/fft/libdsp-coff.a ../../../library/fft/libdsp-elf.a  -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,$(MP_LINKER_FILE_OPTION),--heap=512,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="../C:/Program Files/Microchip/MPLAB C30/lib",--library-path=".",--no-force-link,--smart-io,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../library/fft/libdsp-coff.a ../../../library/fft/libdsp-elf.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    ../../../library/fft/libdsp-coff.a ../../../library/fft/libdsp-elf.a  -mcpu=$(MP_PROCESSOR_OPTION)        -omf=coff -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=512,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="../C:/Program Files/Microchip/MPLAB C30/lib",--library-path=".",--no-force-link,--smart-io,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}/xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=coff  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
