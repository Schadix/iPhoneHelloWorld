//
//  PersonDataSource.m
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PersonDataSource.h"
#import "People.h"
#import "SDXPerson.h"

@implementation PersonDataSource


- (NSInteger)tableView:(UITableView *)tableView  numberOfRowsInSection:(NSInteger)section {
    People *a = [People getInstance] ;
    NSInteger peoplecount = [[a getAll] count];
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
    SDXPerson *p = [a objectAtIndex:indexPath.row];
    cell.textLabel.text = p.name; 
    return cell;
}


@end
