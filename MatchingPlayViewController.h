//
//  MatchingPlayViewController.h
//  Musicise
//
//  Created by Guo Anhong on 12-10-28.
//  Copyright (c) 2012年 Guo Anhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface MatchingPlayViewController : UIViewController{
    CMMotionManager *motionManager;
    UILabel *accelerometerLabel;
    UILabel *gyroscopeLabel;
    NSTimer *updateTimer;
    
}

@property (nonatomic, retain) CMMotionManager *motionManager;
@property (nonatomic, retain) IBOutlet UILabel *accelerometerLabel;
@property (nonatomic, retain) IBOutlet UILabel * gyroscopeLabel;
@property (retain) NSTimer *updateTimer;
@end
