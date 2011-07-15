//
//  NamesList.m
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NamesList.h"


@implementation NamesList

@synthesize list;


- (unsigned) countOfList{
    return [list count];
};


- (id) objectInListAtIndex:(unsigned)theIndex{
    return [list objectAtIndex:theIndex];
};


- (void) addData:(NSString*)data{
    [list addObject:data];
};



- (void)removeDataAtIndex:(unsigned)theIndex{
    [list removeObjectAtIndex:theIndex];
};

-(void) setList:(NSMutableArray *)newList{
    if (list != newList){
        [list release];
        list = [newList mutableCopy];
    }
}

- (id)init 
    {
        if (self == [super init]) 
        {
            //Instantiate list
            NSMutableArray *localList = [[NSMutableArray alloc] init];
            self.list = localList;
            [localList release];

          //Add initial Data
          [self addData:@"Item 1"];
         [self addData:@"Item 2"];
      }
      return self;
  }

- (void)dealloc 
    {
        [list release];
        [super dealloc];
    }

@end
