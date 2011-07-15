//
//  NamesList.h
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NamesList : NSObject
    {
        NSMutableArray *list;
    }
    
    - (unsigned) countOfList;
    - (id) objectInListAtIndex:(unsigned)theIndex;
    - (void) addData:(NSString*)data;
    - (void)removeDataAtIndex:(unsigned)theIndex;
    @property (nonatomic, copy, readwrite) NSMutableArray *list;

@end
