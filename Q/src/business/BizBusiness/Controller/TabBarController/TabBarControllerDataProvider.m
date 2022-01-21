//
//  TabBarControllerDataProvider.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "TabBarControllerDataProvider.h"

#import "TabBarController.h"
#import "HomeNavigationController.h"
#import "FeatureNavigationController.h"
#import "ThirdNavigationController.h"
#import "MineNavigationController.h"

@implementation TabBarControllerDataProvider

- (NSArray<BaseNavigationController *> *)childViewControllers {
  return @[
    [HomeNavigationController share],
    [FeatureNavigationController share],
    [ThirdNavigationController share],
    [MineNavigationController share]
  ];
}

@end
