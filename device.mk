#
# Copyright (C) 2018 The LineageOS Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-aosp

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Device init scripts
PRODUCT_PACKAGES += \
    fstab.qcom

# OPFeature
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/odm_feature_list:$(TARGET_COPY_OUT_ODM)/etc/odm_feature_list

# tri-state-key
PRODUCT_PACKAGES += \
    KeyHandler \
    tri-state-key_daemon

PRODUCT_SHIPPING_API_LEVEL := 29

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service.oneplus_lito

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/dtb.img:dtb.img \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_adsp_loader.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_adsp_loader.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_apr.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_apr.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_bolero_cdc.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_bolero_cdc.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_hdmi.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_hdmi.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_machine_lito.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_machine_lito.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_mbhc.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_mbhc.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_native.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_native.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_pinctrl_lpi.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_pinctrl_lpi.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_platform.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_platform.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_q6.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_q6.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_q6_notifier.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_q6_notifier.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_q6_pdr.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_q6_pdr.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_rx_macro.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_rx_macro.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_snd_event.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_snd_event.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_stub.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_stub.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_swr_ctrl.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_swr_ctrl.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_swr.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_swr.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_tfa9894.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_tfa9894.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_tx_macro.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_tx_macro.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_usf.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_usf.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_va_macro.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_va_macro.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_wcd937x.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_wcd937x.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_wcd937x_slave.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_wcd937x_slave.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_wcd938x.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_wcd938x.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_wcd938x_slave.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_wcd938x_slave.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_wcd9xxx.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_wcd9xxx.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_wcd_core.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_wcd_core.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_wsa881x.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_wsa881x.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_wsa883x.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_wsa883x.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/audio_wsa_macro.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/audio_wsa_macro.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/lcd.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/lcd.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/llcc_perfmon.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/llcc_perfmon.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/modules.alias:$(TARGET_COPY_OUT_VENDOR)/lib/modules/modules.alias \
    $(LOCAL_PATH)/prebuilt/kernel_modules/modules.dep:$(TARGET_COPY_OUT_VENDOR)/lib/modules/modules.dep \
    $(LOCAL_PATH)/prebuilt/kernel_modules/modules.load:$(TARGET_COPY_OUT_VENDOR)/lib/modules/modules.load \
    $(LOCAL_PATH)/prebuilt/kernel_modules/modules.softdep:$(TARGET_COPY_OUT_VENDOR)/lib/modules/modules.softdep \
    $(LOCAL_PATH)/prebuilt/kernel_modules/mpq-adapter.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/mpq-adapter.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/mpq-dmx-hw-plugin.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/mpq-dmx-hw-plugin.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/qca_cld3_wlan.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/qca_cld3_wlan.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/rdbg.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/rdbg.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/rmnet_perf.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/rmnet_perf.ko \
    $(LOCAL_PATH)/prebuilt/kernel_modules/rmnet_shs.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/rmnet_shs.ko \

# Inherit from oneplus sm7250-common
$(call inherit-product, device/oneplus/sm7250-common/common.mk)

# Inherit from vendor blobs
$(call inherit-product, vendor/oneplus/avicii/avicii-vendor.mk)
