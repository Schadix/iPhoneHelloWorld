//
//  Person.m
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"
#import "SBJsonParser.h"
#import "Weight.h"
#import <RestKit/RestKit.h>


@implementation Person

@synthesize name;
@synthesize userid;
@synthesize lastUpdatedWeights;
@synthesize weights;


- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)dealloc {
    [weights release];
    [super dealloc];
}
@end

