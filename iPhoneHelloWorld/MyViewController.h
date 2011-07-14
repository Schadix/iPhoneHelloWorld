//
//  MyViewController.h
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyViewController : UIViewController <UITextFieldDelegate> {
    
    UITextField *textField;
    UILabel *label;
}
- (IBAction)changeGreeting:(id)sender;
- (void)getPickUpLinesFromWebService;


@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, copy) NSString *userName;

@end
