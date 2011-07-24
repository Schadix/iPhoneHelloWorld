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


@implementation Person

@synthesize name;
@synthesize userid;
@dynamic weights;

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)dealloc {
    [weights dealloc];
    [super dealloc];
}

- (void) setWeights:(NSMutableArray *)pweight{
    self.weights = pweight;
}

#warning fix retain count on setter and selfweight
-(NSMutableArray* ) weights
{
    if (weights == nil){
        NSString *urlString = [NSString stringWithFormat:@"http://schadix.heroku.com/people/%d.json", userid];
        NSURL *url = [[NSURL alloc] initWithString:urlString];
        NSString *result = [[NSString alloc] initWithContentsOfURL:url];
        
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        
        NSDictionary *dict = (NSDictionary*)[parser objectWithString:result];
        NSDictionary *dweights = [[dict objectForKey:@"person"] objectForKey:@"weights"];
        NSMutableArray *selfweight = [[NSMutableArray alloc] init ];
        
        
        for (NSDictionary *w in dweights){
            NSString *sweight = [w objectForKey:@"weight"];
            Weight *pweight = [[Weight alloc] init];
            pweight.weight = [sweight doubleValue];
            [selfweight addObject:pweight];
            [pweight release];
        }
        weights = selfweight;
        
//        [selfweight release];
//        [dweights release];
        [parser release];
        [result release];
        [url release];
        [urlString release];
    }
    return weights;
}

@end
