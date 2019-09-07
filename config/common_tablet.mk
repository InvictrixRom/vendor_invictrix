# Common settings and files
-include vendor/invictrix/config/common.mk

# Add tablet overlays
DEVICE_PACKAGE_OVERLAYS += vendor/invictrix/overlay/common_tablet

PRODUCT_CHARACTERISTICS := tablet
