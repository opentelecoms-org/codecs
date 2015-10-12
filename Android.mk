LOCAL_PATH := $(call my-dir)
SPEEX	:= speex-1.2rc1
SILK     := silk
OPUS     := opus-1.1

include $(CLEAR_VARS)
LOCAL_MODULE    := OSNetworkSystem
LOCAL_MODULE_FILENAME	:= libOSNetworkSystem
LOCAL_SRC_FILES := OSNetworkSystem.cpp
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := speex_jni
LOCAL_MODULE_FILENAME	:= libspeex_jni
LOCAL_SRC_FILES := speex_jni.cpp \
		$(SPEEX)/libspeex/speex.c \
		$(SPEEX)/libspeex/speex_callbacks.c \
		$(SPEEX)/libspeex/bits.c \
		$(SPEEX)/libspeex/modes.c \
		$(SPEEX)/libspeex/nb_celp.c \
		$(SPEEX)/libspeex/exc_20_32_table.c \
		$(SPEEX)/libspeex/exc_5_256_table.c \
		$(SPEEX)/libspeex/exc_5_64_table.c \
		$(SPEEX)/libspeex/exc_8_128_table.c \
		$(SPEEX)/libspeex/exc_10_32_table.c \
		$(SPEEX)/libspeex/exc_10_16_table.c \
		$(SPEEX)/libspeex/filters.c \
		$(SPEEX)/libspeex/quant_lsp.c \
		$(SPEEX)/libspeex/ltp.c \
		$(SPEEX)/libspeex/lpc.c \
		$(SPEEX)/libspeex/lsp.c \
		$(SPEEX)/libspeex/vbr.c \
		$(SPEEX)/libspeex/gain_table.c \
		$(SPEEX)/libspeex/gain_table_lbr.c \
		$(SPEEX)/libspeex/lsp_tables_nb.c \
		$(SPEEX)/libspeex/cb_search.c \
		$(SPEEX)/libspeex/vq.c \
		$(SPEEX)/libspeex/window.c \
		$(SPEEX)/libspeex/high_lsp_tables.c

LOCAL_C_INCLUDES += 
LOCAL_CFLAGS = -DFIXED_POINT -DEXPORT="" -UHAVE_CONFIG_H -I$(LOCAL_PATH)/$(SPEEX)/include
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
BV16     := bx16_fixedp
LOCAL_MODULE    := bv16_jni
LOCAL_MODULE_FILENAME	:= libbv16_jni
LOCAL_SRC_FILES := bv16_jni.cpp \
	$(BV16)/bvcommon/a2lsp.c \
	$(BV16)/bvcommon/allpole.c \
	$(BV16)/bvcommon/allzero.c  \
	$(BV16)/bvcommon/autocor.c \
	$(BV16)/bvcommon/basop32.c \
	$(BV16)/bvcommon/cmtables.c \
	$(BV16)/bvcommon/levdur.c \
	$(BV16)/bvcommon/lsp2a.c \
	$(BV16)/bvcommon/mathtables.c \
	$(BV16)/bvcommon/mathutil.c \
	$(BV16)/bvcommon/memutil.c \
	$(BV16)/bvcommon/ptdec.c \
	$(BV16)/bvcommon/stblzlsp.c \
	$(BV16)/bvcommon/utility.c \
	$(BV16)/bvcommon/vqdecode.c \
	$(BV16)/bv16/bitpack.c \
	$(BV16)/bv16/bv.c \
	$(BV16)/bv16/coarptch.c \
	$(BV16)/bv16/decoder.c \
	$(BV16)/bv16/encoder.c \
	$(BV16)/bv16/excdec.c \
	$(BV16)/bv16/excquan.c \
	$(BV16)/bv16/fineptch.c \
	$(BV16)/bv16/g192.c \
	$(BV16)/bv16/gaindec.c \
	$(BV16)/bv16/gainquan.c \
	$(BV16)/bv16/levelest.c \
	$(BV16)/bv16/lspdec.c \
	$(BV16)/bv16/lspquan.c \
	$(BV16)/bv16/plc.c \
	$(BV16)/bv16/postfilt.c \
	$(BV16)/bv16/preproc.c \
	$(BV16)/bv16/ptquan.c \
	$(BV16)/bv16/tables.c 
	
LOCAL_ARM_MODE := arm
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(BV16)/bvcommon $(LOCAL_PATH)/$(BV16)/bv16 $(LOCAL_PATH)/$(BV16)
#LOCAL_CFLAGS = -O3 -marm -march=armv6 -mtune=arm1136j-s -DWMOPS=0 -DG192BITSTREAM=0
#LOCAL_CFLAGS = -O3 -DWMOPS=0 -DG192BITSTREAM=0
include $(BUILD_SHARED_LIBRARY)


SILK     := silk
LOCAL_MODULE    := silkcommon
LOCAL_MODULE_FILENAME	:= libsilkcommon
LOCAL_SRC_FILES :=  $(SILK)/src/SKP_Silk_A2NLSF.c \
	$(SILK)/src/SKP_Silk_CNG.c \
	$(SILK)/src/SKP_Silk_HP_variable_cutoff_FIX.c \
	$(SILK)/src/SKP_Silk_LBRR_reset.c \
	$(SILK)/src/SKP_Silk_LPC_inv_pred_gain.c \
	$(SILK)/src/SKP_Silk_LPC_stabilize.c \
	$(SILK)/src/SKP_Silk_LPC_synthesis_filter.c \
	$(SILK)/src/SKP_Silk_LPC_synthesis_order16.c \
	$(SILK)/src/SKP_Silk_LP_variable_cutoff.c \
	$(SILK)/src/SKP_Silk_LSF_cos_table.c \
	$(SILK)/src/SKP_Silk_LTP_analysis_filter_FIX.c \
	$(SILK)/src/SKP_Silk_LTP_scale_ctrl_FIX.c \
	$(SILK)/src/SKP_Silk_MA.c \
	$(SILK)/src/SKP_Silk_NLSF2A.c \
	$(SILK)/src/SKP_Silk_NLSF2A_stable.c \
	$(SILK)/src/SKP_Silk_NLSF_MSVQ_decode.c \
	$(SILK)/src/SKP_Silk_NLSF_MSVQ_encode_FIX.c \
	$(SILK)/src/SKP_Silk_NLSF_VQ_rate_distortion_FIX.c \
	$(SILK)/src/SKP_Silk_NLSF_VQ_sum_error_FIX.c \
	$(SILK)/src/SKP_Silk_NLSF_VQ_weights_laroia.c \
	$(SILK)/src/SKP_Silk_NLSF_stabilize.c \
	$(SILK)/src/SKP_Silk_NSQ.c \
	$(SILK)/src/SKP_Silk_NSQ_del_dec.c \
	$(SILK)/src/SKP_Silk_PLC.c \
	$(SILK)/src/SKP_Silk_VAD.c \
	$(SILK)/src/SKP_Silk_VQ_nearest_neighbor_FIX.c \
	$(SILK)/src/SKP_Silk_allpass_int.c \
	$(SILK)/src/SKP_Silk_ana_filt_bank_1.c \
	$(SILK)/src/SKP_Silk_apply_sine_window.c \
	$(SILK)/src/SKP_Silk_array_maxabs.c \
	$(SILK)/src/SKP_Silk_autocorr.c \
	$(SILK)/src/SKP_Silk_biquad.c \
	$(SILK)/src/SKP_Silk_biquad_alt.c \
	$(SILK)/src/SKP_Silk_burg_modified.c \
	$(SILK)/src/SKP_Silk_bwexpander.c \
	$(SILK)/src/SKP_Silk_bwexpander_32.c \
	$(SILK)/src/SKP_Silk_code_signs.c \
	$(SILK)/src/SKP_Silk_control_codec_FIX.c \
	$(SILK)/src/SKP_Silk_corrMatrix_FIX.c \
	$(SILK)/src/SKP_Silk_create_init_destroy.c \
	$(SILK)/src/SKP_Silk_dec_API.c \
	$(SILK)/src/SKP_Silk_decode_core.c \
	$(SILK)/src/SKP_Silk_decode_frame.c \
	$(SILK)/src/SKP_Silk_decode_indices_v4.c \
	$(SILK)/src/SKP_Silk_decode_parameters.c \
	$(SILK)/src/SKP_Silk_decode_parameters_v4.c \
	$(SILK)/src/SKP_Silk_decode_pulses.c \
	$(SILK)/src/SKP_Silk_decoder_set_fs.c \
	$(SILK)/src/SKP_Silk_detect_SWB_input.c \
	$(SILK)/src/SKP_Silk_enc_API.c \
	$(SILK)/src/SKP_Silk_encode_frame_FIX.c \
	$(SILK)/src/SKP_Silk_encode_parameters.c \
	$(SILK)/src/SKP_Silk_encode_parameters_v4.c \
	$(SILK)/src/SKP_Silk_encode_pulses.c \
	$(SILK)/src/SKP_Silk_find_LPC_FIX.c \
	$(SILK)/src/SKP_Silk_find_LTP_FIX.c \
	$(SILK)/src/SKP_Silk_find_pitch_lags_FIX.c \
	$(SILK)/src/SKP_Silk_find_pred_coefs_FIX.c \
	$(SILK)/src/SKP_Silk_gain_quant.c \
	$(SILK)/src/SKP_Silk_init_encoder_FIX.c \
	$(SILK)/src/SKP_Silk_inner_prod_aligned.c \
	$(SILK)/src/SKP_Silk_interpolate.c \
	$(SILK)/src/SKP_Silk_k2a.c \
	$(SILK)/src/SKP_Silk_k2a_Q16.c \
	$(SILK)/src/SKP_Silk_lin2log.c \
	$(SILK)/src/SKP_Silk_log2lin.c \
	$(SILK)/src/SKP_Silk_lowpass_int.c \
	$(SILK)/src/SKP_Silk_lowpass_short.c \
	$(SILK)/src/SKP_Silk_noise_shape_analysis_FIX.c \
	$(SILK)/src/SKP_Silk_pitch_analysis_core.c \
	$(SILK)/src/SKP_Silk_pitch_est_tables.c \
	$(SILK)/src/SKP_Silk_prefilter_FIX.c \
	$(SILK)/src/SKP_Silk_process_NLSFs_FIX.c \
	$(SILK)/src/SKP_Silk_process_gains_FIX.c \
	$(SILK)/src/SKP_Silk_pulses_to_bytes.c \
	$(SILK)/src/SKP_Silk_quant_LTP_gains_FIX.c \
	$(SILK)/src/SKP_Silk_range_coder.c \
	$(SILK)/src/SKP_Silk_regularize_correlations_FIX.c \
	$(SILK)/src/SKP_Silk_resample_1_2.c \
	$(SILK)/src/SKP_Silk_resample_1_2_coarse.c \
	$(SILK)/src/SKP_Silk_resample_1_2_coarsest.c \
	$(SILK)/src/SKP_Silk_resample_1_3.c \
	$(SILK)/src/SKP_Silk_resample_2_1_coarse.c \
	$(SILK)/src/SKP_Silk_resample_2_3.c \
	$(SILK)/src/SKP_Silk_resample_2_3_coarse.c \
	$(SILK)/src/SKP_Silk_resample_2_3_coarsest.c \
	$(SILK)/src/SKP_Silk_resample_2_3_rom.c \
	$(SILK)/src/SKP_Silk_resample_3_1.c \
	$(SILK)/src/SKP_Silk_resample_3_2.c \
	$(SILK)/src/SKP_Silk_resample_3_2_rom.c \
	$(SILK)/src/SKP_Silk_resample_3_4.c \
	$(SILK)/src/SKP_Silk_resample_4_3.c \
	$(SILK)/src/SKP_Silk_residual_energy16_FIX.c \
	$(SILK)/src/SKP_Silk_residual_energy_FIX.c \
	$(SILK)/src/SKP_Silk_scale_copy_vector16.c \
	$(SILK)/src/SKP_Silk_scale_vector.c \
	$(SILK)/src/SKP_Silk_schur.c \
	$(SILK)/src/SKP_Silk_schur64.c \
	$(SILK)/src/SKP_Silk_shell_coder.c \
	$(SILK)/src/SKP_Silk_sigm_Q15.c \
	$(SILK)/src/SKP_Silk_solve_LS_FIX.c \
	$(SILK)/src/SKP_Silk_sort.c \
	$(SILK)/src/SKP_Silk_sum_sqr_shift.c \
	$(SILK)/src/SKP_Silk_tables_LTP.c \
	$(SILK)/src/SKP_Silk_tables_NLSF_CB0_10.c \
	$(SILK)/src/SKP_Silk_tables_NLSF_CB0_16.c \
	$(SILK)/src/SKP_Silk_tables_NLSF_CB1_10.c \
	$(SILK)/src/SKP_Silk_tables_NLSF_CB1_16.c \
	$(SILK)/src/SKP_Silk_tables_gain.c \
	$(SILK)/src/SKP_Silk_tables_other.c \
	$(SILK)/src/SKP_Silk_tables_pitch_lag.c \
	$(SILK)/src/SKP_Silk_tables_pulses_per_block.c \
	$(SILK)/src/SKP_Silk_tables_sign.c \
	$(SILK)/src/SKP_Silk_tables_type_offset.c
	
LOCAL_ARM_MODE := arm
LOCAL_CFLAGS = -O3 
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(SILK)/src $(LOCAL_PATH)/$(SILK)/interface
include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE    := silk8_jni
LOCAL_SRC_FILES := silk8_jni.cpp 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(SILK)/src $(LOCAL_PATH)/$(SILK)/interface
LOCAL_CFLAGS = -O3 
LOCAL_STATIC_LIBRARIES :=  silkcommon
LOCAL_ARM_MODE := arm
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := silk16_jni
LOCAL_SRC_FILES := silk16_jni.cpp 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(SILK)/src $(LOCAL_PATH)/$(SILK)/interface
LOCAL_CFLAGS = -O3 
LOCAL_STATIC_LIBRARIES :=  silkcommon
LOCAL_ARM_MODE := arm
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := silk24_jni
LOCAL_SRC_FILES := silk24_jni.cpp 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(SILK)/src $(LOCAL_PATH)/$(SILK)/interface
LOCAL_CFLAGS = -O3 
LOCAL_STATIC_LIBRARIES :=  silkcommon
LOCAL_ARM_MODE := arm
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
include $(BUILD_SHARED_LIBRARY)

ifeq ($(subst -v7a,,$(TARGET_ARCH_ABI)),armeabi)
include $(CLEAR_VARS)
#ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
G729	:= g729/siphon-g729
G729SRC	:= $(G729)/Sources
G729HDR	:= $(G729)/Headers
#else
#G729	:= g729/itu-g729
#G729SRC	:= $(G729SRC)
#G729HDR	:= $(G729SRC)
#fi
LOCAL_MODULE	:= g729_jni
LOCAL_SRC_FILES	:= g729_jni.cpp \
	$(G729SRC)/qua_gain.c \
	$(G729SRC)/util.c \
	$(G729SRC)/g729a_decoder.c \
	$(G729SRC)/tab_ld8a.c \
	$(G729SRC)/filter.c \
	$(G729SRC)/lpc.c \
	$(G729SRC)/dspfunc.c \
	$(G729SRC)/post_pro.c \
	$(G729SRC)/dec_lag3.c \
	$(G729SRC)/cod_ld8a.c \
	$(G729SRC)/lspgetq.c \
	$(G729SRC)/lpcfunc.c \
	$(G729SRC)/lspdec.c \
	$(G729SRC)/dec_gain.c \
	$(G729SRC)/oper_32b.c \
	$(G729SRC)/p_parity.c \
	$(G729SRC)/gainpred.c \
	$(G729SRC)/bits.c \
	$(G729SRC)/dec_ld8a.c \
	$(G729SRC)/de_acelp.c \
	$(G729SRC)/cor_func.c \
	$(G729SRC)/postfilt.c \
	$(G729SRC)/taming.c \
	$(G729SRC)/basic_op.c \
	$(G729SRC)/g729a_encoder.c \
	$(G729SRC)/pitch_a.c \
	$(G729SRC)/pre_proc.c \
	$(G729SRC)/pred_lt3.c \
	$(G729SRC)/acelp_ca.c \
	$(G729SRC)/qua_lsp.c
LOCAL_C_INCLUDES	+= $(LOCAL_PATH)/$(G729HDR)
LOCAL_CFLAGS = -g -Wall -Wextra
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_CFLAGS += -DARM_V7A
endif
LOCAL_ARM_MODE	:= arm
LOCAL_LDLIBS	:= -L$(SYSROOT)/usr/lib
include $(BUILD_SHARED_LIBRARY)
endif

include $(CLEAR_VARS)
SPANDSP     := spandsp
LOCAL_MODULE    := g722_jni
LOCAL_SRC_FILES := g722_jni.cpp \
	$(SPANDSP)/g722.c \
	$(SPANDSP)/vector_int.c
LOCAL_ARM_MODE := arm
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(SPANDSP)/spandsp $(LOCAL_PATH)/$(SPANDSP)
LOCAL_CFLAGS = -O3
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
SPANDSP     := spandsp
LOCAL_MODULE    := gsm_jni
LOCAL_SRC_FILES := gsm_jni.cpp \
	$(SPANDSP)/gsm0610_decode.c \
	$(SPANDSP)/gsm0610_encode.c \
	$(SPANDSP)/gsm0610_lpc.c \
	$(SPANDSP)/gsm0610_preprocess.c \
	$(SPANDSP)/gsm0610_rpe.c \
	$(SPANDSP)/gsm0610_short_term.c \
	$(SPANDSP)/gsm0610_long_term.c
LOCAL_ARM_MODE := arm
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(SPANDSP)/spandsp $(LOCAL_PATH)/$(SPANDSP)
LOCAL_CFLAGS = -O3
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := opus_jni
LOCAL_SRC_FILES := opus_jni.cpp $(OPUS)/celt/celt_decoder.c \
        $(OPUS)/celt/arm/arm_celt_map.c \
        $(OPUS)/celt/arm/armcpu.c \
        $(OPUS)/celt/mathops.c \
        $(OPUS)/celt/cwrs.c \
        $(OPUS)/celt/kiss_fft.c \
        $(OPUS)/celt/vq.c \
        $(OPUS)/celt/celt_encoder.c \
        $(OPUS)/celt/laplace.c \
        $(OPUS)/celt/bands.c \
        $(OPUS)/celt/quant_bands.c \
        $(OPUS)/celt/entenc.c \
        $(OPUS)/celt/mdct.c \
        $(OPUS)/celt/modes.c \
        $(OPUS)/celt/celt_lpc.c \
        $(OPUS)/celt/entcode.c \
        $(OPUS)/celt/pitch.c \
        $(OPUS)/celt/entdec.c \
        $(OPUS)/celt/celt.c \
        $(OPUS)/celt/rate.c \
        $(OPUS)/silk/resampler_private_IIR_FIR.c \
        $(OPUS)/silk/init_encoder.c \
        $(OPUS)/silk/init_decoder.c \
        $(OPUS)/silk/stereo_LR_to_MS.c \
        $(OPUS)/silk/decode_frame.c \
        $(OPUS)/silk/stereo_MS_to_LR.c \
        $(OPUS)/silk/check_control_input.c \
        $(OPUS)/silk/process_NLSFs.c \
        $(OPUS)/silk/biquad_alt.c \
        $(OPUS)/silk/resampler_down2_3.c \
        $(OPUS)/silk/A2NLSF.c \
        $(OPUS)/silk/shell_coder.c \
        $(OPUS)/silk/resampler_rom.c \
        $(OPUS)/silk/PLC.c \
        $(OPUS)/silk/NSQ_del_dec.c \
        $(OPUS)/silk/pitch_est_tables.c \
        $(OPUS)/silk/encode_pulses.c \
        $(OPUS)/silk/resampler.c \
        $(OPUS)/silk/enc_API.c \
        $(OPUS)/silk/NSQ.c \
        $(OPUS)/silk/resampler_private_AR2.c \
        $(OPUS)/silk/NLSF_stabilize.c \
        $(OPUS)/silk/NLSF_unpack.c \
        $(OPUS)/silk/interpolate.c \
        $(OPUS)/silk/control_audio_bandwidth.c \
        $(OPUS)/silk/stereo_find_predictor.c \
        $(OPUS)/silk/decode_indices.c \
        $(OPUS)/silk/code_signs.c \
        $(OPUS)/silk/bwexpander_32.c \
        $(OPUS)/silk/decoder_set_fs.c \
        $(OPUS)/silk/LP_variable_cutoff.c \
        $(OPUS)/silk/fixed/residual_energy16_FIX.c \
        $(OPUS)/silk/fixed/regularize_correlations_FIX.c \
        $(OPUS)/silk/fixed/k2a_Q16_FIX.c \
        $(OPUS)/silk/fixed/apply_sine_window_FIX.c \
        $(OPUS)/silk/fixed/k2a_FIX.c \
        $(OPUS)/silk/fixed/autocorr_FIX.c \
        $(OPUS)/silk/fixed/noise_shape_analysis_FIX.c \
        $(OPUS)/silk/fixed/schur_FIX.c \
        $(OPUS)/silk/fixed/find_pred_coefs_FIX.c \
        $(OPUS)/silk/fixed/process_gains_FIX.c \
        $(OPUS)/silk/fixed/LTP_scale_ctrl_FIX.c \
        $(OPUS)/silk/fixed/schur64_FIX.c \
        $(OPUS)/silk/fixed/find_LTP_FIX.c \
        $(OPUS)/silk/fixed/pitch_analysis_core_FIX.c \
        $(OPUS)/silk/fixed/find_LPC_FIX.c \
        $(OPUS)/silk/fixed/vector_ops_FIX.c \
        $(OPUS)/silk/fixed/prefilter_FIX.c \
        $(OPUS)/silk/fixed/find_pitch_lags_FIX.c \
        $(OPUS)/silk/fixed/corrMatrix_FIX.c \
        $(OPUS)/silk/fixed/LTP_analysis_filter_FIX.c \
        $(OPUS)/silk/fixed/warped_autocorrelation_FIX.c \
        $(OPUS)/silk/fixed/encode_frame_FIX.c \
        $(OPUS)/silk/fixed/residual_energy_FIX.c \
        $(OPUS)/silk/fixed/solve_LS_FIX.c \
        $(OPUS)/silk/fixed/burg_modified_FIX.c \
        $(OPUS)/silk/LPC_analysis_filter.c \
        $(OPUS)/silk/LPC_inv_pred_gain.c \
        $(OPUS)/silk/resampler_private_up2_HQ.c \
        $(OPUS)/silk/tables_LTP.c \
        $(OPUS)/silk/HP_variable_cutoff.c \
        $(OPUS)/silk/VAD.c \
        $(OPUS)/silk/sum_sqr_shift.c \
        $(OPUS)/silk/decode_parameters.c \
        $(OPUS)/silk/inner_prod_aligned.c \
        $(OPUS)/silk/sort.c \
        $(OPUS)/silk/tables_NLSF_CB_WB.c \
        $(OPUS)/silk/control_codec.c \
        $(OPUS)/silk/tables_pulses_per_block.c \
        $(OPUS)/silk/bwexpander.c \
        $(OPUS)/silk/tables_other.c \
        $(OPUS)/silk/resampler_private_down_FIR.c \
        $(OPUS)/silk/lin2log.c \
        $(OPUS)/silk/NLSF_encode.c \
        $(OPUS)/silk/CNG.c \
        $(OPUS)/silk/sigm_Q15.c \
        $(OPUS)/silk/debug.c \
        $(OPUS)/silk/decode_core.c \
        $(OPUS)/silk/ana_filt_bank_1.c \
        $(OPUS)/silk/decode_pulses.c \
        $(OPUS)/silk/log2lin.c \
        $(OPUS)/silk/dec_API.c \
        $(OPUS)/silk/stereo_quant_pred.c \
        $(OPUS)/silk/NLSF2A.c \
        $(OPUS)/silk/table_LSF_cos.c \
        $(OPUS)/silk/NLSF_decode.c \
        $(OPUS)/silk/gain_quant.c \
        $(OPUS)/silk/tables_pitch_lag.c \
        $(OPUS)/silk/NLSF_VQ.c \
        $(OPUS)/silk/stereo_decode_pred.c \
        $(OPUS)/silk/stereo_encode_pred.c \
        $(OPUS)/silk/decode_pitch.c \
        $(OPUS)/silk/tables_gain.c \
        $(OPUS)/silk/tables_NLSF_CB_NB_MB.c \
        $(OPUS)/silk/quant_LTP_gains.c \
        $(OPUS)/silk/resampler_down2.c \
        $(OPUS)/silk/VQ_WMat_EC.c \
        $(OPUS)/silk/NLSF_VQ_weights_laroia.c \
        $(OPUS)/silk/encode_indices.c \
        $(OPUS)/silk/NLSF_del_dec_quant.c \
        $(OPUS)/silk/control_SNR.c \
        $(OPUS)/src/opus_encoder.c \
        $(OPUS)/src/analysis.c \
        $(OPUS)/src/opus_multistream_encoder.c \
        $(OPUS)/src/opus_multistream_decoder.c \
        $(OPUS)/src/mlp_data.c \
        $(OPUS)/src/opus_multistream.c \
        $(OPUS)/src/opus.c \
        $(OPUS)/src/opus_decoder.c \
        $(OPUS)/src/mlp.c \
        $(OPUS)/src/opus_compare.c \
        $(OPUS)/src/repacketizer.c
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(OPUS)/include $(LOCAL_PATH)/$(OPUS)/celt $(LOCAL_PATH)/$(OPUS)/silk $(LOCAL_PATH)/$(OPUS)/silk/fixed
LOCAL_CFLAGS = -O3 -Drestrict='' -D__EMX__ -DOPUS_BUILD -DFIXED_POINT -DDISABLE_FLOAT_API -DUSE_ALLOCA -DHAVE_LRINT -DHAVE_LRINTF -O3 -fno-math-errno
LOCAL_STATIC_LIBRARIES :=  silkcommon
LOCAL_ARM_MODE := arm
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog
include $(BUILD_SHARED_LIBRARY)
