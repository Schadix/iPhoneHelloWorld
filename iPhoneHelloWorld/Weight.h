//
//  Weight.h
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weight : NSObject{
    NSDate *weightDate;
@public double weight;
    NSDate* created_at;
    NSDate* updated_at;
    NSNumber* person_id;
    NSNumber* weight_id;
}

@property (nonatomic, retain) NSDate *weightDate;
@property (nonatomic) double weight;
@property (nonatomic, retain) NSDate *created_at;
@property (nonatomic, retain) NSDate *updated_at;
@property (nonatomic, retain) NSNumber *person_id;
@property (nonatomic, retain) NSNumber *weight_id;

@end
