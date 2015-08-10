LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := SharedBufferClient.cpp

LOCAL_SHARED_LIBRARIES:= libcutils libutils libbinder libisharedbuffer

LOCAL_MODULE := SharedBufferClient

include $(BUILD_EXECUTABLE)
