#line 1 "Tweak.xm"

BOOL hideIcons = false;
BOOL changeLabels = true;





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

#line 8 "Tweak.xm"




static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * arg1) {
	arg1 = [UIColor colorWithRed:0.00 green:1.00 blue:0.64 alpha:1.0];
	_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$(self, _cmd, arg1);
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


	if (hideIcons == true) {
	arg1 = nil;
	_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setText$(self, _cmd, arg1);
	} else if (hideIcons == false) {
			_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setText$(self, _cmd, arg1);
	}
}


static void _logos_method$_ungrouped$SBMutableIconLabelImageParameters$setFont$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIFont * arg1) {
	
	arg1 = [UIFont fontWithName:@"Arial-BoldMT" size:16];

	_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFont$(self, _cmd, arg1);
}










static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBMutableIconLabelImageParameters = objc_getClass("SBMutableIconLabelImageParameters"); MSHookMessageEx(_logos_class$_ungrouped$SBMutableIconLabelImageParameters, @selector(setTextColor:), (IMP)&_logos_method$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$, (IMP*)&_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setTextColor$);MSHookMessageEx(_logos_class$_ungrouped$SBMutableIconLabelImageParameters, @selector(setText:), (IMP)&_logos_method$_ungrouped$SBMutableIconLabelImageParameters$setText$, (IMP*)&_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setText$);MSHookMessageEx(_logos_class$_ungrouped$SBMutableIconLabelImageParameters, @selector(setFont:), (IMP)&_logos_method$_ungrouped$SBMutableIconLabelImageParameters$setFont$, (IMP*)&_logos_orig$_ungrouped$SBMutableIconLabelImageParameters$setFont$);} }
#line 54 "Tweak.xm"
