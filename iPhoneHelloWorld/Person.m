//
//  Person.m
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize weight;
@synthesize name;

- (id)init {
    self = [super init];
    if (self) {
        weight = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    [weight dealloc];
    [super dealloc];
}

@end
