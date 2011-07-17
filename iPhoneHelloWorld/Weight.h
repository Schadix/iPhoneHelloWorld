//
//  Weight.h
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Weight : NSObject {
    NSDate *weightDate;
    double weight;
}

@property (nonatomic, retain) NSDate *weightDate;
@property (nonatomic) double weight;

@end
