//
//  BaseNavigationController.m
//
//  Created by XQ on 2022/1/24.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = self.viewControllers.firstObject.tabBarTitle;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    [self setHideNavigationBar:YES];
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

@end
