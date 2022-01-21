//
//  HomeViewController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.viewControllerName = @"主页";
    self.tabBarTitle = @"主页";
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self addTextField];
}

@end
