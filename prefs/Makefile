include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = LabelChanger
LabelChanger_FILES = labelchangerRootListController.m
LabelChanger_INSTALL_PATH = /Library/PreferenceBundles
LabelChanger_FRAMEWORKS = UIKit
LabelChanger_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LabelChanger.plist$(ECHO_END)
