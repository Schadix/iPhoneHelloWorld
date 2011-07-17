//
//  Person.h
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
    NSString *name;
    NSMutableArray *weight; //type Weight
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSMutableArray *weight;

@end
