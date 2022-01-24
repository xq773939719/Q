//
//  BaseViewController.m
//  Q
//
//  Created by XQ on 2022/1/24.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UITextField *textField;

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
  self.statusBarStyle = UIStatusBarStyleLightContent;
  self.hideTabBar = NO;
  self.tabBarTitle = @"TabBarTitle";
  self.tabBarIcon = @"";
  self.navigationTitle = @"NavigationTitle";
  self.hideNavigationBar = NO;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  LoggerInfo(@"[ViewController] -> viewDidLoad(params): %@", self.params);
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.view.backgroundColor = [UIColor grayColor];
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
  return NO;
}

  // 测试
- (void)addTextField {
  if (self.textField) {
    return;
  }
  self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
  self.textField.text = self.viewControllerName ?: @"1111";
  self.textField.font = [UIFont boldSystemFontOfSize:25];
  [self.view addSubview:self.textField];
  
  [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center.mas_equalTo(self.view);
    
  }];
}


@end
