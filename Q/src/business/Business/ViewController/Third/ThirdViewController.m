//
//  ThirdViewController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

+ (void)initialize {
  [[Router share] registerScheme:@"q://vc/third" withClass:[self class]];
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.viewControllerName = @"引擎";
    self.tabBarTitle = @"引擎";
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
