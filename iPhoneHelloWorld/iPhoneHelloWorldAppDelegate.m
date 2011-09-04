//
//  iPhoneHelloWorldAppDelegate.m
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iPhoneHelloWorldAppDelegate.h"
#import "MyViewController.h"
#import "MyTableViewController.h"
#import <RestKit/RestKit.h>
#import "Weight.h"

NSString* gRKCatalogBaseURL = nil;

@implementation iPhoneHelloWorldAppDelegate

@synthesize window=_window;
@synthesize navigationController=_navigationController;
@synthesize myViewController=_myViewController;
@synthesize myTableViewController=_myTableViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    gRKCatalogBaseURL = [@"http://localhost:3000" retain];
    
    MyViewController *aViewController = [[MyViewController alloc] initWithNibName:@"MyViewController" bundle:[NSBundle mainBundle]];
    [self setMyViewController:aViewController];
    [aViewController release];
    
    MyTableViewController *aTableViewController = [[MyTableViewController alloc] initWithNibName:@"MyTableViewController" bundle:[NSBundle mainBundle]];
    [self setMyTableViewController:aTableViewController];
    
    
    self.navigationController = [[UINavigationController alloc]
                            initWithRootViewController:aTableViewController];
    
    [aTableViewController release];
    
    [self.window addSubview:self.navigationController.view];
    
    [self.window makeKeyAndVisible];
    
    [RKObjectManager objectManagerWithBaseURL:gRKCatalogBaseURL];
    
    RKObjectMapping* taskMapping = [RKObjectMapping mappingForClass:[Weight class]];
    [taskMapping mapKeyPath:@"created_at" toAttribute:@"created_at"];
    [taskMapping mapKeyPath:@"date" toAttribute:@"weightDate"];
    [taskMapping mapKeyPath:@"id" toAttribute:@"weight_id"];
    [taskMapping mapKeyPath:@"person_id" toAttribute:@"person_id"];
    [taskMapping mapKeyPath:@"updated_at" toAttribute:@"updated_at"];
    [taskMapping mapKeyPath:@"weight" toAttribute:@"weight"];
    
    RKObjectMapping* pweightSerializeMapping = [taskMapping inverseMapping];
    
    RKObjectManager* mgr = [RKObjectManager sharedManager]; 
    //    [mgr.mappingProvider setSerializationMapping:pweightSerializeMapping forClass:[Weight class]];
    //    [mgr.router routeClass:[Weight class] toResourcePath:[NSString stringWithFormat:@"/people/(person_id)/weights"]];
    [[mgr mappingProvider ] setMapping:taskMapping forKeyPath:@"person.weights"];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_myViewController release];
    [_window release];
    [super dealloc];
}

@end
