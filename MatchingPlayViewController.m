//
//  MatchingPlayViewController.m
//  Musicise
//
//  Created by Guo Anhong on 12-10-28.
//  Copyright (c) 2012年 Guo Anhong. All rights reserved.
//

#import "MatchingPlayViewController.h"

@interface MatchingPlayViewController ()

@end

@implementation MatchingPlayViewController

@synthesize motionManager;
@synthesize accelerometerLabel;
@synthesize gyroscopeLabel;
@synthesize updateTimer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view.
//    self.motionManager = [[CMMotionManager alloc] init];
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    if (motionManager.accelerometerAvailable) {
//        motionManager.accelerometerUpdateInterval = 1.0/10.0;
//        [motionManager startAccelerometerUpdatesToQueue:queue withHandler:
//         ^(CMAccelerometerData *accelerometerData, NSError *error){
//             NSString *labelText;
//             if (error) {
//                 [motionManager stopAccelerometerUpdates];
//                 labelText = [NSString stringWithFormat:
//                              @"Accelerometer encountered error: %@", error];
//             } else {
//                 labelText = [NSString stringWithFormat:
//                              @"Accelerometer\n-----------\nx: %+.2f\ny: %+.2f\nz: %+.2f",
//                              accelerometerData.acceleration.x,
//                              accelerometerData.acceleration.y,
//                              accelerometerData.acceleration.z];
//             }
//             [accelerometerLabel performSelectorOnMainThread:@selector(setText:)
//                                                  withObject:labelText
//                                               waitUntilDone:NO];
//         }];
//    } else {
//        accelerometerLabel.text = @"This device has no accelerometer.";
//    }
//    if (motionManager.gyroAvailable) {
//        motionManager.gyroUpdateInterval = 1.0/10.0;
//        [motionManager startGyroUpdatesToQueue:queue withHandler:
//         ^(CMGyroData *gyroData, NSError *error) {
//             NSString *labelText;
//             if (error) {
//                 [motionManager stopGyroUpdates];
//                 labelText = [NSString stringWithFormat:
//                              @"Gyroscope encountered error: %@", error];
//             } else {
//                 labelText = [NSString stringWithFormat:
//                              @"Gyroscope\n--------\nx: %+.2f\ny: %+.2f\nz: %+.2f",
//                              gyroData.rotationRate.x,
//                              gyroData.rotationRate.y,
//                              gyroData.rotationRate.z];
//             }
//             [gyroscopeLabel performSelectorOnMainThread:@selector(setText:)
//                                              withObject:labelText
//                                           waitUntilDone:NO];
//         }];
//    } else {
//        gyroscopeLabel.text = @"This device has no gyroscope";
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.motionManager = [[CMMotionManager alloc] init];
    
    if (motionManager.accelerometerAvailable) {
        motionManager.accelerometerUpdateInterval = 1.0/50.0;
        [motionManager startAccelerometerUpdates];
    } else {
        accelerometerLabel.text = @"This device has no accelerometer.";
    }
    if (motionManager.gyroAvailable) {
        motionManager.gyroUpdateInterval = 1.0/50.0;
        [motionManager startGyroUpdates];
    } else {
        gyroscopeLabel.text = @"This device has no gyroscope.";
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/50.0
                                                        target:self
                                                      selector:@selector(updateDisplay)
                                                      userInfo:nil
                                                       repeats:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.updateTimer = nil;
}

- (void)updateDisplay {
    if (motionManager.accelerometerAvailable) {
        CMAccelerometerData *accelerometerData = motionManager.accelerometerData;
        accelerometerLabel.text  = [NSString stringWithFormat:
                                    @"Accelerometer\n-----------\nx: %+.2f\ny: %+.2f\nz: %+.2f",
                                    accelerometerData.acceleration.x,
                                    accelerometerData.acceleration.y,
                                    accelerometerData.acceleration.z];
//        NSLog(@"Accelerometer\n-----------\nx: %+.2f\ny: %+.2f\nz: %+.2f",
//              accelerometerData.acceleration.x,
//              accelerometerData.acceleration.y,
//              accelerometerData.acceleration.z);
    }
    if (motionManager.gyroAvailable) {
        CMGyroData *gyroData = motionManager.gyroData;
        gyroscopeLabel.text = [NSString stringWithFormat:
                               @"Gyroscope\n--------\nx: %+.2f\ny: %+.2f\nz: %+.2f",
                               gyroData.rotationRate.x,
                               gyroData.rotationRate.y,
                               gyroData.rotationRate.z];
        
        NSLog(@"Gyroscope\n--------\nx: %+.2f\ny: %+.2f\nz: %+.2f",
              gyroData.rotationRate.x,
              gyroData.rotationRate.y,
              gyroData.rotationRate.z);
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
