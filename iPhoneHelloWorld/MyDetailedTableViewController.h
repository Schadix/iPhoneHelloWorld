//
//  MyDetailedTableViewController.h
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDXPerson.h"
#import <RestKit/RestKit.h>
#import "AddWeightController.h"

@interface MyDetailedTableViewController : UITableViewController <RKObjectLoaderDelegate>{
    SDXPerson *selectedPerson;
    
}

@property (nonatomic, retain) SDXPerson *selectedPerson;

- (IBAction)addWeight:(id)sender;


@end
