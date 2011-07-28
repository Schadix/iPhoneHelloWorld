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
@public NSDate *lastUpdatedWeights;
@public    NSMutableArray *weights; //type Weight
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSMutableArray *weights;
@property (nonatomic) int userid;
@property (nonatomic, retain) NSDate *lastUpdatedWeights;

@end
