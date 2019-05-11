#import "labelchanger.h"
BOOL hideIcons = false;
BOOL boldLabels = false;
BOOL changeColors = false;
BOOL changeLabels = false;
NSString *color = nil;
NSString *customLabel = @"label";
UIColor *customColor = nil;




//hook de SBMutableIconLabelImageParameters
%hook SBMutableIconLabelImageParameters



-(void)setTextColor:(UIColor *)arg1 {

	////verander de kleur van de labels

	//laad de prefs
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
		%orig;
	} else {
		%orig;
	}

}

-(void)setText:(NSString *)arg1 {

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
		%orig;
	} else if (hideIcons == false && changeLabels == false) {
		%orig;
	} else if (hideIcons == false && changeLabels == true) {
		arg1 = customLabel;
		%orig;
	}
}


-(void)setFont:(UIFont *)arg1 {

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
	    %orig;
	} else if (boldLabels == false) {
			%orig;
	}

}


%end


// static void loadPrefs() {
// 	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.conorthedev.chronoprefs.plist"];

// 	hideIcons = [settings objectForKey:@"khideIcons"] ?[[settings objectForKey:@"khideIcons"] boolValue] : YES;
// }
