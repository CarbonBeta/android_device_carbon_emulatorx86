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

# Define emulator image creation
emulatorimage: droid
	cp -r $(LOCAL_PATH)/skins $(TARGET_PRODUCT_OUT)
	cp -r $(LOCAL_PATH)/start_emulator_image.sh $(TARGET_PRODUCT_OUT)
	cp -r $(LOCAL_PATH)/advancedFeatures.ini $(TARGET_PRODUCT_OUT)
	rm /tmp/carbon_emulator.zip
	cd $(TARGET_PRODUCT_OUT)
	zip -r /tmp/carbon_emulator.zip skins system-qemu.img system/build.prop cache.img userdata.img start_emulator_image.sh advancedFetures.ini encryptionkey.img kernel-ranchu-64 ramdisk.img
