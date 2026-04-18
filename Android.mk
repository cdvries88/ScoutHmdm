LOCAL_PATH := $(call my-dir)

# De XML voor de Privileged Permissions
include $(CLEAR_VARS)
LOCAL_MODULE := privapp-permissions-hmdm.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

# De XML voor de Default Permissions
include $(CLEAR_VARS)
LOCAL_MODULE := default-permissions-hmdm.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/default-permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

# De Headwind MDM App zelf
include $(CLEAR_VARS)
LOCAL_MODULE := HeadwindMDM
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := hmdm-6.26-master.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true

# Zorg dat de XML's altijd worden meegeleverd als de app wordt gebouwd
LOCAL_REQUIRED_MODULES := \
    privapp-permissions-hmdm.xml \
    default-permissions-hmdm.xml

include $(BUILD_PREBUILT)
