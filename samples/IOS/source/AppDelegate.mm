//
//  AppDelegate.mm
//  SoftMeter application analytics IOS demo
//
//  Copyright © 2018 StarMessage software. All rights reserved.
//    https://www.starmessagesoftware.com/softmeter
// 


// This file's extension must be .mm so that it is compiled as Obj-C++


// Include the "SoftMeterIOS.framework" in your IOS project frameworks and
// "SoftMeter-C-Api.h" in your header files
// You can find a copy of "SoftMeter-C-Api.h" inside the framework bundle
#include "../../../bin/libSoftMeter-IOS.framework/Headers/SoftMeter-C-Api.h"

#import "AppDelegate.h"



@interface AppDelegate ()

@end

@implementation AppDelegate

// this line must be rem-ed, so that the variable gaPropertyID (declared a few lines below) is used with your own Google PropertyID
#include "dev-propertyID.h"

// BEFORE RUNNING THE DEMO !!!
//      Replace "1234-1" with your Google Analytics property !

#ifndef PROPERTYID_OVERRIDE
    const char *gaPropertyID = "UA-1234-1";
#endif

// replace these strings with your app's information
const char *appName = "SoftMeter IOS demo";
const char *appVer = "1.2.1";
const char *appLicense = "demo";
const char *appEdition = "IOS app";


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Instead of "true", get the actual consent from the app settings.
    const bool userGaveConsent = true;
    
    // you do not need to enable the log file in your release.
    // But highly recommended during development.
    enableLogfile("demo-IOS", "com.StarMessageSoftware.SoftMeterDemo-IOS");
    
    // if you have a PRO subscription, add here your subscription license.
    // Otherwise, REM this line
    setOptions("subscriptionID=11111\nsubscriptionType=2");
    
    // call the start() function to initialize the SoftMeter library
    start(appName, appVer, appLicense, appEdition, trackingID, userGaveConsent);
    
    // after start() you can send any number and any type of hits to Google Analytics
    sendPageview("IOS launching", "IOS launching");
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    stop();
    
    // show the log file
    // https://littlebitesofcocoa.com/321-opening-files-from-the-files-app
    // https://stackoverflow.com/questions/7942597/supporting-open-in-menu-item-in-my-app-for-ios-mail-and-safari
    
    
}


@end
