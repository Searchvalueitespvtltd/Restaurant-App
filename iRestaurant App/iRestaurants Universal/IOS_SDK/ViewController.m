//
//  ViewController.m
//  IOS_SDK
//
//  Created by satsuki on 12/07/13.
//  Copyright 2012 - 2013 STAR MICRONICS CO., LTD. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewControllerEx.h"
#import "IOS_SDKViewControllerPortable.h"
#import "IOS_SDKViewControllerDKAirCash.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSString *versionNumber = [NSString stringWithFormat:@"Version Number: %@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    labelVersionNumber.text = versionNumber;

    [AppDelegate setButtonArrayAsOldStyle:@[button1, button2, button3]];
}

- (void)viewDidUnload
{
    [button1 release];
    button1 = nil;
    [button2 release];
    button2 = nil;
    [button3 release];
    button3 = nil;
    [labelVersionNumber release];
    labelVersionNumber = nil;
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

- (void)dealloc {
    [button1 release];
    [button2 release];
    [button3 release];
    [labelVersionNumber release];
    [super dealloc];
}

- (IBAction)pushButton1:(id)sender {
    ViewControllerEx *viewController = [[[ViewControllerEx alloc] initWithNibName:@"ViewControllerEx" bundle:nil] autorelease];
    [self presentModalViewController:viewController animated:YES];
}

- (IBAction)pushButton2:(id)sender {
    IOS_SDKViewControllerPortable *viewController = [[[IOS_SDKViewControllerPortable alloc] initWithNibName:@"IOS_SDKViewControllerPortable" bundle:nil] autorelease];
    [self presentModalViewController:viewController animated:YES];
}

- (IBAction)pushButton3:(id)sender {
    IOS_SDKViewControllerDKAirCash *viewController = [[[IOS_SDKViewControllerDKAirCash alloc] initWithNibName:@"IOS_SDKViewControllerDKAirCash" bundle:nil] autorelease];
    [self presentModalViewController:viewController animated:YES];
}
- (IBAction)pushButtonBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
