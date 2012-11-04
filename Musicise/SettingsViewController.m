//
//  SettingsViewController.m
//  Musicise
//
//  Created by Guo Anhong on 12-11-3.
//  Copyright (c) 2012年 Guo Anhong. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize smartCutInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) infoButtonPressed:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Smart Cut Mode" message:@"This is how you switch to the next song. Smart Cut means the system can detect your change and switch songs automatically." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
