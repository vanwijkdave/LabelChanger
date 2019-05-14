#import "labelchanger.h"



BOOL hideIcons = false;
BOOL boldLabels = false;
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
			hideIcons = false;
		} else {
			hideIcons = true;
		}
	
	//laad de labels in een nsstring


	if (hideIcons == true) {
		arg1 = nil;
		%orig;
	} else if (hideIcons == false && changeLabels == false) {
		%orig;
	}
}


-(void)setFont:(UIFont *)arg1 {

	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.daveapps.labelchanger.plist"];
	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.daveapps.labelchanger"];
	id boldLabelsPref = [bundleDefaults valueForKey:@"boldLabelsPref"];

		if ([boldLabelsPref isEqual:@0]) {
			boldLabels = false;
		} else {
			boldLabels = true;
		}

	id sizePref = [bundleDefaults valueForKey:@"sizePref"];

		if ([sizePref isEqual:@0]) {
			changeLabelSize = false;
		} else {
			changeLabelSize = true;
		}

	stringTextSize = [[settings objectForKey:@"sizePref2"] stringValue] ?[[settings objectForKey:@"sizePref2"] stringValue] : @"1";
	int i = [stringTextSize intValue];


	if (boldLabels == true && changeLabelSize == true) {
		arg1 = [UIFont fontWithName:fonts[3] size:i];
	    %orig;
	} else if (boldLabels == true && changeLabelSize == false) {
		arg1 = [UIFont fontWithName:fonts[3] size:13];
		%orig;
	} else if (boldLabels == false && changeLabelSize == true) {
		arg1 = [UIFont fontWithName:fonts[1] size:i];
		%orig;
	}  else if (boldLabels == false && changeLabelSize == false) {
		arg1 = [UIFont fontWithName:fonts[1] size:13];
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
