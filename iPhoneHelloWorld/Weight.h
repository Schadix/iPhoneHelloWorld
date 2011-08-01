//
//  Weight.h
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface Weight : NSObject{
    NSDate *weightDate;
@public double weight;
    NSDate* created_at;
    NSDate* updated_at;
    NSString* person_id;
    NSString* weight_id;
}

@property (nonatomic, retain) NSDate *weightDate;
@property (nonatomic) double weight;
@property (nonatomic, retain) NSDate *created_at;
@property (nonatomic, retain) NSDate *updated_at;
@property (nonatomic, retain) NSString *person_id;
@property (nonatomic, retain) NSString *weight_id;

@end
