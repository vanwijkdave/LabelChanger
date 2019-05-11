#include "labelchangerRootListController.h"
#define UIColorFromRGB(rgbValue) \
	[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
	 green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
	 blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
	 alpha:1.0]


@implementation labelchangerRootListController



- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

- (void)donateButton {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://patreon.com/vanwijkdave"]];
} 
- (void)followButton {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/daveapps"]];
} 

@end

