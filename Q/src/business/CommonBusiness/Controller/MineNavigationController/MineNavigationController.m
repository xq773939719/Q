//
//  MineNavigationController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "MineNavigationController.h"

#import "MineViewController.h"

@interface MineNavigationController ()

@end

@implementation MineNavigationController

+ (instancetype)share {
  static MineNavigationController * instance;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    if (!instance) {
      instance = [[[self class] alloc] init];
    }
  });
  return instance;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    [self setViewControllers: @[
      [MineViewController new]
    ]];
  }
  self.tabBarItem.title = @"四";
  return self;
}

@end
