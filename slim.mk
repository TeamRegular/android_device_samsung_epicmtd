## Specify phone tech before including full_phone
$(call inherit-product, vendor/slim/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := epicmtd

# Inherit some common slim stuff.
$(call inherit-product, vendor/slim/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/epicmtd/full_epicmtd.mk)

# Inherit device settings
$(call inherit-product, vendor/slim/config/common_sgs.mk)
$(call inherit-product, vendor/slim/config/common_ledflash.mk)

PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/hdpi/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_PROPERTY_OVERRIDES += \
    ro.camera.res=5MP

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := epicmtd
PRODUCT_NAME := slim_epicmtd
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SPH-D700
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SPH-D700 TARGET_DEVICE=SPH-D700 BUILD_FINGERPRINT=sprint/SPH-D700/SPH-D700:2.3.5/GINGERBREAD/EI22:user/release-keys PRIVATE_BUILD_DESC="SPH-D700-user 2.3.5 GINGERBREAD EI22 release-keys"
