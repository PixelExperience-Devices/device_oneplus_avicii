/*
   Copyright (c) 2020, The LineageOS Project

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <android-base/logging.h>
#include <android-base/properties.h>
#include <stdlib.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <stdio.h>
#include <sys/_system_properties.h>
#include <sys/system_properties.h>

#include "property_service.h"
#include "vendor_init.h"

using ::android::init::property_set;

constexpr const char* RO_PROP_SOURCES[] = {
        nullptr, "product.", "product_services.", "odm.", "vendor.", "system.", "bootimage.",
};

constexpr const char* BUILD_DESCRIPTION[] = {
	"Nord_IND-user 10 QKQ1.200412.002 2010231934 release-keys",
        "Nord_EEA-user 10 QKQ1.200412.002 2010231937 release-keys",
        "Nord-user 10 QKQ1.200412.002 2010231954 release-keys",
};

constexpr const char* BUILD_FINGERPRINT[] = {
        "OnePlus/Nord_IND/Nord:10/QKQ1.200412.002/2010231934:user/release-keys",
        "OnePlus/Nord_EEA/Nord:10/QKQ1.200412.002/2010231937:user/release-keys",
        "OnePlus/Nord/Nord:10/QKQ1.200412.002/2010231954:user/release-keys",
};

void property_override(char const prop[], char const value[]) {
  prop_info *pi;

  pi = (prop_info *)__system_property_find(prop);
  if (pi)
    __system_property_update(pi, value, strlen(value));
  else
    __system_property_add(prop, strlen(prop), value, strlen(value));
}

void load_props() {
    const auto ro_prop_override = [](const char* source, const char* prop, const char* value,
                                     bool product) {
        std::string prop_name = "ro.";

        if (product) prop_name += "product.";
        if (source != nullptr) prop_name += source;
        if (!product) prop_name += "build.";
        prop_name += prop;

        property_override(prop_name.c_str(), value);
    };

    int rf_version = stoi(android::base::GetProperty("ro.boot.rf_version", "0"));

    switch (rf_version) {
      case 13:
        for (const auto& source : RO_PROP_SOURCES) {
            ro_prop_override(source, "fingerprint", BUILD_FINGERPRINT[0],
                             false);
        }
        ro_prop_override(nullptr, "description", BUILD_DESCRIPTION[0],
                          false);
        // ro.build.fingerprint property has not been set
            property_set("ro.build.fingerprint", BUILD_FINGERPRINT[0]);
        break;
      case 14:
        for (const auto& source : RO_PROP_SOURCES) {
            ro_prop_override(source, "fingerprint", BUILD_FINGERPRINT[1],
                             false);
        }
        ro_prop_override(nullptr, "description", BUILD_DESCRIPTION[1],
                         false);
        // ro.build.fingerprint property has not been set
            property_set("ro.build.fingerprint", BUILD_FINGERPRINT[1]);
        break;
      default:
        for (const auto& source : RO_PROP_SOURCES) {
            ro_prop_override(source, "fingerprint", BUILD_FINGERPRINT[2],
                             false);
        }
        ro_prop_override(nullptr, "description", BUILD_DESCRIPTION[2],
                         false);
        // ro.build.fingerprint property has not been set
            property_set("ro.build.fingerprint", BUILD_FINGERPRINT[2]);
        break;
    }
}

void vendor_load_properties() {
    load_props();
}
