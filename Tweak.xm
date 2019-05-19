#import "labelchanger.h"



BOOL hideLabels = false;
BOOL changeColors = false;
BOOL changeLabels = false;
BOOL changeLabelBorder = false;
BOOL changeLabelSize = true;

int sizeLabel = 14;

NSMutableArray *wordsToReplace = [[NSMutableArray alloc] initWithObjects:@"Twitter", @"Facebook", @"Hulu", @"Chimera", nil];
NSMutableArray *wordsToReplaceTo = [[NSMutableArray alloc] initWithObjects:@"Blue Bird", @"Devil", @"Lulu", @"Chimera", nil];






NSMutableArray *fonts = [[NSMutableArray alloc] initWithObjects:@"Helvetica", @"Chalkduster", @"Arial", @"Arial-BoldMT", nil];

NSString *customLabel = @"label";
NSString *customLabel2 = @"✌🏽";
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
		arg1 = (LCPParseColorString([settings objectForKey:@"kTintColor"], @"#000000"));;
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
	// customLabel = arg1;
	customLabel = [arg1 stringByReplacingOccurrencesOfString:wordsToReplace[1] withString:wordsToReplaceTo[1]];

	//laad de labels in een nsstring


	if (hideLabels == true) {
		// arg1 = [NSString stringWithFormat:@"%@ %@", customLabel, customLabel2];
		// arg1 = nil;
		%orig;
	} else if (hideLabels == false){
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
	sizeLabel = [sizeStepper intValue];
	

	if (changeLabelSize == true) {
		arg1 = [UIFont fontWithName:fontsSetting size:14.0];
	    %orig;
	} else if (changeLabelSize == false) {
		arg1 = [UIFont fontWithName:fontsSetting size:14.0];
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
		arg1 = (LCPParseColorString([settings objectForKey:@"kBorderColor"], @"#ffffff"));;
		%orig;
	} else {
		%orig;
	}

}


%end
