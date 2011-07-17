//
//  People.h
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface People : NSObject {
    NSMutableArray *people;
}

@property (nonatomic, retain) NSMutableArray *people;

+ (People *) getInstance;
- (NSMutableArray *) getAll;

@end
