//
//  BaseViewController.m
//  Q
//
//  Created by XQ on 2022/1/24.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (instancetype)init
{
  self = [super init];
  if (self) {
    [self initProperties];
  }
  return self;
}

- (void)initProperties {
  self.viewControllerName = @"ViewControllerName";
  self.params = @{};
  
  self.hideStatusBar = NO;
  self.statusBarStyle = UIStatusBarStyleDefault;
  
  self.hideTabBar = NO;
  self.tabBarTitle = @"TabBarTitle";
  self.tabBarIcon = @"";
  
  self.navigationTitle = @"NavigationTitle";
  self.hideNavigationBar = YES;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  LoggerInfo(@"[BaseViewController] -> viewDidLoad(params): %@", self.params);
  self.view.backgroundColor = [UIColor colorNamed:@"BackgroundColor"];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  BOOL hideNavigationBar = self.hideNavigationBar;
  BOOL hideTabBar = self.hideTabBar;
  self.navigationController.navigationBar.hidden = hideNavigationBar;
  self.tabBarController.tabBar.hidden = hideTabBar;
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
  return self.statusBarStyle;
}

- (BOOL)prefersStatusBarHidden {
  return self.hideStatusBar;
}


//  [view mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.center.mas_equalTo(self.view);
//
//  }];

@end