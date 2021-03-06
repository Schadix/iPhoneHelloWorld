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
#import "AddWeightController.h"

extern NSString* gRKCatalogBaseURL;

@implementation MyDetailedTableViewController

@synthesize selectedPerson;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    if (self) {
        
        UIButton* infoButton = [UIButton buttonWithType:UIBarButtonSystemItemAdd];
        [infoButton addTarget:self action:@selector(showInfoView:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
        
        [[self navigationItem] setTitle:@"Some Title"];
  }
    
    return self;
}


- (void) showInfoView:(id)sender{
    AddWeightController *addWeightController = [[AddWeightController alloc] initWithNibName:@"AddWeightController" bundle:nil];
    addWeightController.personId = selectedPerson.userid;
    
    [self.navigationController pushViewController:addWeightController animated:YES];
    [addWeightController release];
}

- (void)dealloc
{
    [self.selectedPerson release];
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
    self.selectedPerson =nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
    
    [[RKObjectManager sharedManager] 
     loadObjectsAtResourcePath:[NSString stringWithFormat:@"/people/%d.json", selectedPerson.userid]
     delegate:self];
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
    return [self.selectedPerson.weights count];    
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
    
    Weight *w =[self.selectedPerson.weights objectAtIndex:indexPath.row];
    cell.textLabel.text =  [NSString stringWithFormat:@"%f", w.weight]; 
    return cell;
}



// ------------------------------
- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects{
    NSLog(@"didLoadObjects");
    self.selectedPerson.weights = [objects retain];
    [self.tableView reloadData];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error{
    NSLog(@"Error %@", error.accessibilityHint);
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObject:(id)object{
    NSLog(@"didFailWithError");
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjectDictionary:(NSDictionary*)dictionary{
    NSLog(@"didLoadObjectDictionary");
}

- (void)objectLoaderDidFinishLoading:(RKObjectLoader*)objectLoader{
    NSLog(@"objectLoadDidFinishLoading");
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


- (IBAction)addWeight:(id)sender {
    NSLog(@"addWeight");
}


@end
