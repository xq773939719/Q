//
//  BaseEntranceManager.m
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "BaseEntranceManager.h"
#import "BaseModuleManager.h"

@implementation BaseEntranceManager

- (void)launchWithApplication:(BaseApplication *)application{
  [self registerModules];
  [self createModules];
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
