//
//  BaseApplicationDelegate.m
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "BaseApplicationDelegate.h"
#import "BaseEntranceManager.h"
#import "Logger.h"

@interface BaseApplicationDelegate ()

@property (nonatomic, strong) BaseEntranceManager *entranceManager;

@end

@implementation BaseApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  LoggerVerbose(@"[BaseApplicationDelegate] -> %@", @"启动");
  [self.entranceManager launchWithApplication:application];
  [self.entranceManager onAppLaunch];
  return YES;
}

# pragma mark - BaseApplicationEntranceProtocol
- (BaseEntranceManager *)onDelegateInit {
  // 子类需要实现
  return nil;
}

#pragma mark - UIApplicationDelegate

- (void)applicationWillEnterForeground:(UIApplication *)application {
  LoggerVerbose(@"[BaseApplicationDelegate] -> %@", @"将要进入前台");
  [self.entranceManager onAppWillEnterForeground];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  LoggerVerbose(@"[BaseApplicationDelegate] -> %@", @"已经激活");
  [self.entranceManager onAppDidBecomeActive];
}

- (void)applicationWillResignActive:(UIApplication *)application {
  LoggerVerbose(@"[BaseApplicationDelegate] -> %@", @"将要失活");
  [self.entranceManager onAppWillResignActive];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  LoggerVerbose(@"[BaseApplicationDelegate] -> %@", @"已经进入后台");
  [self.entranceManager onAppDidEnterBackground];
}

- (void)applicationWillTerminate:(UIApplication *)application {
  LoggerVerbose(@"[BaseApplicationDelegate] -> %@", @"已经终止");
  [self.entranceManager onAppWillTerminate];
}

#pragma mark - getter

- (BaseEntranceManager *)entranceManager {
  if (!_entranceManager) {
    _entranceManager = [self onDelegateInit];
  }
  return _entranceManager;
}

@end
