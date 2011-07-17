//
//  People.m
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "People.h"
#import "Person.h"
#import "Weight.h"

@implementation People

@synthesize people;

// Singleton
static NSMutableArray *instance=nil;

+ (NSMutableArray *)getAll
{
    @synchronized(self) {
        static dispatch_once_t pred;
        dispatch_once(&pred, ^{ instance = [[self alloc] init]; });
    }
    return instance;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (instance == nil) {
            instance = [super allocWithZone:zone];
            return instance;  // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}



- init{
    Person *karin = [[Person alloc] init];
    Person *martin = [[Person alloc] init];
    Weight *w = [[Weight alloc] init];
    [w setWeight:140.0];
    [w setWeightDate:[[NSDate alloc] init]];
    
    [karin.weight addObject:w];

    Weight *w1 = [[Weight alloc] init];
    [w1 setWeight:155.0];
    [w1 setWeightDate:[[NSDate alloc] init]];
    
    [martin.weight addObject:w1];
    
    [w1 release];
    [w release];
    [martin release];
    [karin release];
    return self;
}

@end

