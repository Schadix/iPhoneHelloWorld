//
//  MyDetailedTableViewController.m
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyDetailedTableViewController.h"
#import "Weight.h"
#import <RestKit/RestKit.h>

@implementation MyDetailedTableViewController

@synthesize selectedPerson;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [RKObjectManager objectManagerWithBaseURL:@"http://localhost:3000"];
    }
    
    return self;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [RKObjectManager objectManagerWithBaseURL:@"http://somenasty.com:300"];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    RKObjectMapping* taskMapping = [RKObjectMapping mappingForClass:[Weight class]];
    [taskMapping mapKeyPath:@"created_at" toAttribute:@"created_at"];
    [taskMapping mapKeyPath:@"date" toAttribute:@"weightDate"];
    [taskMapping mapKeyPath:@"id" toAttribute:@"weight_id"];
    [taskMapping mapKeyPath:@"person_id" toAttribute:@"person_id"];
    [taskMapping mapKeyPath:@"updated_at" toAttribute:@"updated_at"];
    [taskMapping mapKeyPath:@"weight" toAttribute:@"weight"];

        NSString* lresource = [NSString stringWithFormat:@"/people/%d.json", selectedPerson.userid];
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:lresource objectMapping:taskMapping delegate:self];
        NSLog(@"made call to %@", lresource);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView  numberOfRowsInSection:(NSInteger)section {
    return [selectedPerson.weights count];    
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
    
    Weight *w =[selectedPerson.weights objectAtIndex:indexPath.row];
    cell.textLabel.text =  [NSString stringWithFormat:@"%f", w.weight]; 
    return cell;
}



// ------------------------------
- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects{
    NSLog(@"did load objects");
    selectedPerson.weights = objects;
    [self.tableView reloadData];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    NSLog(@"Error: %@", [error localizedDescription]);
}


- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObject:(id)object{
    NSLog(@"did load objects_didLoadObject");    
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjectDictionary:(NSDictionary*)dictionary{
    NSLog(@"did load objects_didLoadObjectDictionary");
    
}

- (void)objectLoaderDidFinishLoading:(RKObjectLoader*)objectLoader{
    NSLog(@"did load objects_objectLoaderDidFinishLoading");
    
}

- (void)objectLoaderDidLoadUnexpectedResponse:(RKObjectLoader*)objectLoader{
    NSLog(@"did load objects_objectLoaderDidLoadUnexpectedResponse");
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
