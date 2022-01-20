//
//  CommonEntrance.m
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "CommonEntranceManager.h"

#import <UIKit/UIKit.h>

#import "BaseApplication.h"
#import "BaseWindow.h"
#import "TabBarController.h"
#import "BaseModuleManager.h"
#import "CommonPlayerModule.h"

@implementation CommonEntranceManager

- (void)launchWithApplication:(BaseApplication *)application {
  [super launchWithApplication:application];
  TabBarController *tabBarController = [TabBarController share];
  
  application.window = [[BaseWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
  application.window.backgroundColor = UIColor.whiteColor;
  application.window.rootViewController = tabBarController;
  [application.window makeKeyAndVisible];
}

- (void)registerModules {
  NSArray *systemModules = @[
    [CommonPlayerModule class],
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
