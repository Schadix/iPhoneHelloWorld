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
    int userid;
@public    NSArray *weights; //type Weight
@public NSDate *lastUpdatedWeights;    
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSArray *weights;
@property (nonatomic) int userid;
@property (nonatomic, retain) NSDate *lastUpdatedWeights;

@end
