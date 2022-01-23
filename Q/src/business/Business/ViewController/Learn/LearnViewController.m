//
//  LearnViewController.m
//  Q
//
//  Created by XQ on 2022/1/21.
//

#import "LearnViewController.h"

@interface LearnViewController ()

@end

@implementation LearnViewController

+ (void)initialize {
  [[Router share] registerScheme:@"q://vc/learn" withClass:[self class]];
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.viewControllerName = @"学习";
    self.tabBarTitle = @"学习";
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
