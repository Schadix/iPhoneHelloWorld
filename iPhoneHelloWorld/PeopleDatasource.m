//
//  PeopleDatasource.m
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PeopleDatasource.h"
#import "People.h"
#import "Person.h"

@implementation PeopleDatasource


- (NSInteger)tableView:(UITableView *)tableView  numberOfRowsInSection:(NSInteger)section {
    People *a = [People getInstance] ;
    NSInteger peoplecount = [[a getAll]count];
    return peoplecount;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
    }
    NSMutableArray *a = [[People getInstance] getAll];
    Person *p = [a objectAtIndex:indexPath.row];
    cell.textLabel.text = p.name; 
    return cell;
}


@end
