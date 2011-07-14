//
//  MyViewController.m
//  iPhoneHelloWorld
//
//  Created by Martin Schade on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyViewController.h"
#import "SBJson.h"


@implementation MyViewController
@synthesize textField;
@synthesize label;
@synthesize userName;

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
    [textField release];
    [label release];
    [userName release];
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changeGreeting:(id)sender {
    [self getPickUpLinesFromWebService];
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == textField) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)getPickUpLinesFromWebService{
    NSString *urlString = @"http://schadix.heroku.com/people/1.json";
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSString *result = [[NSString alloc] initWithContentsOfURL:url];
    
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    SBJsonWriter *writer = [[SBJsonWriter alloc] init];
    
    id object = [parser objectWithString:result];
    label.text = [writer stringWithObject:object];
    
    
    [writer release];
    [parser release];
    [urlString release];
    [url release];
    [result release];
}



@end
