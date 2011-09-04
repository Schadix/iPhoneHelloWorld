//
//  People.m
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "People.h"
#import "SDXPerson.h"
#import "Weight.h"
#include "stdlib.h"
#include "SBJsonParser.h"

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
- (SDXPerson *) getPersonByName: (NSString *) name{
    for (SDXPerson *p in people){
        if ([p.name isEqualToString:name]) return p;
    }
    return nil;
}

- (SDXPerson *) getPersonById: (NSInteger) id{
    return [people objectAtIndex:id];
}

// RESTful call
- init{
        people = [[NSMutableArray alloc] init];
        NSString *urlString = @"http://localhost:3000/people.json";
        NSURL *url = [[NSURL alloc] initWithString:urlString];
        NSString *result = [[NSString alloc] initWithContentsOfURL:url];
        
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        
        NSDictionary *dict = (NSDictionary*)[parser objectWithString:result];
        
        for (NSDictionary *o in dict) {
            NSString *username =[[o objectForKey:@"person"] objectForKey:@"name"];
            NSString* userid = [[o objectForKey:@"person"] objectForKey:@"id"];
            SDXPerson *p = [[SDXPerson alloc]init];
            p.name = username;
            p.userid = [userid intValue];
            [people addObject:p];
            [p release];
        }
        
        [parser release];
        [result release];
        [url release];
        [urlString release];
    return self;
}

- (void)dealloc{
    [people release];
    [super dealloc];
}

@end

