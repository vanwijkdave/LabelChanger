#include "labelchangerRootListController.h"
#define UIColorFromRGB(rgbValue) \
	[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
	 green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
	 blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
	 alpha:1.0]


@implementation labelchangerRootListController

- (instancetype)init {
	self = [super init];

	if (self) {
		HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
		appearanceSettings.tintColor = UIColorFromRGB(0x2aa8e5);
		appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithWhite:0 alpha:0];
		self.hb_appearanceSettings = appearanceSettings;
	}

	return self;
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}


@end
