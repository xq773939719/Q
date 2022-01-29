//
//  BaseEntranceManager.m
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "BaseEntranceManager.h"
#import "BaseModuleManager.h"
#import "Router.h"

@interface BaseEntranceManager ()

@property (nonatomic, strong) UINavigationController *rootNavigationController;

@end

@implementation BaseEntranceManager

@synthesize window = _window;

- (void)launchWithApplication:(UIApplication *)application{
  self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
  [self initNavigation];
  [self registerModules];
  [self createModules];
}

- (void)initNavigation {
  self.rootNavigationController = [[BaseNavigationController alloc] initWithRootViewController:[self rootViewController]];
  [[Router share] configRootNavigationController:self.rootNavigationController];
}

- (UIViewController *)rootViewController {
  NSAssert(NO, @"子类未实现该方法");
  return nil;
}

- (void)registerModules {
  NSArray *systemModules = @[
    
  ];
  [BaseModuleManager registerModules:systemModules
                               level:BaseModuleLevelSystem];
}

- (void)createModules {
  [BaseModuleManager createModules];
}

- (void)onAppLaunch {
  [[BaseModuleManager share] onAppLaunch];
}

- (void)onAppDidBecomeActive {
  [[BaseModuleManager share] onAppDidBecomeActive];
}

- (void)onAppWillEnterForeground {
  [[BaseModuleManager share] onAppWillEnterForeground];
}

- (void)onAppWillResignActive {
  [[BaseModuleManager share] onAppWillResignActive];
}

- (void)onAppDidEnterBackground {
  [[BaseModuleManager share] onAppDidEnterBackground];
}

- (void)onAppWillTerminate {
  [[BaseModuleManager share] onAppWillTerminate];
}

@end
