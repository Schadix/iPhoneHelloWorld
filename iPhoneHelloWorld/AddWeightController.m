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
    
    RKObjectMapping* pmsg = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
    
    NSMutableDictionary* params = [[NSMutableDictionary alloc] init ];
    [params setValue:uiWeight.text forKey:@"weight"];
    [params setValue:[NSString stringWithFormat:@"%d",personId] forKey:@"person_id"];
    [params setValue:@"2011-08-19T01:28:14Z" forKey:@"date"];
    NSMutableDictionary* main= [[NSMutableDictionary alloc] init ];
    [main setObject:params forKey:@"weight"];
    
    [[RKClient sharedClient] post:[NSString stringWithFormat:@"/people/%d/weights",personId] params:main delegate:self];
    
    [main retain];
    [params retain];
    
}

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {  
    NSLog(@"Retrieved XML: %@", [response bodyAsString]);
    }
@end
