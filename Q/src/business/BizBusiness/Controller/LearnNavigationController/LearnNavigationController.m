//
//  LearnNavigationController.m
//  Q
//
//  Created by XQ on 2022/1/21.
//

#import "LearnNavigationController.h"
#import "LearnViewController.h"

@interface LearnNavigationController ()

@end

@implementation LearnNavigationController

+ (instancetype)share {
  static LearnNavigationController * instance;
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
      [LearnViewController new]
    ]];
  }
  self.tabBarItem.title = @"学";
  return self;
}

@end
