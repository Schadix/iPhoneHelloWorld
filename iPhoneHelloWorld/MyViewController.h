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
    UITableView *tableView;
}
- (IBAction)changeGreeting:(id)sender;
- (void)getPickUpLinesFromWebService;

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, copy) NSString *userName;

@end
