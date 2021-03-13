TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = SpringBoard

ARCHS = arm64 arm64e

THEOS_DEVICE_IP=localhost
THEOS_DEVICE_PORT=2222

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SimpleHome

SimpleHome_FILES = Tweak.x
SimpleHome_CFLAGS = -fobjc-arc

FINALPACKAGE=1

include $(THEOS_MAKE_PATH)/tweak.mk
