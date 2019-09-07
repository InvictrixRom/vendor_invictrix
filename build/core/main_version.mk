PRODUCT_VERSION_MAJOR = 10
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 0.1

ifdef INVICTRIX_BUILD_EXTRA
    INVICTRIX_POSTFIX := -$(INVICTRIX_BUILD_EXTRA)
endif

ifndef INVICTRIX_BUILD_TYPE
    INVICTRIX_BUILD_TYPE := UNOFFICIAL
endif

# Set all versions
INVICTRIX_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(PRODUCT_VERSION_MAINTENANCE)

PRODUCT_GENERIC_PROPERTIES += \
    ro.invictrix.version=$(INVICTRIX_VERSION) \
    ro.invictrix.maintainer=$(INVICTRIX_MAINTAINER) \
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