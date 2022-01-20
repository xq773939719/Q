//
//  CommonAppDelegate.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "CommonAppDelegate.h"
#import "CommonEntranceManager.h"
#import "BaseWindow.h"

@interface CommonAppDelegate ()

@property (nonatomic, strong) CommonEntranceManager *commonEntranceManager;

@end

@implementation CommonAppDelegate

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.commonEntranceManager = [CommonEntranceManager new];
  }
  return self;
}

- (BOOL)application:(BaseApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  [self.commonEntranceManager launchWithApplication:application];
  [self.commonEntranceManager onAppLaunch];
  
  return YES;
}

#pragma mark - UIApplicationDelegate

- (void)applicationWillEnterForeground:(UIApplication *)application {
  [self.commonEntranceManager onAppWillEnterForeground];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  [self.commonEntranceManager onAppDidBecomeActive];
}

- (void)applicationWillResignActive:(UIApplication *)application {
  [self.commonEntranceManager onAppWillResignActive];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  [self.commonEntranceManager onAppDidEnterBackground];
}

- (void)applicationWillTerminate:(UIApplication *)application {
  [self.commonEntranceManager onAppWillTerminate];
}

@end
