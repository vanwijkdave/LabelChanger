include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LabelChanger
LabelChanger_LIBRARIES = colorpicker
LabelChanger_FILES = Tweak.xm
LabelChanger_EXTRA_FRAMEWORKS += Cephei
ARCHS = arm64 arm64e


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += prefs
include $(THEOS_MAKE_PATH)/aggregate.mk

