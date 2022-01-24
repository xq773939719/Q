  //
  //  BaseTabBarController.m
  //  Q
  //
  //  Created by XQ on 2022/1/24.
  //

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.hideNavigationBar = YES;
    self.hideTabBar = NO;
  }
  return self;
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  LoggerInfo(@"[BaseTabBarController] -> viewDidLoad(params): %@", self.params);
  self.navigationController.navigationBar.hidden = self.hideNavigationBar;
  self.tabBarController.tabBar.hidden = self.hideTabBar;
}


@end
