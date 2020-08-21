package lito

import (
    "android/soong/android"
)

func init() {
    android.RegisterModuleType("oneplus_lito_fod_hal_binary", fodHalBinaryFactory)
}
