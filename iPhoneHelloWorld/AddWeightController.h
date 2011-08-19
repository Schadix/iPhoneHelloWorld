//
//  AddWeightController.h
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestKit/RestKit.h"
#import "Weight.h"

@interface AddWeightController : UIViewController <RKRequestDelegate> {
    
    UITextField *uiWeight;
    int personId;
}

@property (nonatomic, retain) IBOutlet UITextField *uiWeight;
@property (nonatomic) int personId;

- (IBAction)addWeight:(id)sender;
- (IBAction)doneWithKeyboard:(id)sender;
- (IBAction)backgroundTouch:(id)sender;


@end
