LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := vendor.qti.hardware.vibrator.service.oneplus_lito
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/bin
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_STEM := vendor.qti.hardware.vibrator.service

LOCAL_CFLAGS += \
    -Wall \
    -Werror             

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include

LOCAL_SRC_FILES := \
    service.cpp \
    Vibrator.cpp \
    effect.cpp

LOCAL_SHARED_LIBRARIES := \
    android.hardware.vibrator-ndk_platform \
    libbase \
    libbinder_ndk \
    libcutils \
    liblog \
    libutils

include $(BUILD_EXECUTABLE)
