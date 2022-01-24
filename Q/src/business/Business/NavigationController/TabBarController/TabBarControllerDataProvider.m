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
#import "LearnNavigationController.h"

@implementation TabBarControllerDataProvider

- (NSArray<UINavigationController *> *)childViewControllers {
  
  NSMutableArray *array = [NSMutableArray array];
  
  [array addObject: [HomeNavigationController share]];
  [array addObject: [FeatureNavigationController share]];
  [array addObject: [ThirdNavigationController share]];
  [array addObject: [MineNavigationController share]];
  [array addObject: [LearnNavigationController share]];

  return [array copy];
}

@end
