//
//  TabBarController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "TabBarController.h"

#import "TabBarControllerDataProvider.h"
#import "BaseViewController.h"

@interface TabBarController ()

@property (nonatomic, strong) TabBarControllerDataProvider *dataProvider;

@end

@implementation TabBarController

+ (instancetype)share {
  static TabBarController * instance;
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
    [self initViewController];
  }
  return self;
}

- (void)initViewController {
  self.dataProvider = [TabBarControllerDataProvider new];
  NSArray<BaseNavigationController *> *childViewControllers = [self.dataProvider childViewControllers];
  for (BaseViewController* childViewController in childViewControllers) {
    [self addChildViewController:childViewController];
  }
  
  self.tabBar.backgroundColor = [UIColor grayColor];
}


@end
