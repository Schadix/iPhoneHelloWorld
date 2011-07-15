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
    NSString *urlString = @"http://schadix.heroku.com/people.json";
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSString *result = [[NSString alloc] initWithContentsOfURL:url];
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
	
    NSDictionary *dict = (NSDictionary*)[parser objectWithString:result];
    NSMutableArray *a = [[NSMutableArray alloc] init];
    NSString *user = [[NSString alloc] init];
    
    for (NSDictionary *o in dict) {
        user = [[o objectForKey:@"person"] objectForKey:@"name"];
        [a addObject:user];
    }
    
    [a release];
    //[dict release];
    [parser release];
    [result release];
    [url release];
    [urlString release];
}


@end
