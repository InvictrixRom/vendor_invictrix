# Versioning System
PRODUCT_VERSION_MAJOR = 9
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 0.1
INVICTRIX_POSTFIX := -$(shell date +"%Y%m%d-%H%M")
ifdef INVICTRIX_BUILD_EXTRA
    INVICTRIX_POSTFIX := -$(INVICTRIX_BUILD_EXTRA)
endif

ifndef INVICTRIX_BUILD_TYPE
    INVICTRIX_BUILD_TYPE := UNOFFICIAL
endif

ROM_FINGERPRINT := Invictrix/$(PLATFORM_VERSION)/$(INVICTRIX_BUILD)/$(shell date +%Y%m%d.%H:%M)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.invictrix.fingerprint=$(ROM_FINGERPRINT)

# Set all versions
INVICTRIX_VERSION := Invictrix-$(INVICTRIX_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(PRODUCT_VERSION_MAINTENANCE)-$(INVICTRIX_BUILD_TYPE)$(INVICTRIX_POSTFIX)
INVICTRIX_BUILD_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(PRODUCT_VERSION_MAINTENANCE)
INVICTRIX_MOD_VERSION := Invictrix-$(INVICTRIX_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(PRODUCT_VERSION_MAINTENANCE)-$(INVICTRIX_BUILD_TYPE)$(INVICTRIX_POSTFIX)

export INVICTRIX_BUILD_VERSION

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    invictrix.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(PRODUCT_VERSION_MAINTENANCE) \
    ro.invictrix.version=$(INVICTRIX_VERSION) \
    ro.invictrix.maintainer=$(INVICTRIX_MAINTAINER) \
    ro.invictrix.build.version=$(INVICTRIX_BUILD_VERSION) \
    ro.modversion=$(INVICTRIX_MOD_VERSION) \
    ro.invictrix.buildtype=$(INVICTRIX_BUILD_TYPE)

# Sign builds if building an official or weekly build
ifeq ($(filter-out Official Weekly,$(INVICTRIX_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := ../.keys/releasekey
    ifneq ($(filter-out EdgeOf%, $(shell hostname)),)
        $(error You can't build an Official or Weekly build)
    endif

    # Only build on official releases
    PRODUCT_PACKAGES += \
        Updater \
        xdelta3
endif