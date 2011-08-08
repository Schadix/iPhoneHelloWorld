//
//  AddWeightController.m
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddWeightController.h"


@implementation AddWeightController
@synthesize uiWeight;
@synthesize personId;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [uiWeight release];
    [super dealloc];
}

- (IBAction)doneWithKeyboard:(id)sender{
    [sender resignFirstResponder];
}

- (IBAction)backgroundTouch:(id)sender{
    [uiWeight resignFirstResponder];
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setUiWeight:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)addWeight:(id)sender {
    NSLog(@"addWeight: personId: %d", personId);
    
    Weight *weight = [[Weight alloc] init];
    weight.weight = [self.uiWeight.text doubleValue];
    
    //[RKObjectManager sharedManager]  postObject:<#(id<NSObject>)#> delegate:<#(id<RKObjectLoaderDelegate>)#>
    
    [weight release];
    
}
@end
