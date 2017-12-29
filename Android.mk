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

LOCAL_PATH := $(call my-dir)

ifneq ($(ANDROID_SUPPORTS_PLAYREADY), n)

ifeq ($(TARGET_BUILD_VARIANT),user)
RELEASE_PREBUILTS := release_prebuilts/user
else
RELEASE_PREBUILTS := release_prebuilts/userdebug
endif
ifeq ($(LOCAL_DEVICE_FULL_TREBLE),y)
RELEASE_PREBUILTS := ${RELEASE_PREBUILTS}_treble
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
LOCAL_SRC_FILES_arm64 := lib/arm64/libplayreadypk_host.a
LOCAL_SRC_FILES_arm := lib/arm/libplayreadypk_host.a
else
LOCAL_MODULE_TARGET_ARCH := arm
ifeq ($(SAGE_VERSION),2x)
LOCAL_SRC_FILES_arm := lib/arm/s2x/libplayreadypk_host.a
else
LOCAL_SRC_FILES_arm := lib/arm/libplayreadypk_host.a
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
LOCAL_SRC_FILES_arm64 := lib/arm64/libplayready30pk.so
LOCAL_SRC_FILES_arm := lib/arm/libplayready30pk.so
else
LOCAL_MODULE_TARGET_ARCH := arm
ifneq ($(SAGE_VERSION),2x)
LOCAL_SRC_FILES_arm := lib/arm/libplayready30pk.so
endif
endif
include $(BUILD_PREBUILT)

ifneq ($(wildcard $(TOP)/$(LOCAL_PATH)/libplayreadydrmplugin/Android.mk),)

include $(call first-makefiles-under,$(LOCAL_PATH))

else

include $(CLEAR_VARS)
LOCAL_MODULE := libplayreadydrmplugin
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)
LOCAL_MODULE_RELATIVE_PATH := mediadrm
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
ifeq ($(TARGET_2ND_ARCH),arm)
LOCAL_MULTILIB := both
LOCAL_MODULE_TARGET_ARCH := arm arm64
# prebuilt 64-bit libplayreadydrmplugin.so hasn't been validated, leaving it empty for now
LOCAL_SRC_FILES_arm64 :=
LOCAL_SRC_FILES_arm := ../../../${BCM_VENDOR_STB_ROOT}/$(RELEASE_PREBUILTS)/$(LOCAL_MODULE).so
else
LOCAL_MODULE_TARGET_ARCH := arm
LOCAL_SRC_FILES_arm := ../../../${BCM_VENDOR_STB_ROOT}/$(RELEASE_PREBUILTS)/$(LOCAL_MODULE).so
endif
include $(BUILD_PREBUILT)

endif
endif
endif
