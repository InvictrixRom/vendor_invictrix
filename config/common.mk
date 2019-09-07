PRODUCT_BRAND ?= Invictrix

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Fixes: terminate called after throwing an instance of 'std::out_of_range' what(): basic_string::erase
# error with prop override
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# general properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    persist.sys.root_access=1 \
    ro.opa.eligible_device=true

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.alarm_alert=Carbon.ogg

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/invictrix/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/invictrix/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/invictrix/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/invictrix/prebuilt/bin/blacklist:system/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/invictrix/prebuilt/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/invictrix/prebuilt/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/invictrix/prebuilt/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# init
PRODUCT_COPY_FILES += \
    vendor/invictrix/prebuilt/etc/init.invictrix.rc:root/init.invictrix.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Weather client
PRODUCT_COPY_FILES += \
    vendor/invictrix/prebuilt/etc/sysconfig/org.pixelexperience.weather.client.xml:system/etc/permissions/org.pixelexperience.weather.client.xml \
    vendor/invictrix/prebuilt/etc/sysconfig/org.pixelexperience.weather.client-default.xml:system/etc/default-permissions/org.pixelexperience.weather.client.xml

# Charging sounds
PRODUCT_COPY_FILES += \
    vendor/invictrix/sounds/BatteryPlugged.ogg:system/media/audio/ui/BatteryPlugged.ogg \
    vendor/invictrix/sounds/BatteryPlugged_48k.ogg:system/media/audio/ui/BatteryPlugged_48k.ogg

# Additional packages
-include vendor/invictrix/config/packages.mk

# SELinux Policy
-include vendor/invictrix/sepolicy/sepolicy.mk

# Themes
# include vendor/invictrix/config/accents.mk
# include vendor/invictrix/config/themes.mk

# Add our overlays
# DEVICE_PACKAGE_OVERLAYS += vendor/invictrix/overlay/common

# Squisher Location
SQUISHER_SCRIPT := vendor/invictrix/tools/squisher

