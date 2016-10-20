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

ifneq ($(filter bcm_% fbx6lc avko banff,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

ifneq ($(ANDROID_SUPPORTS_PLAYREADY), n)

# sage adapter library is always prebuilt.
include $(CLEAR_VARS)
LOCAL_MODULE := libplayreadypk_host
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
ifeq ($(TARGET_2ND_ARCH),arm)
LOCAL_MULTILIB := both
LOCAL_MODULE_TARGET_ARCH := arm arm64
LOCAL_SRC_FILES_arm64 := lib/arm64/libplayreadypk_host.so
LOCAL_SRC_FILES_arm := lib/arm/libplayreadypk_host.so
else
LOCAL_MODULE_TARGET_ARCH := arm
LOCAL_SRC_FILES_arm := lib/arm/libplayreadypk_host.so
endif
include $(BUILD_PREBUILT)

ifneq ($(wildcard $(TOP)/vendor/broadcom/playready/libplayreadydrmplugin/Android.mk),)

include $(call first-makefiles-under,$(LOCAL_PATH))

else

include $(CLEAR_VARS)
LOCAL_MODULE := libplayreadydrmplugin
LOCAL_MODULE_RELATIVE_PATH := mediadrm
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
ifeq ($(TARGET_2ND_ARCH),arm)
LOCAL_MULTILIB := both
LOCAL_MODULE_TARGET_ARCH := arm arm64
LOCAL_SRC_FILES_arm64 := lib/arm64/libplayreadydrmplugin.so
LOCAL_SRC_FILES_arm := lib/arm/libplayreadydrmplugin.so
else
LOCAL_MODULE_TARGET_ARCH := arm
LOCAL_SRC_FILES_arm := lib/arm/libplayreadydrmplugin.so
endif
include $(BUILD_PREBUILT)

endif
endif
endif
