
BOOL hideIcons = false;
BOOL changeLabels = true;



//hook de SBMutableIconLabelImageParameters
%hook SBMutableIconLabelImageParameters



-(void)setTextColor:(UIColor *)arg1 {
	arg1 = [UIColor colorWithRed:0.00 green:1.00 blue:0.64 alpha:1.0];
	%orig;
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
	
	arg1 = [UIFont fontWithName:@"Arial-BoldMT" size:16];

	%orig;
}


%end


// static void loadPrefs() {
// 	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.conorthedev.chronoprefs.plist"];

// 	hideIcons = [settings objectForKey:@"khideIcons"] ?[[settings objectForKey:@"khideIcons"] boolValue] : YES;
// }
