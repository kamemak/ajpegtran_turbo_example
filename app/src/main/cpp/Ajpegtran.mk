LOCAL_PATH := $(abspath $(call my-dir))
include $(CLEAR_VARS)

LOCAL_MODULE := ajpegtran
SOURCE_PATH := libjpeg-turbo-2.1.3

LOCAL_SRC_FILES += \
	$(SOURCE_PATH)/ajpegtran_turbo.c \
	$(SOURCE_PATH)/transupp.c \
	$(SOURCE_PATH)/rdswitch.c \
	$(SOURCE_PATH)/cdjpeg.c \

LOCAL_LDLIBS := -llog -landroid

LOCAL_STATIC_LIBRARIES := libjpeg-turbo

include $(BUILD_SHARED_LIBRARY)
