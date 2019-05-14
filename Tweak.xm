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


//hook de SBMutableIconLabelImageParameters
%hook SBMutableIconLabelImageParameters



-(void)setTextColor:(UIColor *)arg1 {

	////change labelcolor

	//link the color prefe

	//laad de prefs
	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.daveapps.labelchanger"];
	id colorPref = [bundleDefaults valueForKey:@"colorPref"];

	//change the enabled bool
		if ([colorPref isEqual:@0]) {
			changeColors = false;
		} else {
			changeColors = true;
		}
	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.daveapps.labelchanger-colors.plist"];



    if (changeColors  == true){
		arg1 = (LCPParseColorString([settings objectForKey:@"kTintColor"], @"#ff0000"));;
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
			hideLabels = false;
		} else {
			hideLabels = true;
		}
	
	//laad de labels in een nsstring


	if (hideLabels == true) {
		arg1 = nil;
		%orig;
	} else if (hideLabels == false && changeLabels == false) {
		%orig;
	}
}


-(void)setFont:(UIFont *)arg1 {

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
	    %orig;
	} else if (changeLabelSize == false) {
		arg1 = [UIFont fontWithName:fontsSetting size:14];
		%orig;
	}

}

-(void)setFocusHighlightColor:(UIColor *)arg1 {

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
		%orig;
	} else {
		%orig;
	}

}


%end
