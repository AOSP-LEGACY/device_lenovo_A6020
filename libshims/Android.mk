# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := lenovo_gui.c
LOCAL_SHARED_LIBRARIES := liblog libcutils libsensor libbinder libutils
LOCAL_MODULE := libshim_gui
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := lenovo_atomic.cpp
LOCAL_SHARED_LIBRARIES := libcutils
LOCAL_MODULE := libshim_atomic
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    boringssl/p_dec.c \
    boringssl/p_open.c \
    boringssl/cipher.c \
    boringssl/e_des.c \
    boringssl/cleanup.c \
    boringssl/ctrl.c
LOCAL_CFLAGS += -std=c99
LOCAL_C_INCLUDES := boringssl
LOCAL_SHARED_LIBRARIES := libcrypto
LOCAL_MODULE := libshims_boringssl
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := libshim_mediabuffer.cpp
LOCAL_SHARED_LIBRARIES := libstagefright_foundation libui libgui libmedia
LOCAL_MODULE := libshims_ims
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
