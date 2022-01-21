//
//  ViewController.m
//  Q
//
//  Created by XQ on 2022/1/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.view.backgroundColor = [UIColor grayColor];
  
}

// 测试
- (void)addTextField {
  UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
  textField.text = self.viewControllerName ?: @"1111";
  textField.font = [UIFont boldSystemFontOfSize:25];
  [self.view addSubview:textField];

  [textField mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center.mas_equalTo(self.view);

  }];
}

@end
