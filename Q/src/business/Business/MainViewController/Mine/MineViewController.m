//
//  MineViewController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

+ (void)load {
  [[Router share] registerScheme:@"q://vc/mine" withClass:[self class]];
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.viewControllerName = @"我的";

    self.hideStatusBar = YES;
  }
  return self;
}

@end