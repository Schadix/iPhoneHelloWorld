//
//  iPhoneHelloWorldAppDelegate.h
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyViewController;
@class MyTableViewController;

@interface iPhoneHelloWorldAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic, retain) MyViewController *myViewController;

@property (nonatomic, retain) MyTableViewController *myTableViewController;

@end
