//
//  FeatureViewController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "FeatureViewController.h"

@interface FeatureViewController ()

@end

@implementation FeatureViewController

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.viewControllerName = @"特征";
    self.tabBarTitle = @"特征";
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
