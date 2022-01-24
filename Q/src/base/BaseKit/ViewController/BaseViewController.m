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
  self.hideNavigationBar = NO;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  LoggerInfo(@"[ViewController] -> viewDidLoad(params): %@", self.params);
  self.view.backgroundColor = [UIColor colorNamed:@"BackgroundColor"];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  self.navigationController.navigationBar.hidden = self.hideNavigationBar;
  self.tabBarController.tabBar.hidden = self.hideTabBar;
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
