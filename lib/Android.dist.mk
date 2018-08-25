# Copyright (C) 2018 The Android Open Source Project
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

ifeq ($(NEXUS_SECURITY_API_VERSION),2)
SEC_API_VER := secv2
else
SEC_API_VER := secv1
endif
ifeq ($(TARGET_BUILD_VARIANT),user)
SEC_VARIANT := usr
else
SEC_VARIANT := usrdbg
endif

include $(CLEAR_VARS)
LOCAL_MODULE             := libprhidl_3_0
LOCAL_MODULE_PATH        := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_TAGS        := optional
LOCAL_MODULE_SUFFIX      := .so
LOCAL_MODULE_CLASS       := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_TARGET_ARCH := arm
ifeq ($(TARGET_2ND_ARCH),arm)
LOCAL_MULTILIB           := both
LOCAL_MODULE_TARGET_ARCH += arm64
# TODO: prebuilt 64-bit libprhidl_3_0.so hasn't been validated.
LOCAL_SRC_FILES_arm64    :=
endif
LOCAL_SRC_FILES_arm      := arm/$(SEC_API_VER)/$(SEC_VARIANT)/$(LOCAL_MODULE).so
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := libplayreadydrmplugin_3_0
LOCAL_MODULE_PATH          := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_RELATIVE_PATH := mediadrm
LOCAL_MODULE_TAGS          := optional
LOCAL_MODULE_SUFFIX        := .so
LOCAL_MODULE_CLASS         := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE   := true
LOCAL_MODULE_TARGET_ARCH   := arm
ifeq ($(TARGET_2ND_ARCH),arm)
LOCAL_MULTILIB             := both
LOCAL_MODULE_TARGET_ARCH   += arm64
# TODO: prebuilt 64-bit libplayreadydrmplugin_3_0.so hasn't been validated.
LOCAL_SRC_FILES_arm64      :=
endif
LOCAL_SRC_FILES_arm        := arm/$(SEC_API_VER)/$(SEC_VARIANT)/$(LOCAL_MODULE).so
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE             := libprhidl_2_5
LOCAL_MODULE_PATH        := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_TAGS        := optional
LOCAL_MODULE_SUFFIX      := .so
LOCAL_MODULE_CLASS       := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_TARGET_ARCH := arm
ifeq ($(TARGET_2ND_ARCH),arm)
LOCAL_MULTILIB           := both
LOCAL_MODULE_TARGET_ARCH += arm64
# TODO: prebuilt 64-bit libprhidl_2_5.so hasn't been validated.
LOCAL_SRC_FILES_arm64    :=
endif
LOCAL_SRC_FILES_arm      := arm/$(SEC_API_VER)/$(SEC_VARIANT)/$(LOCAL_MODULE).so
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := libplayreadydrmplugin_2_5
LOCAL_MODULE_PATH          := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_RELATIVE_PATH := mediadrm
LOCAL_MODULE_TAGS          := optional
LOCAL_MODULE_SUFFIX        := .so
LOCAL_MODULE_CLASS         := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE   := true
LOCAL_MODULE_TARGET_ARCH   := arm
ifeq ($(TARGET_2ND_ARCH),arm)
LOCAL_MULTILIB             := both
LOCAL_MODULE_TARGET_ARCH   += arm64
# TODO: prebuilt 64-bit libplayreadydrmplugin_2_5.so hasn't been validated.
LOCAL_SRC_FILES_arm64      :=
endif
LOCAL_SRC_FILES_arm        := arm/$(SEC_API_VER)/$(SEC_VARIANT)/$(LOCAL_MODULE).so
include $(BUILD_PREBUILT)
