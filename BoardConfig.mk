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

# Inherit from oneplus sm7250-common
-include device/oneplus/sm7250-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/avicii

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include

# Fingerprint
SOONG_CONFIG_ONEPLUS_LITO_FOD_POS_X = 436
SOONG_CONFIG_ONEPLUS_LITO_FOD_POS_Y = 2062
SOONG_CONFIG_ONEPLUS_LITO_FOD_SIZE = 208

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# inherit from the proprietary version
-include vendor/oneplus/avicii/BoardConfigVendor.mk
