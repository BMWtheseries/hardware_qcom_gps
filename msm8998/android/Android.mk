LOCAL_PATH := $(call my-dir)

qcom_qti_common_cflags := \
    -Wall \
    -Werror \
    -Wno-format \
    -Wno-unused-parameter \
    -Wno-unused-private-field \

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.gnss@1.0-impl-qti
LOCAL_LICENSE_KINDS := SPDX-license-identifier-Apache-2.0 SPDX-license-identifier-BSD legacy_not_a_contribution
LOCAL_LICENSE_CONDITIONS := by_exception_only not_allowed notice
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_OWNER := qti
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_CFLAGS := $(qcom_qti_common_cflags)
LOCAL_SRC_FILES := \
    AGnss.cpp \
    Gnss.cpp \
    GnssBatching.cpp \
    GnssGeofencing.cpp \
    GnssMeasurement.cpp \
    GnssNi.cpp \
    GnssConfiguration.cpp \
    GnssDebug.cpp \
    AGnssRil.cpp

LOCAL_SRC_FILES += \
    location_api/LocationUtil.cpp \
    location_api/GnssAPIClient.cpp \
    location_api/GeofenceAPIClient.cpp \
    location_api/FlpAPIClient.cpp \
    location_api/GnssMeasurementAPIClient.cpp \

LOCAL_C_INCLUDES:= \
    $(LOCAL_PATH)/location_api

LOCAL_HEADER_LIBRARIES := \
    libgps.utils_headers \
    libloc_core_headers \
    libloc_pla_headers \
    liblocation_api_headers

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libhidlbase \
    libutils \
    android.hardware.gnss@1.0 \

LOCAL_SHARED_LIBRARIES += \
    libloc_core \
    libgps.utils \
    libdl \
    libloc_pla \
    liblocation_api \

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.gnss@1.0-service-qti
LOCAL_LICENSE_KINDS := SPDX-license-identifier-Apache-2.0 SPDX-license-identifier-BSD legacy_not_a_contribution
LOCAL_LICENSE_CONDITIONS := by_exception_only not_allowed notice
LOCAL_MODULE_OWNER := qti
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_INIT_RC := android.hardware.gnss@1.0-service-qti.rc
LOCAL_VENDOR_MODULE := true
LOCAL_CFLAGS := $(qcom_qti_common_cflags)
LOCAL_SRC_FILES := \
    service.cpp \

LOCAL_C_INCLUDES:= \
    $(LOCAL_PATH)/location_api

LOCAL_HEADER_LIBRARIES := \
    libgps.utils_headers \
    libloc_core_headers \
    libloc_pla_headers \
    liblocation_api_headers

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libcutils \
    libdl \
    libbase \
    libutils \

LOCAL_SHARED_LIBRARIES += \
    libhidlbase \
    android.hardware.gnss@1.0 \

include $(BUILD_EXECUTABLE)
