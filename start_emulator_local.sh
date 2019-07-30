#!/bin/sh

# assumes the image zip has been extracted in /tmp

emulator  -verbose -skindir $ANDROID_BUILD_TOP/device/carbon/emulatorx86_64/skins/ -skin pixel_xl -writable-system
