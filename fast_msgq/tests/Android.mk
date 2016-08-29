#
# Copyright (C) 2016 The Android Open Source Project
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
#

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := mq_test_service
LOCAL_SRC_FILES := msgq_test_service.cpp

LOCAL_SHARED_LIBRARIES := libhidl libhwbinder libbase libcutils libutils libfmq
LOCAL_SHARED_LIBRARIES += android.hardware.tests.msgq@1.0
LOCAL_C_INCLUDES := system/libhwbinder/include
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_REQUIRED_MODULES := libgtest
LOCAL_SRC_FILES := msgq_test_client.cpp \
                   test_main.cpp

LOCAL_SHARED_LIBRARIES := libhidl libhwbinder libbase libcutils libutils libfmq
LOCAL_SHARED_LIBRARIES += android.hardware.tests.msgq@1.0
LOCAL_STATIC_LIBRARIES := libgtest
LOCAL_MODULE := mq_test_client
LOCAL_C_INCLUDES := system/libhwbinder/include
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_REQUIRED_MODULES := libgtest
LOCAL_SRC_FILES := mq_test.cpp \
                   test_main.cpp
LOCAL_STATIC_LIBRARIES := libutils libcutils liblog libgtest
LOCAL_SHARED_LIBRARIES := libhidl libhwbinder libfmq
LOCAL_C_INCLUDES := system/libhwbinder/include
LOCAL_MODULE := mq_test
include $(BUILD_EXECUTABLE)
