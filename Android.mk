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

ifneq ($(filter $(BCM_RBOARDS) $(BCM_DBOARDS) $(BCM_CBOARDS),$(TARGET_DEVICE)),)

MY_LOCAL_PATH := $(call my-dir)
LOCAL_PATH := $(MY_LOCAL_PATH)

ifneq ($(ANDROID_SUPPORTS_PLAYREADY), n)

# sources available?  build from sources.
ifneq ($(wildcard $(TOP)/$(MY_LOCAL_PATH)/libplayreadydrmplugin/Android.mk),)
include $(MY_LOCAL_PATH)/libplayreadydrmplugin/Android.mk
include $(MY_LOCAL_PATH)/libplayreadydrmplugin_hidl/Android.mk
else
# binary distribution.
include $(MY_LOCAL_PATH)/lib/Android.dist.mk
include $(MY_LOCAL_PATH)/bin/Android.dist.mk
endif

include $(MY_LOCAL_PATH)/lib/Android.mk
endif
endif
