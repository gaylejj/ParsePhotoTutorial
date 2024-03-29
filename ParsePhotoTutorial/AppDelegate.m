//
//  AppDelegate.m
//  ParsePhotoTutorial
//
//  Created by Jeff Gayle on 8/30/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [Parse setApplicationId:kParseApplicationID clientKey:kParseClientKey];
    
//    PFObject *player = [PFObject objectWithClassName:@"player"];
//    [player setObject:@"John" forKey:@"name"];
//    [player setObject:[NSNumber numberWithInt:1337] forKey:@"score"];
//    [player saveInBackground];
    
//    PFObject *anotherPlayer = [PFObject objectWithClassName:@"player"];
//    [anotherPlayer setObject:@"Jack" forKey:@"name"];
//    [anotherPlayer setObject:[NSNumber numberWithInt:7331] forKey:@"score"];
//    [anotherPlayer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            NSLog(@"Object uploaded");
//        } else {
//            NSString *errorString = [error.userInfo objectForKey:@"error"];
//            NSLog(@"%@", errorString);
//        }
//    }];
    
//    PFQuery *query = [PFQuery queryWithClassName:@"player"];
//    [query whereKey:@"name" equalTo:@"John"];
//    [query whereKey:@"score" greaterThan:[NSNumber numberWithInt:1000]];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (error) {
//            NSString *errorString = [error.userInfo objectForKey:@"error"];
//            NSLog(@"%@", errorString);
//        } else {
//            NSLog(@"Successfully retrieved %@", objects);
//        }
//    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
