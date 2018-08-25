# Copyright (C) 2008 The Android Open Source Project
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

ifneq ($(filter $(BCM_RBOARDS) $(BCM_DBOARDS) $(BCM_CBOARDS),$(TARGET_DEVICE)),)

SAVED_LOCAL_PATH := $(call my-dir)
LOCAL_PATH := $(SAVED_LOCAL_PATH)

ifneq ($(ANDROID_SUPPORTS_PLAYREADY), n)

ifeq ($(NEXUS_SECURITY_API_VERSION),2)
SEC_API_VER := secv2
else
SEC_API_VER := secv1
endif

# sage adapter library is always prebuilt.
# PR 2.5
include $(CLEAR_VARS)
LOCAL_MODULE := libplayreadypk_host
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
ifeq ($(TARGET_2ND_ARCH),arm)
LOCAL_MULTILIB := both
LOCAL_MODULE_TARGET_ARCH := arm arm64
LOCAL_SRC_FILES_arm64 := arm64/$(SEC_API_VER)/libplayreadypk_host.a
LOCAL_SRC_FILES_arm := arm/$(SEC_API_VER)/libplayreadypk_host.a
else
LOCAL_MODULE_TARGET_ARCH := arm
ifeq ($(SAGE_VERSION),2x)
LOCAL_SRC_FILES_arm := arm/s2x/libplayreadypk_host.a
else
LOCAL_SRC_FILES_arm := arm/$(SEC_API_VER)/libplayreadypk_host.a
endif
endif
include $(BUILD_PREBUILT)

# PR 3.0
include $(CLEAR_VARS)
LOCAL_MODULE := libplayready30pk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
ifeq ($(TARGET_2ND_ARCH),arm)
LOCAL_MULTILIB := 32
LOCAL_MODULE_TARGET_ARCH := arm arm64
LOCAL_SRC_FILES_arm64 := arm64/$(SEC_API_VER)/libplayready30pk.so
LOCAL_SRC_FILES_arm := arm/$(SEC_API_VER)/libplayready30pk.so
else
LOCAL_MODULE_TARGET_ARCH := arm
ifneq ($(SAGE_VERSION),2x)
LOCAL_SRC_FILES_arm := arm/$(SEC_API_VER)/libplayready30pk.so
endif
endif
include $(BUILD_PREBUILT)

endif
endif
