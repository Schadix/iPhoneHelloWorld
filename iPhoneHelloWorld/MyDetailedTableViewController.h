//
//  MyDetailedTableViewController.h
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface MyDetailedTableViewController : UITableViewController <RKObjectLoaderDelegate>{
    Person *selectedPerson;
    
}

@property (nonatomic, retain) Person *selectedPerson;


@end
