//
//  BaseEntranceManager.m
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "BaseEntranceManager.h"

@implementation BaseEntranceManager

- (void)launchWithApplication:(BaseApplication *)application{
  [self registerModules];
  [self createModules];
}

- (void)registerModules {
  NSAssert(NO, @"No implement");
}

- (void)createModules {
  NSAssert(NO, @"No implement");
}

- (void)onAppLaunch {
  
}

- (void)onAppDidBecomeActive {
  
}

- (void)onAppWillEnterForeground {
  
}

- (void)onAppWillResignActive {
  
}

- (void)onAppDidEnterBackground {
  
}

- (void)onAppWillTerminate {
  
}

@end
