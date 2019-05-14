#line 1 "Tweak.xm"
#import "labelchanger.h"



BOOL hideLabels = false;
BOOL changeColors = false;
BOOL changeLabels = false;
BOOL changeLabelBorder = false;
BOOL changeLabelSize = true;


NSString *stringTextSize = @"14";

NSMutableArray *fonts = [[NSMutableArray alloc] initWithObjects:@"Helvetica", @"Chalkduster", @"Arial", @"Arial-BoldMT", nil];

NSString *customLabel = @"label";
UIColor *customColor = nil;
UIColor *borderColor = nil;




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
static void (*_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$)(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setText$)(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, NSString *); static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setText$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, NSString *); static void (*_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFont$)(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, UIFont *); static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setFont$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, UIFont *); static void (*_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFocusHighlightColor$)(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setFocusHighlightColor$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, UIColor *); 

#line 22 "Tweak.xm"




static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * arg1) {

	

	

	
	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.daveapps.labelchanger"];
	id colorPref = [bundleDefaults valueForKey:@"colorPref"];

	
		if ([colorPref isEqual:@0]) {
			changeColors = false;
		} else {
			changeColors = true;
		}
	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.daveapps.labelchanger-colors.plist"];



    if (changeColors  == true){
		arg1 = (LCPParseColorString([settings objectForKey:@"kTintColor"], @"#ff0000"));;
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
			hideLabels = false;
		} else {
			hideLabels = true;
		}
	
	


	if (hideLabels == true) {
		arg1 = nil;
		_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setText$(self, _cmd, arg1);
	} else if (hideLabels == false && changeLabels == false) {
		_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setText$(self, _cmd, arg1);
	}
}


static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setFont$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIFont * arg1) {

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.daveapps.labelchanger"];

	id sizePref = [bundleDefaults valueForKey:@"sizePref"];

		if ([sizePref isEqual:@0]) {
			changeLabelSize = false;
		} else {
			changeLabelSize = true;
		}

	id fontsSetting = [bundleDefaults valueForKey:@"fontsSetting"];
	id sizeStepper = [bundleDefaults valueForKey:@"sizeStepper"];
	int id = [sizeStepper intValue];

	if (changeLabelSize == true) {
		arg1 = [UIFont fontWithName:fontsSetting size:id];
	    _logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFont$(self, _cmd, arg1);
	} else if (changeLabelSize == false) {
		arg1 = [UIFont fontWithName:fontsSetting size:14];
		_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFont$(self, _cmd, arg1);
	}

}

static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setFocusHighlightColor$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * arg1) {

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.daveapps.labelchanger"];
	id borderPref = [bundleDefaults valueForKey:@"borderPref"];

		if ([borderPref isEqual:@0]) {
			changeLabelBorder = false;
		} else {
			changeLabelBorder = true;
		}

	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.daveapps.labelchanger-colors.plist"];
	

	if (changeLabelBorder == true) {
		arg1 = (LCPParseColorString([settings objectForKey:@"kBorderColor"], @"#ff0000"));;
		_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFocusHighlightColor$(self, _cmd, arg1);
	} else {
		_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFocusHighlightColor$(self, _cmd, arg1);
	}

}



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBMutableIconLabelImageParameters = objc_getClass("SBMutableIconLabelImageParameters"); MSHookMessageEx(_logos_class$_ungrouped$SBMutableIconLabelImageParameters, @selector(setTextColor:), (IMP)&_logos_method$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$, (IMP*)&_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$);MSHookMessageEx(_logos_class$_ungrouped$SBMutableIconLabelImageParameters, @selector(setText:), (IMP)&_logos_method$_ungrouped$SBMutableIconLabelImageParameters$setText$, (IMP*)&_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setText$);MSHookMessageEx(_logos_class$_ungrouped$SBMutableIconLabelImageParameters, @selector(setFont:), (IMP)&_logos_method$_ungrouped$SBMutableIconLabelImageParameters$setFont$, (IMP*)&_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFont$);MSHookMessageEx(_logos_class$_ungrouped$SBMutableIconLabelImageParameters, @selector(setFocusHighlightColor:), (IMP)&_logos_method$_ungrouped$SBMutableIconLabelImageParameters$setFocusHighlightColor$, (IMP*)&_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFocusHighlightColor$);} }
#line 134 "Tweak.xm"
