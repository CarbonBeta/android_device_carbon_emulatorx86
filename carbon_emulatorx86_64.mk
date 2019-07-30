LOCAL_PATH := device/carbon/emulatorx86_64

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/mini_emulator_x86_64.mk)

# Inherit Carbon's custom configurations
$(call inherit-product, vendor/carbon/config/common.mk)
$(call inherit-product, vendor/carbon/config/gsm.mk)

PRODUCT_NAME := carbon_emulatorx86_64
PRODUCT_DEVICE := emulatorx86_64
PRODUCT_BRAND := CarbonROM
PRODUCT_MODEL := CarbonROM on x86_64 Emulator

