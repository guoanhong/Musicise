//
//  SettingsViewController.h
//  Musicise
//
//  Created by Guo Anhong on 12-11-3.
//  Copyright (c) 2012年 Guo Anhong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController{
    UIButton *smartCutInfo;
}

@property (nonatomic, retain) IBOutlet UIButton *smartCutInfo;

-(IBAction)infoButtonPressed:(id)sender;

@end
