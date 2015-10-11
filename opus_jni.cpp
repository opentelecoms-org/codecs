/*
 * Copyright (C) 2015 The Lumicall Open Source Project
 * Copyright (C) 2009 The Sipdroid Open Source Project
 * 
 * This file is part of Lumicall (http://lumicall.org)
 * 
 * Lumicall is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This source code is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this source code; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

 
#include <jni.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

/* Define codec specific settings */
#define MAX_BYTES_ENC_PER_FRAME     250 // Equals peak bitrate of 100 kbps 
#define MAX_BYTES_DEC_PER_FRAME     1024

#define MAX_INPUT_FRAMES        5
#define MAX_LBRR_DELAY          2
#define MAX_FRAME_LENGTH        5760

#define	MAX_FRAME			160

#include <android/log.h> 

#define LOG_TAG "opus" // text for log tag 

#include <opus.h>

#undef DEBUG_OPUS

// the header length of the RTP frame (must skip when en/decoding)
#define	RTP_HDR_SIZE	12

static int codec_open = 0;

static JavaVM *gJavaVM;
//const char *kInterfacePath = "org/lumicall/pjlib/silk8";

/* encoder parameters */

    opus_int32 encSizeBytes;
    OpusEncoder *encoder;

    /* default settings */
    opus_int   fs_kHz = 8;
    opus_int   targetRate_bps = 20000;
    opus_int   packetSize_ms = 20;
    opus_int   frameSizeReadFromFile_ms = 20;
    opus_int   packetLoss_perc = 0, smplsSinceLastPacket;
    opus_int   INBandFec_enabled = 0, DTX_enabled = 0, quiet = 0;
        

/* decoder parameters */

    jbyte payloadToDec[    MAX_BYTES_DEC_PER_FRAME * MAX_INPUT_FRAMES * ( MAX_LBRR_DELAY + 1 ) ];
    jshort out[ ( MAX_FRAME_LENGTH << 1 ) * MAX_INPUT_FRAMES ], *outPtr;
    opus_int32 decSizeBytes;
    //void      *psDec;
    OpusDecoder *decoder;

extern "C"
JNIEXPORT jint JNICALL Java_org_sipdroid_codecs_Opus_open
  (JNIEnv *env, jobject obj, jint compression) {
	int ret;

	if (codec_open++ != 0)
		return (jint)0;

    /* Create decoder */
    decoder = opus_decoder_create(8000, 1, &ret);
    if( ret != OPUS_OK ) {
		__android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, 
            "\n!!!!!!!! opus_decoder_create returned %d", ret );		
    }


    /* Create Encoder */
    encoder = opus_encoder_create(8000, 1, OPUS_APPLICATION_VOIP, &ret);
    if( ret != OPUS_OK ) {
		__android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, 
            "\n!!!!!!!! opus_encoder_create returned %d", ret );	
    }
    
	
	return (jint)0;
}

extern "C"
JNIEXPORT jint JNICALL Java_org_sipdroid_codecs_Opus_encode
    (JNIEnv *env, jobject obj, jshortArray lin, jint offset, jbyteArray encoded, jint size) {

    jbyte	  enc_payload[ MAX_BYTES_DEC_PER_FRAME * MAX_INPUT_FRAMES ];
    jshort    in[ MAX_FRAME_LENGTH * MAX_INPUT_FRAMES ];	
	int ret,i,frsz=MAX_FRAME;
	opus_int16 nBytes;
	unsigned int lin_pos = 0;
	
	if (!codec_open)
		return 0;
		

	for (i = 0; i < size; i+=MAX_FRAME) {
			
		env->GetShortArrayRegion(lin, offset + i,frsz, in);
        /* max payload size */
        nBytes = MAX_BYTES_ENC_PER_FRAME * MAX_INPUT_FRAMES;

        ret = opus_encode(encoder, in, frsz, (unsigned char*)enc_payload, nBytes);
        if( ret < 1 ) {
			__android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, 
				"!!!!!!!! opus_encode returned: %d\n", ret);
            break;
        }
        /* Write payload */		
		env->SetByteArrayRegion(encoded, RTP_HDR_SIZE+ lin_pos, ret, enc_payload);
		lin_pos += ret;
	}

    return (jint)lin_pos;
}

extern "C"
JNIEXPORT jint JNICALL Java_org_sipdroid_codecs_Opus_decode
    (JNIEnv *env, jobject obj, jbyteArray encoded, jshortArray lin, jint size) {

    jbyte buffer [MAX_BYTES_DEC_PER_FRAME * MAX_INPUT_FRAMES * ( MAX_LBRR_DELAY + 1 ) ];
    //jshort output_buffer[( MAX_FRAME_LENGTH << 1 ) * MAX_INPUT_FRAMES ];
    jshort output_buffer[5760 * MAX_INPUT_FRAMES];
//	opus_int16	*outPtr;

	int ret;
	//opus_int16 len = ( MAX_FRAME_LENGTH << 1 ) * MAX_INPUT_FRAMES;
        opus_int16 len = 5760 * MAX_INPUT_FRAMES;
//	int	tot_len,frames;

	if (!codec_open)
		return 0;

        //__android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, "!!!!!!!! mapping encoded to buffer size=%d len=%d", size, len);
	env->GetByteArrayRegion(encoded, RTP_HDR_SIZE, size, buffer);

//	do {
                //__android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, "!!!!!!!! calling opus_decode size=%d len=%d", size, len);
		ret = opus_decode( decoder, (unsigned char*)buffer, size, output_buffer, len, 0 );
		if( ret < 0 ) {
			__android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, 
				"!!!!!!!! opus_decode returned: %d\n", ret); 	
		}
//		frames++;
//		outPtr  += len;
//		tot_len += len;		
	
//	} while( DecControl.moreInternalDecoderFrames );

        if(ret > 0) {
                //__android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, "!!!!!!!! mapping output_buffer to lin");
	        env->SetShortArrayRegion(lin, 0, ret,output_buffer);
        }
//        return (jint)len;
        if(ret < 0)
                ret = 0;
	return (jint)ret;
}

extern "C"
JNIEXPORT void JNICALL Java_org_sipdroid_codecs_Opus_close
    (JNIEnv *env, jobject obj) {

	if (--codec_open != 0)
		return;
    /* Free decoder */
    opus_decoder_destroy(decoder);
    /* Free Encoder */
    opus_encoder_destroy(encoder);
}
