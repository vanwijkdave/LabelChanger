#line 1 "Tweak.xm"
#import "labelchanger.h"
BOOL hideIcons = false;
BOOL boldLabels = false;
BOOL changeColors = false;
BOOL changeLabels = false;
NSString *color = nil;
NSString *customLabel = @"label";
UIColor *customColor = nil;






#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBMutableIconLabelImageParameters; 
static void (*_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$)(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setText$)(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, NSString *); static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setText$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, NSString *); static void (*_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFont$)(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, UIFont *); static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setFont$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, UIFont *); 

#line 14 "Tweak.xm"




static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * arg1) {

	

	
	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.daveapps.labelchanger"];
	id colorPref = [bundleDefaults valueForKey:@"colorPref"];
		if ([colorPref isEqual:@0]) {
			changeColors = false;
		} else {
			changeColors = true;
		}

	NSMutableDictionary *colors = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.daveapps.labelchanger-colors.plist"];
	color = [[colors objectForKey:@"kTintColor"] stringValue] ?[[colors objectForKey:@"kTintColor"] stringValue] : @"#FFFFFF";


    if (changeColors  == true){
		arg1 = customColor;
		_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$(self, _cmd, arg1);
	} else {
		_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$(self, _cmd, arg1);
	}

}

static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setText$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * arg1) {

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.daveapps.labelchanger"];
	id hideIconsPref = [bundleDefaults valueForKey:@"hideIconsPref"];
		if ([hideIconsPref isEqual:@0]) {
			hideIcons = false;
		} else {
			hideIcons = true;
		}
	NSMutableDictionary *colors = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.daveapps.labelchanger-colors.plist"];
	color = [[colors objectForKey:@"kTintColor"] stringValue] ?[[colors objectForKey:@"kTintColor"] stringValue] : @"#FFFFFF";

	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.daveapps.labelchanger.plist"];
	customLabel = [[settings objectForKey:@"kCustomText1"] stringValue] ?[[settings objectForKey:@"kCustomText1"] stringValue] : @"label";

	id customLabelPref = [bundleDefaults valueForKey:@"customLabelPref"];
		if ([customLabelPref isEqual:@0]) {
			changeLabels = false;
		} else {
			changeLabels = true;
		}

	if (hideIcons == true) {
		arg1 = nil;
		_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setText$(self, _cmd, arg1);
	} else if (hideIcons == false && changeLabels == false) {
		_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setText$(self, _cmd, arg1);
	} else if (hideIcons == false && changeLabels == true) {
		arg1 = customLabel;
		_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setText$(self, _cmd, arg1);
	}
}


static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setFont$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIFont * arg1) {

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.daveapps.labelchanger"];
	id boldLabelsPref = [bundleDefaults valueForKey:@"boldLabelsPref"];
		if ([boldLabelsPref isEqual:@0]) {
			boldLabels = false;
		} else {
			boldLabels = true;
		}
	if (boldLabels == true) {
		arg1 = [UIFont fontWithName:@"Arial-BoldMT" size:14];
	    _logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFont$(self, _cmd, arg1);
	} else if (boldLabels == false) {
			_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFont$(self, _cmd, arg1);
	}

}










static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBMutableIconLabelImageParameters = objc_getClass("SBMutableIconLabelImageParameters"); MSHookMessageEx(_logos_class$_ungrouped$SBMutableIconLabelImageParameters, @selector(setTextColor:), (IMP)&_logos_method$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$, (IMP*)&_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$);MSHookMessageEx(_logos_class$_ungrouped$SBMutableIconLabelImageParameters, @selector(setText:), (IMP)&_logos_method$_ungrouped$SBMutableIconLabelImageParameters$setText$, (IMP*)&_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setText$);MSHookMessageEx(_logos_class$_ungrouped$SBMutableIconLabelImageParameters, @selector(setFont:), (IMP)&_logos_method$_ungrouped$SBMutableIconLabelImageParameters$setFont$, (IMP*)&_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFont$);} }
#line 108 "Tweak.xm"
