/*
*	File:		SFCEcho_ViewFactory.m
*	
*	Version:	1.0
* 
*	Created:	�DATE�
*	
*	Copyright:  Copyright � �YEAR� �ORGANIZATIONNAME�, All Rights Reserved
*
*/

#import "SFCEcho_ViewFactory.h"
#import "SFCEcho_UIView.h"

@implementation SFCEcho_ViewFactory

// version 0
- (unsigned) interfaceVersion {
	return 0;
}

- (NSString *) description {
	return @" Cocoa View";
}

- (NSView *)uiViewForAudioUnit:(AudioUnit)inAU withSize:(NSSize)inPreferredSize {
    bool loaded = [[NSBundle mainBundle] loadNibNamed:@"SFCEcho_UIView" owner:self topLevelObjects:nil];
	if (!loaded) {
        NSLog (@"Unable to load nib for view.");
		return nil;
	}

    [uiFreshlyLoadedView setAU:inAU];
    
    NSView *returnView = uiFreshlyLoadedView;
    uiFreshlyLoadedView = nil;
    
    return [returnView autorelease];
}

@end
