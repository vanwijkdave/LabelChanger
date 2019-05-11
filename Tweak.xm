
BOOL hideIcons = false;
BOOL boldLabels = false;
BOOL changeColors = false;
BOOL changeLabels = false;



//hook de SBMutableIconLabelImageParameters
%hook SBMutableIconLabelImageParameters



-(void)setTextColor:(UIColor *)arg1 {

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.daveapps.labelchanger"];
	id colorPref = [bundleDefaults valueForKey:@"colorPref"];
		if ([colorPref isEqual:@0]) {
			changeColors = false;
		} else {
			changeColors = true;
		}

    if (changeColors  == true){
		arg1 = [UIColor colorWithRed:0.00 green:1.00 blue:0.64 alpha:1.0];
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


	if (hideIcons == true) {
	arg1 = nil;
	%orig;
	} else if (hideIcons == false) {
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
