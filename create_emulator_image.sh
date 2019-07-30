#!/bin/sh

if [ -z $ANDROID_BUILD_TOP ]; then
    echo $ANDROID_BUILD_TOP undefined
    exit 1
fi

if [ -z $ANDROID_PRODUCT_OUT ]; then
    echo $ANDROID_PRODUCT_OUT undefined
    exit 1
fi

if [ ! -f $ANDROID_PRODUCT_OUT/system.img ]; then
    echo "Please build before running this"
    exit 1
fi

# unzip vendor image
unzip device/carbon/emulatorx86_64/vendor.zip -d device/carbon/emulatorx86_64/

# creates image zip in /tmp/
cd $ANDROID_BUILD_TOP
cp -r device/carbon/emulatorx86_64/skins $ANDROID_PRODUCT_OUT
cp -r device/carbon/emulatorx86_64/start_emulator_image.sh $ANDROID_PRODUCT_OUT
cp -r device/carbon/emulatorx86_64/advancedFeatures.ini $ANDROID_PRODUCT_OUT
cp -r device/carbon/emulatorx86_64/vendor.img $ANDROID_PRODUCT_OUT

cd $ANDROID_PRODUCT_OUT/..
rm /tmp/carbon_emulator.zip
zip -r /tmp/carbon_emulator.zip emulatorx86_64/skins emulatorx86_64/system-qemu.img emulatorx86_64/system/build.prop emulatorx86_64/cache.img emulatorx86_64/userdata.img emulatorx86_64/start_emulator_image.sh emulatorx86_64/advancedFeatures.ini emulatorx86_64/encryptionkey.img emulatorx86_64/kernel-ranchu-64 emulatorx86_64/ramdisk.img emulatorx86_64/vendor.img
