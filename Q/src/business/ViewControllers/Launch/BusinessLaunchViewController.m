//
//  BusinessLaunchViewController.m
//
//  Created by XQ on 2022/1/21.
//

#import "BusinessLaunchViewController.h"

@interface BusinessLaunchViewController ()

@end

@implementation BusinessLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSTimeInterval time = 1;
    [NSTimer scheduledTimerWithTimeInterval:time block:^(NSTimer * _Nonnull timer) {
        [self.delegate showRootViewController];
    } repeats:NO];
}



@end
