//
//  UIViewController+Configuration.m
//  Q
//
//  Created by XQ on 2022/1/22.
//

#import "UIViewController+Configuration.h"

#import <objc/runtime.h>

static NSString *viewControllerNameKey = @"viewControllerNameKey";
static NSString *paramsKey = @"paramsKey";
static NSString *tabBarTitleKey = @"tabBarTitleKey";
static NSString *tabBarIconKey = @"tabBarIconKey";
static NSString *navigationTitleKey = @"navigationTitleKey";

static NSString *hideTabBarKey = @"hideTabBar";
static NSString *hideNavigationBarKey = @"hideNavigationBar";

@implementation UIViewController (Configuration)

- (void)setViewControllerName:(NSString *)viewControllerName {
  objc_setAssociatedObject(self, &viewControllerNameKey, viewControllerName, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)viewControllerName {
  return objc_getAssociatedObject(self, &viewControllerNameKey);
}

- (void)setParams:(NSDictionary *)params {
  objc_setAssociatedObject(self, &paramsKey, params, OBJC_ASSOCIATION_RETAIN);
}

- (NSDictionary *)params {
  return objc_getAssociatedObject(self, &paramsKey);
}

- (void)setTabBarTitle:(NSString *)tabBarTitle {
  objc_setAssociatedObject(self, &tabBarIconKey, tabBarTitle, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)tabBarTitle {
  return objc_getAssociatedObject(self, &tabBarIconKey);
}

- (void)setTabBarIcon:(NSString *)tabBarIcon {
  objc_setAssociatedObject(self, &tabBarIconKey, tabBarIcon, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)tabBarIcon {
  return objc_getAssociatedObject(self, &tabBarIconKey);
}

- (void)setNavigationTitle:(NSString *)navigationTitle {
  objc_setAssociatedObject(self, &navigationTitleKey, navigationTitle, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)navigationTitle {
  return objc_getAssociatedObject(self, &navigationTitleKey);
}

- (void)setHideTabBar:(BOOL)hideTabBar {
  objc_setAssociatedObject(self, &hideTabBarKey, @(hideTabBar), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)hideTabBar {
  return objc_getAssociatedObject(self, &hideTabBarKey);
}

- (void)setHideNavigationBar:(BOOL)hideNavigationBar {
  objc_setAssociatedObject(self, &hideNavigationBarKey, @(hideNavigationBar), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)hideNavigationBar {
  return objc_getAssociatedObject(self, &hideNavigationBarKey);
}

@end
