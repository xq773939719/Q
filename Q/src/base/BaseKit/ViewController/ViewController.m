//
//  ViewController.m
//  Q
//
//  Created by XQ on 2022/1/22.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

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
