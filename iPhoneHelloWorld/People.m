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
#include "stdlib.h"

@implementation People

@synthesize people;

// Singleton
static People *instance=nil;

+ (People *)getInstance
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

- (NSMutableArray *) getAll{
    return people;
}

#warning "this is a lazy impl, fixme by using hashmap on personlist"
- (Person *) getPersonByName: (NSString *) name{
    for (Person *p in people){
        if ([p.name isEqualToString:name]) return p;
    }
    return nil;
}

- (Person *) getPersonById: (NSInteger) id{
    return [people objectAtIndex:id];
}

- init{
    people = [[NSMutableArray alloc] init];
    
    Person *karin = [[Person alloc] init];
    Person *martin = [[Person alloc] init];
    
    martin.name = @"martin";
    karin.name = @"karin";

    for (int i=0; i<10; i++) {
        Weight *w = [[Weight alloc] init];
        [w setWeight:((arc4random() % 15) + 138)];
        [w setWeightDate:[[NSDate alloc] init]];
        [karin.weight addObject:w];
        [w release];
    }
    
    for (int i=0; i<100; i++) {
        Weight *w1 = [[Weight alloc] init];
        [w1 setWeight:((arc4random() % 15) + 148)];
        [w1 setWeightDate:[[NSDate alloc] init]];
        [martin.weight addObject:w1];
        [w1 release];
    }
    
    
    [people addObject:martin];
    [people addObject:karin];
    
    [martin release];
    [karin release];
    return self;
}

- (void)dealloc{
    [people release];
    [super dealloc];
}

@end

