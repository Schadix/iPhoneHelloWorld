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
@synthesize lastUpdatedWeights;
@dynamic weights;

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

- (void) setWeights:(NSMutableArray *)pweight{
    weights = pweight;
    [weights retain];
}

-(NSMutableArray* ) weights
{
<<<<<<< Updated upstream
    if (weights == nil || ([lastUpdatedWeights compare:[NSDate date]] == NSOrderedAscending)){
        NSLog(@"read weights from service");
        NSString *urlString = [NSString stringWithFormat:@"http://schadix.heroku.com/people/%d.json", userid];
=======
    if (weights == nil || ([ [self.lastUpdatedWeights dateByAddingTimeInterval:10] compare:[NSDate date]]== NSOrderedAscending)){
        NSLog(@"updating weights");
        NSString *urlString = [NSString stringWithFormat:@"http://localhost:3000/people/%d.json", userid];
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        [self setWeights:selfweight];
        lastUpdatedWeights = [[NSDate alloc] initWithTimeIntervalSinceNow:10];
        
        [selfweight release];
=======
        weights = selfweight;
        self.lastUpdatedWeights = [NSDate date];
//        [selfweight release];
//        [dweights release];
>>>>>>> Stashed changes
        [parser release];
        [result release];
        [url release];
    }
    return weights;
}

@end
