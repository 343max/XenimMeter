//
//  XMAppDelegate.m
//  XenimMeter
//
//  Created by Max Winde on 18.07.12.
//  Copyright (c) 2012 343max. All rights reserved.
//

#import "XMMeterViewController.h"
#import "XMAppDelegate.h"

@implementation XMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    XMMeterViewController *meterViewController = [[XMMeterViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = meterViewController;
    
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
