//
//  BaseApplicationDelegate.m
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "BaseApplicationDelegate.h"
#import "BaseEntranceManager.h"

@interface BaseApplicationDelegate ()

@property (nonatomic, strong) BaseEntranceManager *entranceManager;

@end

@implementation BaseApplicationDelegate

- (BOOL)application:(BaseApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
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
  [self.entranceManager onAppWillEnterForeground];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  [self.entranceManager onAppDidBecomeActive];
}

- (void)applicationWillResignActive:(UIApplication *)application {
  [self.entranceManager onAppWillResignActive];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  [self.entranceManager onAppDidEnterBackground];
}

- (void)applicationWillTerminate:(UIApplication *)application {
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
