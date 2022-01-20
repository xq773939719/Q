//
//  CommonEntrance.m
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import "CommonEntranceManager.h"

#import <UIKit/UIKit.h>

#import "BaseScene.h"
#import "BaseApplicationDelegate.h"
#import "BaseWindowSceneDelegate.h"
#import "TabBarController.h"
#import "BaseModuleManager.h"

@implementation CommonEntranceManager

+ (void)launchWithApplicationDelegate:(BaseApplicationDelegate *)delegate {
  TabBarController *tabBarController = [TabBarController share];
  delegate.window = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
  delegate.window.backgroundColor = UIColor.whiteColor;
  delegate.window.rootViewController = tabBarController;
  [delegate.window makeKeyAndVisible];
  [self launch];
}

+ (void)launchWithWindowSceneDelegate:(BaseWindowSceneDelegate *)delegate withScene:(BaseScene *)scene {
  UIWindowScene *windowScene = (UIWindowScene *)scene;
  TabBarController *tabBarController = [TabBarController share];
  delegate.window = [[UIWindow alloc] initWithWindowScene:windowScene];
  delegate.window.frame = UIScreen.mainScreen.bounds;
  delegate.window.backgroundColor = UIColor.whiteColor;
  delegate.window.rootViewController = tabBarController;
  [delegate.window makeKeyAndVisible];
  [self launch];
}

+ (void)launch {
  NSArray *systemModules = @[
    
  ];
  [BaseModuleManager registerModules:systemModules
                               level:BaseModuleLevelSystem];
}

@end
