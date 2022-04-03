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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.delegate showRootViewController];
    });
}



@end
